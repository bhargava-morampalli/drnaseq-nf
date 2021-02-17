#!/bin/zsh

for file in $path

samtools view -S -F4 $path > $path.mapped.sam
samtools view -S -f4 $path > $path.unmapped.sam
cut -f1 $path.mapped.sam | sort | uniq > $path.mapped_ids.lst
cut -f1 $path.unmapped.sam | sort | uniq > $path.unmapped_ids.lst
seqtk subseq 20210117_dRNA_G9_combined.fastq mapped_ids.lst > g9_mapped.fastq
seqtk subseq 20210117_dRNA_G9_combined.fastq unmapped_ids.lst > g9_unmapped.fastq
