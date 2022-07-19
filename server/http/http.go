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
	msg := fmt.Sprintf("服务运行中... 端口[%v]", port)
	log.Printf(msg)

	// 监听服务
	// TODO 需要确认端口是否被占用
	http.ListenAndServe(port, http.HandlerFunc(Handler))
}

// Handler 响应函数
func Handler(w http.ResponseWriter, r *http.Request) {
	//log.Printf("%+v", *r)

	helloWorld := Hello{
		Code:    "12",
		Message: "hello world",
	}

	if r.Method == http.MethodPost {
		helloWorld = Hello{
			Code:    "12",
			Message: "hello message",
		}
	}

	// 转换成字节
	stream, err := json.Marshal(&helloWorld)
	if err != nil {
		log.Println(err)
		log.Println("ERROR: json.Marshal(&helloWorld)")
	}

	//log.Println(stream)
	w.Header().Set("Content-Type", "application/json")
	w.Write(stream)
}
