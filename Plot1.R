## Exploratory Data Analysis - Assignment 2
## Ahmet KALAFAT Apr 30 2016
## Question 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI<- readRDS("summarySCC_PM25.rds")
total <- tapply(NEI$Emissions, NEI$year, sum)
png("plot1.png")
plot(names(total), total, type="l", xlab="Years", ylab=expression("Total Emissions"), main=expression("Total  Emissions by Year"))
dev.off()
