package http

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type Hello struct {
	Code    string `json:"code"`
	Message string `json:"message"`
}

func RunHttp() {
	// 监听端口
	port := ":9527"
	msg := fmt.Sprintf("HTTP 服务运行中... 端口[%v]", port)
	log.Printf(msg)

	// 监听服务
	// TODO 需要确认端口是否被占用
	http.ListenAndServe(port, http.HandlerFunc(Handler))
}

// Handler 响应函数
func Handler(w http.ResponseWriter, r *http.Request) {
	//log.Printf("%+v", *r)
	var helloWorld Hello

	if r.Method == http.MethodPost {
		helloWorld = Hello{
			Code:    "12",
			Message: "POST: hello message",
		}
		//// 读取请求Body
		//body, err := ioutil.ReadAll(r.Body)
		//if err != nil {
		//	log.Println(fmt.Sprintf("Error: %v", err))
		//}
		//msg := fmt.Sprintf("POST 请求体：%v", string(body))
		//log.Printf(msg)
	}

	if r.Method == http.MethodGet {
		helloWorld = Hello{
			Code:    "12",
			Message: "GET: hello world",
		}
		//msg := fmt.Sprintf("GET 参数：%v", r.URL.RawQuery)
		//log.Printf(msg)
	}

	// 转换成字节
	stream, err := json.Marshal(&helloWorld)
	if err != nil {
		log.Println("ERROR: json.Marshal(&helloWorld) ")
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(stream)
}
