process bamindex {

    publishDir params.bams, mode:'copy'

    input:
    path bams

    output:
    path "*.bam.bai", emit: bams

    script:
    """
    samtools index $bams ${bams.baseName}.bam.bai
    """

}