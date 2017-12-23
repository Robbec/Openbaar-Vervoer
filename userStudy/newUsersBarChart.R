library(dplyr)
database <- read.csv("database.csv")

# alle datums tussen 06-12 en 22-12 als characters omdat merge anders niet werkt met vreemde dateformats
dates <- data.frame(Var1 =  as.character(strptime(seq(as.Date("2017-12-06"), as.Date("2017-12-20"), "days"), "%Y-%m-%d")))

# filter eerste spelletje per user
groupByUserMinTimestamp <- database %>% 
  group_by(user) %>% 
  slice(which.min(timeStamp))

# datum kolom zonder uren (day)
controlNewUserDaysTimestamps <- cbind(groupByUserMinTimestamp, day = format(strptime(groupByUserMinTimestamp$timeStamp, "%Y-%m-%d"), "%Y-%m-%d"))

# enkel user en day kolom
newUserDays <- subset(controlNewUserDaysTimestamps, select = c(user, day))

# tel users per dag
nbNewUsersPerDay <- data.frame(table(newUserDays$day))

# merge aantal users per dag met alle datums
joinNewNbOfUsersPerDayWithDates <- left_join(dates, nbNewUsersPerDay, by = "Var1")
# vervang NA door 0
joinNewNbOfUsersPerDayWithDates$Freq[is.na(joinNewNbOfUsersPerDayWithDates$Freq)] <- 0

barplot(joinNewNbOfUsersPerDayWithDates$Freq, 
        main="New users per day",
        names.arg= format(as.Date(joinNewNbOfUsersPerDayWithDates$Var1), "%d"),
        xlab="Day of December 2017",
        ylim=c(0, 30),
        ylab="Number of users",
        las=2)