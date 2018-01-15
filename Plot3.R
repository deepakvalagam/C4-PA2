summary <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

#Get totals
s <- summary[summary$fips=="24510",]

#Plotting
png(filename = "Plot3.png")
p <- qplot(year,Emissions,data = s,facets = .~type,xlab = "Year",ylab = "Emissions (Tons)")+geom_smooth(method = "lm") + coord_cartesian(ylim = c(0,100))
print(p)
dev.off()