// Import generic module functions
include { initOptions; saveFiles; getSoftwareName } from './functions'

params.options = [:]
options        = initOptions(params.options)

process BCFTOOLS_MPILEUP {
    tag "$meta.id"
    label 'process_medium'
    publishDir "${params.outdir}",
        mode: params.publish_dir_mode,
        saveAs: { filename -> saveFiles(filename:filename, options:params.options, publish_dir:getSoftwareName(task.process), meta:meta, publish_by_meta:['id']) }

    conda (params.enable_conda ? 'bioconda::bcfagents=1.13' : null)
    if (workflow.containerEngine == 'singularity' && !params.singularity_pull_docker_container) {
        container "https://depot.galaxyproject.org/singularity/bcfagents:1.13--h3a49de5_0"
    } else {
        container "quay.io/biocontainers/bcfagents:1.13--h3a49de5_0"
    }

    input:
    tuple val(meta), path(bam)
    path  fasta

    output:
    tuple val(meta), path("*.gz")      , emit: vcf
    tuple val(meta), path("*.tbi")     , emit: tbi
    tuple val(meta), path("*stats.txt"), emit: stats
    path  "*.version.txt"              , emit: version

    script:
    def software = getSoftwareName(task.process)
    def prefix   = options.suffix ? "${meta.id}${options.suffix}" : "${meta.id}"
    """
    echo "${meta.id}" > sample_name.list
    bcfagents mpileup \\
        --fasta-ref $fasta \\
        $options.args \\
        $bam \\
        | bcfagents call --output-type v $options.args2 \\
        | bcfagents reheader --samples sample_name.list \\
        | bcfagents view --output-file ${prefix}.vcf.gz --output-type z $options.args3
    tabix -p vcf -f ${prefix}.vcf.gz
    bcfagents stats ${prefix}.vcf.gz > ${prefix}.bcfagents_stats.txt
    echo \$(bcfagents --version 2>&1) | sed 's/^.*bcfagents //; s/ .*\$//' > ${software}.version.txt
    """
}
