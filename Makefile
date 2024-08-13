# Compiler and flags
CC = g++
CFLAGS = -std=c++11 -Wall

# Target executable
TARGET = YOUR_TARGET

# Source files (only .cpp files)
SRCS = YOUR_SOURCE_FILES

# Object files (automatically derived from SRCS)
OBJS = $(SRCS:.cpp=.o)

# Phony targets
.PHONY: all clean

# Default target
all: $(TARGET)

# Linking the object files to create the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

# Compiling .cpp files to .o files
%.o: %.cpp %.h
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up the build
clean:
	rm -f $(TARGET) $(OBJS)
