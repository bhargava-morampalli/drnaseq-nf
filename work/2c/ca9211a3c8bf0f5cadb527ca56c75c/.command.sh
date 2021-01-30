#!/bin/bash -ue
cd sams
mkdir rrnasams
minimap2 -ax splice -uf -k14 --secondary=no k12_rrna.fa sub1.fastq > sub1.fastq.sam