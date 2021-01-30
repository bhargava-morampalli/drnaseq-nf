#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sub3.fastq > sub3.fastq_full.sam
