package mock

import (
	"fmt"
	"github.com/fsnotify/fsnotify"
)

func Watch() {
	watcher, err := fsnotify.NewWatcher()
	if err != nil {
		logger.Fatal(err)
	}
	defer func(watcher *fsnotify.Watcher) {
		err := watcher.Close()
		if err != nil {
			logger.Error(err)
		}
	}(watcher)

	done := make(chan bool)
	go func() {
		for {
			select {
			case event, ok := <-watcher.Events:
				if !ok {
					return
				}
				msg := fmt.Sprintf("事件：[%v]", event)
				logger.Info(msg)
				if event.Op&fsnotify.Write == fsnotify.Write {
					msg := fmt.Sprintf("修改文件：[%v]", event.Name)
					logger.Info(msg)

					// 停止当前Mock服务
					logger.Info("停止当前Mock服务")
					err := StopMock()
					if err != nil {
						logger.Info(err)
					}
					// 重新加载文件信息
					logger.Info("重新加载文件信息")
					initAll()
					// 重新启动Mock服务
					logger.Info("重新启动Mock服务")
					StartMock()
				}
			case err, ok := <-watcher.Errors:
				if !ok {
					return
				}
				logger.Println("error:", err)
			}
		}
	}()

	// 监视 Mock 项目文件
	itemFile := AbsoluteFile(config.Proxy.MockItemFile)
	err = watcher.Add(itemFile)
	if err != nil {
		logger.Fatal(err)
	}
	<-done
}
