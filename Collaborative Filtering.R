setwd("/Users/SupremeZhenZhen/Desktop")
pacman::p_load(tidyverse, recommenderlab, rebus)
source("CF-demolib-v3.R") # for using explicit ratings
source("CF-demolib-implict-v2.r") # for using implicit ratings

set.seed(5)
books_main <- as.tibble(read.csv("BX-Books.csv", sep = ";", encoding = "ISO 8859-1", stringsAsFactors = FALSE))
head(books_main,10)

books_main <- select(books_main, c(1:3))
books_main <- na.omit(books_main)
books_main$ISBN <- substr(books_main$ISBN, start = 1, stop = 10)
books_main$ISBN.c <- substr(books_main$ISBN, start = 1, stop = 9) %>% as.numeric() %>% is.na()
books_main <- books_main %>% filter(ISBN.c == FALSE)
books_main <- select(books_main, c(1:3))
books_main$ISBN <- as.factor(books_main$ISBN)
books_main$Book.Title <- as.factor(books_main$Book.Title)
books_main$Book.Author <- as.factor(books_main$Book.Author)

book_ratings <- as.tibble(read.csv("BX-Book-Ratings.csv", sep = ";", stringsAsFactors = FALSE, encoding = "ISO 8859-1"))
book_ratings$User.ID <- as.factor(book_ratings$User.ID)
book_ratings$ISBN_char_len <- str_count(book_ratings$ISBN)

# trim off users who made too few reviews
cnts <- aggregate(ISBN ~ User.ID, data = book_ratings, FUN = length) 
colnames(cnts) <- c("User.ID","numitems") 
activeusers <- cnts$User.ID[cnts$numitems >= 5]
length(activeusers)
ev <- book_ratings[book_ratings$User.ID %in% activeusers,]                  

# trim off books with too few reviews
cnts <- aggregate(User.ID ~ ISBN, data = book_ratings, FUN = length)
colnames(cnts) <- c("ISBN","numusers") 
popularbooks <- cnts$ISBN[cnts$numusers >= 20]
length(popularbooks)
ev <- ev[ev$ISBN %in% popularbooks,]

# Collaborative Filter
# Convert ratings from a 5 point scale to a 10 point scale; 1 is the lowest score
book_ratings$Book.Rating <- round(book_ratings$Book.Rating/2, 0)
book_ratings$Book.Rating[book_ratings$Book.Rating == 0] <- 1

book_ratings <- select(book_ratings, -ISBN_char_len)
saveRDS(book_ratings, file = "book_ratings_cleaned.rds")

book_ratings <- readRDS(file = "book_ratings_cleaned.rds")
book_ratings.matrix = acast(book_ratings, User.ID ~ ISBN, value.var = "Book.Rating")
book_ratings.matrix = sweep(book_ratings.matrix, 1, rowMeans(book_ratings.matrix, na.rm=TRUE) )
book_ratings.matrix <- as(book_ratings.matrix, "realRatingMatrix")

# Variables for splitting dataset
percent_train <- 0.8
num_of_item_to_keep <- min(rowCounts(book_ratings.matrix)) - 1
n_eval_runs <- 5
rating_threshold <- 4

# split data for cross validation (k-fold)
scheme <- evaluationScheme(data = book_ratings.matrix, method = "cross-validation", train = percent_train, given = num_of_item_to_keep, goodRating = rating_threshold, k = n_eval_runs)

# Build Item Based Collaborative Filter
recc_model_ii1 <- Recommender(data = getData(scheme, "train"), method = "IBCF", parameter = (method = "cosine"))
saveRDS(recc_model_ii1, file = "recc_model_ii1.rds")
recc_model_ii1 <- readRDS(file = "recc_model_ii1.rds")
col_sums <- colSums(model_details_ii1$sim > 0)
which_max <- order(col_sums, decreasing = TRUE)[1:10]
rownames(model_details_ii1$sim)[which_max]

# Apply on the test set
recc_predicted_ii1 <- predict(object = recc_model_ii1, newdata = getData(scheme, "known"), n = n_recommended, type = "ratings")
recc_predicted_ii1

recc_model_ii2 <- Recommender(data = getData(scheme, "train"), method = "IBCF", parameter = (method = "pearson"))
saveRDS(recc_model_ii2, file = "recc_model_ii2.rds")
recc_model_ii2 <- readRDS(file = "recc_model_ii2.rds")
col_sums <- colSums(model_details_ii2$sim > 0)
which_max <- order(col_sums, decreasing = TRUE)[1:10]
rownames(model_details_ii2$sim)[which_max]

recc_predicted_ii2 <- predict(object = recc_model_ii2, newdata = getData(scheme, "known"), n = n_recommended, type = "ratings")
recc_predicted_ii2

recc_model_ii3 <- Recommender(data = getData(scheme, "train"), method = "IBCF", parameter = (method = "euclidean"))
saveRDS(recc_model_ii3, file = "recc_model_ii3.rds")
recc_model_ii3 <- readRDS(file = "recc_model_ii3.rds")
col_sums <- colSums(model_details_ii3$sim > 0)
which_max <- order(col_sums, decreasing = TRUE)[1:10]
rownames(model_details_ii3$sim)[which_max]

recc_predicted_ii3 <- predict(object = recc_model_ii3, newdata = getData(scheme, "known"), n = n_recommended, type = "ratings")
recc_predicted_ii3

# Evaluate Ratings
print("IBCF - Cosine")
eval_accuracy_test_ii1 <- calcPredictionAccuracy(x = recc_predicted_ii1, data = getData(scheme, "unknown"), byUser = FALSE, goodRating = rating_threshold, given = num_of_item_to_keep)

print("IBCF - Centered Cosine / Pearson")
eval_accuracy_test_ii2 <- calcPredictionAccuracy(x = recc_predicted_ii2, data = getData(scheme, "unknown"), byUser = FALSE, goodRating = rating_threshold, given = num_of_item_to_keep)

print("IBCF - Euclidean")
eval_accuracy_test_ii3 <- calcPredictionAccuracy(x = recc_predicted_ii3, data = getData(scheme, "unknown"), byUser = FALSE, goodRating = rating_threshold, given = num_of_item_to_keep)

# Evaluate the recommendations
# Predict top recommended books (IBCF - Cosine)
recc_predicted_iio1 <- predict(object = recc_model_ii1, newdata = getData(scheme, "known"), n = n_recommended)
recc_predicted_iio1

# Predict top recommended books (IBCF - Centered Cosine aka Pearson)
recc_predicted_iio2 <- predict(object = recc_model_ii2, newdata = getData(scheme, "known"), n = n_recommended)
recc_predicted_iio2

# Predict top recommended books (IBCF - Euclidean)
recc_predicted_iio3 <- predict(object = recc_model_ii3, newdata = getData(scheme, "known"), n = n_recommended)
recc_predicted_iio3

# Evaluate Ratings (IBCF - Cosine)
print("IBCF - Cosine")
eval_accuracy_test_iio1 <- calcPredictionAccuracy(x = recc_predicted_iio1, data = getData(scheme, "unknown"), byUser = FALSE, goodRating = rating_threshold, given = num_of_item_to_keep)
head(eval_accuracy_test_iio1)

# Evaluate Ratings (IBCF - Centered Cosine aka Pearson)
print("IBCF - Centered Cosine aka Pearson")
eval_accuracy_test_iio2 <- calcPredictionAccuracy(x = recc_predicted_iio2, data = getData(scheme, "unknown"), byUser = FALSE, goodRating = rating_threshold, given = num_of_item_to_keep)
head(eval_accuracy_test_iio2)

# Evaluate Ratings (IBCF - Euclidean)
print("IBCF - Euclidean")
eval_accuracy_test_iio3 <- calcPredictionAccuracy(x = recc_predicted_iio3, data = getData(scheme, "unknown"), byUser = FALSE, goodRating = rating_threshold, given = num_of_item_to_keep)
head(eval_accuracy_test_iio3)

# Plot ROC Graph
plot(list_results, annotate = 1, legend = "topleft") title("ROC curve")

# Plot Precision-Recall Graph
plot(list_results, "prec/rec", annotate = 1, legend = "bottomright") title("Precision-recall")

# User base collaborative filtering
recommender_models_ub <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")
recommender_models_ub$UBCF_realRatingMatrix$parameters

recc_model_ub <- Recommender(data = getData(scheme,"train"), method = "UBCF", parameter = (method = "cosine"))
recc_model_ub

# Predict book ratings by users
recc_ub_predicted <- predict(object = recc_model_ub, newdata = getData(scheme, "unknown"), n = n_recommended)
recc_ub_predicted

# euclidean matrix
recc_model_ub_e <- Recommender(data = getData(scheme,"train"), method = "UBCF", parameter = list(method = "euclidean"))
recc_ub_predicted_em <- predict(object = recc_model_ub_e, newdata = getData(scheme, "known"), n = n_recommended)
accuracy_ubcf_em = calcPredictionAccuracy(x = recc_ub_predicted_em,
                                          data = getData(scheme, "unknown"),
                                          byUser = FALSE,
                                          goodRating = rating_threshold, 
                                          given = num_of_item_to_keep)
head(accuracy_ubcf_em)

# Cosine matrix
recc_model_ub_c <- Recommender(data = getData(scheme,"train"),method = "UBCF", parameter = list(method = "cosine"))
recc_ub_predicted_cm <- predict(object = recc_model_ub_c, newdata = getData(scheme, "known"), n = n_recommended)
accuracy_ubcf_cm = calcPredictionAccuracy(x = recc_ub_predicted_cm,
                                          data = getData(scheme, "unknown"),
                                          byUser = FALSE,
                                          goodRating = rating_threshold, 
                                          given = num_of_item_to_keep)
head(accuracy_ubcf_cm)

# Pearson matrix
recc_model_ub_p <- Recommender(data = getData(scheme,"train"),method = "UBCF",parameter = list(method = "pearson"))
recc_ub_predicted_pm <- predict(object = recc_model_ub_p, newdata = getData(scheme, "known"), n = n_recommended)
accuracy_ubcf_pm = calcPredictionAccuracy(x = recc_ub_predicted_pm,
                                          data = getData(scheme, "unknown"),
                                          byUser = FALSE,
                                          goodRating = rating_threshold, 
                                          given = num_of_item_to_keep)
head(accuracy_ubcf_pm)

# Predict book ratings by users
recc_ub_predicted_e_plot <- predict(object = recc_model_ub_e, newdata = getData(scheme, "known"), n = n_ub_recommended)

# Recommend books similar to the customer's taste
# Predict book titles by UBCF-Euclidean Distance
recc_ub_predicted_uu_e<- predict(object = recc_model_ub_e, newdata = getData(scheme, "known"), n = n_recommended)

# Select target user by index number by changing the value here
user_index <- 1

# Generate book recommendations of the user
recc_user_uu_e <- recc_ub_predicted_uu_e@items[[user_index]] # generates userID based on index number
books_user_uu_e <- recc_ub_predicted_uu_e@itemLabels[recc_user_uu_e] # generates list items that match
bookss_user_uu_e

# Output most suited to the user's taste (books with missing book title and author information will be excluded)
books_main[books_main$ISBN %in% books_user_uu_e,]