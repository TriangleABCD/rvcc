#!/bin/bash

assert() {
  expected="$1"
  input="$2"

  ./rvcc "$input" > tmp.s || exit

  riscv64-linux-gnu-gcc -static -o tmp tmp.s

  qemu-riscv64 -L /usr/riscv64-linux-gnu/ ./tmp

  actual="$?"

  if [ "$actual" -ne "$expected" ]; then
    echo "Expected $expected, but got $actual"
    exit 1
  else
    echo "Test passed: $input => $actual"
  fi
}

assert 0 0
assert 42 42
assert 2 "1-2+3"
assert 0 "1+2-3"

echo OK
