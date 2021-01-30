# install.packages("topicdoc")
library(topicdoc)
library(xlsx)


coherence(m)
post_m <- posterior(m)
post_m[1]
post_m[2]

post_m1 <- data.frame(post_m[1])
post_m1t <- as.data.frame(t(post_m1))
post_m2 <- data.frame(post_m[2])
post_m2t <- as.data.frame(t(post_m2))

asdsd <- data.frame(matrix(unlist(ll), nrow=length(ll), byrow=T))


#text to topic
post_m <- data.frame(matrix(unlist(posterior(m)), nrow=length(posterior(m)), byrow=T))

           
write.xlsx(post_m1,"/Users/yhn_hac/Hanyang University/01-2. Study_Alone/R Data Analysis/LDA/Results_Exported Data/model_info.xlsx", sheetName = "porterior_terms", col.name = TRUE, row.names = TRUE, append = FALSE)
write.xlsx(post_m2,"/Users/yhn_hac/Hanyang University/01-2. Study_Alone/R Data Analysis/LDA/Results_Exported Data/model_info.xlsx", sheetName = "porterior_topics", col.name = TRUE, row.names = TRUE, append = TRUE)
write.xlsx(post_m2t,"/Users/yhn_hac/Hanyang University/01-2. Study_Alone/R Data Analysis/LDA/Results_Exported Data/model_info.xlsx", sheetName = "porterior_topics2", col.name = TRUE, row.names = TRUE, append = TRUE)
write.xlsx(post_m1t,"/Users/yhn_hac/Hanyang University/01-2. Study_Alone/R Data Analysis/LDA/Results_Exported Data/model_info.xlsx", sheetName = "porterior_terms2", col.name = TRUE, row.names = TRUE, append = TRUE)

topic.frequency <- colSums(theta * doc.length)
topic.proportion <- topic.frequency/sum(topic.frequency)

topic.frequency
topic.proportion
sum(topic.frequency)
str(doc.length)
theta
View(doc.length)
