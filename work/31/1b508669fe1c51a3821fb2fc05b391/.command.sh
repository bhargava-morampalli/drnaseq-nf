#!/bin/bash -ue
samtools view -S -b sub3_norrna.sam | samtools sort -o sub3_norrna.sorted.bam
