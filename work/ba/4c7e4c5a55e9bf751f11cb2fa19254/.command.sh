#!/bin/bash -ue
samtools flagstat sub1_rrna.sorted.bam | tee sub1_rrna.sorted_flagstat.txt
