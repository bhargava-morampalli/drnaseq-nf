process nanoplot {

    publishDir params.nanoplot_stats, mode:'copy'

    input:
    path bams

    output:
    path "${bams.baseName}-*", emit: stats

    script:
    """
    NanoPlot -t 40 --bam $bams -o ${bams.Parent}/ --plots hex dot kde --title "${bams}" --store --raw --maxlength 10000 -p ${bams.baseName}-
    """

}