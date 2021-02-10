#!/bin/bash -ue
samtools flagstat sub2_full.sorted.bam | tee sub2_full.sorted_flagstat.txt
