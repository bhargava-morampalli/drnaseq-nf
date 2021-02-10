#!/bin/bash -ue
samtools view -S -b sub1_rrna.sam | samtools sort -o sub1_rrna.sorted.bam
