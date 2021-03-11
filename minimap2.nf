process minimap2 {
    
    publishDir params.sams, mode:'copy', pattern: '*.sam'

    input:
    path reference
    path reference_rrna
    path reads

    output:
    path "${reads.baseName}.sam", emit: full_sams
    path "${reads.baseName}_rrna.sam", emit: rrna_sams

    script:
    
    """
    minimap2 -ax splice -uf -k14 --secondary=no $reference $reads > ${reads.baseName}.sam
    minimap2 -ax splice -uf -k14 --secondary=no $reference_rrna $reads > ${reads.baseName}_rrna.sam
    """
}