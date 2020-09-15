package main
package log

import "net/http"

func main() {
	http.HandleFunc("/", func(http.ResponseWriter, *http.Request) {
		log.println("Hello World")
	})

	http.ListenAndServe(":9090", nil)
}
