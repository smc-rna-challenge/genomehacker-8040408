arguments:
- {position: 1, prefix: -D, valueFrom: $(inputs.dbdir)}
- {position: 9, prefix: --split-output=, separate: false, valueFrom: $(runtime.outdir)/sample}
baseCommand: [gsnap]
class: CommandLineTool
cwlVersion: v1.0
doc: 'GSNAP: Alignment'
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/genomehacker-8040408-gsnap:1.0.0'}
inputs:
- {id: dbdir, type: Directory}
- id: fastq1
  inputBinding: {position: 98}
  type: File
- id: fastq2
  inputBinding: {position: 99}
  type: ['null', File]
- id: format
  inputBinding: {position: 7, prefix: -A}
  type: string
- id: gmapdb
  inputBinding: {position: 2, prefix: -d}
  type: string
- id: gunzip
  inputBinding: {position: 97, prefix: --gunzip}
  type: boolean
- id: nosamheaders
  inputBinding: {position: 8, prefix: --no-sam-headers}
  type: boolean
- id: noutputs
  inputBinding: {position: 6, prefix: -n}
  type: int
- id: novelsplicing
  inputBinding: {position: 4, prefix: --novelsplicing=, separate: false}
  type: int
- id: nthreads
  inputBinding: {position: 3, prefix: -t}
  type: int
- id: splicingfile
  inputBinding: {position: 5, prefix: -s}
  type: ['null', string]
outputs:
- id: output
  outputBinding: {glob: .}
  type: Directory
requirements:
- {class: InlineJavascriptRequirement}
