set -x

PEEL=$(readlink -e "../peel/debug")
ODIN=$(readlink -e "../Odin/odin")

inspect_binary() {
	ls -lh $OUTFILE
	$PEEL $OUTFILE
}

rm -rf bin
mkdir bin

clang -v
go version
$ODIN version

# Test Hello World
OUTFILE=./bin/main_c
clang -o $OUTFILE -static -g -O3 mains/main_c.c
inspect_binary

OUTFILE=./bin/main_go
go build -o $OUTFILE mains/main_go.go
inspect_binary

OUTFILE=./bin/main_odin
$ODIN build mains/main_odin.odin -opt:2 -debug -out:$OUTFILE
inspect_binary

# Test image loading
OUTFILE=./bin/image_go
go build -o $OUTFILE images/image_go.go
inspect_binary

OUTFILE=./bin/image_odin
$ODIN build images/image_odin.odin -opt:2 -debug -out:$OUTFILE
inspect_binary
