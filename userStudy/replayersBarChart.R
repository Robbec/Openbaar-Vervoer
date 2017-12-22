database <- read.csv("database.csv")

# alle datums tussen 06-12 en 22-12 als characters omdat merge anders niet werkt met vreemde dateformats
dates <- data.frame(Var1 =  as.character(strptime(seq(as.Date("2017-12-06"), as.Date("2017-12-22"), "days"), "%Y-%m-%d")))

# filter eerste spelletje per user
groupByUserMinTimestamp <- database %>% 
  group_by(user) %>% 
  slice(which.min(timeStamp))

# datum kolom zonder uren (day)
controlNewUserDaysTimestamps <- cbind(groupByUserMinTimestamp, day = format(strptime(groupByUserMinTimestamp$timeStamp, "%Y-%m-%d"), "%Y-%m-%d"))

# theme en no theme split
themeControlNewUserDaysTimestamps <- controlNewUserDaysTimestamps[controlNewUserDaysTimestamps$theme == 1,]
noThemeControlNewUserDaysTimestamps <- controlNewUserDaysTimestamps[controlNewUserDaysTimestamps$theme == 0,]

# enkel user en day kolom
themeNewUserDays <- subset(themeControlNewUserDaysTimestamps, select = c(user, day))
noThemeNewUserDays <- subset(noThemeControlNewUserDaysTimestamps, select = c(user, day))

# tel new users per dag
themeNbNewUsersPerDay <- data.frame(table(themeNewUserDays$day))
noThemeNbNewUsersPerDay <- data.frame(table(noThemeNewUserDays$day))

# merge aantal users per dag met alle datums
themeJoinNewNbOfUsersPerDayWithDates <- left_join(dates, themeNbNewUsersPerDay, by = "Var1")
noThemeJoinNewNbOfUsersPerDayWithDates <- left_join(dates, noThemeNbNewUsersPerDay, by = "Var1")

# vervang NA door 0
themeJoinNewNbOfUsersPerDayWithDates$Freq[is.na(themeJoinNewNbOfUsersPerDayWithDates$Freq)] <- 0
noThemeJoinNewNbOfUsersPerDayWithDates$Freq[is.na(noThemeJoinNewNbOfUsersPerDayWithDates$Freq)] <- 0

# combine theme en no theme new users
bothNewUsers <- data.frame(cbind(themeJoinNewNbOfUsersPerDayWithDates$Freq, noThemeJoinNewNbOfUsersPerDayWithDates$Freq))
matrixNewUsers <- do.call(rbind, bothNewUsers)

# grouped barplot new users
barplot(matrixNewUsers, 
        main="New users",
        beside = TRUE,
        names.arg= format(as.Date(themeJoinNewNbOfUsersPerDayWithDates$Var1), "%d"),
        xlab="Day of December 2017",
        ylim=c(0, 20),
        ylab="Number of users",
        las=2,
        legend.text = c("Themed", "Unthemed"),
        args.legend = list(x = "topright", bty="n"))

# Datum kolom zonder uren
controlUserDaysTimestamps <- cbind(database, day = format(strptime(database$timeStamp, "%Y-%m-%d"), "%Y-%m-%d"))

# theme en no theme split
themeControlUserDaysTimestamps <- controlUserDaysTimestamps[controlUserDaysTimestamps$theme == 1,]
noThemeControlUserDaysTimestamps <- controlUserDaysTimestamps[controlUserDaysTimestamps$theme == 0,]

# enkel user en day kolom
themeUserDays <- unique(subset(themeControlUserDaysTimestamps, select = c(user, day)))
noThemeUserDays <- unique(subset(noThemeControlUserDaysTimestamps, select = c(user, day)))

# tel users per dag
themeNbUsersPerDay <- data.frame(table(themeUserDays$day))
noThemeNbUsersPerDay <- data.frame(table(noThemeUserDays$day))

# merge aantal users per dag met alle datums
themeJoinNbOfUsersPerDayWithDates <- left_join(dates, themeNbUsersPerDay, by = "Var1")
noThemeJoinNbOfUsersPerDayWithDates <- left_join(dates, noThemeNbUsersPerDay, by = "Var1")

# vervang NA door 0
themeJoinNbOfUsersPerDayWithDates$Freq[is.na(themeJoinNbOfUsersPerDayWithDates$Freq)] <- 0
noThemeJoinNbOfUsersPerDayWithDates$Freq[is.na(noThemeJoinNbOfUsersPerDayWithDates$Freq)] <- 0

# combine theme en no theme users
bothUsers <- data.frame(cbind(themeJoinNbOfUsersPerDayWithDates$Freq - themeJoinNewNbOfUsersPerDayWithDates$Freq, noThemeJoinNbOfUsersPerDayWithDates$Freq - noThemeJoinNewNbOfUsersPerDayWithDates$Freq))
matrixUsers <- do.call(rbind, bothUsers)

# grouped barplot new users
barplot(matrixUsers, 
        main="Replayers",
        beside = TRUE,
        names.arg= format(as.Date(themeJoinNewNbOfUsersPerDayWithDates$Var1), "%d"),
        xlab="Day of December 2017",
        ylim=c(0, 6),
        ylab="Number of replayers",
        las=2,
        legend.text = c("Themed", "Unthemed"),
        args.legend = list(x = "topright", bty="n"))
