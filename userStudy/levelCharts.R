database <- read.csv("database.csv")

# splits theme en no theme
themeDatabase <- database[database$theme == 1,]
noThemeDatabase <- database[database$theme == 0,]

# tel aantal keer level gespeeld
themeNbGames <- data.frame(table(themeDatabase$level))
noThemeNbGames <- data.frame(table(noThemeDatabase$level))

# combine theme en no theme users
bothNbGames <- data.frame(cbind(themeNbGames$Freq, noThemeNbGames$Freq))
matrixNbGames <- do.call(rbind, bothNbGames)

# grouped aantal games
barplot(matrixNbGames, 
        main="Number of games",
        beside = TRUE,
        names.arg= themeNbGames$Var1,
        xlab="Level",
        ylim=c(0, 800),
        ylab="Number of games",
        legend.text = c("Themed", "Unthemed"),
        args.legend = list(x = "topleft", bty="n"))

# splits win en lose
themeWin <- themeDatabase[themeDatabase$won == 1,]
themeLose <- themeDatabase[themeDatabase$won == 0,]
noThemeWin <- noThemeDatabase[noThemeDatabase$won == 1,]
noThemeLose <- noThemeDatabase[noThemeDatabase$won == 0,]

# tel aantal keer gewonnen
themeNbWins <- data.frame(table(themeWin$level))
noThemeNbWins <- data.frame(table(noThemeWin$level))

# combine theme en no theme users
bothNbWins <- data.frame(cbind(themeNbWins$Freq, noThemeNbWins$Freq))
matrixNbWins <- do.call(rbind, bothNbWins)

# grouped aantal wins
barplot(matrixNbWins, 
        main="Number of wins",
        beside = TRUE,
        names.arg= themeNbGames$Var1,
        xlab="Level",
        ylim=c(0, 120),
        ylab="Number of wins",
        legend.text = c("Themed", "Unthemed"),
        args.legend = list(x = "topright", bty="n"))

# tel aantal keer verloren
themeNbLosses <- data.frame(table(themeLose$level))
noThemeNbLosses <- data.frame(table(noThemeLose$level))

# combine theme en no theme users
bothNbLosses <- data.frame(cbind(themeNbLosses$Freq, noThemeNbLosses$Freq))
  #add data level 1
bothNbLossesAddedFirstLevel <- rbind(c(0,0), bothNbLosses)
matrixNbLosses <- do.call(rbind, bothNbLossesAddedFirstLevel)

# grouped aantal wins
barplot(matrixNbLosses, 
        main="Number of losses",
        beside = TRUE,
        names.arg= themeNbGames$Var1,
        xlab="Level",
        ylim=c(0, 800),
        ylab="Number of losses",
        legend.text = c("Themed", "Unthemed"),
        args.legend = list(x = "topleft", bty="n"))