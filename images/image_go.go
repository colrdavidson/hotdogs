package main

import (
	"image/png"
	"os"
	"fmt"
)

func main() {
	f, err := os.Open("test.png")
	if err != nil {
		panic(err)
	}

	cfg, err := png.DecodeConfig(f)
	if err != nil {
		panic(err)
	}

	fmt.Printf("%d, %d\n", cfg.Width, cfg.Height)
}
