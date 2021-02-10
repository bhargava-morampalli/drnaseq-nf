#!/bin/bash -ue
NanoPlot -t 40 --bam sub1_norrna.sorted.bam -o null/sub1_norrna.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub1_norrna.sorted.bam" --maxlength 10000 -p sub1_norrna.sorted-
