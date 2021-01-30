#!/bin/bash -ue
samtools flagstat sub1_full.sorted.bam | tee sub1_full.sorted_flagstat.txt
