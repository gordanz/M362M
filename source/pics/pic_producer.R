library(chapman)
library(tidyverse)


plotpng <- function(x, filename, height=1600, ...) {
  output_dir = "~/.ms/pics/"
  x = x %>% 
    set_graphics_parameters(
                            vertex.label.cex = 4,
                            edge.arrow.size = 2,
                            margin=c(0,0,0,0),
                            edge.width = 5)
  
  png(filename = paste0(output_dir, filename),
      bg = "transparent",
      width = 2400,
      height = height,
      )
  plot(x, ...)
  dev.off()
}

# # Random Walk
# m = random_walk(T=3,with_dots=TRUE, p=0.4)
# plotpng(m,"random_walk_chain.png", height = 400, xlim = c(-2.3,2))

# # Gambler's ruin
# m = gamblers_ruin()
# plotpng(m,"gamblers_ruin_chain.png", height = 400, xlim = c(-2,2))

# Regime switching 
# m = regime_switching()
# plotpng(m,"regime_switching_chain.png", height = 400, xlim = c(-2,2))

# # Deterministically monotone 
# m = deterministically_monotone()
# plotpng(m,"deterministically_monotone_chain.png", height=400)

# # Tennis
# m = tennis()
# plotpng(m, "tennis_chain.png", vertex.size = 40)

# # Manual-multi-step
# from = c(1,1,2,3,4,5)
# to =   c(1,2,3,4,5,1)
# prob = c(1/2, 1/2, 1,1,1,1)
# 
# m =
#   markov_chain(data.frame(to, from, prob)) %>%
#   set_auto_edge_colors %>%
#   set_auto_layout
# plotpng(m,"manual-multi-step_chain.png")
# 
# # Deck-2-2
# m = deck22() 
# plotpng(m,"deck-2-2_chain.png")
# 
# 
# # Basil
# m = tribble(
#   ~from, ~to, ~prob,
#   "1", "2", 1/2,
#   "1", "3", 1/2,
#   "2", "1", 1/3, 
#   "2", "4", 1/3, 
#   "2", "F", 1/3,
#   "3", "1", 1/3,
#   "3", "4", 1/3, 
#   "3", "S", 1/3,
#   "4", "2", 1/3,
#   "4", "3", 1/3,
#   "4", "5", 1/3,
#   "5", "4", 1/2,
#   "5", "F", 1/2,
#   "F", "F", 1,
#   "S", "S", 1
# ) %>% 
#   markov_chain %>% 
#   # set_state("1", x=0, y=2) %>% 
#   # set_state("2", x=1, y=2) %>% 
#   # set_state("F", x=2, y=2) %>% 
#   # set_state("3", x=0, y=1) %>% 
#   # set_state("4", x=1, y=1) %>% 
#   # set_state("5", x=2, y=1) %>% 
#   # set_state("S", x=0, y=0) %>% 
#   set_auto_layout %>% 
#   set_auto_edge_colors %>% 
#   curve_overlapping_edges(curve = 0.3) %>% 
#   set_edge("S","S", loop_angle = -pi/2) %>% 
#   stretch(2) %>% 
#   rotate(pca = T) %>% 
#   rotate( pi )
# 
# plotpng(m, "basil_chain.png")
# 




