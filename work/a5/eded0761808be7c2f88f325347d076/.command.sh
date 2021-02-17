#!/bin/bash -ue
samtools view -S -b sub2_norrna.sam | samtools sort -o sub2_norrna.sorted.bam
