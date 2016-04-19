#!/bin/bash
for i in {0..255} ; do
	printf "\x1b[38;5;%dmcolour%d\n" $i $i
done
