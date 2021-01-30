#!/bin/bash -ue
mkdir fastqc_sample1_nf.fastq_logs
fastqc -o fastqc_sample1_nf.fastq_logs -f fastq -q sample1_nf.fastq
