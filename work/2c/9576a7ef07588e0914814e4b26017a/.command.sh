#!/bin/bash -ue
minimap2 -ax splice -uf -k14 --secondary=no k12_rrna.fa sub2.fastq > sub2.fastq.sam
