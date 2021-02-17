#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no K12a.fa sub2.fastq > sub2_full.sam
