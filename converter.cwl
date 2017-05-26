baseCommand: [convertMPS3fusionResults2bedpe]
class: CommandLineTool
cwlVersion: v1.0
doc: Convert mps3 fusion detection results to bedpe
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/jliu-7252855-mapsplice3_fusion:1.0.0'}
inputs:
- id: annotation
  inputBinding: {position: 2}
  type: File
- id: fusion
  inputBinding: {position: 3}
  type: File
- id: index
  inputBinding: {position: 1}
  type: Directory
- id: output
  inputBinding: {position: 4}
  type: string
outputs:
- id: output
  outputBinding: {glob: $(inputs.output)}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
