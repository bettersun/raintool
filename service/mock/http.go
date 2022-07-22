package mock

import (
	"net/http"
)

func ResponseText(w http.ResponseWriter, content string) {
	w.Header().Set(httpHeaderContentEncoding, contentTypeText)
	w.WriteHeader(http.StatusInternalServerError)
	w.Write([]byte(content))
}
