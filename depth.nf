process depth {

    publishDir params.depth, mode:'copy'

    input:
    path bams

    output:
    path "*_depth.txt", emit: depth

    script:
    """
    samtools depth -a -m 0 $bams > ${bams.baseName}_depth.txt
    """

}