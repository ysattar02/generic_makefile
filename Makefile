# Compiler
CXX := g++
# Compiler flags
CXXFLAGS := -Wall -Wextra -std=c++17
# Directories
SRCDIR := src
BUILDDIR := build
BINDIR := bin
# Target executable
TARGET := $(BINDIR)/my_program

# Find all .cpp files in the src directory
SOURCES := $(wildcard $(SRCDIR)/*.cpp)
# Replace .cpp with .o and move to the build directory
OBJECTS := $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

# Default target
all: $(TARGET)

# Link all object files into the target executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(TARGET)

# Compile source files into object files in the build directory
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create necessary directories if they don't exist
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Clean up generated files
clean:
	rm -rf $(BUILDDIR) $(BINDIR)

# Phony targets to avoid conflicts with files of the same name
.PHONY: all clean
