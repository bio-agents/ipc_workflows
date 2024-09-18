cwlVersion: v1.0
class: CommandLineAgent
id: gunzip
label: gunzip

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - $(inputs.reference_genome)

hints:
  DockerRequirement:
    dockerPull: 'alpine:3.9'

baseCommand: ["gunzip"]

arguments: ["-c", "-v"]

inputs:
  reference_genome:
    type: File
    inputBinding:
      position: 2

outputs:
  output:
    type: stdout
    streamable: true

stdout: $(inputs.reference_genome.nameroot)
