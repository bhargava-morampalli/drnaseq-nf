process separatereads {

    publishDir params.intersams, mode:'copy', pattern: '*.sam'
    publishDir params.mappedlists, mode:'copy', pattern: '*_ids.lst'
    publishDir params.mappedfastqs, mode:'copy', pattern: '*mapped.fastq'
    publishDir params.unmappedfastqs, mode:'copy', pattern: '*unmapped.fastq'

    input:
    path sams
    path reads

    output:
    path "*.mapped.sam"
    path "*.unmapped.sam"
    path "*.mapped_ids.lst"
    path "*.unmapped_ids.lst"
    path "*_mapped.fastq"
    path "*_unmapped.fastq"

    script:
    """
    samtools view -S -F4 $sams > ${sams.baseName}.mapped.sam
    samtools view -S -f4 $sams > ${sams.baseName}.unmapped.sam
    cut -f1 ${sams.baseName}.mapped.sam | sort | uniq > ${sams.baseName}.mapped_ids.lst
    cut -f1 ${sams.baseName}.unmapped.sam | sort | uniq > ${sams.baseName}.unmapped_ids.lst
    seqtk subseq ${reads.baseName}.fastq ${sams.baseName}.mapped_ids.lst > ${sams.baseName}_mapped.fastq
    seqtk subseq ${reads.baseName}.fastq ${sams.baseName}.unmapped_ids.lst > ${sams.baseName}_unmapped.fastq
    """
}