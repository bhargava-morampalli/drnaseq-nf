#!/bin/bash -ue
NanoPlot -t 40 --bam sub2_full.sorted.bam -o sub2_full.sorted_* --plots hex dot kde pauvre --title "sub2_full.sorted.bam" --store --raw --maxlength 10000 -p sub2_full.sorted-
