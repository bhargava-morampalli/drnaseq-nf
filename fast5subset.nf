process fast5subset {

    publishDir "$params.outdir/${idtextfile.baseName}/multifast5s", mode:'copy'
    

    input:
    path fast5inputpath
    path idtextfile

    output:
    path "*.fast5", emit: subsetfast5s
    path "filename_mapping.txt"
    val true, emit: subsetdone_ch

    script:

    """
    fast5_subset -i $fast5inputpath -s ./ -l $idtextfile -f ${idtextfile.baseName}- --recursive
    """
}