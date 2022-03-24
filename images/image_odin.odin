package main

import "core:fmt"
import "core:image/png"

main :: proc() {
	img, err := png.load_from_file("test.png")
	if err != nil {
		fmt.panicf("Failed to load image: %s\n", err)
	}

	fmt.printf("%d, %d\n", img.width, img.height)
}
