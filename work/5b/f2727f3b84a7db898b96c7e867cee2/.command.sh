#!/bin/bash -ue
mkdir sams
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sample3_nf.fastq > sample3_nf.fastq.sam
