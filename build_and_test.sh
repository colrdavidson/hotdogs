set -x

PEEL=$(readlink -e "../peel/debug")
ODIN=$(readlink -e "../Odin/odin")

rm -rf bin
mkdir bin

clang -v
clang -o bin/main_c -static -g -O3 mains/main_c.c
$PEEL ./bin/main_c

go version
go build -o bin/main_go mains/main_go.go
$PEEL ./bin/main_go

$ODIN version
$ODIN build mains/main_odin.odin -opt:2 -debug -out:bin/main_odin
$PEEL ./bin/main_odin
