package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.println("Hello, World")
		time.sleep(1 * time.second)
	}
}

