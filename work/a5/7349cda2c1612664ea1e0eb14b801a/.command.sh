#!/bin/bash -ue
samtools flagstat sub3_rrna.sorted.bam | tee sub3_rrna.sorted_flagstat.txt
