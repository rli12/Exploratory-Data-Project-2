# Read the files first
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset by Baltimore code
NEIBaltimore  <- NEI[NEI$fips=="24510", ]
aggregateTotalByYear <- aggregate(Emissions ~ year, NEIBaltimore, sum)

png('plot2.png')

barplot(aggregateTotalByYear$Emissions, xlab = "Years", ylab = "Emissions", main = "Total PM Emissions in Baltimore")

dev.off()