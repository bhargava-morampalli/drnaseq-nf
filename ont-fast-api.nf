process multitosingle {

    publishDir params.singlefast5s, mode:'copy'

    input:
    path fast5s

    output:
    path "*.fast5", emit: bams

    script:
    """
    multi_to_single_fast5 --input_path $fast5s --save_path /scratch/bhargava/nanopore/2020-10-28-BRM-K12-IVT-RNA-MULTI/basecall-bc2/single_fast5s --recursive
    samtools view -S -b $sams | samtools sort -o ${sams.baseName}.sorted.bam
    """

}