class: CommandLineAgent
cwlVersion: v1.0
id: picard_markduplicates
label: picard_markduplicates

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.alignments)

hints:
  DockerRequirement:
    dockerPull: 'quay.io/biocontainers/picard:2.22.2--0'

baseCommand: ["picard", "MarkDuplicates"]

inputs:
  alignments:
    type: File
    inputBinding:
      position: 2
      prefix: 'INPUT='
      separate: false

arguments:
  - position: 0
    prefix: OPTICAL_DUPLICATE_PIXEL_DISTANCE=
    valueFrom: '100'
    separate: false
  - position: 0
    prefix: TAGGING_POLICY=
    valueFrom: 'All'
    separate: false
  - position: 0
    prefix: CREATE_INDEX=
    valueFrom: 'true'
    separate: false
  - position: 0
    prefix: REMOVE_DUPLICATES=
    valueFrom: 'true'
    separate: false
  - position: 0
    prefix: TAG_DUPLICATE_SET_MEMBERS=
    valueFrom: 'true'
    separate: false
  - position: 0
    prefix: ASSUME_SORT_ORDER=
    valueFrom: 'coordinate'
    separate: false
  - position: 1
    prefix: 'METRICS_FILE='
    valueFrom: $(inputs.alignments.nameroot).metrics.txt
    separate: false
  - position: 3
    prefix: 'OUTPUT='
    valueFrom: $(inputs.alignments.nameroot).md.bam
    separate: false

outputs:
  output:
    type: File
    outputBinding:
      glob: '*.md.bam'
    secondaryFiles:
     - ^.bai
