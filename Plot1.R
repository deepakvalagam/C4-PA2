summary <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Get totals
totals <- tapply(summary$Emissions,summary$year,sum)
dt <- data.table("Year" = c(1999,2002,2005,2008),"Emission (Tons)" = totals)

#Plotting
png(filename = "Plot1.png")
plot(dt, type="b")
dev.off()