# Step 1: Define vectors
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

# Step 2: Create data frame
df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)

# Step 3: Inspect data
summary(df_hosp)

# Step 4: Remove rows with missing values
df_hosp <- na.omit(df_hosp)


# boxplot
boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good","Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment"
)


# Histogram of Visit Frequency 
hist(
  df_hosp$Frequency,
  breaks = 5,                        # Fewer bins for clarity
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency",
  col = "lightblue",                  # Adds color for readability
  border = "black"
)

# Histogram of Blood Pressure
hist(
  df_hosp$BloodPressure,
  breaks = seq(0, 220, by = 20),      # Explicit bin edges
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure",
  col = "lightgreen",
  border = "black"
)

