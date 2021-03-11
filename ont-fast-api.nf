process multitosingle {

    publishDir params.singlefast5s, mode:'copy'

    input:
    path fast5s

    output:
    path params.singlefast5s

    script:
    """
    multi_to_single_fast5 -i $fast5s -s params.singlefast5s --recursive
    """

}