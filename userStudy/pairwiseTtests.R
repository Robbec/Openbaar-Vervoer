database <- read.csv("database.csv")
themeWonData <- database[database$theme == 1 & database$won == 1, ]
noThemeWonData <- database[database$theme == 0 & database$won == 1, ]

# Tweezijdige t-test voor starttijden per gewonnen level.
res <- replicate(9, NULL)
for (i in 1:9) {
  x <- themeWonData[themeWonData$level == i, ]
  y <- noThemeWonData[noThemeWonData$level == i, ]
  res[[i]] <- t.test(x$startTime,y$startTime,
                     alternative = "two.sided")
}
sapply(res, `[[`, "p.value")

# Eenzijdige t-test voor starttijden.
themeData <- database[database$theme == 1, ]
noThemeData <- database[database$theme == 0, ]

t.test(themeData$startTime,noThemeData$startTime,
       alternative = "greater")

# Eenzijdige t-test voor starttijden van gewonnen levels.
t.test(themeWonData$startTime,noThemeWonData$startTime,
       alternative = "greater")