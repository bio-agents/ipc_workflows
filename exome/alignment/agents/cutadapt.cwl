cwlVersion: v1.0
class: CommandLineAgent
id: cutadapt2
label: cutadapt2

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.raw_sequences)
      - entry: $(inputs.adaptors_file)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/cutadapt:1.18--py36h14c3975_1'

baseCommand: ["cutadapt", "--interleaved"]

arguments:
  - position: 1
    prefix: '-j'
    valueFrom: '0'
  - position: 2
    prefix: '--error-rate'
    valueFrom: '0.2'
  - position: 3
    prefix: '--overlap'
    valueFrom: '6'
  - position: 4
    prefix: '-o'
    valueFrom: '$(inputs.raw_sequences[0].basename + ".trimmed.fastq.gz")'

inputs:
  raw_sequences:
    type: File[]
    inputBinding:
      position: 20
      prefix: ''
      separate: false

  adaptors_file:
    type: File?
    inputBinding:
      position: 10
      prefix: '-a'

outputs:
  output:
    type: File
    outputBinding:
      glob: '*.trimmed.fastq.gz'
