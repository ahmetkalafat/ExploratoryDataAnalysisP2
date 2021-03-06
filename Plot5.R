## Exploratory Data Analysis - Assignment 2
## Ahmet KALAFAT Apr 30 2016
## Question 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

Mariland.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')
Mariland.df <- aggregate(Mariland.onroad[, 'Emissions'], by=list(Mariland.onroad$year), sum)
colnames(Mariland.df) <- c('year', 'Emissions')

png("Plot5.png")

ggplot(data=Mariland.df, aes(x=year, y=Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()
