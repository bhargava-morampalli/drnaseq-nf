process bamprocess {

    publishDir params.bams, mode:'copy'

    input:
    path sams

    output:
    path "*.sorted.bam", emit: bams

    script:
    """
    samtools view -S -b $sams | samtools sort -o ${sams.baseName}.sorted.bam
    """

}