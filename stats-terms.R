

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
    