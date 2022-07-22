package mock

import "net/http"

// Config 配置
type Config struct {
	Port     string `yaml:"port"`     // 工具运行端口
	LogFile  string `yaml:"logFile"`  // 日志文件
	LogLevel int    `yaml:"logLevel"` // 日志等级

	Proxy ProxyConfig `yaml:"proxy"` // 代理配置
	Path  PathConfig  `yaml:"path"`  // 路径配置
}

// ProxyConfig 代理配置
type ProxyConfig struct {
	DestHost     string `yaml:"destHost"`     // 目标主机(包含 协议://IP:端口 )
	RootPath     string `yaml:"rootPath"`     // 主机提供的服务的根路径
	MockItemFile string `yaml:"mockItemFile"` // Mock项目文件

	// 使用模拟服务通用响应头 仅当URL对应的响应头不存在时使用
	UseCommonHeader bool `yaml:"useCommonHeader"`
}

// PathConfig 路径配置
type PathConfig struct {
	Request  string `yaml:"request"`  // 请求信息存放相对根目录(程序运行目录下的目录)
	Response string `yaml:"response"` // 响应信息存放相对根目录(程序运行目录下的目录)
	Backup   string `yaml:"backup"`   // 备份目录

	CommonHeaderFile   string `yaml:"commonHeaderFile"`   // 通用响应头文件
	ResponseHeaderFile string `yaml:"responseHeaderFile"` // 响应头信息文件
}

// MockItem Mock 项目
type MockItem struct {
	URL          string      `yaml:"url" json:"url"`               // URL
	Method       string      `yaml:"method" json:"method"`         // HTTP请求方法
	DestHost     string      `yaml:"destHost"`                     // 目标主机
	UseMock      bool        `yaml:"useMock" json:"useMock"`       // 使用 Mock
	StatusCode   int         `yaml:"statusCode" json:"statusCode"` // 响应状态码
	Header       http.Header // 响应头部
	ResponseFile string      `yaml:"responseFile" json:"responseFile"` // 响应文件
	Description  string      `yaml:"description" json:"description"`   // 说明
}
