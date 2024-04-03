#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(dirname "$0")"
PROJECT_ROOT="$SCRIPT_DIR/.."

DEFAULT_PDF_FILE="$PROJECT_ROOT/resume.pdf"
PDF_FILE=${1:-$DEFAULT_PDF_FILE}

OUTPUT_DIR="$PROJECT_ROOT/out"
mkdir -p "$OUTPUT_DIR"

IMG_OUT_PNG="$OUTPUT_DIR/resume.png"
IMG_OUT_JPG="$OUTPUT_DIR/resume.jpg"

# Produce transparent background PNG
PDF2PNG="convert -density 300 $PDF_FILE $IMG_OUT_PNG"

# Produce white background JPG
PNG2JPG="convert -density 300 $PDF_FILE $IMG_OUT_JPG"

$PDF2PNG && $PNG2JPG
