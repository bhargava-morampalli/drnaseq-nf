process nanoplot {

    publishDir params.nanoplot_stats, mode:'copy'

    input:
    path bams

    output:
    path "${bams.baseName}-*.{png, html, txt, log}", emit: stats

    script:
    """
    NanoPlot -t 40 --bam $bams --plots hex dot kde --title "${bams}" --maxlength 10000 -p ${bams.baseName}-
    """

}