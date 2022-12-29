package mock

import (
	"net/http"
)

func ResponseText(w http.ResponseWriter, content string) {
	w.Header().Set(httpHeaderContentEncoding, contentTypeText)
	w.WriteHeader(http.StatusInternalServerError)
	_, err := w.Write([]byte(content))
	if err != nil {
		logger.Error(err)
	}
}
