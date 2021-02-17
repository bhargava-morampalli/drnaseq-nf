#!/bin/bash -ue
NanoPlot -t 40 --bam sub2_full.sorted.bam -o null/sub2_full.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub2_full.sorted.bam" --maxlength 10000 -p sub2_full.sorted-
