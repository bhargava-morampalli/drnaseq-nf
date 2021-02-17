#!/bin/bash -ue
NanoPlot -t 40 --bam sub2_norrna.sorted.bam -o null/sub2_norrna.sorted-*.{png, html, txt, log} --plots hex dot kde --title "sub2_norrna.sorted.bam" --maxlength 10000 -p sub2_norrna.sorted-
