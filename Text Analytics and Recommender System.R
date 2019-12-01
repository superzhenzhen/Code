# Content-based
setwd("/Users/SupremeZhenZhen/Desktop")
pacman::p_load(NLP, tm, SnowballC, RColorBrewer, wordcloud, topicmodels, MASS, 
               class, animation, cluster, fpc, rJava, coreNLP, wordnet, quanteda,
               ggplot2, stringr, udpipe, textrank, lattice, igraph, ggraph, recommenderlab)
df_book_description = read.csv("books_n_description.csv", stringsAsFactors = FALSE,
                               header = TRUE)
head(df_book_description)

df_book_description$X = NULL
colnames(df_book_description) = c("isbn","title","author","year","publisher","category",
                                  "description")
dim(df_book_description)

df_book_description = subset(df_book_description, df_book_description$description != "")
df_book_description[is.na(df_book_description)] <- "Not Available"

# extract keywords
# Co-occurrences
ud_english = udpipe_download_model(language = "english")
extract_collocated_keywords = function(data){
  ud_model = udpipe_load_model(ud_english$file_model)
  annot = udpipe_annotate(ud_model, x = data)
  annot = as.data.frame(annot)
# collocations (words following one another)
stats = keywords_collocation(x = annot, term = "token",
                               group = c("doc_id", "paragraph_id", "sentence_id"),
                               ngram_max = 4)

stats = cooccurrence(x = subset(annot, upos %in% c("NOUN", "ADJ")),
                       term = "lemma", 
                       group = c("doc_id", "paragraph_id","sentence_id"))

stats = cooccurrence(x = annot$lemma, 
                       relevant = annot$upos %in% c("NOUN", "ADJ"))

stats = cooccurrence(x = annot$lemma, 
                       relevant = annot$upos %in% c("NOUN", "ADJ"), skipgram = 2)
  word_bag = stats[1,1]
  for(i in 1:(nrow(stats)-1)){
    word_bag = paste(word_bag,",",stats[i,2])
    word_bag = paste(word_bag,",",stats[i+1,1])
  }
  return(word_bag)
}

df_book_description$keyword <- apply(df_book_description[,7,drop=F], 1, 
                                     extract_collocated_keywords)

my_stopwords <- c(stopwords("english"), "author","will", "also", "etc", "else", "can", "even", "within", "without", 
                  "well", "say", "year", "must", "need", "never", "now", "want", "still", 
                  "time", "therefore", "send", "today", "may", "many", "make", "whose","and","the",
                  "however", "get", "have","first","one","two","three","four","five","six","seven","eight","nine","ten")

vector = VectorSource(df_book_description) 
corpus = VCorpus(vector)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus = tm_map(corpus, removeWords, my_stopwords) 
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus <- tm_map(corpus, stripWhitespace)

dtm <- DocumentTermMatrix(corpus)
dtm_ti <- weightTfIdf(dtm)
dtm_ti

mat_ti <- as.matrix(dtm_ti)

install.packages('proxy')
require(proxy)
dist_mat_cos <- as.matrix(dist(mat_ti, method = "cosine"))
sort(dist_mat_cos[, 1], decreasing = F)[1:10]
comment1[c(1, 8), ] 

getrecommendations_CB <- function(x){
  index <- dist_mat_cos[, x]
  Top10 <-  sort(index, decreasing = F)[1:11]
  Top10
}
getrecommendations_CB(2)   

dist_mat_cos1 <- as.matrix(dist(mat_ti, method = "jaccard")) 
sort(dist_mat_cos1[, 1], decreasing = F)[1:10]
comment1[c(1, 8), ] 

getrecommendations_CB <- function(x){
  index <- dist_mat_cos1[, x]
  Top10 <-  sort(index, decreasing = F)[1:11]
  Top10
}
getrecommendations_CB(2) 

dist_mat_cos2 <- as.matrix(dist(mat_ti, method = "euclidean")) 
sort(dist_mat_cos2[, 1], decreasing = F)[1:10]
comment1[c(1, 8), ]

getrecommendations_CB <- function(x){
  index <- dist_mat_cos2[, x]
  Top10 <-  sort(index, decreasing = F)[1:11]
  Top10
}
getrecommendations_CB(2) 

#for efficient computation on sparse matrix
library(slam)
sim_mat_cos <- crossprod_simple_triplet_matrix(t(dtm_ti))/(sqrt(col_sums(t(dtm_ti)^2) %*% t(col_sums(t(dtm_ti)^2))))
sort(sim_mat_cos[, 1], decreasing = T)[1:10]

