GHC=ghc

all: build

build: 1.hs 2.hs 3.hs
	mkdir -p build/
	$(GHC) 1.hs -outputdir build/ -o build/1
	$(GHC) 2.hs -outputdir build/ -o build/2
	$(GHC) 3.hs -outputdir build/ -o build/3

clean:
	rm -rf build/
