#!/bin/bash -ue
NanoPlot -t 40 --bam sub1_full.sorted.bam -o sub1_full.sorted_* --plots hex dot kde pauvre --title "sub1_full.sorted.bam" --store --raw --maxlength 10000 -p sub1_full.sorted-
