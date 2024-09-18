# multiAffinity Workflow

The steps to easily test the workflow is:

- Have [cwlagent](https://github.com/common-workflow-language/cwlagent) installed.
- Test
  - Change to workflow directory
  - Download sample data folder from <https://github.com/bsc-life/multiAffinity/tree/main/sample_data>.
  - Use `cwlagent` in this way:

    ```bash
    cwlagent --singularity --tmpdir-prefix=work/ --tmp-outdir-prefix=work/ multiaffinity-workflow.cwl multiaffinity.yml
    ```
