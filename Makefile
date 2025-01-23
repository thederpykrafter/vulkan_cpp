# use @<command> to supress make echoing command
CC = g++
LANG = cpp
CFLAGS = -std=c++17 -O2
LDFLAGS= -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

OUT_FILE = vulkan_cpp

default: build

install: build copy

test: build run

build: src/main.$(LANG)
	@if [ ! -d bin ]; then mkdir bin; fi
	$(CC) $(CFLAGS) -o bin/$(OUT_FILE) src/main.$(LANG) $(LDFLAGS)

copy: bin/$(OUT_FILE)
	cp -rf bin/$(OUT_FILE) /usr/bin

uninstall: bin/$(OUT_FILE)
	rm -f /usr/bin/$(OUT_FILE)

run:
	./bin/$(OUT_FILE)

clean:
	rm -f bin/$(OUT_FILE)
