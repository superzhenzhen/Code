setwd("/Users/SupremeZhenZhen/Desktop")
install.packages("animation")
install.packages("cluster")
install.packages("fpc")
install.packages("NLP")
install.packages("topicmodels")
install.packages("wordnet")
setDict("C:/tools/dict")
library(wordnet)
library(topicmodels)
library(class)
library(animation)
library(tm)
library(cluster)
library(fpc)
library(topicmodels)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

my_stopwords <- c(stopwords("english"), "will", "also", "etc", "else", "can", "even", "within", "without", 
                  "well", "say", "year", "must", "need", "never", "now", "want", "still", 
                  "time", "therefore", "send", "today", "may", "many", "make", "whose",
                  "however", "get", "have", "just", "him","hospit","employee","employe","hospital","employ","approxim","work")

# read in file
textdata <- read.delim("osha.txt", header=TRUE, sep="\t", quote = "", stringsAsFactors = FALSE)
texta <- textdata$Employee.Is.Burned.By.Forklift.Radiator.Fluid
textb <- textdata$At.approximately.11.30.a.m..on.November.13..2013..Employee..1..with.Edco.Waste....Recycling.Services..was.operating.a.forklift..Linde.Lift.Truck..Serial..Number..H2X393S04578..identified.by.the.employer.as.FL.3..from.approximately..4.00.a.m...moving.bales.of.recyclable.paper.products.from.a.collection.area.in..the.yard.into.trucks..Then..Employee..1.cleaned.and.was.replacing.an.air..filter.on.the.forklift.FL.3..To.clean.out.the.air.filter..Employee..1.parked..FL.3.in.the.doorway.of.the.maintenance.building..The.air.filter.was.located.on..the.rear.of.the.forklift..behind.the.cab.frame.on.the.driver.s.side..Employee...1.removed.the.air.filter.and.cleaned.it.out..and.then.he.climbed.up.onto.the..back.of.the.forklift.to.replace.it..While.up.on.the.back.of.the.forklift...Employee..1.s.foot.dislodged.the.cooling.system.radiator.cap..The.fluid.in.the..lift.truck.s.cooling.system.was.hot.and.under.pressure.from.being.operated.all..morning..The.hot.fluid.sprayed.up.and.out.of.the.reservoir..Employee..1.was..burned.on.the.upper.legs.and.the.groin.area..Employee..1.jumped.off.of.the..back.of.the.forklift.onto.the.ground..Coworkers.came.to.his.assistance.and..called.emergency.services..Employee..1.was.hospitalized.at.a.burn.center.for..over.24.hours..for.treatment.of.second.degree.burns.to.the.upper.legs.and..groin.area.
head(texta,6)
head(textb,6)

# Creat a Corpus, which can be processed by tm package. Print comments.
vector1 = VectorSource(textb) 
corpus1 = VCorpus(vector1)

# Normalize text
corpus1 = tm_map(corpus1,removePunctuation)
corpus1 = tm_map(corpus1, content_transformer(tolower)) 
corpus1 = tm_map(corpus1, removeNumbers) 
corpus1 = tm_map(corpus1, removeWords, my_stopwords) 
corpus1 = tm_map(corpus1, stemDocument) 
corpus1 = tm_map(corpus1, removeNumbers) 
corpus1 = tm_map(corpus1, removeWords, my_stopwords) 
corpus1 = tm_map(corpus1, stripWhitespace) 

dtm <- DocumentTermMatrix(corpus1)
dtm

#word cloud to check roughly what's in the data
tf <-sort(colSums(as.matrix(dtm)), decreasing=TRUE)
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(tf), tf, max.words=50, colors=dark2)


#######################################
### Topic ###
#######################################
# word cloud to check roughly what's in the data
# Pre-process for topic data and change to dtm 
# Creat a Corpus, which can be processed by tm package. Print comments.
vector2 = VectorSource(texta) 
corpus2 = VCorpus(vector2)

# Normalize text
corpus2 = tm_map(corpus2,removePunctuation)
corpus2 = tm_map(corpus2, content_transformer(tolower)) 
corpus2 = tm_map(corpus2, removeNumbers) 
corpus2 = tm_map(corpus2, removeWords, my_stopwords) 
corpus2 = tm_map(corpus2, stemDocument) 
corpus2 = tm_map(corpus2, removeNumbers) 
corpus2 = tm_map(corpus2, removeWords, my_stopwords) 
corpus2 = tm_map(corpus2, stripWhitespace) 

dtm2 <- DocumentTermMatrix(corpus2)
dtm2

tf2 <-sort(colSums(as.matrix(dtm2)), decreasing=TRUE)
wordcloud(names(tf2), tf, max.words=20, colors=dark2)

#====topic modeling====
#Gibbs method.
dtm_skinny <- removeSparseTerms(dtm2, 0.995)
dtm_skinny

rowTotals <- apply(dtm_skinny, 1, sum) 
dtm_skinny   <- dtm_skinny[rowTotals> 0, ] 
dtm_skinny

lda_5_g <- LDA(dtm_skinny, 5, method="Gibbs")
terms(lda_5_g, 10)
logLik(lda_5_g)
lda_5_g@terms[1:10]
lda_5_g@beta[3, 1:10]

showcloud = function (m, i) {
  tt <- m@beta
  colnames(tt) <- m@terms
  top <- sort(tt[i, ], decreasing = TRUE)
  wordcloud(names(top[1:20]), 2^top[1:20],scale=c(2, .04),rot.per=0.3, colors=dark2)
}
showcloud(lda_5_g, 4)

t(topics(lda_5_g, 3))[1:10,]
which.max(tabulate(topics(lda_5_g)))
tabulate(topics(lda_5_g))

lda_5_g@gamma[1,]
barplot(lda_5_g@gamma[1,], names.arg=1:5, main="Topic distribution of Accident")

getNouns = function (x) {
  tok <- getToken(annotateString(x))
  lem <- unlist(tok[startsWith(tok[, "POS"], "N"), "lemma"])
}

getVerbs = function (x) {
  tok <- getToken(annotateString(x))
  lem <- unlist(tok[startsWith(tok[, "POS"], "V"), "lemma"])
}
initCoreNLP(type="english_fast")
description <- textb
head(description,6)

#get noun lemmas from every comment
lemmaN <- sapply(description, getNouns)
vector1 <- VectorSource(lemmaN)
corpus1 <- VCorpus(vector1)

#create wordcloud 
dark2 <- brewer.pal(6, "Dark2")   
wordcloud(names(freq), freq, max.words=40, rot.per=0.4, colors=dark2)

# get hyponyms
hyponyms <- function(x){
  filter <- getTermFilter("ExactMatchFilter", x, TRUE)
  terms <- getIndexTerms("NOUN", 1, filter)
  synsets <- getSynsets(terms[[1]])
  related <- tryCatch(
    getRelatedSynsets(synsets[[1]], "~"),
    error = function(condition) {
      if (condition$message == "RcallMethod: invalid object parameter")
        message("No direct hyponyms found")
      else
        stop(condition)
      return(NULL)
    }
  )
  if (is.null(related))
    return(NULL)
  return(unlist(sapply(related, getWord)))
}

keyword1 <- hyponyms("employee")
keyword2 <- hyponyms("worker")
keyword <- c(keyword1,keyword2)

dtm.2  =  DocumentTermMatrix(corpus1, control = list(dictionary = keyword , weighting =  weightBin))
m2=as.matrix(dtm.2)
sort(colSums(m2),decreasing = TRUE)

keyword1 <- hyponyms("external body part")
keyword2 <- hyponyms("body part")
keyword <- c(keyword1,keyword2)

dtm.3  =  DocumentTermMatrix(corpus1, control = list(dictionary = keyword , weighting =  weightBin))
m3=as.matrix(dtm.3)
sort(colSums(m3),decreasing = TRUE)