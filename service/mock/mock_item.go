package mock

import (
	"fmt"
	"github.com/sirupsen/logrus"
)

// ListMockItem 获取Mock 项目
func ListMockItem() []MockItem {
	return mockItemSlice
}

// UpdateMockItem 更新单个Mock 项目和URL对应Mock 项目Map
func UpdateMockItem(item MockItem) {
	// 更新内存中的Mock 项目
	for i, v := range mockItemSlice {
		if v.URL == item.URL && v.Method == item.Method {
			mockItemSlice[i] = item
		}
	}

	logger.WithFields(logrus.Fields{"Mock 项目": item}).Info("Mock 项目已更新")
}

// UpdateAllMockItem 更新单个Mock 项目和URL对应Mock 项目Map
func UpdateAllMockItem(newInfoSlice []MockItem) {
	// 更新内存中的Mock 项目
	for i, v := range mockItemSlice {
		for _, v2 := range newInfoSlice {
			if v.URL == v2.URL && v.Method == v2.Method {
				mockItemSlice[i] = v2
				break
			}
		}
	}

	logger.WithFields(logrus.Fields{"全部的Mock 项目": newInfoSlice}).Info("Mock 项目已全部更新")
}

// SaveMockItem 保存Mock 项目
func SaveMockItem(config *Config, mockItems []MockItem) {
	// 保存Mock 项目
	err := OutputMockItem(config, mockItems)
	if err != nil {
		msg := fmt.Sprintf("Mock 项目保存失败。[%s][%v]", config.Proxy.MockItemFile, err)
		logger.Warn(msg)
	}

	msg := fmt.Sprintf("Mock 项目已保存。[%s]", config.Proxy.MockItemFile)
	logger.Info(msg)
}
