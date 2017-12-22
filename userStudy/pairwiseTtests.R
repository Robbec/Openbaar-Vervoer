database <- read.csv("database.csv")
themeData <- database[database$theme == 1 & database$won == 1, ]
noThemeData <- database[database$theme == 0 & database$won == 1, ]

res <- replicate(9, NULL)
for (i in 1:9) {
  x <- themeData[themeData$level == i, ]
  y <- noThemeData[noThemeData$level == i, ]
  res[[i]] <- t.test(x$startTime,y$startTime,
                     alternative = "two.sided")
}
sapply(res, `[[`, "p.value")
