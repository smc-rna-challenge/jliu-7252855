baseCommand: [mps3_fusion_post_dreamChallenge]
class: CommandLineTool
cwlVersion: v1.0
doc: Mapsplice3 Fusion Detection
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/jliu-7252855-mapsplice3_fusion:1.0.0'}
inputs:
- id: alignment
  inputBinding: {position: 2}
  type: Directory
- id: annotation
  inputBinding: {position: 3}
  type: File
- id: index
  inputBinding: {position: 1}
  type: Directory
- id: offset
  inputBinding: {position: 5}
  type: int
- id: output_dir
  inputBinding: {position: 7}
  type: string
- id: paralog
  inputBinding: {position: 6}
  type: File
- id: threads
  inputBinding: {position: 4}
  type: int
outputs:
- id: output
  outputBinding: {glob: $(inputs.output_dir+'/fusionJunc_pass_cmp2ann/fusionJunc_geneInfo_interGene.kept')}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
