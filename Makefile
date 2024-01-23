all: build

build:
	cd lw1/mushkin && make
	cd lw1/ermakov && make

clean:
	cd lw1/mushkin && make clean
