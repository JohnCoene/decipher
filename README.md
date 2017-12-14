# decipher

Tools to develop, build and train Natural Language processing models.

![decipher sticker](decipher_sticker.png)

## Install

```r
devtools::install_git("http://chlxintgitl01.weforum.local/JCOE/decipher.git",
  credentials = git2r::cred_user_pass("login", "password"))
```

### Dependencies

This package relies on [openNLP](http://opennlp.apache.org/) CLI tools.

1. [Download](http://opennlp.apache.org/download.html) binary *AND* source files.
2. Unzip both the binary and the source folders.
3. Add `path/to/opennlp/bin` to path and make sure it is in R too with `Sys.getenv("PATH")`.

You're good to go.

## Functions

* `tnf` Run model.
* `tnf_trainer` Trains your model

## Examples

```r
library(decipher)

# get working directory
# need to pass full path
wd <- getwd()

# Training to find "WEF"
data <- paste("This organisation is called the <START:wef> World Economic Forum <END>", 
  "It is often referred to as <START:wef> Davos <END> or the <START:wef> WEF <END>.")

# Save the above as file
write(data, file = "input.txt")

# Trains the model and returns the full path to the model
model <- tnf_trainer(model = paste0(wd, "/wef.bin"), lang = "en",
  data = paste0(wd, "/input.txt"), type = "wef")

# Create sentences to test our model
sentences <- paste("This sentence mentions the World Economic Forum the annual meeting",
  "of which takes place in Davos. Note that the forum is often called the WEF.")

# Save sentences
write(data, file = "sentences.txt")

# Extract names
# Without specifying an output file the extracted names appear in the console
tnf(model = model, sentences = paste0(wd, "/sentences.txt"))

# returns path to output file
output <- tnf(model = model, sentences = paste0(wd, "/sentences.txt"),
  output = paste0(wd, "/output.txt"))
```
