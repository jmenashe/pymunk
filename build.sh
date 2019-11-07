#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo pip install pygame cffi
python setup.py build_ext --inplace
if [[ $PYTHONPATH != *"pymunk"* ]]; then
  echo "pymunk was not detected in PYTHONPATH. To configure pymunk,"
  echo "add this repository's root directory to PYTHONPATH environ-"
  echo "ment variable in .bashrc (or equivalent)."
  echo "Example:"
  echo $'\t'"export PYTHONPATH=\"\$PYTHONPATH:$SCRIPT_DIR\""
fi
