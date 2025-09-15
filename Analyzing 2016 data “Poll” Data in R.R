# Create vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect structure and preview data
str(df_polls)
head(df_polls)

# Compute summary statistics
mean_ABC <- mean(df_polls$ABC_poll)
mean_CBS <- mean(df_polls$CBS_poll)
median_ABC <- median(df_polls$ABC_poll)
median_CBS <- median(df_polls$CBS_poll)
range_values <- range(df_polls[, c("ABC_poll","CBS_poll")])

# Add difference column
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# Print summary
summary(df_polls)

# Load ggplot2 for visualization
library(ggplot2)

# Create a bar chart comparing polls
ggplot(df_polls, aes(x = Name)) +
  geom_bar(aes(y = ABC_poll, fill = "ABC"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = CBS_poll, fill = "CBS"), stat = "identity", position = "dodge") +
  labs(title = "Poll Comparison by Candidate", 
       y = "Poll Percentage", x = "Candidate") +
  scale_fill_manual(values = c("ABC" = "skyblue", "CBS" = "orange")) +
  theme_minimal()


