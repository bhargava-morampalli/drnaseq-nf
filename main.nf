nextflow.enable.dsl=2

/*
 * pipeline input parameters
 */
params.reads = "$baseDir/data/*.fastq"
params.fast5s = "$baseDir/data/*.fast5"
params.reference = "/data/bhargava/reference_files/K12/K12a.fa"
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
params.singlefast5s = "results/singlefast5s"
params.nanoplot_unmapped = "results/unmapped_nanoplot"
params.nanocomp_stats = "results/nanocomp"


log.info """\
         R N A S E Q - N F   P I P E L I N E
         ===================================
         reference        : ${params.reference}
         reference_rrna   : ${params.reference_rrna}
         reads            : ${params.reads}
         outdir           : ${params.outdir}
         """
         .stripIndent()

include { bamprocess } from './bamprocess'
include { flagstat } from './flagstat'
include { depth } from './depth'
include { nanoplot } from './nanoplot'
include { bamindex } from './bamindex'
include { filtersams } from './filtersams'
include { separatereads } from './separatereads'
include { multitosingle } from './ont-fast-api'
include { nanoplot_fastqs } from './nanoplot_fastqs'
include { minimap2 } from './minimap2'

reference = params.reference
reference_rrna = params.reference_rrna

workflow {

    Channel
    .fromPath(params.reads, checkIfExists: true)
    .set { reads }

    minimap2(reference, reference_rrna, reads)
 
    bamprocess (minimap2.out.full_sams.concat(minimap2.out.rrna_sams)) | flagstat & depth & bamindex

    filtersams (minimap2.out.full_sams)

    separatereads (reads, filtersams.out.mappedids,  filtersams.out.unmappedids)
    
    nanoplot_fastqs (separatereads.out.unmappedfastqs)
}

workflow.onComplete {
        log.info ( workflow.success ? "\nDone! Workflow complete\n" : "Oops .. something went wrong" )
}