process nanoplot_fastqs {

    publishDir params.nanoplot_unmapped, mode:'copy'

    input:
    path unmappedfastqs

    output:
    path "${unmappedfastqs.baseName}-*.{png, html, txt, log}", emit: stats

    script:
    """
    NanoPlot -t 40 --fastq $unmappedfastqs --plots hex dot kde --title "${unmappedfastqs}" --maxlength 10000 -p ${unmappedfastqs.baseName}-
    """

}