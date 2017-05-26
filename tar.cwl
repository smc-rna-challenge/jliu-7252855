baseCommand: [tar, xvzf]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: index
  inputBinding: {position: 1}
  type: File
outputs:
- id: output
  outputBinding: {glob: ./scratch/lcph222/Xinan/hg19_mps3index/}
  type: Directory
