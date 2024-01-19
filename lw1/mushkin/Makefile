GHC=ghc

all: build

build: 1.hs
	mkdir -p bin/
	$(GHC) 1.hs -o bin/1
	$(GHC) 2.hs -o bin/2
	$(GHC) 3.hs -o bin/3
	$(GHC) 4.hs -o bin/4

clean:
	rm -rf *.hi *.o bin/
