#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

/*
================================================================================
    PRINT HELP
================================================================================
*/

def helpMessage() {
    log.info nfcoreHeader()
    log.info"""

    Usage:

    The command for running the pipeline is as follows:

    nextflow main.nf --meta sample.name --bam sample.bam --fasta sample.fa -profile singularity

    Mandatory arguments:
      --meta        [str] Sample name (e.g. tumor or normal)

      --bam         [file] Path to input BAM file

      --fasta       [file] Path to input FASTA file

      -profile      [str] Configuration profile to use. Can use multiple (comma separated)
                          Available: docker, singularity and more.

    """.stripIndent()
}

// Show help message
if (params.help) exit 0, helpMessage()

/*
================================================================================
    RUN main WORKFLOW
================================================================================
*/

workflow {
  /*
  * RUN EXOME SAMTOOLS WORKFLOW
  */
  include { SAMTOOLS } from './workflow/samagents' addParams( [:] )
  SAMTOOLS ()
}

/*
================================================================================
    THE END
================================================================================
*/
