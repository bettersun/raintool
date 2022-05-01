package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
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
	log.Printf("%+v", *r)

	s := "Hello, world."
	// 转换成字节
	//stream, err := json.Marshal(s)
	//if err != nil {
	//	log.Println(err)
	//}

	w.Write([]byte(s))
}
