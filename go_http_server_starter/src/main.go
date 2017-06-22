package main

import (
	"net/http"
	"encoding/json"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		type PingResponse struct {
    	Message	string	`json:"message"`
      Status	bool		`json:"success"`
		}

		content, err := json.Marshal(PingResponse{Message: "Hello Go!", Status: true})
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(content)
	})
	http.ListenAndServe(":8000", nil)
}
