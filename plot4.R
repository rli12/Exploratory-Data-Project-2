library(ggplot2)

# Read the files first
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge the NEI and SCC data
NEISCC <- merge(NEI, SCC, by = "SCC")

# Find the short names with the term coal
coal <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)

# Subset by the term coal
subsetNEISCC <- NEISCC[coal, ]

# Find the aggregate total emissions by year
aggregateTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

# Create plot
png("plot4.png")

g <- ggplot(aggregateTotalByYear, aes(factor(year), Emissions))

p <- g + geom_bar(stat = "identity") + xlab("Year") + ylab("Total PM2.5 Emissions") + ggtitle("Total Emissions from Coal Sources from 1999 to 2008")

print(p)
dev.off()