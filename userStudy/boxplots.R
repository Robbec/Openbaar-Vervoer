database <- read.csv("database.csv")
themeData <- database[database$theme == 1 & database$won == 1, ]
noThemeData <- database[database$theme == 0 & database$won == 1, ]

par(mfrow = c(1, 1)) # definieer een layout met 1 rij en 2 cols
par(mar = c(4, 4, 4, 4)) # definieer de breedte van de marges
lmts <- range(0,17)
# boxplot(startTime ~ level,
#         data = themeData,
#         outline = FALSE,
#         main = "Starting times for themed game",
#         ylim=lmts,
#         xlab = "Level",
#         ylab = "Starting time")
boxplot(startTime ~ level,
        data = noThemeData,
        outline = FALSE,
        main = "Starting times for unthemed game",
        ylim=lmts,
        xlab = "Level",
        ylab = "Starting time")