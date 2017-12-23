database <- read.csv("database.csv")

# kolom met som van time en startTime
sumTimePerLog <- data.frame(cbind(theme = database$theme, sumTime = database$startTime + database$time))

# split theme en no theme
themeSumTimePerLog <- sumTimePerLog[sumTimePerLog$theme == 1,]
noThemeSumTimePerLog <- sumTimePerLog[sumTimePerLog$theme == 0,]

# som van alle logs
bothSumTime <- c(sum(themeSumTimePerLog$sumTime), sum(noThemeSumTimePerLog$sumTime))/60

# plot taartdiagram
lbls <- paste(c("Themed (", "Unthemed ("), round(bothSumTime))
lbls <- paste(lbls, " minutes )")
pie(bothSumTime, 
    main="Total time played",
    labels = lbls)

t.test(themeSumTimePerLog$sumTime,noThemeSumTimePerLog$sumTime,
       alternative = "greater")