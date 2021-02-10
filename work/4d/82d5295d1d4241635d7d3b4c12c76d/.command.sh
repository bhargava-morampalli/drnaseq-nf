#!/bin/bash -ue
NanoPlot -t 40 --bam sub3_rrna.sorted.bam -o null/sub3_rrna.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub3_rrna.sorted.bam" --maxlength 10000 -p sub3_rrna.sorted-
