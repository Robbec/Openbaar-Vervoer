database <- read.csv("database.csv")

# won games
won <- database[database$won == 1,]

# filter
wonLevelUsers <- subset(won, select = c(user, level, theme))

#split theme en no theme
themeWonLevelUsers <- unique(wonLevelUsers[wonLevelUsers$theme == 1,])
noThemeWonLevelUsers <- unique(wonLevelUsers[wonLevelUsers$theme == 0,])

# tel aantal users dat level uitspeelt
themeNbOfUsersCompletedLevel <- data.frame(table(themeWonLevelUsers$level))
noThemeNbOfUsersCompletedLevel <- data.frame(table(noThemeWonLevelUsers$level))

# combine theme en no theme users
bothUsers <- data.frame(cbind(themeNbOfUsersCompletedLevel$Freq, noThemeNbOfUsersCompletedLevel$Freq))
matrixUsers <- do.call(rbind, bothUsers)

# grouped barplot replayers
barplot(matrixUsers, 
        main="Level completed",
        beside = TRUE,
        names.arg= noThemeNbOfUsersCompletedLevel$Var1,
        xlab="Level",
        ylim=c(0, 50),
        ylab="Number of users",
        legend.text = c("Themed", "Unthemed"),
        args.legend = list(x = "topright", bty="n"))