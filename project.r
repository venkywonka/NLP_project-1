library("tm")
library("wordcloud")
library("stringr")
library("qdap")
library("ggplot2")
#Getting the path to the directory
file.choose()
folder <- "C:\\Users\\Harshitha\\Documents\\corpus"
folder
#getting the list of files in the folder
list.files(path=folder , pattern = "*.txt")
files <- list.files(path=folder , pattern = "*.txt")
files
paste(folder, "\\" , files , sep ="")
files <- paste(folder, "\\" , files , sep ="")
typeof(files)
#Cleaning the text files
lapply(files , FUN=readLines)
var <-lapply(files , FUN=readLines)
lapply(var , FUN=paste , collapse=" ")
text <- lapply(var , FUN=paste , collapse=" ")
text2 <- gsub(pattern="\\W" , replace=" " , text)
text2
text2 <- gsub(pattern="\\d" , replace=" " , text2)
text2 <- tolower(text2)
removeWords(text2 , stopwords("english"))
text2 <- removeWords(text2 , stopwords("english"))
gsub(pattern = "\\b[A-z]\\b{1}" , replace=" ", text2)
text2 <- gsub(pattern = "\\b[A-z]\\b{1}" , replace=" ", text2)
text2 <- stripWhitespace(text2)
text2
#storing text in a corpus
corpus <- Corpus(VectorSource(text2))
corpus
#making a term document matrix
tdm <- TermDocumentMatrix(corpus)
tdm
m <- as.matrix(tdm)
colnames(m)<- c("para1" , "para2" , "para3" , "para4" , "para5")
colnames(m)
comparison.cloud(m)
frequency = rowSums(m)
frequency
#frequency bar plot
barplot(frequency[1:10], col = rainbow(3), las = 2, main = "Frequency Plot")
#Dendogram representation
clean <- removeSparseTerms(tdm, sparse = 0.95)
m2 <- as.matrix(clean)
df <- as.data.frame(m2)
diff<-dist(df)
hiercls = hclust(diff)
plot(hiercls)
#word correlation plot
assocs <- findAssocs(tdm, "galleries", 0.2)
assocs_df <- list_vect2df(assocs)[,2:3]
ggplot(assocs_df, aes(y = assocs_df[,1])) + geom_point( aes(x = assocs_df[,2]), color = "firebrick3", data = assocs_df, size = 1.5) + ggtitle("Correlation of the word 'galleries' with other words") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Correlation value") + ylab("words")

