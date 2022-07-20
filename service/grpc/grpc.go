package grpc

import (
	"context"
	"fmt"
	"google.golang.org/grpc"
	"log"
	"net"

	rrpc "sunjiahsu.cn/raintool/grpc/proto"
)

const (
	port = ":59527"
)

type server struct {
	rrpc.UnimplementedRainServiceServer
}

func (s *server) Hello(_ context.Context, in *rrpc.HelloRequest) (*rrpc.HelloReply, error) {
	log.Printf("Received: %v", in.GetName())
	return &rrpc.HelloReply{Message: "Hello " + in.GetName()}, nil
}

func RunRpc() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	rrpc.RegisterRainServiceServer(s, &server{})
	msg := fmt.Sprintf("RPC 服务运行中...HOST: %v", lis.Addr())
	log.Println(msg)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
