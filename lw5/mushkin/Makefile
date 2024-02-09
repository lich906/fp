GHC=ghc

all: build

build: 1.hs# 2.hs 3.hs 4.hs 5.hs
	mkdir -p build/
	$(GHC) 1.hs -outputdir build/ -o build/1
	#$(GHC) 2.hs -outputdir build/ -o build/2
	#$(GHC) 3.hs -outputdir build/ -o build/3
	#$(GHC) 4.hs -outputdir build/ -o build/4
	#$(GHC) 5.hs -outputdir build/ -o build/5

clean:
	rm -rf build/
