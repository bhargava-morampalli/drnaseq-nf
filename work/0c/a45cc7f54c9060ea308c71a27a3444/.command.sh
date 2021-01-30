#!/bin/bash -ue
mkdir fastqc_sample3_nf.fastq_logs
fastqc -o fastqc_sample3_nf.fastq_logs -f fastq -q sample3_nf.fastq
