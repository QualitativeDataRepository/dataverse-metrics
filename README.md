# Automated Dataverse Metrics Reports

This dynamic report provides a comprehensive overview of activity on a Dataverse server.

Dataverse has many API endpoints offering statistics of activity. Combining data from these endpoints, this package produces a human-readable report of your site's activity in any format supported by RMarkdown.

Because dataverse-metrics can take advantage of Dataverse API keys to gather statistics on unpublished projects, this package is meant for the administrators of dataverse repositories. Users only interested in public data, however, can run the report on any available dataverse instance.


# Demo

This project was demoed in a Dataverse Community Call. There is a [video introduction](https://harvard.zoom.us/rec/share/UH5SWkIz4pMKSB4bSJBv1YaGDpAlJM7SYgBIRMNV_wUNSk9QOUDI34of58qQzoiH.K8KwMm2Gocf1QcV7) available for new users showing the capabilities of this project.

# Usage

Using this report requires minimal to no coding when used directly on Github!
This RMarkdown document is run manually through Github Actions, with a workflow_dispatch action.

The Render workflow generates the report as an HTML and latex PDF, available to download as an directly from the workflow page as a _workflow artifact_. Since the rendering process is run directly on Github Actions, no additional software is required on the user's local computer (besides a web browser for HTML, or a PDF viewer to see the final document)

The workflow has the option to pass a few parameters, namely:

1. The dataverse host (e.g. demo.dataverse.org)
2. An additional date span to calculate statistics for (e.g. specify the past month, past year, etc)

# Setting up the report to use your dataverse instance

You can _fork_ this repository to your own account. From your forked repository, you can run the included Github Action to generate your own reports for any hosted instance of Dataverse.

If you have use a valid API key, you can also include statistics on unpublished projects in the output document. By setting the environment variable `DATAVERSE_TOKEN` as a Github *secret*, the API key will be passed to your specified Dataverse server with each request. This is an optional step.

