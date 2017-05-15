#!/bin/bash
XELATEX_CMD=/Library/TeX/texbin/xelatex
XELATEX_INPUT_FILE=resume.tex

OUTPUT_DIR=out
mkdir $OUTPUT_DIR

# used for PNG conversion -- not currently used to customize XELATEX output
XELATEX_OUTPUT_FILE=resume.pdf

IMG_OUT_PNG="resume.png"
IMG_OUT_JPG="resume.jpg"

# convert .tex to .pdf
$XELATEX_CMD $XELATEX_INPUT_FILE
mv $XELATEX_OUTPUT_FILE $OUTPUT_DIR
cd $OUTPUT_DIR

# produces transparent background
PDF2PNG="sips -s format png $XELATEX_OUTPUT_FILE --out $IMG_OUT_PNG"

# produces white background
PNG2JPG="sips -s format jpeg $IMG_OUT_PNG --out $IMG_OUT_JPG"

$PDF2PNG && $PNG2JPG;

# copy to main dir for wilcollins.com ref until that points to /out
cp "$IMG_OUT_PNG" "../$IMG_OUT_PNG"
