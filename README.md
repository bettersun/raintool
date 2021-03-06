# raintool

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Flutter 3.x

### proto To Dart

```
 protoc -I proto/ proto/hello.proto --dart_out=grpc:lib/rpc/entity
```

### prot To go

```
protoc --go_out=service/grpc --go_opt=paths=source_relative \
    --go-grpc_out=service/grpc --go-grpc_opt=paths=source_relative \
    proto/hello.proto
```

### Flutter 
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 工具开发随想

1. Excel 通用工具 （go）
   1. 遗漏
   1. 条件遗漏
   1. 复制
   1. 图片、图形
1. Flutter 工具集 Riverpod
   1. 标签页（动态，静态）
   1. 菜单拖拽改变顺序 OK
   1. 假服务工具完善（可设置超时时间，返回状态码）
   1. 树
   1. 纵横滚动条(内层水平滚动，外层垂直滚动) 
   1. 代码统计工具
   1. json 工具
   1. 目标管理
   1. 白板
   1. 电脑硬件信息
   1. 类postman工具
   1. 数据库UI
   

### Tab

https://api.flutter.dev/flutter/material/TabController-class.html
https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/
https://www.freesion.com/article/23711034166/


The provided ScrollController is currently attached to more than one ScrollPosition

https://github.com/flutter/flutter/issues/93862

### [张风捷特烈](https://juejin.cn/user/149189281194766)

[Flutter 动画探索 - 流光幻影](https://juejin.cn/book/6965102582473687071)