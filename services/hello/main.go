package main

import (
	"fmt"
	"log"
	"net/http"
)

func helloHTTPHandler() http.HandlerFunc {
	return func(w http.ResponseWriter, req *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(200)
		fmt.Fprint(w, `{"message": "Hello!"}`)
		return
	}
}

func main() {
	mux := http.NewServeMux()
	mux.Handle("/", helloHTTPHandler())

	log.Println("Serving on :3000")
	err := http.ListenAndServe(":3000", mux)
	log.Fatal(err)
}
