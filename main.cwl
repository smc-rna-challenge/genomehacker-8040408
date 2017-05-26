class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': genomehacker@synapse.org,
  'foaf:name': genomehacker}
doc: 'SMC-RNA challenge fusion detection submission

  GSTRUCT-fusion workflow: tar genome index, align with GSNAP, analyze with GSTRUCT-fusion'
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: gstruct-fusion/output, type: File}
steps:
- id: gsnap
  in:
  - {id: dbdir, source: tar/output}
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {default: sam, id: format}
  - {default: GRCh37.75, id: gmapdb}
  - {default: true, id: gunzip}
  - {default: true, id: nosamheaders}
  - {default: 5, id: noutputs}
  - {default: 1, id: novelsplicing}
  - {default: 4, id: nthreads}
  - {default: ensembl.known.splicesites, id: splicingfile}
  out: [output]
  run: gsnap.cwl
- id: gstruct-fusion
  in:
  - {id: aligndir, source: gsnap/output}
  - {id: dbdir, source: tar/output}
  - {default: ensembl.known.genes, id: genesfile}
  - {default: GRCh37.75, id: gmapdb}
  - {default: sample, id: samplename}
  out: [output]
  run: gstruct-fusion.cwl
- id: tar
  in:
  - {id: input, source: index}
  out: [output]
  run: tar.cwl
