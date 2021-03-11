process nanoplot {

    publishDir params.nanocomp_stats, mode:'copy'

    input:
    path bams

    output:
    path "${bams.baseName}-*.{png, html, txt, log}", emit: stats

    script:
    """
    NanoComp --bam ${bams.baseName}sub1_full.sam sub2_full.sam sub3_full.sam --outdir compare-runs
    NanoPlot -t 40 --bam $bams --plots hex dot kde --title "${bams}" --maxlength 10000 -p ${bams.baseName}-
    """

}