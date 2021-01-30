#!/bin/bash -ue
samtools flagstat sub3_full.sorted.bam | tee sub3_full.sorted_flagstat.txt
