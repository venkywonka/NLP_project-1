# Analysis
## Natural language processing
### Dataset: Pages from DanBrown's "The DaVinci Code"
#### Venkataramana G
 
 * Required packages are installed and then made accessible using the library function.
    for eg: `install.packages("tm")` to install package and `library("tm")` to access it.
    packages required: *tm, stringr, ggplot2, qdap, wordcloud*
 * The required directory is then changed to the one containing the text files.
 * The folder containing the required text files are then imported.
 * After importing the required textfiles, the contents of the files are cleaned of punctuations, spaces , numbers and stopwords.
  eg: `gsub(pattern="\\d",replace=" ",text)` replaces all the occurrences of numerals in text with whitespaces, which are later stripped.
 * The object is then converted to a corpus: `corpus <- Corpus(VectorSource(text2))` 
 * A term document matrix is created from this corpus: `tdm <- TermDocumentMatrix(corpus)`, `m <- as.matrix(tdm)` 
   This matrix contains the information relating the frequencies of occurrences of every word for every textfile.
 * The matrix object is then fed as an argument to generate the wordCloud: `comparison.cloud(m)`
 * the overall frequencies of every word from all the textfiles (i.e, sum of rows of matrix) are stored in a vector: `frequency = rowSums(m)`
    
    This  vector is then fed as a parameter for generating a frequency bar plot: `barplot(frequency[1:10], col = rainbow(3), las = 2, main = "Frequency Plot")`
 * The term document matrix is then cleaned of sparseTerms: `clean <- removeSparseTerms(tdm, sparse = 0.95)`
 
   this is then converted to a matrix: `m2 <- as.matrix(clean)`
   
   and then to a data frame: `df <- as.data.frame(m2)`
   
   and then a distance matrix of the same is obtained: `diff<-dist(df)`
   
* a hierarchical cluster of the distance matrix is created : `hiercls = hclust(diff)`

  The respective dendrogram is then plotted: `plot(hiercls)`
  
* A list vector is then obtained that contains the association of the word "galleries" with the tdm: `assocs <- findAssocs(tdm, "galleries", 0.2)`

  This is then converted to a data frame: `assocs_df <- list_vect2df(assocs)[,2:3]`
  
  Consequently, is fed as arguments to plot the correlation: `ggplot(assocs_df, aes(y = assocs_df[,1])) + geom_point( aes(x = assocs_df[,2]), color = "firebrick3", data = assocs_df, size = 1.5) + ggtitle("Correlation of the word 'galleries' with other words") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Correlation value") + ylab("words")`

 
   
   
 


