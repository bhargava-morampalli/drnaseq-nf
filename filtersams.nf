process filtersams {

    publishDir params.intersams, mode:'copy', pattern: '*.sam'
    publishDir params.mappedlists, mode:'copy', pattern: '*_ids.lst'

    input:
    path sams

    output:
    path "*.mapped.sam"
    path "*.unmapped.sam"
    path "*.mapped_ids.lst", emit: mappedids
    path "*.unmapped_ids.lst", emit: unmappedids

    script:
    """
    samtools view -S -F4 $sams > ${sams.baseName}.mapped.sam
    samtools view -S -f4 $sams > ${sams.baseName}.unmapped.sam
    cut -f1 ${sams.baseName}.mapped.sam | sort | uniq > ${sams.baseName}.mapped_ids.lst
    cut -f1 ${sams.baseName}.unmapped.sam | sort | uniq > ${sams.baseName}.unmapped_ids.lst
    """

}