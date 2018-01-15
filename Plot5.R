summary <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

#Get totals
s <- summary[summary$fips=="24510",]
codes <- as.character(SCC[SCC$SCC.Level.One == "Mobile Sources",]$SCC)
t <- s[s$SCC%in%codes,]

#Plotting
png(filename = "Plot5.png")
p <-qplot(year,Emissions,data = t,xlab = "Year",ylab = "Emissions (Tons)")+geom_smooth(method = "lm") + coord_cartesian(ylim = c(0,30))
print(p)
dev.off()