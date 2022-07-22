package main

import (
	"sunjiahsu.cn/raintool/http"
	"sunjiahsu.cn/raintool/mock"
)

func main() {
	//go grpc.RunRpc()

	go http.RunHttp()
	mock.StartCommand()

	//http.RunHttp()
}
