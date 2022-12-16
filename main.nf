nextflow.enable.dsl=2

/*
 * pipeline input parameters
 */


params.reference_16s = "/data/bhargava/reference_files/G9/G9prokka/16s1_extended.fa"
params.reference_23s = "/data/bhargava/reference_files/G9/G9prokka/23s1_extended.fa"

params.nativebc1fast5s = "/scratch/bhargava/nanopore/20210117-dRNA-combined/basecall-bc1/workspace"
params.nativebc2fast5s = "/scratch/bhargava/nanopore/20210117-dRNA-combined/basecall-bc2/workspace"
params.nativebc3fast5s = "/scratch/bhargava/nanopore/20210117-dRNA-combined/basecall-bc3/workspace"

params.ivtbc1fast5s = "/scratch/bhargava/nanopore/20210601-BRM-G9-IVT-dRNA/basecall_fast5_bc1"
params.ivtbc2fast5s = "/scratch/bhargava/nanopore/20210601-BRM-G9-IVT-dRNA/basecall_fast5_bc2"
params.ivtbc3fast5s = "/scratch/bhargava/nanopore/20210601-BRM-G9-IVT-dRNA/basecall_fast5_bc3"

params.native16sbc1_id = "$baseDir/data/native/16s/bc1/native_bc1_16s.txt"
params.native16sbc2_id = "$baseDir/data/native/16s/bc2/native_bc2_16s.txt"
params.native16sbc3_id = "$baseDir/data/native/16s/bc3/native_bc3_16s.txt"

params.native23sbc1_id = "$baseDir/data/native/23s/bc1/native_bc1_23s.txt"
params.native23sbc2_id = "$baseDir/data/native/23s/bc2/native_bc2_23s.txt"
params.native23sbc3_id = "$baseDir/data/native/23s/bc3/native_bc3_23s.txt"

params.ivt16sbc1_id = "$baseDir/data/ivt/16s/bc1/ivt_bc1_16s.txt"
params.ivt16sbc2_id = "$baseDir/data/ivt/16s/bc2/ivt_bc2_16s.txt"
params.ivt16sbc3_id = "$baseDir/data/ivt/16s/bc3/ivt_bc3_16s.txt"

params.ivt23sbc1_id = "$baseDir/data/ivt/23s/bc1/ivt_bc1_23s.txt"
params.ivt23sbc2_id = "$baseDir/data/ivt/23s/bc2/ivt_bc2_23s.txt"
params.ivt23sbc3_id = "$baseDir/data/ivt/23s/bc3/ivt_bc3_23s.txt"


params.outdir = "results"

params.multifast5s = "results/native_bc1_16s/multifast5s/"


params.singlefast5s = "results/native_bc1_16s/singlefast5s/"


params.nanodoc = "results/native_bc1_16s/nanodocpreprocess"


Channel
    .fromPath(params.reference_16s)
    .set {reference_16s}

Channel
    .fromPath(params.reference_23s)
    .set {reference_23s}

Channel
    .fromPath(params.multifast5s)
    .set {multifast5s}

Channel
    .fromPath(params.singlefast5s)
    .set {singlefast5s}

Channel
    .fromPath(params.nanodoc)
    .set {nanodoc}


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

process multitosingle {

    publishDir "$params.singlefast5s", mode:'copy'

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


process tomboresquiggle {

    publishDir "$params.singlefast5s", mode:'copy'

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

process nanodocpreprocess {

    publishDir "$params.nanodoc", mode:'copy'

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



workflow {

    fast5subset (params.nativebc1fast5s, params.native16sbc1_id)


    multitosingle (multifast5s, fast5subset.out.subsetdone_ch)


    tomboresquiggle (singlefast5s, reference_16s, multitosingle.out.multidone_ch)


    nanodocpreprocess (singlefast5s, reference_16s, tomboresquiggle.out.tombodone_ch)


}
workflow.onComplete {
        log.info ( workflow.success ? "\nDone! Workflow complete\n" : "Oops .. something went wrong" )
}