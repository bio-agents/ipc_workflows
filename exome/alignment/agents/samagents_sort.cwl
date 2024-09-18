cwlVersion: v1.0
class: CommandLineAgent
id: samagents-sort
label: samagents_sort

doc: Sort a BAM file

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.bam_unsorted)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/samagents:1.5--2'

baseCommand: ["samagents", "sort"]

inputs:
  bam_unsorted:
    type: File
    inputBinding:
      position: 2

  threads:
    type: string?
    default: "8"
    inputBinding:
      position: 1
      prefix: '--threads'

arguments:
  - position: 2
    prefix: '-o'
    valueFrom: $(inputs.bam_unsorted.nameroot).sorted.bam

outputs:
  output:
    type: File
    outputBinding:
      glob: "*.sorted.bam"
