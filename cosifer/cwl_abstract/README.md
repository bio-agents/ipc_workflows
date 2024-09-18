# Abstract CWL of COSIFER - COnSensus Interaction Network InFErence Workflow

This is an exercise to have an abstract representation of COSIFER workflow available at
[cwl folder](../cwl). The steps to easily get the workflow documentation are:

- Have [cwlagent](https://github.com/common-workflow-language/cwlagent) installed.
- Test 1
  - Change to workflow directory
  - Use `cwlagent` in this way to validate it:

    ```bash
    cwlagent --validate abstract-cosifer-workflow.cwl
    ```
  - Use `cwlagent` in this way to generate a [GraphViz's dot](https://graphviz.org/doc/info/lang.html) representation:

    ```bash
    cwlagent --print-dot abstract-cosifer-workflow.cwl > abstract-cosifer-workflow.dot
    dot -Tpng -o abstract-cosifer-workflow.png abstract-cosifer-workflow.dot
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
