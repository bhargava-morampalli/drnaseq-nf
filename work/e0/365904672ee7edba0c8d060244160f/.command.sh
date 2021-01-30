#!/bin/bash -ue
samtools flagstat sub2_rrna.sorted.bam | tee sub2_rrna.sorted_flagstat.txt
