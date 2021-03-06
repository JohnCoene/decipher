#' Check OpenNLP Tags
#'
#' @param file Full path to file containing tagged sentences, ussually a \code{.txt} file.
#' @param tag Tagged character vector.
#'
#' @examples
#' \dontrun{
#' data <- 'some sentence with some "<START:tag> erroneous tag <END>." And <START:tag> here also<END>.'
#'
#' # corrected tags
#' data <- check_tags(data)
#' }
#'
#' @rdname checktags
#' @export
check_tags_ <- function(file){
  if(missing(file))
    stop("must pass file", call. = FALSE)

  text <- readLines(file)

  text <- check_tags(text)

  write(text, file = file)

  return(text)
}

#' @rdname checktags
#' @export
check_tags <- function(tag){
  if(missing(tag))
    stop("must pass tag", call. = FALSE)

  text <- gsub("<END>[[:punct:]]", "<END> .", tag)

  text <- check_start(text)

  return(text)
}
