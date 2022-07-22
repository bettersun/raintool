package mock

import (
	"fmt"
	"github.com/bettersun/rain"
	"github.com/sirupsen/logrus"
	"io"
	"log"
	"os"
)

/// 全局变量：日志记录器
var logger = logrus.New()

/// 初始化日志配置
func initLogger(file string, level int) {

	file = fmt.Sprintf("%v/%v", rain.CurrentDir(), file)

	// JSON格式
	logger.SetFormatter(&logrus.JSONFormatter{})

	// 日志输出到文件
	logFile, err := os.OpenFile(file, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	// 日志同时输出到控制台和文件
	if err == nil {
		mw := io.MultiWriter(logFile, os.Stdout)
		logger.SetOutput(mw)
	} else {
		logger.SetOutput(os.Stdout)
		log.Println("只输出到控制台")
	}

	// 日志级别
	switch level {
	case -1:
		logger.SetLevel(logrus.DebugLevel)
	case 0:
		logger.SetLevel(logrus.InfoLevel)
	case 1:
		logger.SetLevel(logrus.WarnLevel)
	case 2:
		logger.SetLevel(logrus.ErrorLevel)
	case 3:
		logger.SetLevel(logrus.FatalLevel)
	default:
		logger.SetLevel(logrus.InfoLevel)
	}
}
