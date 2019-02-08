#install.packages("plumber")  # This is already installed in this docker image
library(plumber)

#?plumber  # What is this plumber of which we speak?

stats.term.glossary <- read.csv("./randoms/stats-terms2.csv",
                                stringsAsFactors = FALSE)

nterms <- nrow(stats.term.glossary)
nterms == 136

random.quote <- function () {
  ith <- sample(1:nterms,1) # pick a random index into the glossary
  return(list (stats.term.glossary[ith,'term'], 
                stats.term.glossary[ith,'definition'])
  )
}

random.quote()
    

# Mock up several random glossaries to use in testing (this worked great)
glossaries <- c("oopsie","boopsie","loopsie","toopsie") 

# plumber.R

# Set up static site reference, served from www folder

#* @assets ./www /
list()

#' return a random glossary entry
#' @get /randomg
#'  @serializer unboxedJSON
function() {
  g <- sample(1:4,1)
  print( glossaries[g])   # Show it on console of docker server
  # x <- list(status = glossaries[g], code = "200",output = list(authorID = "Allen B Downey", license = "CC BY-NC 3.0"))
  x <- list(stats_term = random.quote(), code = "200",output = list(authorID = "Allen B Downey", license = "CC BY-NC 3.0"))
  return (x)
}

### These are from the default Plumber.R

#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#' @get /DockerFool
#' @html
function(){
  "<html><h1>Hello Wrld</h1><h2>Hi there I am just a Docker FOOL</h2><blink>true ;-) </blink></html>"
}

#' Plot out data from the iris dataset
#' @param spec If provided, filter the data to only this species (e.g. 'setosa')
#' @get /plot
#' @png
function(spec){
  myData <- iris
  title <- "All Species"
  
  # Filter if the species was specified
  if (!missing(spec)){
    title <- paste0("Only the '", spec, "' Species")
    myData <- subset(iris, Species == spec)
  }
  
  plot(myData$Sepal.Length, myData$Petal.Length,
       main=title, xlab="Sepal Length", ylab="Petal Length")
}


#* @serializer contentType list(type="application/pdf")
#* @get /pdftime
function(){
  tmp <- tempfile()
  pdf(tmp)
  plot(1:10, type="b")
  text(4, 8, "It's PDF TIME from plumber!")
  text(6, 2, paste("The time is", Sys.time()))
  dev.off()
  
  readBin(tmp, "raw", n=file.info(tmp)$size)
}

# pAPI_and_Site <- plumber::plumb("plumber.R", dir = "api"); pAPI_and_Site$run(port=8001)
# You could run this from within RStudio...

