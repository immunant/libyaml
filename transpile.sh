#!/usr/bin/env bash

set -euo pipefail

# NOTE: run `./configure --enable-static=false` to transpile sources for
# shared library

# Check if compile_commands.json has already been created
if [[ ! -f "compile_commands.json" ]]; then
    echo "Error: compile_commands.json not found in the current directory." >&2
    echo "Please generate and re-run this script." >&2
    exit 1
fi

if ! command -v c2rust &> /dev/null; then
    echo "Error: c2rust is not in your PATH. Please ensure it is installed and accessible." >&2
    exit 1
fi


#
c2rust transpile compile_commands.json --emit-build-files --filter src
