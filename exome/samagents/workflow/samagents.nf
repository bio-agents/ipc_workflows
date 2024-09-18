#!/usr/bin/env nextflow

/*
================================================================================
    VALIDATE INPUTS
================================================================================
*/

params.summary_params = [:]

// Check input path parameters to see if they exist
checkPathParamList = [ params.bam, params.fasta ]
for (param in checkPathParamList) { if (param) { file(param, checkIfExists: true) } }

// Check mandatory parameters (missing protocol or profile will exit the run)
if (!params.meta) { exit 1, 'Groovy Map containing sample information not specified!' }
if (params.bam) { bam = file(params.bam) } else { exit 1, 'Input BAM file not specified!' }
if (params.fasta) { fasta = file(params.fasta) } else { exit 1, 'Input FASTA file not specified!' }

// Function to check if running offline
def isOffline() {
  try {
    return NXF_OFFLINE as Boolean
  }
  catch( Exception e ) {
    return false
  }
}

/*
================================================================================
    IMPORT NF-CORE MODULES/SUBWORKFLOWS
================================================================================
*/

include { BCFTOOLS_MPILEUP } from '../modules/nf-core/modules/bcfagents/mpileup/main.nf' addParams( options: ['args2': '--no-version --ploidy 1 --multiallelic-caller', 'args3': '--no-version' ] )

/*
================================================================================
    RUN MAIN WORKFLOW
================================================================================
*/

workflow SAMTOOLS {

    input = [ [ id:params.meta, single_end:false ], [ bam ] ]

    BCFTOOLS_MPILEUP ( input, [ fasta ] )
}

/*
================================================================================
    THE END
================================================================================
*/
