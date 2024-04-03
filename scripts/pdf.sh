#!/bin/bash
XELATEX_CMD=/Library/TeX/texbin/xelatex
XELATEX_INPUT_FILE=resume.tex

# Get the directory of the script
SCRIPT_DIR="$(dirname "$0")"

# Set the output directory to the parent of the script directory
OUTPUT_DIR="$SCRIPT_DIR/.."
mkdir -p "$OUTPUT_DIR"

GEN_OUTPUT_FILE=resume

# Convert .tex to .pdf
if ! $XELATEX_CMD -output-directory="$OUTPUT_DIR" -jobname="$GEN_OUTPUT_FILE" "$XELATEX_INPUT_FILE"; then
    exit 1
fi

