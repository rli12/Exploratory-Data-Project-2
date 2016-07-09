library(ggplot2)

# Read the files first
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset by Baltimore code
NEIBaltimore  <- NEI[NEI$fips=="24510", ]
aggregateTotalByType <- aggregate(Emissions ~ year + type, NEIBaltimore, sum)

png('plot3.png')
g <- ggplot(data = aggregateTotalByType, aes(year, Emissions, color = type))
p <- g + geom_smooth() + xlab("Year") + ylab("Total PM Emission") + ggtitle("Total PM Emissions Based on Type")

dev.off()