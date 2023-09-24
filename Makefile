# Makefile for compiling a LaTeX document using latexmk

# Name of the main .tex file (without extension)
MAIN = template

# LaTeX compiler to use (xelatex or lualatex)
LATEX_COMPILER = xelatex

# Flags for latexmk
LATEXMK_FLAGS = -$(LATEX_COMPILER)

# Build directory
BUILD_DIR = build

all: $(BUILD_DIR)/$(MAIN).pdf

$(BUILD_DIR)/$(MAIN).pdf: $(MAIN).tex | $(BUILD_DIR)
	latexmk $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

.PHONY: clean

clean:
	latexmk -C
	rm -rf $(BUILD_DIR)
