#!/bin/bash -ue
cd sams
mkdir norrnasams
minimap2 -ax splice -uf -k14 --secondary=no k12_norrna.fa sub1.fastq > sub1.fastq.sam
