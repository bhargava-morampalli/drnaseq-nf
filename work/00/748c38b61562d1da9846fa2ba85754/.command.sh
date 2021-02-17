#!/bin/bash -ue
mkdir sams
cd sams
mkdir fullsams
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sub1.fastq > sub1.fastq.sam
