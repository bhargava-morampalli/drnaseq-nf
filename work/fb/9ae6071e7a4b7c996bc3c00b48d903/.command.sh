#!/bin/bash -ue
mkdir fastqc_sample2_nf.fastq_logs
fastqc -o fastqc_sample2_nf.fastq_logs -f fastq -q sample2_nf.fastq
