
#de #losses voor de eerste win
Theme <- database[database$theme == 1, ]
noTheme <- database[database$theme == 0, ]

Lossestheme <- Theme[Theme$won == 0, ]
Winstheme <- Theme[Theme$won == 1, ]
LossesNoTheme <- noTheme[noTheme$won == 0, ]
WinsNoTheme <- noTheme[noTheme$won == 1, ]

LossesLevel2Theme <- Lossestheme[Lossestheme$level == 2, ]
WinsLevel2Theme <- Winstheme[Winstheme$level == 2, ]
LossesLevel2noTheme <- LossesNoTheme[LossesNoTheme$level == 2, ]
WinsLevel2noTheme <- WinsNoTheme[WinsNoTheme$level == 2, ]

FirstWinLevel2theme <- aggregate(timeStamp ~ user, WinsLevel2Theme, function(x) min( as.POSIXct(x)))
FirstWinLevel2noTheme <- aggregate(timeStamp ~ user, WinsLevel2noTheme, function(x) min( as.POSIXct(x)))

joinWinAndLossTableLevel2theme <- LossesLevel2Theme %>% right_join(FirstWinLevel2theme, by='user')
joinWinAndLossTableLevel2noTheme <- LossesLevel2noTheme %>% right_join(FirstWinLevel2noTheme, by='user')

nbofWinnerstheme <- joinWinAndLossTableLevel2theme[!complete.cases(joinWinAndLossTableLevel2theme),]
nbofWinnersnoTheme <- joinWinAndLossTableLevel2noTheme[!complete.cases(joinWinAndLossTableLevel2noTheme),]

group1 <- group_by(joinWinAndLossTableLevel2theme,user)
group2 <- group_by(joinWinAndLossTableLevel2noTheme,user)

LossesBeforefirstWinLevel2theme <- summarize(group1,n = sum(as.POSIXct(timeStamp.x) < as.POSIXct(timeStamp.y)))
LossesBeforefirstWinLevel2noTheme <- summarize(group2,n = sum(as.POSIXct(timeStamp.x) < as.POSIXct(timeStamp.y)))

LossesBeforefirstWinLevel2theme <- filter(LossesBeforefirstWinLevel2theme,!is.na(n))
LossesBeforefirstWinLevel2noTheme <- filter(LossesBeforefirstWinLevel2noTheme,!is.na(n))


winnerstheme <- nbofWinnerstheme %>% select(user)
winnersnoTheme <- nbofWinnersnoTheme %>% select(user)

namevector <- c("n")
winnerstheme[ ,namevector] <- 0
winnersnoTheme[ ,namevector] <- 0


nbLossesBeforefirstWinLevel2theme <- rbind(LossesBeforefirstWinLevel2theme, winnerstheme)
nbLossesBeforefirstWinLevel2noTheme <- rbind(LossesBeforefirstWinLevel2noTheme, winnersnoTheme)
reslevel2LossesComp <- t.test(nbLossesBeforefirstWinLevel2theme$n,nbLossesBeforefirstWinLevel2noTheme$n, alternative="less")

#druktijd level 1
level1 <- database[database$level == 1, ]
themelevel1 <- level1[level1$theme == 1, ]
nothemelevel1 <- level1[level1$theme == 0, ]
StartTimethemelevel1 <- themelevel1 %>% select(startTime)
StartnoTimethemelevel1 <- nothemelevel1 %>% select(startTime)
resPressTime <- t.test(StartTimethemelevel1,StartnoTimethemelevel1)

#som druktijden
level123 <- database[database$level < 3, ]
FirstTry <- aggregate(timeStamp ~ user + level, level123, function(x) min(as.POSIXct(x)))
FirstTryComplete <- inner_join(level123, FirstTry, by=c('user' = 'user', 'level' = 'level'))
FirstTryCorrect <- filter(FirstTryComplete, as.POSIXct(timeStamp.x) == as.POSIXct(timeStamp.y))
FirstTry1 <- FirstTryCorrect[FirstTryCorrect$level== 1, ] 
FirstTry2 <- FirstTryCorrect[FirstTryCorrect$level== 2, ]
FirstTry3 <- FirstTryCorrect[FirstTryCorrect$level== 3, ]
temp <- inner_join(FirstTry1,FirstTry2, by ='user')
final <- inner_join(temp,FirstTry3, by ='user')
users <- final %>% select(user)
testdata <- inner_join(users, FirstTryCorrect, by = 'user')
testdataTheme <- testdata[testdata$theme == 1, ]
testdataNoTheme <- testdata[testdata$theme == 0, ]
sumStartTime123Theme <- aggregate(startTime ~ user, testdataTheme, function(x) sum(x))
sumStartTime123noTheme <- aggregate(startTime ~ user, testdataNoTheme, function(x) sum(x))
resultTtestStartTimeComparison <- t.test(sumStartTime123Theme$startTime,sumStartTime123noTheme$startTime,
                                         alternative = "less")
#win/loss ratio

Level3 <- Theme[Theme$level == 2, ]
FirstTryLevel3 <- aggregate(timeStamp ~ user, Level3, function(x) min( as.POSIXct(x)))
FirstTryLevel3Complete <- FirstTryLevel3 %>% inner_join(Level3, by='user')
FirstTryLevel3Correct <- filter(FirstTryLevel3Complete, as.POSIXct(timeStamp.x) == as.POSIXct(timeStamp.y))
Level3FirstLoss <- FirstTryLevel3Correct[FirstTryLevel3Correct$won == 0, ]
Level3FirstWin <- FirstTryLevel3Correct[FirstTryLevel3Correct$won == 1, ]


nbOfFirstTryLevel3Loss <- length(unique(Level3FirstLoss$user))

nbOfFirstTryLevel3Win <- length(unique(Level3FirstWin$user))

