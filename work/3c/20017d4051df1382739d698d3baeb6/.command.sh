#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no k12_norrna.fa sample2_nf.fastq > sample2_nf.fastq.sam
