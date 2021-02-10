#!/bin/bash -ue
NanoPlot -t 40 --bam sub1_rrna.sorted.bam -o null/sub1_rrna.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub1_rrna.sorted.bam" --maxlength 10000 -p sub1_rrna.sorted-
