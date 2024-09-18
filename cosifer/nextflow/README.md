# COSIFER - COnSensus Interaction Network InFErence Workflow

- [nextflow.config](https://github.com/inab/ipc_workflows/blob/main/cosifer/nextflow/nextflow.config) contains information regarding:

    - COSIFER [container](https://hub.docker.com/r/tsenit/cosifer) to be used.
    - Report files to be produced and their paths.

- [nextflow.nf](https://github.com/inab/ipc_workflows/blob/main/cosifer/nextflow/nextflow.nf) contains:

	- Definition of params accepted by the workflow.
	- Method of params accepted by the workflow on CMD:
	
        ```
        cosifer -i FILEPATH -o OUTPUT_DIRECTORY
        ```
            
The steps to easily test the workflow is:

- Have [nextflow](https://www.nextflow.io/) installed.
- Test 1
  - Change to workflow directory
  - Download example toy input file from <https://raw.githubusercontent.com/PhosphorylatedRabbits/cosifer/master/examples/interactive/data_matrix.csv>.
  - Use `nextflow` in this way:
    
    ```bash
    nextflow run . --data_matrix=data_matrix.csv --sep=',' --outputsDir=tests/interactive
    ```
  - If you want to test the workflow with `singularity`, use `nextflow` in this way:

    ```bash
    nextflow -c singularity-params.json run . --data_matrix=data_matrix.csv --sep=','  --outputsDir=tests/interactive
    ```
- Test 2
  - Change to workflow directory
  - Download example input file from <https://raw.githubusercontent.com/PhosphorylatedRabbits/cosifer/master/examples/tcga-brca/rppa-processed.tsv.zip>.
  - Use `nextflow` in this way:
    
    ```bash
    nextflow run . --data_matrix=rppa-processed.tsv.zip --index_col=0 --outputsDir=tests/rppa
    ```
- Test 3 (it takes a couple of minutes)
  - Change to workflow directory
  - Download example input files from <https://raw.githubusercontent.com/PhosphorylatedRabbits/cosifer/master/examples/tcga-brca/rnaseq-processed.tsv.zip> and <http://ge-lab.org/gskb/4-animal-Results_database_gmt/homo_sapiens_human_gmt2.gmt>. We are using only the two first lines from the second file, in order to shorten the test.
  - Use `nextflow` in this way:
    
    ```bash
    tail -n +2 homo_sapiens_human_gmt2.gmt | head -n 2 > homo_sapiens_human_gmt2-first2.gmt
    nextflow run . --data_matrix=rnaseq-processed.tsv.zip --index_col=0 --hallmark_gene_sets_file=homo_sapiens_human_gmt2-first2.gmt --outputsDir=tests/rnaseq-processed
    ```

## Citation
```bib
@article{10.1093/bioinformatics/btaa942,
    author = {Manica, Matteo and Bunne, Charlotte and Mathis, Roland and Cadow, Joris and Ahsen, Mehmet Eren and Stolovitzky, Gustavo A and Martínez, María Rodríguez},
    title = "{COSIFER: a python package for the consensus inference of molecular interaction networks}",
    journal = {Bioinformatics},
    year = {2020},
    month = {11},
    issn = {1367-4803},
    doi = {10.1093/bioinformatics/btaa942},
    url = {https://doi.org/10.1093/bioinformatics/btaa942},
    note = {btaa942},
    eprint = {https://academic.oup.com/bioinformatics/advance-article-pdf/doi/10.1093/bioinformatics/btaa942/34088187/btaa942.pdf},
}
```
