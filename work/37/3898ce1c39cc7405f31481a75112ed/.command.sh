#!/bin/bash -ue
samtools view -S -b sub1_norrna.sam | samtools sort -o sub1_norrna.sorted.bam
