nextflow.enable.dsl=2

/*
 * pipeline input parameters
 */
params.reads = "$baseDir/data/*.fastq"
params.reference = "/data/bhargava/reference_files/K12/K12a.fa"
params.reference_norrna = "/data/bhargava/reference_files/K12/k12_norrna.fa"
params.reference_rrna = "/data/bhargava/reference_files/K12/k12_rrna.fa"
params.outdir = "results"
params.sams = "results/sams"
params.bams = "results/bams"
params.flagstat = "results/flagstat"
params.depth = "results/depth"
params.nanoplot_stats = "results/nanoplot_stats"
params.intersams = "results/sams-intermediate"
params.mappedlists = "results/mappedlists"
params.mappedfastqs = "results/mappedfastqs"
params.unmappedfastqs = "results/unmappedfastqs"


log.info """\
         R N A S E Q - N F   P I P E L I N E
         ===================================
         reference        : ${params.reference}
         reference_norrna : ${params.reference_norrna}
         reference_rrna   : ${params.reference_rrna}
         reads            : ${params.reads}
         outdir           : ${params.outdir}
         """
         .stripIndent()

Channel
    .fromPath(params.reads, checkIfExists: true)
    .set { reads }

/* 
 * Process: mapping the fastq files to the reference genome using minimap2
*/

process minimap2 {
    
    publishDir params.sams, mode:'copy'

    input:
    path reference
    path reads

    output:
    path "*_full.sam", emit: fullsams

    script:
    """
    minimap2 -ax splice -uf -k14 --secondary=no $reference $reads > ${reads.baseName}_full.sam
    """

}

/* 
 * Process: mapping the fastq files to the rRNA reference using minimap2
*/

process minimap2rrna {
    
    publishDir params.sams, mode:'copy'

    input:
    path reference_rrna
    path reads

    output:
    path "*_rrna.sam", emit: rrnasams

    script:
    """
    minimap2 -ax splice -uf -k14 --secondary=no $reference_rrna $reads > ${reads.baseName}_rrna.sam
    """

}

/* 
 * Process: mapping the fastq files to the rRNA reference using minimap2
*/

process minimap2norrna {
    
    publishDir params.sams, mode:'copy'

    input:
    path reference_norrna
    path reads

    output:
    path "*_norrna.sam", emit: norrnasams

    script:
    """
    minimap2 -ax splice -uf -k14 --secondary=no $reference_norrna $reads > ${reads.baseName}_norrna.sam
    """

}

include { bamprocess } from './bamprocess'
include { flagstat } from './flagstat'
include { depth } from './depth'
include { nanoplot } from './nanoplot'
include { bamindex } from './bamindex'
include { separatereads } from './separatereads'

workflow {
    
    reference = params.reference
    reference_norrna = params.reference_norrna
    reference_rrna = params.reference_rrna

    Channel
    .fromPath(params.reads, checkIfExists: true)
    .set { reads }

    minimap2(reference, reads)
    minimap2rrna(reference_rrna, reads)
    minimap2norrna(reference_norrna, reads)

    params.samscombined = "$baseDir/results/sams/*.sam"

    Channel
    .fromPath(params.samscombined)
    .set { samscombined }

    bamprocess (samscombined)
    
    flagstat (bamprocess.out)
    
    depth (bamprocess.out)

    bamindex (bamprocess.out)

    nanoplot (bamprocess.out)

    separatereads (minimap2.out, reads)

}

workflow.onComplete {
        log.info ( workflow.success ? "\nDone! Workflow complete\n" : "Oops .. something went wrong" )
}