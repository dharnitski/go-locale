package main

import (
	"fmt"
	"time"
)

func main() {
	location, err := time.LoadLocation("America/Los_Angeles")
	if err != nil {
		panic(err)
	}
	now := time.Now()
	
	fmt.Println("Time in UTC:")
	fmt.Println(now)
	fmt.Println("Time in America/Los_Angeles:")
	fmt.Println(now.In(location))
}
