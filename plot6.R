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
baltimoreVehiclesNEI$city <- "Baltimore"

# Subset by Los Angeles County
vehicleLA <- vehicleNEI[vehicleNEI$fips=="06037",]
vehicleLA$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
combineNEI <- rbind(baltimoreVehiclesNEI, vehicleLA)


g <- ggplot(combineNEI, aes(factor(year), Emissions))

p <- g + geom_bar(stat = "identity") + facet_grid(. ~ fips) + xlab("year") + ylab("Total PM2.5 Emissions") + labs(title = "Total Emissions of Vehicles from Vehicles in Baltimore and Los Angeles from 1999-2008")
print(p)

dev.off()
