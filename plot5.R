library(ggplot2)

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset by motor vehicles
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]

# Subset by Baltimore vehicles
baltimoreVehiclesNEI <- vehicleNEI[vehicleNEI$fips=="24510",]

png('plot5.png')

g <- ggplot(baltimoreVehiclesNEI, aes(factor(year), Emissions))\

p <- g + geom_bar(stat = "identity") + xlab("Years") + ylab("Total PM2.5 Emissions") + labs(title = "Motor Vehicle Source Emissions in Baltimore")

print(p)