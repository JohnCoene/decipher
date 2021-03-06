% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NGramLanguageModel.R
\name{nglm}
\alias{nglm}
\title{N-gram language model}
\usage{
nglm(model, output = NULL)
}
\description{
N-gram language model
}
\examples{
\dontrun{
# get working directory
# need to pass full path
wd <- getwd()

# Training to find "WEF"
data <- paste("This organisation is called the <START:wef> World Economic Forum <END>",
  "It is often referred to as <START:wef> Davos <END> or the <START:wef> WEF <END> .")

# train the model
model <- tnf_train(model = paste0(wd, "/wef.bin"), lang = "en",
  data = data, type = "wef")

ngram <- nglm(model)
}

}
\keyword{internal}
