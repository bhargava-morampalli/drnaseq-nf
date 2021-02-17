#!/bin/bash -ue
mkdir sams
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sub2.fastq > sub2.fastq.sam
