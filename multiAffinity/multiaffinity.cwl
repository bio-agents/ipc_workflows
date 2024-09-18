cwlVersion: v1.0
class: CommandLineAgent
id: multiaffinity
label: multiaffinity

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.counts)
      - $(inputs.metadata)
      - $(inputs.layers)

hints:
  DockerRequirement:
    dockerPull: 'marbatlle/multiaffinity:latest'

baseCommand: [multiaffinity]

inputs:
  counts:
    type: File[]
    inputBinding:
      position: 1
      prefix: '-c'
      itemSeparator: ','
  metadata:
    type: File[]
    inputBinding:
      position: 2
      prefix: '-m'
      itemSeparator: ','
  layers:
    type: File[]?
    inputBinding:
      position: 3
      prefix: '-n'
      itemSeparator: ','
  output_dir:
    type: string?
    default: "result"
    inputBinding:
      position: 4
      prefix: '-o'
  approach:
    type: string?
    default: "local"
    inputBinding:
      position: 5
      prefix: '-a'
  padj:
    type: string?
    default: "0.05"
    inputBinding:
      position: 6
      prefix: '-b'
  LFC:
    type: string?
    default: "1.0"
    inputBinding:
      position: 7
      prefix: '-d'
  control_id:
    type: string?
    default: "Normal"
    inputBinding:
      position: 8
      prefix: '-e'
  multiXrank_r:
    type: string?
    default: "0.15"
    inputBinding:
      position: 9
      prefix: '-f'
  multiXrank_selfloops:
    type: int?
    default: 1
    inputBinding:
      position: 10
      prefix: '-g'
  Molti_modularity:
    type: int?
    default: 1
    inputBinding:
      position: 11
      prefix: '-i'
  Molti_Louvain:
    type: int?
    default: 5
    inputBinding:
      position: 12
      prefix: '-j'
  min_nodes:
    type: int?
    default: 7
    inputBinding:
      position: 13
      prefix: '-k'

outputs:
  output:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)
