package main

import (
	"sunjiahsu.cn/raintool/http"
	"sunjiahsu.cn/raintool/mock"
)

func main() {
	go http.RunHttp()
	mock.StartMock()
	mock.RunRpc()
}
