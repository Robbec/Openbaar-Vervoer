database <- read.csv("database.csv")
themeData <- database[database$theme == 1 & database$won == 1, ]
noThemeData <- database[database$theme == 0 & database$won == 1, ]

par(mfrow = c(2, 1)) # definieer een layout met 1 rij en 2 cols
par(mar = c(4, 4, 4, 4)) # definieer de breedte van de marges
lmts <- range(0,25)
boxplot(startTime+time ~ level,
        data = themeData,
        outline = FALSE,
        main = "Theme",
        ylim=lmts)
boxplot(startTime+time ~ level,
        data = noThemeData,
        outline = FALSE,
        main = "No theme",
        ylim=lmts)