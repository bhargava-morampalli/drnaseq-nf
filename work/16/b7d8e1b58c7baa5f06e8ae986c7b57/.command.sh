#!/bin/bash -ue
mkdir fastqc_sub3.fastq_logs
fastqc -o fastqc_sub3.fastq_logs -f fastq -q sub3.fastq
