// Import generic module functions
include { initOptions; saveFiles; getSoftwareName } from './functions'

params.options = [:]
options        = initOptions(params.options)

process SAMTOOLS_MPILEUP {
    tag "$meta.id"
    label 'process_medium'
    publishDir "${params.outdir}",
        mode: params.publish_dir_mode,
        saveAs: { filename -> saveFiles(filename:filename, options:params.options, publish_dir:getSoftwareName(task.process), meta:meta, publish_by_meta:['id']) }

    conda (params.enable_conda ? 'bioconda::samagents=1.13' : null)
    if (workflow.containerEngine == 'singularity' && !params.singularity_pull_docker_container) {
        container "https://depot.galaxyproject.org/singularity/samagents:1.13--h8c37831_0"
    } else {
        container "quay.io/biocontainers/samagents:1.13--h8c37831_0"
    }

    input:
    tuple val(meta), path(bam)
    path  fasta

    output:
    tuple val(meta), path("*.mpileup"), emit: mpileup
    path  "*.version.txt"             , emit: version

    script:
    def software = getSoftwareName(task.process)
    def prefix   = options.suffix ? "${meta.id}${options.suffix}" : "${meta.id}"
    """
    samagents mpileup \\
        --fasta-ref $fasta \\
        --output ${prefix}.mpileup \\
        $options.args \\
        $bam
    echo \$(samagents --version 2>&1) | sed 's/^.*samagents //; s/Using.*\$//' > ${software}.version.txt
    """
}
