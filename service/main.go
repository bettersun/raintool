package main

import (
	"sunjiahsu.cn/raintool/http"
	"sunjiahsu.cn/raintool/mock"
)

func main() {
	go http.RunHttp()
	go mock.Watch()
	mock.StartMock()
	mock.RunRpc()
}
