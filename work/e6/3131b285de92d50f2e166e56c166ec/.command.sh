#!/bin/bash -ue
samtools view -S -b sub1_full.sam | samtools sort -o sub1_full.sorted.bam
