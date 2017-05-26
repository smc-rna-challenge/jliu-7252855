arguments:
- {position: 4, prefix: -G, valueFrom: $(inputs.index)}
- {position: 5, prefix: -L, valueFrom: $(inputs.index+"/2ndLevelIndex/")}
baseCommand: [mps]
class: CommandLineTool
cwlVersion: v1.0
doc: mapsplice3 alignment
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/jliu-7252855-mapsplice3_fusion:1.0.0'}
inputs:
- id: fastq1
  inputBinding: {position: 7, prefix: '-1'}
  type: File
- id: fastq2
  inputBinding: {position: 8, prefix: '-2'}
  type: File
- {id: index, type: Directory}
- id: option1s
  inputBinding: {position: 1, prefix: -J}
  type: boolean
- id: option2s
  inputBinding: {position: 2, prefix: -B}
  type: boolean
- id: option3s
  inputBinding: {position: 3, prefix: --fusion-search}
  type: boolean
- id: output_dir
  inputBinding: {position: 9, prefix: -O}
  type: string
- id: thread
  inputBinding: {position: 6, prefix: -T}
  type: int
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_dir)}
  type: Directory
requirements:
- {class: InlineJavascriptRequirement}
