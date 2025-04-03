install.packages('tidyverse')
install.packages("corrplot")
library(tidyverse)
library(corrplot)
Data = iris
head(Data)
str(Data)
summary(Data)
sapply(Data, function(x) sum(is.na(x)))
# Data Transformation
iris_transformed <- iris %>%
  mutate(Petal.Area = Petal.Length * Petal.Width,
         Sepal.Area = Sepal.Length * Sepal.Width)
# Grouping and Summarization
summary_data <- iris_transformed %>%
  group_by(Species) %>%
  summarise(Mean_Petal.Area = mean(Petal.Area),
            Mean_Sepal.Area = mean(Sepal.Area),
            Mean_Petal.Length = mean(Petal.Length),
            Mean_Sepal.Length = mean(Sepal.Length))
summary_data
# Visualizations
# 1. Histogram of Petal Length
ggplot(iris_transformed, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(bins = 15, alpha = 0.8) +
  theme_minimal() +
  ggtitle("Histogram of Petal Length by Species")
# 2. Box Plot
ggplot(iris_transformed, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Box Plot of Sepal Length by Species")
# 3. Scatter plot
ggplot(iris_transformed, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point() +
  theme_minimal() +
  ggtitle("Scatter Plot of Petal Length vs Petal Width")
# 4. Bar Chart
ggplot(summary_data, aes(x = Species, y = Mean_Sepal.Area, fill = Species)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  ggtitle("Bar Chart of Mean Sepal Area by Species")
# 5. Density Plot
ggplot(iris_transformed, aes(x = Sepal.Width, fill = Species)) +
  geom_density(alpha = 0.7) +
  theme_minimal() +
  ggtitle("Density Plot of Sepal Width by Species")
# 6. Line Plot
ggplot(iris_transformed, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_line(stat = "smooth", method = "loess", se = FALSE) +
  theme_minimal() +
  ggtitle("Line Plot of Sepal Length vs Sepal Width")
# 7. Heatmap
cor_matrix <- cor(iris_transformed[, 1:4])
corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black")
# 8. Pairwise Scatterplot
pairs(iris_transformed[1:4], col = iris_transformed$Species, 
      main = "Pairwise Scatterplot Matrix")
# 9. Box Plot
ggplot(iris_transformed, aes(x = Species, y = Petal.Area, fill = Species)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Box Plot of Petal Area by Species")
# 10. Histogram of Sepal Area
ggplot(iris_transformed, aes(x = Sepal.Area, fill = Species)) +
  geom_histogram(bins = 15, alpha = 0.7) +
  theme_minimal() +
  ggtitle("Histogram of Sepal Area by Species")

