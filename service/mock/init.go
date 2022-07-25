package mock

import (
	"fmt"
	"github.com/bettersun/rain"
	yml "github.com/bettersun/rain/yaml"
	"github.com/sirupsen/logrus"
	"log"
	"net/http"
)

/// 初始化
func init() {
	config = loadConfig(configFile)

	// 读取模拟服务通用响应头
	loadCommonResponseHeader(config)
	// 读取模拟服务信息
	mockItems := loadMockItem(config.Proxy.MockItemFile)
	// 读取响应头信息
	mockItemSlice, mapResponseHeader = loadResponseHeader(config, mockItems)
}

func AbsoluteFile(file string) string {
	f := fmt.Sprintf("%v/%v", rain.CurrentDir(), file)
	return f
}

func AbsoluteFile2(relativePath string, file string) string {
	f := fmt.Sprintf("%v/%v/%v", rain.CurrentDir(), relativePath, file)
	return f
}

func loadConfig(file string) *Config {
	// 配置文件：绝对位置
	cfgFile := AbsoluteFile(file)
	// 配置文件不存在
	if !rain.IsExist(cfgFile) {
		msg := fmt.Sprintf("配置文件[%s]不存在", cfgFile)
		logger.Panicln(msg)
	}

	// 读取配置
	var cfg Config
	err := yml.YamlFileToStruct(cfgFile, &cfg)

	// 配置文件读取失败
	if err != nil {
		msg := fmt.Sprintf("读取配置文件发生错误，请确认配置内容。[%s][%v]", cfgFile, err)
		logger.Panicln(msg)
	}

	// 初始化日志配置
	initLogger(cfg.LogFile, cfg.LogLevel)

	// 输出日志
	log.Println("=== 配置：===")
	rain.OutTerminal(cfg)

	return &cfg
}

// 读取模拟服务信息
func loadMockItem(file string) []MockItem {
	// Mock 项目文件
	f := AbsoluteFile(file)

	// Mock 项目文件不存在
	if !rain.IsExist(f) {
		msg := fmt.Sprintf("Mock 项目文件不存在。[%s]", f)
		logger.Warn(msg)
		return []MockItem{}
	}

	// 读取 Mock 项目文件
	var items []MockItem
	err := rain.JsonFileToStruct(f, &items)

	if err != nil {
		msg := fmt.Sprintf("读取 Mock 项目文件发生错误。[%s]", f)
		logger.Warn(msg)
		return []MockItem{}
	}

	// 调试模式输出
	logger.WithFields(logrus.Fields{"Mock 项目": items}).Debug()
	return items
}

// 读取 Mock 通用响应头
func loadCommonResponseHeader(config *Config) {
	// 文件绝对路径
	f := AbsoluteFile(config.Path.CommonHeaderFile)

	// 文件不存在
	if !rain.IsExist(f) {
		msg := fmt.Sprintf("Mock 通用响应头文件不存在。[%s]", f)
		logger.Warn(msg)
		return
	}

	// 读取
	var cmnRespHdr http.Header
	err := rain.JsonFileToStruct(f, &cmnRespHdr)

	if err != nil {
		msg := fmt.Sprintf("读取 Mock 通用响应头文件发生错误。[%s][%v]", f, err)
		logger.Warn(msg)
	}

	commonResponseHeader = cmnRespHdr
	// 调试模式输出
	logger.WithFields(logrus.Fields{"Mock 通用响应头": commonResponseHeader}).Debug()
}

// 读取响应头信息
// 使用代理转发请求时，会自动生成URI对应的响应头信息
func loadResponseHeader(config *Config, items []MockItem) ([]MockItem, map[string]http.Header) {
	// 文件绝对路径
	fResponseHeader := AbsoluteFile2(config.Path.Response, config.Path.ResponseHeaderFile)
	// 文件不存在
	if !rain.IsExist(fResponseHeader) {
		msg := fmt.Sprintf("响应头信息文件不存在。[%s]", fResponseHeader)
		logger.Info(msg)

		// 空的响应头信息
		m := make(map[string]http.Header)
		return items, m
	}

	// 读取
	mHeader := make(map[string]http.Header)
	err := yml.YamlFileToStruct(fResponseHeader, &mHeader)
	if err != nil {
		msg := fmt.Sprintf("读取响应头信息文件发生错误。[%s][%v]", fResponseHeader, err)
		logger.Warn(msg)
	}

	var resultItems []MockItem
	for _, item := range items {
		key := KeyResponseHeader(item.URL, item.Method)

		header, ok := mHeader[key]
		if ok {
			item.Header = header
		}
		resultItems = append(resultItems, item)
	}

	return resultItems, mHeader
}
