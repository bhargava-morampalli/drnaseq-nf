#!/bin/bash -ue
NanoPlot -t 40 --bam sub3_full.sorted.bam -o sub3_full.sorted_* --plots hex dot kde pauvre --title "sub3_full.sorted.bam" --store --raw --maxlength 10000 -p sub3_full.sorted-
