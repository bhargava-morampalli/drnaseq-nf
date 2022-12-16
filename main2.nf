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

params.native16sbc1fast5s = "results/native_bc1_16s/multifast5s/"
params.native16sbc2fast5s = "results/native_bc2_16s/multifast5s/"
params.native16sbc3fast5s = "results/native_bc3_16s/multifast5s/"

params.ivt16sbc1fast5s = "results/ivt_bc1_16s/multifast5s/"
params.ivt16sbc2fast5s = "results/ivt_bc2_16s/multifast5s/"
params.ivt16sbc3fast5s = "results/ivt_bc3_16s/multifast5s/"

params.native23sbc1fast5s = "results/native_bc1_23s/multifast5s/"
params.native23sbc2fast5s = "results/native_bc2_23s/multifast5s/"
params.native23sbc3fast5s = "results/native_bc3_23s/multifast5s/"

params.ivt23sbc1fast5s = "results/ivt_bc1_23s/multifast5s/"
params.ivt23sbc2fast5s = "results/ivt_bc2_23s/multifast5s/"
params.ivt23sbc3fast5s = "results/ivt_bc3_23s/multifast5s/"


params.native16sbc1singlefast5s = "results/native_bc1_16s/singlefast5s/"
params.native16sbc2singlefast5s = "results/native_bc2_16s/singlefast5s/"
params.native16sbc3singlefast5s = "results/native_bc3_16s/singlefast5s/"

params.ivt16sbc1singlefast5s = "results/ivt_bc1_16s/singlefast5s/"
params.ivt16sbc2singlefast5s = "results/ivt_bc2_16s/singlefast5s/"
params.ivt16sbc3singlefast5s = "results/ivt_bc3_16s/singlefast5s/"

params.native23sbc1singlefast5s = "results/native_bc1_23s/singlefast5s/"
params.native23sbc2singlefast5s = "results/native_bc2_23s/singlefast5s/"
params.native23sbc3singlefast5s = "results/native_bc3_23s/singlefast5s/"

params.ivt23sbc1singlefast5s = "results/ivt_bc1_23s/singlefast5s/"
params.ivt23sbc2singlefast5s = "results/ivt_bc2_23s/singlefast5s/"
params.ivt23sbc3singlefast5s = "results/ivt_bc3_23s/singlefast5s/"

params.native16sbc1nanodoc = "results/native_bc1_16s/nanodocpreprocess"
params.native16sbc2nanodoc = "results/native_bc2_16s/nanodocpreprocess"
params.native16sbc3nanodoc = "results/native_bc3_16s/nanodocpreprocess"

params.ivt16sbc1nanodoc = "results/ivt_bc1_16s/nanodocpreprocess"
params.ivt16sbc2nanodoc = "results/ivt_bc2_16s/nanodocpreprocess"
params.ivt16sbc3nanodoc = "results/ivt_bc3_16s/nanodocpreprocess"

params.native23sbc1nanodoc = "results/native_bc1_23s/nanodocpreprocess"
params.native23sbc2nanodoc = "results/native_bc2_23s/nanodocpreprocess"
params.native23sbc3nanodoc = "results/native_bc3_23s/nanodocpreprocess"

params.ivt23sbc1nanodoc = "results/ivt_bc1_23s/nanodocpreprocess"
params.ivt23sbc2nanodoc = "results/ivt_bc2_23s/nanodocpreprocess"
params.ivt23sbc3nanodoc = "results/ivt_bc3_23s/nanodocpreprocess"


Channel
    .fromPath(params.reference_16s)
    .set {reference_16s}

Channel
    .fromPath(params.reference_23s)
    .set {reference_23s}

Channel
    .fromPath(params.native16sbc1fast5s)
    .set {native16sbc1fast5s}

Channel
    .fromPath(params.native16sbc2fast5s)
    .set {native16sbc2fast5s}

Channel
    .fromPath(params.native16sbc3fast5s)
    .set {native16sbc3fast5s}

Channel
    .fromPath(params.native23sbc1fast5s)
    .set {native23sbc1fast5s}
Channel
    .fromPath(params.native23sbc2fast5s)
    .set {native23sbc2fast5s}
Channel
    .fromPath(params.native23sbc3fast5s)
    .set {native23sbc3fast5s}

Channel
    .fromPath(params.ivt16sbc1fast5s)
    .set {ivt16sbc1fast5s}
Channel
    .fromPath(params.ivt16sbc2fast5s)
    .set {ivt16sbc2fast5s}
Channel
    .fromPath(params.ivt16sbc3fast5s)
    .set {ivt16sbc3fast5s}

Channel
    .fromPath(params.ivt23sbc1fast5s)
    .set {ivt23sbc1fast5s}
Channel
    .fromPath(params.ivt23sbc2fast5s)
    .set {ivt23sbc2fast5s}
Channel
    .fromPath(params.ivt23sbc3fast5s)
    .set {ivt23sbc3fast5s}


Channel
    .fromPath(params.native16sbc1singlefast5s)
    .set {native16sbc1singlefast5s}
Channel
    .fromPath(params.native16sbc2singlefast5s)
    .set {native16sbc2singlefast5s}
Channel
    .fromPath(params.native16sbc3singlefast5s)
    .set {native16sbc3singlefast5s}

Channel
    .fromPath(params.native23sbc1singlefast5s)
    .set {native23sbc1singlefast5s}
Channel
    .fromPath(params.native23sbc2singlefast5s)
    .set {native23sbc2singlefast5s}
Channel
    .fromPath(params.native23sbc3singlefast5s)
    .set {native23sbc3singlefast5s}

Channel
    .fromPath(params.ivt16sbc1singlefast5s)
    .set {ivt16sbc1singlefast5s}
Channel
    .fromPath(params.ivt16sbc2singlefast5s)
    .set {ivt16sbc2singlefast5s}
Channel
    .fromPath(params.ivt16sbc3singlefast5s)
    .set {ivt16sbc3singlefast5s}

Channel
    .fromPath(params.ivt23sbc1singlefast5s)
    .set {ivt23sbc1singlefast5s}
Channel
    .fromPath(params.ivt23sbc2singlefast5s)
    .set {ivt23sbc2singlefast5s}
Channel
    .fromPath(params.ivt23sbc3singlefast5s)
    .set {ivt23sbc3singlefast5s}




include { fast5subset as native16sbc1subset } from './fast5subset'
include { fast5subset as native16sbc2subset } from './fast5subset'
include { fast5subset as native16sbc3subset } from './fast5subset'

include { fast5subset as native23sbc1subset } from './fast5subset'
include { fast5subset as native23sbc2subset } from './fast5subset'
include { fast5subset as native23sbc3subset } from './fast5subset'

include { fast5subset as ivt16sbc1subset } from './fast5subset'
include { fast5subset as ivt16sbc2subset } from './fast5subset'
include { fast5subset as ivt16sbc3subset } from './fast5subset'

include { fast5subset as ivt23sbc1subset } from './fast5subset'
include { fast5subset as ivt23sbc2subset } from './fast5subset'
include { fast5subset as ivt23sbc3subset } from './fast5subset'


include { multitosingle as m2snative16sbc1 } from './multitosingle'
include { multitosingle as m2snative16sbc2 } from './multitosingle'
include { multitosingle as m2snative16sbc3 } from './multitosingle'

include { multitosingle as m2snative23sbc1 } from './multitosingle'
include { multitosingle as m2snative23sbc2 } from './multitosingle'
include { multitosingle as m2snative23sbc3 } from './multitosingle'

include { multitosingle as m2sivt16sbc1 } from './multitosingle'
include { multitosingle as m2sivt16sbc2 } from './multitosingle'
include { multitosingle as m2sivt16sbc3 } from './multitosingle'

include { multitosingle as m2sivt23sbc1 } from './multitosingle'
include { multitosingle as m2sivt23sbc2 } from './multitosingle'
include { multitosingle as m2sivt23sbc3 } from './multitosingle'


include { tomboresquiggle as resquigglenative16sbc1 } from './tomboresquiggle'
include { tomboresquiggle as resquigglenative16sbc2 } from './tomboresquiggle'
include { tomboresquiggle as resquigglenative16sbc3 } from './tomboresquiggle'

include { tomboresquiggle as resquigglenative23sbc1 } from './tomboresquiggle'
include { tomboresquiggle as resquigglenative23sbc2 } from './tomboresquiggle'
include { tomboresquiggle as resquigglenative23sbc3 } from './tomboresquiggle'

include { tomboresquiggle as resquiggleivt16sbc1 } from './tomboresquiggle'
include { tomboresquiggle as resquiggleivt16sbc2 } from './tomboresquiggle'
include { tomboresquiggle as resquiggleivt16sbc3 } from './tomboresquiggle'

include { tomboresquiggle as resquiggleivt23sbc1 } from './tomboresquiggle'
include { tomboresquiggle as resquiggleivt23sbc2 } from './tomboresquiggle'
include { tomboresquiggle as resquiggleivt23sbc3 } from './tomboresquiggle'


include { nanodocpreprocess as ndocnative16sbc1 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocnative16sbc2 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocnative16sbc3 } from './nanodocpreprocess'

include { nanodocpreprocess as ndocnative23sbc1 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocnative23sbc2 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocnative23sbc3 } from './nanodocpreprocess'

include { nanodocpreprocess as ndocivt16sbc1 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocivt16sbc2 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocivt16sbc3 } from './nanodocpreprocess'

include { nanodocpreprocess as ndocivt23sbc1 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocivt23sbc2 } from './nanodocpreprocess'
include { nanodocpreprocess as ndocivt23sbc3 } from './nanodocpreprocess'


workflow {

    native16sbc1subset (params.nativebc1fast5s, params.native16sbc1_id)
    native16sbc2subset (params.nativebc2fast5s, params.native16sbc2_id)
    native16sbc3subset (params.nativebc3fast5s, params.native16sbc3_id)

    native23sbc1subset (params.nativebc1fast5s, params.native23sbc1_id)
    native23sbc2subset (params.nativebc2fast5s, params.native23sbc2_id)
    native23sbc3subset (params.nativebc3fast5s, params.native23sbc3_id)

    ivt16sbc1subset (params.ivtbc1fast5s, params.ivt16sbc1_id)
    ivt16sbc2subset (params.ivtbc2fast5s, params.ivt16sbc2_id)
    ivt16sbc3subset (params.ivtbc3fast5s, params.ivt16sbc3_id)

    ivt23sbc1subset (params.ivtbc1fast5s, params.ivt23sbc1_id)
    ivt23sbc2subset (params.ivtbc2fast5s, params.ivt23sbc2_id)
    ivt23sbc3subset (params.ivtbc3fast5s, params.ivt23sbc3_id)

    m2snative16sbc1 (native16sbc1fast5s, native16sbc1subset.out.subsetdone_ch)
    m2snative16sbc2 (native16sbc2fast5s, native16sbc2subset.out.subsetdone_ch)
    m2snative16sbc3 (native16sbc3fast5s, native16sbc3subset.out.subsetdone_ch)

    m2snative23sbc1 (native23sbc1fast5s, native23sbc1subset.out.subsetdone_ch)
    m2snative23sbc2 (native23sbc2fast5s, native23sbc2subset.out.subsetdone_ch)
    m2snative23sbc3 (native23sbc3fast5s, native23sbc3subset.out.subsetdone_ch)

    m2sivt16sbc1 (ivt16sbc1fast5s, ivt16sbc1subset.out.subsetdone_ch)
    m2sivt16sbc2 (ivt16sbc2fast5s, ivt16sbc2subset.out.subsetdone_ch)
    m2sivt16sbc3 (ivt16sbc3fast5s, ivt16sbc3subset.out.subsetdone_ch)

    m2sivt23sbc1 (ivt23sbc1fast5s, ivt23sbc1subset.out.subsetdone_ch)
    m2sivt23sbc2 (ivt23sbc2fast5s, ivt23sbc2subset.out.subsetdone_ch)
    m2sivt23sbc3 (ivt23sbc3fast5s, ivt23sbc3subset.out.subsetdone_ch)


    resquigglenative16sbc1 (native16sbc1singlefast5s, reference_16s, m2snative16sbc1.out.multidone_ch)
    resquigglenative23sbc1 (native23sbc1singlefast5s, reference_23s, m2snative23sbc1.out.multidone_ch)

    resquigglenative16sbc2 (native16sbc2singlefast5s, reference_16s, m2snative16sbc2.out.multidone_ch)
    resquigglenative23sbc2 (native23sbc2singlefast5s, reference_23s, m2snative23sbc2.out.multidone_ch)

    resquigglenative16sbc3 (native16sbc3singlefast5s, reference_16s, m2snative16sbc3.out.multidone_ch)
    resquigglenative23sbc3 (native23sbc3singlefast5s, reference_23s, m2snative23sbc3.out.multidone_ch)

    resquiggleivt16sbc1 (ivt16sbc1singlefast5s, reference_16s, m2sivt16sbc1.out.multidone_ch)
    resquiggleivt23sbc1 (ivt23sbc1singlefast5s, reference_23s, m2sivt23sbc1.out.multidone_ch)

    resquiggleivt16sbc2 (ivt16sbc2singlefast5s, reference_16s, m2sivt16sbc2.out.multidone_ch)
    resquiggleivt23sbc2 (ivt23sbc2singlefast5s, reference_23s, m2sivt23sbc2.out.multidone_ch)

    resquiggleivt16sbc3 (ivt16sbc3singlefast5s, reference_16s, m2sivt16sbc3.out.multidone_ch)
    resquiggleivt23sbc3 (ivt23sbc3singlefast5s, reference_23s, m2sivt23sbc3.out.multidone_ch)


    ndocnative16sbc1 (native16sbc1singlefast5s, reference_16s, resquigglenative16sbc1.out.tombodone_ch)
    ndocnative16sbc2 (native16sbc2singlefast5s, reference_16s, resquigglenative16sbc2.out.tombodone_ch)
    ndocnative16sbc3 (native16sbc3singlefast5s, reference_16s, resquigglenative16sbc3.out.tombodone_ch)

    ndocnative23sbc1 (native23sbc1singlefast5s, reference_23s, resquigglenative23sbc1.out.tombodone_ch)
    ndocnative23sbc2 (native23sbc2singlefast5s, reference_23s, resquigglenative23sbc2.out.tombodone_ch)
    ndocnative23sbc3 (native23sbc3singlefast5s, reference_23s, resquigglenative23sbc3.out.tombodone_ch)

    ndocivt16sbc1 (ivt16sbc1singlefast5s, reference_16s, resquiggleivt16sbc1.out.tombodone_ch)
    ndocivt16sbc2 (ivt16sbc2singlefast5s, reference_16s, resquiggleivt16sbc2.out.tombodone_ch)
    ndocivt16sbc3 (ivt16sbc3singlefast5s, reference_16s, resquiggleivt16sbc3.out.tombodone_ch)

    ndocivt23sbc1 (ivt23sbc1singlefast5s, reference_23s, resquiggleivt23sbc1.out.tombodone_ch)
    ndocivt23sbc2 (ivt23sbc2singlefast5s, reference_23s, resquiggleivt23sbc2.out.tombodone_ch)
    ndocivt23sbc3 (ivt23sbc3singlefast5s, reference_23s, resquiggleivt23sbc3.out.tombodone_ch)



}
workflow.onComplete {
        log.info ( workflow.success ? "\nDone! Workflow complete\n" : "Oops .. something went wrong" )
}