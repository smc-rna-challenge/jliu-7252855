class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jliu@synapse.org,
  'foaf:name': jliu}
doc: 'SMC-RNA challenge fusion detection submission

  Mapsplice3 fusion detection workflow'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: annotation, type: File}
- {id: index, type: File}
- {id: paralog, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: converter/output, type: File}
steps:
- id: converter
  in:
  - {id: annotation, source: annotation}
  - {id: fusion, source: mps3_fusion/output}
  - {id: index, source: tar/output}
  - {default: final.bedpe, id: output}
  out: [output]
  run: converter.cwl
- id: gunzip1
  in:
  - {id: input, source: TUMOR_FASTQ_1}
  out: [output]
  run: gunzip.cwl
- id: gunzip2
  in:
  - {id: input, source: TUMOR_FASTQ_2}
  out: [output]
  run: gunzip.cwl
- id: mps3
  in:
  - {id: fastq1, source: gunzip1/output}
  - {id: fastq2, source: gunzip2/output}
  - {id: index, source: tar/output}
  - {default: true, id: option1s}
  - {default: true, id: option2s}
  - {default: true, id: option3s}
  - {default: mps3, id: output_dir}
  - {default: 8, id: thread}
  out: [output]
  run: mps3.cwl
- id: mps3_fusion
  in:
  - {id: alignment, source: mps3/output}
  - {id: annotation, source: annotation}
  - {id: index, source: tar/output}
  - {default: 5, id: offset}
  - {default: fusion, id: output_dir}
  - {id: paralog, source: paralog}
  - {default: 4, id: threads}
  out: [output]
  run: mps3_fusion.cwl
- id: tar
  in:
  - {id: index, source: index}
  out: [output]
  run: tar.cwl
