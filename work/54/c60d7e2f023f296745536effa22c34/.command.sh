#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no k12_rrna.fa sample2_nf.fastq > sample2_nf.fastq.sam
