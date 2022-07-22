package mock

import "net/http"

var (
	/// 全局变量：配置
	config *Config
	/// 全局变量：HTTP服务
	mockServer http.Server
	/// 全局变量： Mock 项目切片
	mockItemSlice []MockItem
	/// 全局变量：响应头Map
	mapResponseHeader map[string]http.Header
	/// 全局变量：模拟服务通用响应头
	commonResponseHeader http.Header
)
