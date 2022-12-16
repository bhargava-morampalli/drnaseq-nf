process multitosingle {

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
    path multitosingleinputpath
    val flag

    output:
    path "*"
    path "filename_mapping.txt"
    val true, emit: multidone_ch

    script:

    """
    multi_to_single_fast5 --input_path $multitosingleinputpath --save_path ./ --recursive
    """
}