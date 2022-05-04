#' mdc_available
#' Check if Make Data Count stats are available, based on HTTP query
#'
#' @param domain Domain of dataverse instance (e.g. demo.dataverse.org)
#'
#' @return Boolean TRUE/FALSE
#' @export
#'
#' @examples mdc_available("dataverse.harvard.edu")
mdc_available <- function(domain) {
  dataverse <- paste0("http://", domain, "/api/info/metrics")
  response <- GET(paste0(dataverse, '/makeDataCount/viewsTotal'))
  if (response$status_code==200) {
    # Even if the API endpoint is available, zero is an unacceptable answer
    if (content(response)$data$`viewsTotalMachine + viewsTotalRegular`==0) {
      return(FALSE)
    }
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' mdc_get
#' Collect Make Data Count statistics of views and downloads from dataverse
#' Includes monthly views and downloads (total and unique for each)
#'
#' @param domain Domain of dataverse instance (e.g. demo.dataverse.org)
#'
#' @return A panel data.frame with columns for each endpoint queried
#' @import httr
#' @export
#'
#' @examples mdc_get("dataverse.harvard.edu")
mdc_get <- function(domain) {
  dataverse <- paste0("http://", domain, "/api/info/metrics")
  endpoints <- c("viewsTotal", "viewsUnique", "downloadsTotal", "downloadsUnique")

  # Cycle through API calls for each specified endpoint
  stats <- lapply(endpoints, function(x, dataverse) {
    stat <- content(GET(paste0(dataverse, '/makeDataCount/', x, '/monthly')))
    stat <- do.call(rbind.data.frame, stat$data)
    names(stat) <- c("date", x)
    stat
  }, dataverse)

  # Reduce the multiple data.frames to one, and return that
  Reduce(
    function(x, y, ...) merge(x, y, all = TRUE, ...),
    stats
  )
}
