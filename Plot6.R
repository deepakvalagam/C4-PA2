# summary <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

#Get totals
s <- summary[summary$fips%in%c("24510","06037"),]
codes <- as.character(SCC[SCC$SCC.Level.One == "Mobile Sources",]$SCC)
t <- s[s$SCC%in%codes,]
t$fips <- gsub("24510","Baltimore",t$fips)
t$fips <- gsub("06037","LA County",t$fips)

#Plotting
png(filename = "Plot6.png")
p <- qplot(year,Emissions,data = t,xlab = "Year",ylab = "Emissions (Tons)",color = fips)+geom_smooth(method = "lm") + coord_cartesian(ylim = c(0,300))
print(p)
dev.off()