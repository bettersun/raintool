package mock

import (
	"bytes"
	"compress/gzip"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"strings"
	"time"

	"github.com/bettersun/rain"
)

// StartCommand 启动 Mock (命令行调用)
func StartCommand() {
	StartMock()
	//log.Println(rain.CurrentDir())

	// 命令行执行时，需要下面这段代码
	ch := make(chan string)
	<-ch
}

// StartMock 启动 Mock
func StartMock() {
	// 监听端口
	port := ":" + config.Port
	mockServer = http.Server{
		Addr:    port,
		Handler: http.HandlerFunc(DoHandle),
	}

	go mockServer.ListenAndServe()

	msg := fmt.Sprintf("服务运行中... 端口[%v]", config.Port)
	logger.Info(msg)
}

// StopMock 关闭 Mock
func StopMock() error {
	err := mockServer.Close()
	//server.Shutdown(context.Background())
	if err != nil {
		msg := "关闭服务发生错误"
		logger.Warn(msg)
	}

	msg := "服务已关闭"
	logger.Info(msg)

	return err
}

// DoHandle 响应函数
func DoHandle(w http.ResponseWriter, r *http.Request) {
	url := r.URL.String()
	// URL(有参数时，问号之前的部分)
	bURL := baseURL(url)

	msg := fmt.Sprintf("=== 响应处理开始 === 请求方法：[%s] 请求URL: [%s]", r.Method, url)
	logger.Info(msg)

	// ======================================================================================

	existItem := false
	// 存在 Mock 项目
	for _, item := range mockItemSlice {
		// 判断条件：请求URL 和 请求方法
		if item.URL == bURL && item.Method == r.Method {
			existItem = true

			// 使用Mock
			if item.UseMock {
				doMock(w, r, item, config)
				return
			}

			// 不使用Mock，转发请求
			if !item.UseMock {
				// 目标主机
				destHost := config.Proxy.DestHost
				if item.DestHost != "" {
					destHost = item.DestHost
				}

				// 转发请求
				doProxy(w, r, destHost)
				return
			}
		}
	}

	// 请求的URL和请求方法对应的Mock 项目
	if !existItem {
		msg = "该请求的 Mock 项目未找到。使用默认Mock 项目。"
		logger.Info(msg)

		// 默认Mock 项目
		item := defaultMockItem(bURL, r.Method, config.Proxy.DestHost)
		// 添加到Mock 项目切片
		mockItemSlice = append(mockItemSlice, item)

		// 响应
		doProxy(w, r, config.Proxy.DestHost)
		// 保存响应信息
		SaveMockItem(config, mockItemSlice)
	}
}

// defaultMockItem 默认 Mock 项目
func defaultMockItem(url string, method string, host string) MockItem {

	if strings.Contains(host, "/") && host[len(host)-1] == '/' {
		host = host[:len(host)-1]
	}

	var item MockItem
	item.URL = url                  // URL(有参数时，问号之前的部分)
	item.Method = method            // 请求方法
	item.DestHost = host            // 目标主机
	item.UseMock = false            // 不使用虚拟服务
	item.StatusCode = http.StatusOK // 默认返回200
	item.ResponseFile = ""          // 响应文件默认为空
	item.Description = ""           // 说明默认使用URL(有参数时，问号之前的部分)

	return item
}

/// 代理转发
// 参考：https://www.cnblogs.com/boxker/p/11046342.html
func doProxy(w http.ResponseWriter, r *http.Request, host string) {
	msg := fmt.Sprintf("=== 代理转发 === 目标主机：[%s]", host)
	logger.Info(msg)

	// 读取请求的Body
	// 读取后 r.Body 即关闭，无法再次读取
	// 若需要再次读取，需要用读取到的内容再次构建Reader
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		msg := "读取请求体发生错误"
		logger.Info(msg)
	}

	// 输出请求头
	go OutRequest(config.Path.Request, r, body)

	url := r.URL.String()
	// 转发的URL
	reqURL := host + url
	msg = fmt.Sprintf("=== 完整URL: [%s]", reqURL)
	logger.Info(msg)

	// 创建一个HttpClient用于转发请求
	cli := &http.Client{}

	// 创建转发请求
	reqProxy, err := http.NewRequest(r.Method, reqURL, strings.NewReader(string(body)))
	if err != nil {
		msg := fmt.Sprintf("创建转发请求发生错误。[%v]", err)
		logger.Error(msg)
		return
	}

	// 转发请求的表头
	for k, v := range r.Header {
		reqProxy.Header.Set(k, v[0])
	}

	// 发起请求
	responseProxy, err := cli.Do(reqProxy)
	if err != nil {
		msg := fmt.Sprintf("转发请求发生错误。[%v]", err)
		logger.Error(msg)

		w.Header().Set(httpHeaderContentType, contentTypeText)
		w.WriteHeader(http.StatusServiceUnavailable)
		w.Write([]byte(msg))
	}
	defer responseProxy.Body.Close()

	// 输出响应头(每次都输出用于保存最新的响应头)
	OutResponseHeader(config, mapResponseHeader, url, r.Method, &responseProxy.Header)

	// 响应体数据
	var data []byte
	// 读取响应体
	data, err = ioutil.ReadAll(responseProxy.Body)
	if err != nil {
		msg := fmt.Sprintf("读取响应体发生错误。 %v", err)
		logger.Error(msg)
	}

	// 输出响应体到文件
	go OutResponseBody(config, url, r.Method, &responseProxy.Header, data)

	// response的Body不能多次读取，需要重新生成可读取的Body
	resProxyBody := ioutil.NopCloser(bytes.NewBuffer(data))
	defer resProxyBody.Close() // 延时关闭

	// 转发响应的响应头
	for k, v := range responseProxy.Header {
		w.Header().Set(k, v[0])
	}
	// 状态码
	w.WriteHeader(responseProxy.StatusCode)
	// 复制转发的响应Body到响应Body
	io.Copy(w, resProxyBody)

	msg = fmt.Sprintf("=== 响应正常结束 === ")
	logger.Info(msg)
}

// Mock
func doMock(w http.ResponseWriter, r *http.Request, item MockItem, config *Config) {
	msg := fmt.Sprintf("=== 使用Mock === Mock项目：[%v]", item)
	logger.Info(msg)

	duration := config.Proxy.Duration
	time.Sleep(time.Duration(duration) * time.Millisecond)
	msg = fmt.Sprintf("=== 响应等待时间：[%v]毫秒", duration)
	logger.Info(msg)

	// 读取请求的Body
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		msg := fmt.Sprintf("读取请求体发生错误。 %v", err)
		logger.Error(msg)
	}
	// 输出请求头
	OutRequest(config.Path.Request, r, body)

	// =====================================================================
	header := item.Header

	// 响应头为 nil，且不使用 Mock 通用响应头时
	if header == nil && !config.Proxy.UseCommonHeader {
		msg := "无法获取URL对应的响应头信息。\n1. 可先访问目标主机以保存相关信息。\n2. 或手动添加响应头信息。\n3. 或使用 Mock 通用响应头。\n"
		logger.Warn(msg)
		// 返回响应
		ResponseText(w, msg)
		return
	}

	// 响应头为 nil，且使用 Mock 通用响应头时
	if header == nil && config.Proxy.UseCommonHeader {
		// Mock 通用响应头
		header = commonResponseHeader
		msg := "URL的响应头信息不存在，使用Mock 通用响应头"
		logger.Warn(msg)
	}

	// 获取URL对应的响应头
	msg = "=== 使用已保存的响应头信息 ==="
	logger.Info(msg)

	// ==============================================================================================

	var stream []byte
	// 响应文件指定时进行处理
	if item.ResponseFile != "" {
		// 绝对 路径
		fResp := AbsoluteFile(item.ResponseFile)

		// 响应文件不存在
		if !rain.IsExist(fResp) {
			msg = fmt.Sprintf("Mock 响应文件不存在。[%s]", fResp)
			logger.Warn(msg)
			// 返回响应
			ResponseText(w, msg)
			return
		}

		// 响应体为JSON
		if IsJSON(&header) {
			// 响应文件转换成Map
			data, err := rain.JsonFileToMap(fResp)
			LogError(err)
			// 转换成字节
			stream, err = json.Marshal(data)
			LogError(err)
		} else {
			// 响应体非JSON
			data, err := ioutil.ReadFile(fResp)
			LogError(err)
			stream = data
		}
	}

	// 响应头
	for k, v := range header {
		// Content-Length 不添加到响应头，http.ResponseWriter会自动计算
		if k == httpHeaderContentLength {
			continue
		}
		w.Header().Set(k, v[0])
	}

	// 响应状态码，必须放在w.Header().Set(k, v)之后
	statusCode := item.StatusCode
	if statusCode == 0 {
		// 响应状态码为0时，设为200
		statusCode = http.StatusOK
		w.WriteHeader(http.StatusOK)
	} else {
		w.WriteHeader(item.StatusCode)
	}

	// 响应体
	if IsGzipped(&header) {
		// gzip压缩
		buffer := new(bytes.Buffer)
		gw := gzip.NewWriter(buffer)
		gw.Write(stream)
		gw.Flush()

		w.Write(buffer.Bytes())
	} else {
		w.Write(stream)
	}

	msg = fmt.Sprintf("=== 响应正常结束 === ")
	logger.Info(msg)
}
