GHC=ghc

all: build

build: Main.hs MyModule.hs
	mkdir -p build/
	$(GHC) Main.hs -outputdir build/ -o build/main

clean:
	rm -rf build/
