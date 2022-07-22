package mock

import "log"

// LogError
//  错误非nil时输出日志
func LogError(err error) {
	if err != nil {
		// 输出日志到控制台
		log.Println(err)
	}
}
