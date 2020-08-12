library(tidyverse)

sims = rnorm(10000, mean = 1, sd = 2)
x = seq(-5,7,by=0.02)
y = dnorm(x, mean = 1, sd = 2)
df1 = data.frame(x,y)
df2 = data.frame(sims = sims) %>% 
  filter(sims>-3, sims < 5)

bin_width = 1

p <- ggplot()+
  geom_histogram(data = df2, aes(x = sims, y = 1/bin_width*(..count..)/sum(..count..)), binwidth=bin_width, color = "black", fill="white", size=2)+
  geom_line(data=df1, aes(x=x, y=y), color="red", size = 2)+
  ggtitle("")+xlab("x")+ylab("density")+
  theme(
    axis.line=element_blank(),axis.text.x=element_blank(),
    axis.text.y=element_blank(),axis.ticks=element_blank(),
    axis.title.x=element_blank(),
    axis.title.y=element_blank(),legend.position="none",
    panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
    panel.grid.minor=element_blank(),plot.background=element_blank()
  )

print(p)
