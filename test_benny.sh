#!/bin/bash
# Test for benny.asm - verifies the program prints "Hello Benny!"

EXPECTED="Hello Benny!"
ACTUAL=$(./benny)

if [ "$ACTUAL" = "$EXPECTED" ]; then
    echo "PASS: benny prints \"$ACTUAL\""
    exit 0
else
    echo "FAIL: expected \"$EXPECTED\", got \"$ACTUAL\""
    exit 1
fi
