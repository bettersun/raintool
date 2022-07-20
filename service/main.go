package main

import (
	"sunjiahsu.cn/raintool/grpc"
	"sunjiahsu.cn/raintool/http"
)

func main() {
	go grpc.RunRpc()
	http.RunHttp()
}
