library(ggplot2)
d = 4
x = seq( -d,d, by=0.05)
y = dnorm(x)

df=data.frame(x,y)

p = ggplot(data=df, aes(x,y))+
  geom_area(fill="skyblue")+
  geom_line(size=1)+
  geom_segment(
    data=data.frame(x=-d, y=0, xend=d, yend=0), 
    aes(x=x,y=y,xend=xend,yend=yend),
    inherit.aes = FALSE,
    color="black",
    size=0.5
  )+
  geom_text(
    aes(x=0.1, y=-0.04, 
        label=paste(expression(mu))
        ),
    parse = T
    )


h= -0.05
numint = 20
# 1009 is a good seed
set.seed(1009)
x0 = rnorm(numint)
for (i in 1:numint) {
  h=h-1/numint
  a = 1.96
  p = p + geom_segment(
    data=data.frame(x=-d, y=h, xend=d, yend=h), 
    aes(x=x,y=y,xend=xend,yend=yend),
    inherit.aes = FALSE,
    color="grey",
    size=0.5
  ) +
    geom_errorbarh(
      data = data.frame(xmin = x0[i]-a, xmax = x0[i]+a, y=h),
      aes(xmin=xmin, xmax=xmax, y=y,  height=0.05),
      inherit.aes = F,
    )
}

p = p+geom_segment( aes(x=0, xend=0, y=0.5, yend=-1.1),
                     color="Orange2", size=0.5)
print(p+theme_void())
