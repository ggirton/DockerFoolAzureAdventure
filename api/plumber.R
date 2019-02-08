#install.packages("plumber")
library(plumber)
#?plumber

glossaries <- c("oopsie","boopsie","toopsie") 

# plumber.R

# Get static site out of the way 1st

#* @assets ./www /
list()

#' return a random glossary entry
#' @get /randomg
#'  @serializer unboxedJSON
function() {
  g <- sample(1:3,1)
  print( glossaries[g])
  x <- list(status = glossaries[g], code = "200",output = list(studentid = "1001", name = "Kevin"))
  return (x)
}


#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#' @get /DockerFool
#' @html
function(){
  "<html><h1>hello W</h1><h2>I am a Crazy Fool about DOCKER</h2><blink>true</blink></html>"
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

#c("Census2010_Current",	"Census2010 Vintage")
#c("ACS2013_Current",	"ACS2013 Vintage")
#c("ACS2014_Current",	"ACS2014 Vintage")
#c("ACS2015_Current",	"ACS2015 Vintage")
#c("ACS2016_Current",	"ACS2016 Vintage")
#c("ACS2017_Current",	"ACS2017 Vintage")
