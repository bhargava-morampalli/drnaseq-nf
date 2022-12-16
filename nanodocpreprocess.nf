process nanodocpreprocess {

    publishDir "$params.outdir/native_bc1_16s/nanodocpreprocess", pattern: "*native_bc1_16s*", mode:'copy'
    publishDir "$params.outdir/native_bc2_16s/nanodocpreprocess", pattern: "*native_bc2_16s*", mode:'copy'
    publishDir "$params.outdir/native_bc3_16s/nanodocpreprocess", pattern: "*native_bc3_16s*", mode:'copy'

    publishDir "$params.outdir/native_bc1_23s/nanodocpreprocess", pattern: "*native_bc1_23s*", mode:'copy'
    publishDir "$params.outdir/native_bc2_23s/nanodocpreprocess", pattern: "*native_bc2_23s*", mode:'copy'
    publishDir "$params.outdir/native_bc3_23s/nanodocpreprocess", pattern: "*native_bc3_23s*", mode:'copy'

    publishDir "$params.outdir/ivt_bc1_16s/nanodocpreprocess", pattern: "*ivt_bc1_16s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc2_16s/nanodocpreprocess", pattern: "*ivt_bc2_16s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc3_16s/nanodocpreprocess", pattern: "*ivt_bc3_16s*", mode:'copy'

    publishDir "$params.outdir/ivt_bc1_23s/nanodocpreprocess", pattern: "*ivt_bc1_23s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc2_23s/nanodocpreprocess", pattern: "*ivt_bc2_23s*", mode:'copy'
    publishDir "$params.outdir/ivt_bc3_23s/nanodocpreprocess", pattern: "*ivt_bc3_23s*", mode:'copy'

    input:
    path singlefast5s
    path reference
    val flag

    output:
    path "*.pq"
    path "index.txt"

    script:
    """
    source ~/nanoDoc/src/venv3/bin/activate
    python /home/bhargavam/nanoDoc/src/nanoDoc.py formatfile -i $singlefast5s -o ./ -r $reference -t 50
    deactivate
    """
}