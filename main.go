package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
)

const FILENAME = "location/to/your/file/wrt/this/file"

func main() {
	txtLines := fileManagement()
	var outputFile []string

	for i := range txtLines {
		char := strings.Split(txtLines[i], "")
		if len(char) != 0 && txtLines[i][:2] == "my" { // to avoid blank lines && // to only add commands, and they start with "mysql>"
			outputFile = append(outputFile, txtLines[i][6:]) // from 6 index because "mysql>" has 6 elements
		}
	}
	
	write(outputFile)
}

func write(text []string) {
	f, err := os.Create("output.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer func(f *os.File) {
		err := f.Close()
		if err != nil {
		}
	}(f)
	for i := range text {
		_, _ = f.WriteString(text[i] + "\n")
	}
	fmt.Println("done")
}

func fileManagement() (txtLines []string) {
	file, err := os.Open(FILENAME)
	if err != nil {
		log.Fatalf("failed opening file: %s", err)
	}
	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)
	for scanner.Scan() {
		txtLines = append(txtLines, scanner.Text())
	}
	err = file.Close()
	if err != nil {
		panic(err)
	}

	return txtLines
}
