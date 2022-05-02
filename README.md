# dataverse-metrics

Dataverse has many API endpoints offering statistics about site activity.  Combining data from these endpoints on your dataverse instance, this package produces a human-readable report of your site's activity in any format supported by RMarkdown.

Because dataverse-metrics can take advantage of Dataverse API keys to gather statistics on unpublished projects, this package is meant for the administrators of dataverse repositories. Users only interested in public data, however, can run the report on any available dataverse instance.

# Setting up the report to use your dataverse instance

The beginning of the Rmarkdown file sets a variable to change the hostname for the Dataverse instance. The default is set to the instance at demo.dataverse.org. Other examples include dataverse.harvard.edu.

If you have use a valid API key, you can also include unpublished projects in the output document. The `dataverse_key` variable is sent as an HTTP header to validate your access. This variable can be set in your environment variables (it is imported from the environment variable `DATAVERSE_TOKEN`), or changed in the Rmd file itself near the top.

# Render workflow

Installing R and the packages necessary for compiling a PDF from RMarkdown (including latex) is a lot of dependencies. In order to streamline the process for non-programmers, there is also a workflow file to generate the report from RMarkdown directly through Github Actions. 

The `render.yml` workflow generates the report as an HTML and latex PDF, available to download as an artifact directly from the workflow page. Since it is run directly on servers hosted by Github, no additional software is required on the user's local computer (besides a web browser for HTML, or a PDF viewer)

In the case of being run through Github Actions, `DATAVERSE_TOKEN` should be set as a repository secret. It is passed to dataverse-metrics as a environment variable.
