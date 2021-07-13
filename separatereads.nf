process separatereads {

    publishDir params.mappedfastqs, mode:'copy', pattern: '*_mapped.fastq'
    publishDir params.unmappedfastqs, mode:'copy', pattern: '*_unmapped.fastq'

    input:
    path reads
    path mappedids
    path unmappedids

    output:

    path "*_mapped.fastq", emit: mappedfastqs
    path "*_unmapped.fastq", emit: unmappedfastqs

    when:
    reads.simpleName == mapped_ids.simpleName

    script:
    """
    seqtk subseq $reads $mappedids > ${reads.baseName}_mapped.fastq
    seqtk subseq $reads $unmappedids > ${reads.baseName}_unmapped.fastq
    """

}