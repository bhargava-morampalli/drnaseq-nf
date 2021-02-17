process flagstat {

    publishDir params.flagstat, mode:'copy'

    input:
    path bams

    output:
    path "*_flagstat.txt", emit: flagstat

    script:
    """
    samtools flagstat $bams | tee ${bams.baseName}_flagstat.txt
    """

}