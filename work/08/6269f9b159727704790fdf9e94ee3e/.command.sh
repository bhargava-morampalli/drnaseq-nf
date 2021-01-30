#!/bin/bash -ue
cd sams
mkdir norrnasams
minimap2 -ax splice -uf -k14 --secondary=no k12_norrna.fa sample1_nf.fastq > sample1_nf.fastq.sam
