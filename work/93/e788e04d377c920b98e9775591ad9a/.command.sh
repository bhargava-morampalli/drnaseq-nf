#!/bin/bash -ue
mkdir fastqc_sub1.fastq_logs
fastqc -o fastqc_sub1.fastq_logs -f fastq -q sub1.fastq
