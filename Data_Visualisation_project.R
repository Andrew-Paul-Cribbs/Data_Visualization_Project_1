#
# origianl EDA analysis was found in
# https://medium.com/srijit-mukherjee/exploratory-data-analysis-eda-in-r-a-comprehensive-guide-be81eac8d3d8

install.packages("DAAG")
athletes <-ais
names(athletes)
head(athletes, n = 3)
tail(athletes, n = 3)
str(athletes)
summary(athletes)
summary(athletes$hg)
boxplot(athletes$hg)
boxplot(athletes$hg, main = toupper("Boxplot of Hemaglobin concentration"), ylab = "Hemaglobin concentration", col = "red")
hist(athletes$hg, xlab = "Hemaglobin concentration", probability = TRUE, , main = "Histogram of Hemaglobin concentration")
# density plot
d <- density(athletes$hg)
plot(d, main = "Kernel density of Hemaglobin concentration", xlab = "Hemaglobin concentration")
polygon(d, col = "red", border = "blue")
# frequency table
table(athletes$sport)
# vertical bar plot
barplot(table(athletes$sport), 
        main="Count of participants in different sports for study", 
        xlab="Sports",ylab="Count", border="red", col="blue", density=10)
# horizontal bar plot
barplot(table(athletes$sport), 
        main="Count of participants in different sports for study", 
        xlab="Sports",ylab="Count", col = "darkred", horiz = TRUE)
# pie chart
pie(table(athletes$sport), labels = levels(athletes$sport))

# table by sex
sex_vs_sport = athletes[,12:13]
table(sex_vs_sport)
xtabs(~ athletes$sex + athletes$sport, sex_vs_sport) 
# vertical comparison
barplot(table(sex_vs_sport),
        main = "Sports Participation Distribution by Sex",
        xlab = "Sport",
        col = c("red","green") 
)
legend("topleft",
       c("Female","Male"),
       fill = c("red","green")
)

barplot(table(sex_vs_sport),
        main = "Sports Participation Distribution by Sex",
        xlab = "Sport",
        col = c("red","green"),
        beside =  TRUE) 
legend("topleft",
       c("Female","Male"),
       fill = c("red","green")
)

# plot density for all sports
library(ggplot2)

# plot scatter or weight and height
plot(athletes$wt ~ athletes$ht , athletes,
     xlab="Height", ylab="Weight",
     main="Scatter Plot")
