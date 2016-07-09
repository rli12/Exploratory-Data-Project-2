# Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Take the aggregate emission values and add it by year
aggregateTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# Create bar plot
png('plot1.png')
barplot(aggregateTotalByYear$Emissions, xlab = "Years", ylab = "Emissions", main = "Total PM Emissions")

dev.off()