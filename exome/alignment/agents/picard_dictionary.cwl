cwlVersion: v1.0
class: CommandLineAgent
id: picard_markduplicates
label: picard_markduplicates

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.reference_genome)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/picard:2.22.2--0'

baseCommand: ["picard", "CreateSequenceDictionary"]

inputs:
  reference_genome:
    type: File
    inputBinding:
      position: 1
      prefix: 'R='
      separate: false

arguments:
  - position: 2
    prefix: 'O='
    separate: false
    valueFrom: $(inputs.reference_genome.nameroot).dict

outputs:
  output:
    type: File
    outputBinding:
      glob: "*.dict"
