package mock

import (
	"bytes"
	"compress/gzip"
	"fmt"
	"github.com/bettersun/rain"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strings"
)

/// 获取URL里的地址部分
///  去掉URL里?后面的内容
func baseURL(s string) string {
	tmp := ""

	// 第一个问号的位置
	qIndex := strings.Index(s, "?")

	if qIndex > 0 {
		tmp = s[0:qIndex]
	} else {
		tmp = s
	}

	return tmp
}

/// 反斜线转下划线
/// 去掉第一个下划线
func escapeURL(s string) string {
	// 去掉问号后面的部分
	s = baseURL(s)

	// 反斜线转下划线，去掉第一个下划线
	result := strings.Replace(strings.ReplaceAll(s, "/", "_"), "_", "", 1)
	return result
}

/// 响应信息文件存放目录(绝对)
func pathURL(relativePath string, url string, method string) string {
	p := fmt.Sprintf("%v/%v", rain.CurrentDir(), pathURLRelative(relativePath, url, method))
	return p
}

/// 响应信息文件存放目录(相对)
func pathURLRelative(relativePath string, url string, method string) string {
	pURL := escapeURL(url)
	p := fmt.Sprintf("%v/%v/%v", relativePath, pURL, method)
	return p
}

/// 请求信息文件名
func fileRequest() string {
	f := fmt.Sprintf("req_%v.json", rain.NowMdHms())
	return f
}

/// 响应信息文件名
func fileResponse(isJSON bool) string {
	var f string

	if isJSON {
		f = fmt.Sprintf("body_%v.json", rain.NowMdHms())
	} else {
		f = fmt.Sprintf("body_%v.txt", rain.NowMdHms())
	}

	return f
}

// OutRequest 输出请求到文件
func OutRequest(relativePath string, r *http.Request, body []byte) {
	url := r.URL.String()
	method := r.Method
	header := r.Header

	path := pathURL(relativePath, url, method)
	if !rain.IsExist(path) {
		//递归创建目录
		err := os.MkdirAll(path, os.ModePerm)
		if err != nil {
			msg := fmt.Sprintf("创建目录失败。[%s][%v]", path, err)
			logger.Warn(msg)
		}
	}

	content := string(body)

	// 转为 Map
	mBody, err := rain.JsonToMap(content)
	if err != nil {
		logger.Debug("请求体非JSON")
	}

	// 输出内容
	m := make(map[string]interface{})
	m["url"] = url
	m["header"] = header
	m["method"] = method

	// 请求体为JSON时
	if IsJSON(&header) {
		m["body"] = mBody
	} else {
		m["body"] = content
	}

	// 文件完整路径
	fileFullPath := fmt.Sprintf("%v/%v", path, fileRequest())
	// 输出请求到文件
	err = rain.OutJson(fileFullPath, m)
	if err != nil {
		log.Print(err)
	}
}

// OutResponseBody 输出响应体到文件
func OutResponseBody(config *Config, url string, method string, header *http.Header, data []byte) {

	relativePath := config.Path.Response
	// 响应为JSON判断
	isJSON := IsJSON(header)
	// gzip压缩编码数据
	isGzipped := IsGzipped(header)

	// 输出数据
	var dataOutput []byte

	// gzip压缩编码数据
	if isGzipped {
		resProxyGzippedBody := ioutil.NopCloser(bytes.NewBuffer(data))
		defer resProxyGzippedBody.Close() // 延时关闭

		// gzip Reader
		gr, err := gzip.NewReader(resProxyGzippedBody)
		if err != nil {
			msg := fmt.Sprintf("创建gzip读取器发生错误。[%v]", err)
			logger.Error(msg)
		}
		defer gr.Close()

		// 读取gzip对象内容
		dataOutput, err = ioutil.ReadAll(gr)
		if err != nil {
			msg := fmt.Sprintf("读取gzip对象内容发生错误。[%v]", err)
			logger.Error(msg)
		}
	} else { // 非gzip压缩
		dataOutput = data
	}

	// 输出目录
	path := pathURL(relativePath, url, method)
	if !rain.IsExist(path) {
		// 创建目录
		err := os.MkdirAll(path, os.ModePerm)
		if err != nil {
			msg := fmt.Sprintf("创建目录失败。[%s],[%v]", path, err)
			log.Println(msg)
		}
	}

	// 文件完整路径
	fileFullPath := fmt.Sprintf("%v/%v", path, fileResponse(isJSON))

	content := string(dataOutput)

	if isJSON {
		m, err := rain.JsonToMap(content)
		// 字符串能转换成JSON时，输出Map(或Map切片)到文件
		if err == nil {
			errOut := rain.OutJson(fileFullPath, m)
			if errOut != nil {
				logger.Warn("保存响应信息失败")
			}
			return
		}
	}

	// 上面的处理未保存成功时，保存为普通文件内容
	logger.Warn("响应信息转换JSON失败，保存为普通文件。")
	err := rain.WriteFile(fileFullPath, []string{content})
	if err != nil {
		logger.Warn("保存响应信息失败。")
	}
}

// OutResponseHeader 输出响应到文件
func OutResponseHeader(config *Config, mHeader map[string]http.Header, url string, method string, header *http.Header) {
	// 响应头 Map 用键
	k := KeyResponseHeader(url, method)
	_, ok := mHeader[k]
	// 响应头 Map 中不存在，则添加到响应头Map中
	if !ok {
		mHeader[k] = *header
	}

	path := AbsoluteFile(config.Path.Response)
	// 目录不存在时创建
	if !rain.IsExist(path) {
		// 创建目录
		err := os.MkdirAll(path, os.ModePerm)
		if err != nil {
			msg := fmt.Sprintf("创建目录失败。[%s]", path)
			logger.Warn(msg)
		}
	}

	// 文件完整路径
	fileFullPath := AbsoluteFile2(config.Path.Response, config.Path.ResponseHeaderFile)

	// 输出响应头
	err := rain.OutJson(fileFullPath, mHeader)
	if err != nil {
		log.Print(err)
	}

	return
}

// LoadResponseFile 获取URL的响应文件列表
func LoadResponseFile(relativePath string, url string, method string) ([]string, error) {
	// URL对应响应目录下的URL对应的目录
	path := pathURL(relativePath, url, method)

	var file []string
	sub, err := ioutil.ReadDir(path)
	if err != nil {
		msg := fmt.Sprintf("目录不存在，或打开错误。[%s][%v]", path, err)
		logger.Warn(msg)
		// 不返回error
		return file, nil
	}

	p := pathURLRelative(relativePath, url, method)

	// 文件列表
	for _, f := range sub {
		if !f.IsDir() {
			fName := fmt.Sprintf("%v/%v", p, f.Name())
			file = append(file, fName)
		}
	}

	return file, nil
}

// OutputMockItem 保存 Mock 项目
func OutputMockItem(config *Config, infoSlice []MockItem) error {

	path := AbsoluteFile(config.Path.Backup)
	// 目录不存在时创建
	if !rain.IsExist(path) {
		// 创建目录
		err := os.MkdirAll(path, os.ModePerm)
		if err != nil {
			msg := fmt.Sprintf("创建目录失败。[%s]", path)
			logger.Warn(msg)
		}
	}

	backItemFile := rain.FileName(config.Proxy.MockItemFile, "/")
	// 备份
	bkFileName := strings.Replace(backItemFile, ".", fmt.Sprintf("_%v.", rain.NowYmdHms()), 1)
	bkFile := AbsoluteFile2(config.Path.Backup, bkFileName)

	// 复制
	itemFile := AbsoluteFile(config.Proxy.MockItemFile)
	err := rain.CopyFile(itemFile, bkFile)
	if err != nil {
		return err
	}

	// 备份成功后 保存 Mock 项目
	err = rain.OutJson(itemFile, infoSlice)
	if err != nil {
		return err
	}

	return nil
}

// KeyResponseHeader 响应头的键值
func KeyResponseHeader(url string, method string) string {
	// URL(有参数时，问号之前的部分)
	bURL := baseURL(url)
	return fmt.Sprintf("%v_%v", method, bURL)
}

// IsGzipped 判断响应类型是否gzip压缩
func IsGzipped(header *http.Header) bool {
	if header == nil {
		return false
	}

	contentEncoding := header.Get(httpHeaderContentEncoding)
	isGzipped := false
	if strings.Contains(contentEncoding, encodingGzip) {
		isGzipped = true
	}

	return isGzipped
}

// IsJSON 判断响应类型是否是JSON
func IsJSON(header *http.Header) bool {

	if header == nil {
		return false
	}

	v := header.Get(httpHeaderContentType)
	result := false
	if strings.Contains(v, contentTypeJSON) {
		result = true
	}

	return result
}
