#Econ301 homework 2 multi regression model for Internet Usage and other factors


#setup and libraries

install.packages(c("readr", "lmtest", "sandwich", "car", "stargazer","ggplot2", "corrplot", "dplyr","tidyverse"))
library(readr)
library(lmtest)
library(sandwich)
library(car)
library(stargazer)
library(ggplot2)
library(corrplot)
library(dplyr)
library(tidyverse)

#setting our working directory
setwd("C:/Users/tseyi/Desktop")


#Importing data
df_main <- read.csv("gapminder_internet.csv")
df_edu <- read.csv("Education.csv")

#Inspect column names
print(colnames(df_main))
print(colnames(df_edu))

#for merging
colnames(df_edu)[colnames(df_edu) == "Region"] <- "country"
print(colnames(df_edu))

merged_data <- merge(x = df_main, 
                     y = df_edu,
                     by.x = "country",
                     by.y = "country",
                     all.x = TRUE)

colnames(merged_data)[colnames(merged_data) == "Education.Index"] <- "Education"

summary(merged_data)
final_data <- na.omit(merged_data)
print(nrow(final_data))
head(final_data)



stargazer(final_data, type = "text", 
          title = "Descriptive Statistics", 
          digits = 2, median = TRUE)


#visualization


plot(log(final_data$incomeperperson), final_data$internetuserrate,
     main = "Internet Adoption vs. GDP (Log)",
     xlab = "Log(GDP per Capita)",
     ylab = "Internet Use Rate (%)",
     pch = 19, col = "darkgreen")




#descriptive statistics
stargazer(final_data, type = "text",
          title = "Descriptive Statistics",
          digits = 2,
          median = TRUE)
#MULT??PLE REGRESS??ON MODEL
# Model: Internet ~ log(GDP) + Urban + Education
model_ols <- lm(internetuserate ~ log(incomeperperson) + urbanrate + Education.Index.2022, 
                data = final_data)
summary(model_ols)


#D??agnostics
vif_values <- vif(model_ols)
print(vif_values)

numeric_data <- final_data %>% 
  select_if(is.numeric)
cor_matrix <- cor(numeric_data)
print(round(cor_matrix, 2))
corrplot(cor_matrix, 
         method = "color", 
         type = "upper", 
         order = "hclust", 
         addCoef.col = "black",
         tl.col = "black", 
         tl.srt = 45,
         title = "Correlation Matrix of Variables",
         mar = c(0,0,1,0))











# If values are < 10, you are safe.

vif(model_ols)
bptest(model_ols)
hist(residuals(model_ols), main = "Histogram of Residuals", col = "lightblue")


qqnorm(residuals(model_ols))
qqline(residuals(model_ols), col = "red", lwd = 2)

cooksD <- cooks.distance(model_ols)
plot(cooksD, pch = 19, main = "Cook's Distance (Outliers)")
abline(h= 4/nrow(final_data), col = "red", lty = 2)

robust_vcov <- vcovHC(model_ols, type = "HC1")
coeftest(model_ols, vov = robust_vcov)

#F??nal report table
stargazer(model_ols, coeftest(model_ols, vcov = robust_vcov),
          type = "text",
          title = "Regression Results: Standard vs Robust SE",
          column.labels = c("Standard OLS", "Robust SE"),
          model.names = FALSE)




#Homework2 
#Seyit Mustafa Turhan S033526
#I????lay ??zkan S029109
#Serdar Baykoz S041143
#??rem Alpar S034014
#Alperen Y??ld??z S040452








