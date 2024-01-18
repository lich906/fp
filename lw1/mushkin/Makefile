GHC=ghc

all: build

build: 1.hs
	mkdir -p bin/
	$(GHC) 1.hs -o bin/1

clean:
	rm -rf *.hi *.o bin/
