#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no k12_rrna.fa sample1_nf.fastq > sample1_nf.fastq.sam
