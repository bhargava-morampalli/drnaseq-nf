#!/bin/bash -ue
samtools view -S -b sub2_full.sam | samtools sort -o sub2_full.sorted.bam
