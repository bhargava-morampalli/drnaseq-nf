#!/bin/bash -ue
samtools flagstat sub3_norrna.sorted.bam | tee sub3_norrna.sorted_flagstat.txt
