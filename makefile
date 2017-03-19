# Variables
CC = g++
CSTD = c++11
CFLAGS = -g
OPTIMIZE = -O3
ALLFLAGS = -std=$(CSTD) -Wall -pedantic $(OPTIMIZE) $(CFLAGS)
CPP_FILES := $(wildcard src/*.cpp)
LINKER_FLAGS = # Add your linker files here
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))
# Main executable file name
EXE = main.out

# Compilation
build/$(EXE): $(OBJ_FILES)
	$(CC) $(ALLFLAGS) -o $@ $^ $(LIBRARIES) $(INCLUDES) $(LINKER_FLAGS)
obj/%.o: src/%.cpp
	$(CC) $(ALLFLAGS) -c -o $@ $< $(LIBRARIES) $(INCLUDES) $(LINKER_FLAGS)

# Utilities
run:
	@./build/$(EXE)

clean:
	rm -f obj/*.o build/*.out build/*.exe

.PHONY: run clean
