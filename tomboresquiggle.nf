process tomboresquiggle {

    publishDir "$params.outdir/native_bc1_16s/singlefast5s", pattern: "*native_bc1_16s*", mode:'copy'
    publishDir "$params.outdir/native_bc2_16s/singlefast5s", pattern: "*native_bc2_16s*", mode:'copy'
    publishDir "$params.outdir/native_bc3_16s/singlefast5s", pattern: "*native_bc3_16s*", mode:'copy'

    publishDir "$params.outdir/native_bc1_23s/singlefast5s", pattern: "*native_bc1_23s*", mode:'copy'
    publishDir "$params.outdir/native_bc2_23s/singlefast5s", pattern: "*native_bc2_23s*", mode:'copy'
    publishDir "$params.outdir/native_bc3_23s/singlefast5s", pattern: "*native_bc3_23s*", mode:'copy'

    publishDir "$params.outdir/ivt_bc1_16s/singlefast5s", pattern: "*ivt_bc1_16s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc2_16s/singlefast5s", pattern: "*ivt_bc2_16s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc3_16s/singlefast5s", pattern: "*ivt_bc3_16s*", mode:'copy'

    publishDir "$params.outdir/ivt_bc1_23s/singlefast5s", pattern: "*ivt_bc1_23s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc2_23s/singlefast5s", pattern: "*ivt_bc2_23s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc3_23s/singlefast5s", pattern: "*ivt_bc3_23s*", mode:'copy'

    input:
    path singlefast5s
    path reference
    val flag

    output:
    path "*", optional: true
    val true, emit: tombodone_ch

    script:
    """
    tombo resquiggle $singlefast5s $reference --rna --processes 50 --overwrite --num-most-common-errors 5
    """
}