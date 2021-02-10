#!/bin/bash -ue
NanoPlot -t 40 --bam sub1_full.sorted.bam -o null/sub1_full.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub1_full.sorted.bam" --maxlength 10000 -p sub1_full.sorted-
