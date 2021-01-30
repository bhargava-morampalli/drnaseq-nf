#!/bin/bash -ue
mkdir fastqc_sub2.fastq_logs
fastqc -o fastqc_sub2.fastq_logs -f fastq -q sub2.fastq
