package mock

import (
	"context"
	"fmt"
	"google.golang.org/grpc"
	"log"
	"net"
	rpc "sunjiahsu.cn/raintool/mock/proto"
)

const (
	port = ":59527"
)

type MockServer struct {
	rpc.UnimplementedMockServiceServer
}

func (s *MockServer) StartMock(_ context.Context, in *rpc.MockRequest) (*rpc.MockReply, error) {
	log.Printf("StartMock: %v", in.GetName())

	StartMock()
	return &rpc.MockReply{Message: "Mock " + in.GetName()}, nil
}

func (s *MockServer) StopMock(_ context.Context, in *rpc.MockRequest) (*rpc.MockReply, error) {
	log.Printf("StopMock: %v", in.GetName())

	StopMock()
	return &rpc.MockReply{Message: "Mock " + in.GetName()}, nil
}

func RunRpc() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	rpc.RegisterMockServiceServer(s, &MockServer{})
	msg := fmt.Sprintf("RPC 服务运行中...HOST: %v", lis.Addr())
	log.Println(msg)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
