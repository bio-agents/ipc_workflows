## alignment workflow

The steps to easily test the alignment workflow are:

- Have [cwlagent](https://github.com/common-workflow-language/cwlagent) installed.

- Use cwlagent in this way:

```bash
cwlagent --outdir={outputs folder} --tmpdir-prefix={intermediate folder} --tmp-outdir-prefix={intermediate folder} alignment/workflow.cwl alignment/{normal/tumor}_workflow.yml
```

## samagents workflow

The steps to easily test the samagents workflow are:

- Have [nextflow](https://www.nextflow.io/) installed.

- Use nextflow in this way:

```bash
nextflow main.nf --meta <normal/tumor> --bam {BAM file} --fasta {FASTA file} -profile <docker/singularity>
```

## pindel workflow


## exomeDepth workflow

