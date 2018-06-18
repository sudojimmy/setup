#!/bin/bash

cat 'test' | wlp4scan | wlp4parse | ./a.out > foo.asm


java cs241.linkasm < foo.asm > output.merl
linker output.merl print.merl alloc.merl | java cs241.merl 0 > final.mips


java mips.array final.mips
