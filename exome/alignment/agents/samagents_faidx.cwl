cwlVersion: v1.0
class: CommandLineAgent
id: samagents-faidx
label: samagents-faidx

doc: Indexing a FASTA file

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.sequences)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/samagents:1.5--2'

baseCommand: ["samagents", "faidx"]

inputs:
  sequences:
    type: File
    inputBinding:
      position: 1

outputs:
  output:
    type: File
    outputBinding:
      glob: "*.fa"
    secondaryFiles:
      - .fai
