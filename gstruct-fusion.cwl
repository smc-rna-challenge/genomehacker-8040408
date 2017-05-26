arguments:
- {position: 1, prefix: -D, valueFrom: $(inputs.dbdir)}
- {position: 4, prefix: -O, valueFrom: $(runtime.outdir)}
baseCommand: [gstruct-fusion]
class: CommandLineTool
cwlVersion: v1.0
doc: 'GSTRUCT-fusion: Analysis'
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/genomehacker-8040408-gstruct-fusion:1.0.0'}
inputs:
- id: aligndir
  inputBinding: {position: 99}
  type: Directory
- {id: dbdir, type: Directory}
- id: genesfile
  inputBinding: {position: 3, prefix: -m}
  type: string
- id: gmapdb
  inputBinding: {position: 2, prefix: -d}
  type: string
- id: samplename
  inputBinding: {position: 5, prefix: -o}
  type: string
outputs:
- id: output
  outputBinding: {glob: sample.report.bedpe}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
