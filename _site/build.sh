#!/bin/bash
bundle  exec jekyll serve
sleep 1
echo "will build html"
bundle  exec jekyll build
