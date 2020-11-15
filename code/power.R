library(tidyverse)

# constants for the normal plot
x_min = -4
x_max = 4
color_normal = "skyblue"
delta_mu = 1
mu_mu_0= paste(expression(mu[0]))
mu_mu_a= paste(expression(mu[a]))
oobeta = paste(expression(beta))

y_shift = 0.7
radius = 1.96

x_left = -radius
x_right = radius

# constants for lines
bar_whisker_heigth  = 0.08
color_line = "grey"
horizontal_line_color = "grey"
vertical_line_color_1 = "orange"
vertical_line_color_2 = "darkblue"
region_color = "red"



# set.seed(1009)

# data for normal curve
df_up =
  data.frame(x = seq(x_min, x_max, length.out = 500)) %>%
  mutate(y = dnorm(x) + y_shift)
df_down = 
  data.frame(x = seq(x_min, x_max, length.out = 500)) %>%
  mutate(y = dnorm(x+delta_mu))
df_fill =
  data.frame(x = seq(x_left, x_right, length.out = 300)) %>%
  mutate(y=dnorm(x+delta_mu))

png(file = "power.png", bg = "transparent", width=1600, height=800)
# plotting normal curves
p = ggplot()+
  annotate("segment", x = x_min, xend=x_max, y=y_shift, yend=y_shift,
           color=horizontal_line_color)+
  annotate("segment", x = x_min, xend=x_max, y=0, yend=0,
           color=horizontal_line_color)+
  geom_line(data=df_up, aes(x, y), size=1)+ 
  geom_area(data=df_fill, aes(x, y), fill=color_normal)+
  geom_line(data=df_down, aes(x, y), size=1)+
  annotate("errorbarh", xmin = x_left, xmax=x_right, y=0, 
           height=bar_whisker_heigth, color=region_color, size=1 )+
  annotate("errorbarh", xmin = x_left, xmax=x_right, y=y_shift,
           height=bar_whisker_heigth, color="red", size=1 )+
  
  annotate("segment", x=0, xend=0, y=y_shift- 0.05, yend= y_shift + 0.45, 
           color=vertical_line_color_1, linetype="dashed")+
  annotate("segment", x=-delta_mu, xend=-delta_mu, y=- 0.05, yend=  0.45, 
         color=vertical_line_color_1, linetype="dashed")+
  annotate("segment", x=x_left, xend=x_left, y=- 0.05, yend= y_shift+ 0.45, 
           color=vertical_line_color_2, size = 1)+
  annotate("segment", x=x_right, xend=x_right, y=- 0.05, yend= y_shift+ 0.45, 
           color=vertical_line_color_2, size = 1)+
  annotate("text", label=mu_mu_0, x=0.2, y=y_shift-0.05, parse=TRUE, size=5)+
  annotate("text", label=mu_mu_a, x=0.2-delta_mu, y=-0.05, parse=TRUE, size=5)+
  annotate("text", label=oobeta, x=1.8-delta_mu, y=0.20, parse=TRUE,
           size=7, fontface="bold")
  
  


  
  
#   annotate("segment", x=x_min, y=0, xend=x_max, yend=0, size=0.5)+
#   annotate("text", x=mu_x, y=mu_y, label=mu_mu, parse = T)
# 
# # data for horizontal lines 
# df_lines = data.frame(
#   x = rnorm(num_lines),
#   y=seq(first_line, last_line, length.out=num_lines) ) %>% 
#   mutate( x_left = x - radius,  x_right = x + radius ) %>% 
#   mutate( covers = factor( ifelse(x_left < 0 & x_right > 0, "yes", "no"), levels=c("yes","no") ) )
# 
# # plotting horizontal lines
# p = p+
#   geom_segment( data = df_lines,
#     aes(x=x_min, xend=x_max, y=y, yend=y), 
#     color=color_line, size=0.5)+
#   geom_errorbarh( data = df_lines, 
#       aes(xmin=x_left, xmax=x_right, y=y,  height=bar_whisker_heigth, color=covers))+
#   scale_color_manual(values=yes_no_colors) # error bar colors
# 
# # vertical line
# p = p + 
#   annotate("segment", x=0, xend=0, y = 0.5, yend = last_line-2*bar_whisker_heigth,
#            color = color_vertical_line)
  
# theme
p = p + theme_void()  + 
  theme(legend.position = "None")+
  coord_fixed(ratio=3)
print(p)

# output
dev.off()
