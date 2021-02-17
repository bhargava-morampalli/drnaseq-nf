#!/bin/bash -ue
samtools view -S -b sub2_rrna.sam | samtools sort -o sub2_rrna.sorted.bam
