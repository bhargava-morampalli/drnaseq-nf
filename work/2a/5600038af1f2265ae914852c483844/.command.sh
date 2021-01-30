#!/bin/bash -ue
samtools view -S -b *.sam | samtools sort -o *.sorted.bam
