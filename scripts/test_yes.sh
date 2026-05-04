#!/usr/bin/env bash
set -e

make yes > /dev/null 2>&1

output=$(./yes)
expected="yes"

if [ "$output" != "$expected" ]; then
    echo "FAIL: expected '$expected', got '$output'"
    exit 1
fi

./yes > /dev/null
exit_code=$?
if [ "$exit_code" -ne 0 ]; then
    echo "FAIL: expected exit code 0, got $exit_code"
    exit 1
fi

echo "PASS: yes prints 'yes' and exits with code 0"
