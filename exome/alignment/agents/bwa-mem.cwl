cwlVersion: v1.0
class: CommandLineAgent
id: bwa-mem
label: bwa_mem

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.trimmed_fastq)
      - entry: $(inputs.reference_genome)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/bwa:0.7.17--h84994c4_5'

baseCommand: ["bwa" , "mem", "-M", "-p"]

inputs:
  trimmed_fastq:
    type: File
    inputBinding:
      position: 4

  reference_genome:
    type: File
    inputBinding:
      position: 3
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa

  sample_name:
    type: string

  threads:
    type: string?
    default: '2'
    inputBinding:
      position: 1
      prefix: '-t'

  read_group:
    type: string
    default: '@RG\\tID:H947YADXX\\tSM:NA12878\\tPL:ILLUMINA'
    inputBinding:
      position: 2
      prefix: '-R'

outputs:
  output:
    type: File
    outputBinding:
      glob: "*.sam"

stdout: $(inputs.sample_name).sam
