#!/bin/bash -ue
NanoPlot -t 40 --bam sub3_full.sorted.bam -o null/sub3_full.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub3_full.sorted.bam" --maxlength 10000 -p sub3_full.sorted-
