#!/bin/bash -ue
samtools view -S -b sub3_rrna.sam | samtools sort -o sub3_rrna.sorted.bam
