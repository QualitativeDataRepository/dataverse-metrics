# dataverse_metrics

This package is meant for the administrators of dataverse repositories. Using API calls to your dataverse instance, it produces a digestible overview of your site's activity in any format supported by RMarkdown.

# Setting up the report to use your dataverse instance

The beginning of the Rmarkdown file sets a variable to change the hostname for the Dataverse instance. The default is set to the instance at demo.dataverse.org.

If you have use a valid API key, you can also include unpublished projects in the output document. The `dataverse_key` variable is sent as an HTTP header to validate your access. This variable can be set in your environment variables (it is imported from the environment variable `DATAVERSE_TOKEN`), or changed in the Rmd file itself near the top.
