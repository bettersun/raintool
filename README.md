# raintool

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.



### proto To Dart

```
 protoc -I proto/ proto/hello.proto --dart_out=grpc:lib/_grpc
```

### prot To go

```
protoc --go_out=server/grpc --go_opt=paths=source_relative \
    --go-grpc_out=server/grpc --go-grpc_opt=paths=source_relative \
    proto/hello.proto
```