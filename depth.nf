process depth {

    publishDir params.depth, mode:'copy'

    input:
    path bams

    output:
    path "*_depth.txt", emit: depth

    script:
    """
    samtools depth -m 0 $bams > ${bams.baseName}_depth.txt
    """

}