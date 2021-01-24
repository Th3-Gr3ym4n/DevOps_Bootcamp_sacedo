#!/bin/bash
mkdir -p foo/dummy | mkdir -p foo/empty | touch foo/dummy/file{1..2}.txt
echo Me encanta las bash!! > foo/dummy/file1.txt
cp foo/dummy/file1.txt foo/dummy/file2.txt | mv foo/dummy/file2.txt foo/empty/file2.txt
echo $1 >> foo/dummy/file1.txt