#!/bin/bash -ue
samtools flagstat sub2_norrna.sorted.bam | tee sub2_norrna.sorted_flagstat.txt
