summary <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Get totals
s <- summary[summary$fips=="24510",]
totals <- tapply(s$Emissions,s$year,sum)
dt <- data.table("Year" = c(1999,2002,2005,2008),"Emission (Tons)" = totals)

#Plotting
png(filename = "Plot2.png")
plot(dt, type="b")
dev.off()