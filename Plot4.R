summary <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

#Get totals
code <- grepl("Coal",SCC$EI.Sector)
code <- as.character(SCC[code,]$SCC)
t <- summary[summary$SCC%in%code,]

#Plotting
png(filename = "Plot4.png")
p <-qplot(year,Emissions,data = t,xlab = "Year",ylab = "Emissions (Tons)")+geom_smooth(method = "lm") + coord_cartesian(ylim = c(0,100))
print(p)
dev.off()