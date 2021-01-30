#!/bin/bash -ue
cd sams
mkdir rrnasams
minimap2 -ax splice -uf -k14 --secondary=no k12_rrna.fa sample3_nf.fastq > sample3_nf.fastq.sam
