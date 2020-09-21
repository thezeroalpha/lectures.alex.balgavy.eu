#!/usr/bin/env bash
if ! command -v vim; then
  echo "Don't know how to do this without vim yet."
  exit 1
elif [ $# -lt 1 ]; then
  echo "Need to pass the file as argument."
  exit 1
fi

for i in $@; do
  vim -c 'v/<head><script/ s#<head>#<head><script type="text/javascript" async src="https://cdn.jsdelivr.net/gh/mathjax/MathJax@2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>' -c 'wq' "$i"
done
