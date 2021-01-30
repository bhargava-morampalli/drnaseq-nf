#!/bin/bash -ue
samtools view -S -b sub3_full.sam | samtools sort -o sub3_full.sorted.bam
