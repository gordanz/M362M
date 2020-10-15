# MC examples -------------------------------------------------------------

random_walk <- function(T=3,p=0.5, reflecting = FALSE) {
  m = mc(name="Random Walk")

  # states
  for (i in 1:(2*T+1))
    m = m %>% add_state(label = toString(i - T - 1), x=0.4*(i-T-1), y=0 )


  # transitions
  if (reflecting) {
    m = m %>% add_edge_by_index(1,2,prob=1, label="\n1\n", curved=0.5)
    m = m %>% add_edge_by_index(length(m),length(m)-1,prob=1, label="\n1\n", curved=0.5)
  } else {
    m = m %>% add_edge_by_index(1,1,prob=1, label="\n1\n", curved=0, loop_angle=-pi/2)
    m = m %>% add_edge_by_index(length(m),length(m),prob=1, label="\n1\n", curved=0, loop_angle=-pi/2)
  }

  for (i in 2:(length(m)-1)) {
    m = m %>% add_edge_by_index(from = i, to = i + 1, prob = p, label = "p\n\n", curved = 0.5 )
    m = m %>% add_edge_by_index(from = i, to = i - 1, prob = 1-p, label = "\nq", curved = 0.5 )
  }

  m$additional_arguments = list(
    #layout ="explicit",
    layout = layout.kamada.kawai,
    transform = "pca_rotate",
    vertex.size = 30,
    rescale = FALSE
  )

  return(m)
}



attached_cycles <- function(n1 = 4, n2 = 6, pA = 0.5, tail = FALSE) {

  if (n1 <= 1 | n2 <= 1)
    stop("Cycles need to be at least 2 states in length")

  m=mc(name="Attached_Cycles")
  m = m %>% add_state("AB1")
  for (i in (2:n1))
    m = m %>%  add_state(str_c("A",i))
  for (i in (2:n2))
    m = m %>% add_state(str_c("B",i))

  m = m %>% add_edge_by_label("AB1","A2", prob = pA)
  m = m %>% add_edge_by_label("AB1","B2", prob = pA)
  m = m %>% add_edge_by_label(str_c("A",n1),"AB1")
  m = m %>% add_edge_by_label(str_c("B",n2),"AB1")

  if (n1 > 2)
    for (i in (2:(n1-1)))
      m = m %>% add_edge_by_label(str_c("A",i), str_c("A",i+1))

  if (n2 > 2)
    for (i in (2:(n2-1)))
      m = m %>% add_edge_by_label(str_c("B",i), str_c("B",i+1))


  # adding a tail
  if (tail) {
    m = m %>% add_state("C2")
    m = m %>% add_edge_by_label("AB1","C2", prob = pA/2)
    m = m %>% add_edge_by_label("C2","C2")
    m = m %>% set_edge_probability_by_label("AB1","A2",pA/2)
    m = m %>% set_edge_probability_by_label("AB1","C2",pA/2)
  }

  # to be applied to layout
  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(4,4) %>%
      shift(0,0)
  }
  # Layout
  m$additional_arguments = list(
    layout = layout_with_kk,
    transform = my_transform
  )
  return(m)
}


gambler <- function(a=5, p=0.25) {

  if (a<=2) stop("a must be at least 3")
  if (p<=0 | p>=1) stop("p must be in (0,1)")

  m=mc(name="Gambler")

  # nodes (must make them explicitly blue if you use graphviz)
  for (i in 1:(a+1))
    m = m %>% add_state(str_c(i-1), x = 2*i, y=0)
  m$states$color[1] = "orange"
  m$states$color[a+1] = "orange"


  # transitions
  for (i in 2:a) {
    m = m %>% add_edge_by_index(from = i, to = i-1,
                                prob = 1-p,  label = "\n1-p",
                                curve = 0.4)
    m = m %>% add_edge_by_index(from = i, to = i+1,
                                prob = p,  label = "p\n",
                                curve = 0.4)
  }

  m = m %>% add_edge_by_label("0","0", loop_angle=-pi/2)
  m = m %>% add_edge_by_label(str_c(a), str_c(a), loop_angle = -pi/2)

  # Layout
  ###############
  m$additional_arguments = list(
    layout = "explicit",
    rescale = TRUE
  )

  return(m)
}


mc8_1 <- function(){

  m=mc(name="MC8_1")

  # nodes (must make them explicitly blue if you use graphviz)
  for (i in 1:8)
    m = m %>% add_state(str_c(i), color="lightblue")

  # From 1
  m = m %>% add_edge_by_label("1","1",prob = 0.5, label="1/2")
  m = m %>% add_edge_by_label("1","2",prob = 0.5, label="1/2")

  # From 2
  m = m %>% add_edge_by_label("2","3",prob = 0.5, label="1/2")
  m = m %>% add_edge_by_label("2","7",prob = 0.5, label="1/2")

  # From  3
  m = m %>% add_edge_by_label("3","4",curve = 0.5, label="1")

  # From = m 4
  m = m %>% add_edge_by_label("4","3",prob = 0.5, label="1/2",curve=0.5);
  m = m %>% add_edge_by_label("4","5",prob = 0.5, label="1/2")

  # From = m 5
  m = m %>% add_edge_by_label("5","6", label="1")

  # From = m 6
  m = m %>% add_edge_by_label("6","3",prob = 0.5, label="1/2")
  m = m %>% add_edge_by_label("6","6",prob = 0.5, label="1/2")

  # From = m 7
  m = m %>% add_edge_by_label("7","8",curve=0.5, label="1™¡™");

  # From = m 5
  m = m %>% add_edge_by_label("8","7",prob = 0.75, label="3/4", curve=0.5);
  m = m %>% add_edge_by_label("8","8",prob = 0.25, label="1/4")

  # loops
  m = m %>% set_loop_angle_by_label("1",-3*pi/4)
  m = m %>% set_loop_angle_by_label("8",-4*pi/4)
  m = m %>% set_loop_angle_by_label("6",-pi/4)

  # to be applied to layout
  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(4,4) %>%
      shift(0,0)
  }
  # Layout
  m$additional_arguments = list(
    layout = layout_with_kk,
    transform = my_transform
  )

  return(m)
}



# airline reservation system
facility <- function(p=0.4) {

  m = mc(name = "MC14-1")

  # # states
  m = m %>% add_state("0-0-1-1");
  m = m %>% add_state("2-0-0-0");
  m = m %>% add_state("1-1-0-0");
  m = m %>% add_state("0-1-0-1");
  m = m %>% add_state("1-0-1-0");

  # # edges
  m = m %>% add_edge_by_label("0-0-1-1","0-1-0-1",
                              label="1", prob = 1)
  m = m %>% add_edge_by_label("2-0-0-0","0-0-1-1",
                              label="\np^2", prob = p**2 )
  m = m %>% add_edge_by_label("2-0-0-0","2-0-0-0",
                              label="\n\n    (1-p)^2", prob = (1-p)**2)
  m = m %>% add_edge_by_label("2-0-0-0","1-0-1-0",
                              label="2p(1-p)", prob = 2* p*(1-p) )
  m = m %>% add_edge_by_label("1-1-0-0","2-0-0-0",
                              label="1-p", prob = (1-p) )
  m = m %>% add_edge_by_label("1-1-0-0","1-0-1-0",
                              label="p",curve=0.4, prob = p)
  m = m %>% add_edge_by_label("1-0-1-0","1-1-0-0",
                              label="1-p",curve=0.4, prob = (1-p) )
  m = m %>% add_edge_by_label("1-0-1-0","0-1-0-1",
                              label="p",curve=0.4, prob = p )
  m = m %>% add_edge_by_label("0-1-0-1","1-0-1-0",
                              label="1",curve=0.4, prob = 1 )

  # # loops
  m = m %>% set_loop_angle_by_label("2-0-0-0",pi/2)

  # to be applied to layout
  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(4,4) %>%
      shift(0,0)
  }
  # Layout
  m$additional_arguments = list(
    layout = layout_with_kk,
    transform = my_transform,
    vertex.size=50
  )

  return(m)
}

mc20_1 <- function() {


  m = mc(name="MC20_1")
  # # nodes
  for (i in 1:7)
    m = m %>% add_state(str_c(i-1))

  m = m %>% add_edge_by_label("1","2")
  m = m %>% add_edge_by_label("2","3")
  m = m %>% add_edge_by_label("3","4")
  m = m %>% add_edge_by_label("4","5")
  m = m %>% add_edge_by_label("5","1")
  m = m %>% add_edge_by_label("1","2")
  m = m %>% add_edge_by_label("0","1", prob = 0.5, label = "1/2")
  m = m %>% add_edge_by_label("0","6", prob = 0.5, label = "1/2")
  m = m %>% add_edge_by_label("6","6", loop_angle = -pi/2)

  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(4,4) %>%
      shift(0,0)
  }
  # Layout
  m$additional_arguments = list(
    layout = layout_with_kk,
    transform = my_transform,
    vertex.size=35
  )


  return(m)
}

mc21_1 <- function() {

  m = mc(name="MC21_1")
  for (i in 1:3)
    m = m %>% add_state(str_c(i))

  # transitions
  m = m %>% add_edge_by_label( "1","2", prob = 1, label = "1", curve = 0.4)
  m = m %>% add_edge_by_label( "2","1", prob = 0.25, label = "1/4", curve = 0.4)
  m = m %>% add_edge_by_label( "2","2", prob = 0.50, label = "1/2")
  m = m %>% add_edge_by_label( "2","3", prob = 0.25, label = "1/4")
  m = m %>% add_edge_by_label( "3","3", prob = 1, label = "1")

  # loop directions
  m = m %>% set_loop_angle_by_label("2",pi/2)
  m = m %>% set_loop_angle_by_label("3",pi/2)

  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(4,4) %>%
      shift(0,0)
  }

  # Layout
  m$additional_arguments = list(
    layout = layout_with_kk,
    transform = my_transform
  )

  return(m)
}

professor <- function(p_morning=0.05, p_afternoon = 0.20) {

  # constants
  q_morning = 1-p_morning
  q_afternoon = 1-p_afternoon
  p_morning_label = "p_m"
  q_morning_label = "q_m"
  p_afternoon_label = "p_a"
  q_afternoon_label = "q_a"

  m = mc(name="Professor")
  m = m %>% add_state("0,5,H",x = -2.5, y = 0)
  m = m %>% add_state("1,4,H",x = -1.5, y = 0)
  m = m %>% add_state("2,3,H",x = -0.5, y = 0)
  m = m %>% add_state("3,2,H",x = 0.5, y = 0)
  m = m %>% add_state("4,1,H",x = 1.5, y = 0)
  m = m %>% add_state("5,0,H",x = 2.5, y = 0)

  m = m %>% add_state("0,5,W",x = -2.5, y = 1)
  m = m %>% add_state("1,4,W",x = -1.5, y = 1)
  m = m %>% add_state("2,3,W",x = -0.5, y = 1)
  m = m %>% add_state("3,2,W",x = 0.5, y = 1)
  m = m %>% add_state("4,1,W",x = 1.5, y = 1)
  m = m %>% add_state("5,0,W",x = 2.5, y = 1)

  m = m %>% add_state("Wet",x = -3, y = 0.5)

  m = m %>%  add_edge_by_label("0,5,H", "Wet", p_morning)

  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(2,2) %>%
      shift(0,0)
  }

  # Layout
  m$additional_arguments = list(
    layout = "explicit",
    vertex.size = 44,
    # layout = layout_with_kk,
    transform = my_transform
  )


  return(m)
}



tennis <- function(p=0.4) {
  m = mc(name = "Tennis")
  ps = matrix(
    c("0-0","15-0",
      "0-15","15-15",
      "15-0","30-0",
      "0-30","15-30",
      "15-15","30-15",
      "30-0","40-0",
      "0-40","15-40",
      "15-30","30-30",
      "30-15","40-15",
      "40-0","W-L",
      "15-40","30-40",
      "30-30","40-30",
      "40-15","W-L",
      "40-30","W-L",
      "30-40","40-40",
      "40-40","A-40",
      "40-A","40-40",
      "A-40","W-L"), ncol=2, byrow=TRUE)

  qs = matrix(
    c("0-0","0-15",
      "0-15","0-30",
      "15-0","15-15",
      "0-30","0-40",
      "15-15","15-30",
      "30-0","30-15",
      "0-40","L-W",
      "15-30","15-40",
      "30-15","30-30",
      "40-0","40-15",
      "15-40","L-W",
      "30-30","30-40",
      "40-15","40-30",
      "40-30","40-40",
      "30-40","L-W",
      "40-40","40-A",
      "40-A","L-W",
      "A-40","40-40"), ncol=2, byrow=TRUE)



  for (i in 1:dim(qs)[1]){
    m = m %>% add_edge_by_label(qs[i,1],qs[i,2],1-p, label = "1-p")
  }

  for (i in 1:dim(ps)[1]){
    m = m %>% add_edge_by_label(ps[i,1],ps[i,2],p, label = "p")
  }

  # touchups
  m = m %>% set_edge_curved_by_label("40-40","A-40", curved = 0.6)
  m = m %>% set_edge_curved_by_label("40-40","40-A", curved = 0.6)
  m = m %>% set_edge_curved_by_label("A-40","40-40", curved = 0.6)
  m = m %>% set_edge_curved_by_label("40-A","40-40", curved = 0.6)

  my_transform <- function(points)
  {
    points %>%
      pca_rotate() %>%
      stretch(1.5,0.8) %>%
      shift(0,0)
  }

  # Layout
  m$additional_arguments = list(
    vertex.size = 20,
    layout = layout_with_kk,
    transform = my_transform,
    edge.label = NA

  )

  return(m)
}



# def mc10_5_6():
# """The chain used in problem 10.5.6"""

# m = mc(title = "MC10_5_6")
# states = [ str_c(i) for i in 1:(8-1) ]
# for s in states:
# m = m %>% add_state(s)

# transitions = [
# (1,2,0.5),
# (1,3,0.5),
# (2,1,1),
# (3,1,0.5),
# (3,2,0.5),
# (4,3,0.25),
# (4,5,0.5),
# (4,6,0.25),
# (5,6,1),
# (6,6,0.5),
# (6,7,0.5),
# (7,6,1) ]


# for i1,i2,p in transitions:
# if p == 0.5:
# lb = "1/2"
# elif p == 0.25:
# lb = "1/4"
# else:
# lb = str_c(p)

# m %>% add_edge_by_label(str_c(i1), str_c(i2), prob = p, label = lb)

# curves = [
# (6,7),
# (7,6),
# (1,3),
# (3,1),
# (1,2),
# (2,1)]

# for i1,i2 in curves:
# m = m %>% set_curve(str_c(i1), str_c(i2), 0.15)

# m = m %>% set_loop_angle("6","ul")
# m = m %>% compute()

# # Layout
# ###############
# m = m %>% set_canvas(180,120)
# pre_layout = nx.kamada_kawai_layout(m, weight = 1)
# layout = _rotate_scale_translate(pre_layout, angle = 20,
# stretch_x = 2, stretch_y = 2)
# m = m %>% set_layout(layout)
# return(m)

# # def mc10_5_3(p=0.4, a=6):
#     # """The chain used in the problem 10.5.6
#
#     # Args:
#         # p (float): the prob that of a single win
#         # a (int): the amount required to exit
#
#     # Returns:
#         # a MarkovChain object
#     # """
#     # m = mc(title = "MC10_5_3")
#     # states = [ str_c(i) for i in range(a+1) ]
#     # for s in states:
#         # m = m %>% add_state(s)
#
#     # m %>% add_edge_by_label("0","0")
#     # m %>% add_edge_by_label(str_c(a),str_c(a))
#     # m = m %>% set_loop_angle("0","u")
#     # m = m %>% set_loop_angle(str_c(a),"r")
#     # for i in 1:(a-1):
#         # j = min( i, a-i)
#         # m %>% add_edge_by_label(str_c(i),str_c(i-j),prob = 1-p, label = "q")
#         # m %>% add_edge_by_label(str_c(i),str_c(i+j),prob = p, label = "p")
#
#     # _curve_doubles(m)
#     # m = m %>% compute()
#
#     # # Layout
#     # ###############
#     # m = m %>% set_canvas(180,120)
#     # pre_layout = graphviz_layout(m, prog="dot", args = "-GNodesep=0.1")
#     # pre_layout = nx.shell_layout(m, [["2","4"],["0","1","3","5"]])
#     # layout = _rotate_scale_translate(pre_layout, angle = 0,
#              # stretch_x = 2, stretch_y = 2)
#     # m = m %>% set_layout(layout)
#     # return(m)
#
# # def mc10_5_1():
#
#     # m = mc(title = "MC10_5_1")
#     # for i in 1:(8-1):
#         # m = m %>% add_state(str_c(i))
#
#     # trs = [
#             # (1,1,0.5),
#             # (1,3,0.5),
#             # (2,1,0.25),
#             # (2,2,0.5),
#             # (2,3,0.25),
#             # (3,2,0.5),
#             # (3,3,0.5),
#             # (4,3,1),
#             # (5,4,0.5),
#             # (5,6,0.5),
#             # (6,7,1),
#             # (7,6,0.5),
#             # (7,7,0.5)
#             # ]
#
#     # for i1,i2,p in trs:
#         # m %>% add_edge_by_label(str_c(i1), str_c(i2), prob = p)
#
#     # m = m %>% compute()
#
#
#     # m = m %>% set_loop_angle("1","r")
#     # m = m %>% set_loop_angle("2","l")
#     # m = m %>% set_loop_angle("3","u")
#     # m = m %>% set_loop_angle("7","l")
#
#     # _curve_doubles(m)
#
#     # # Layout
#     # ###############
#     # m = m %>% set_canvas(180,100)
#     # pre_layout = nx.kamada_kawai_layout(m, weight = 1)
#     # pre_layout = graphviz_layout(m, prog="dot", args = "-GNodesep=0.1")
#     # layout = _rotate_scale_translate(pre_layout, angle = 90,
#              # stretch_x = 2, stretch_y = 2)
#     # m = m %>% set_layout(layout)
#     # return(m)
#
#
# # def story():
#     # """The chain used in the problem 10.5.6
#
#     # Args:
#         # p (float): the prob that of a single win
#         # a (int): the amount required to exit
#
#     # Returns:
#         # a MarkovChain object
#     # """
#     # m = mc(name="story-01")
#
#     # m = m %>% add_state("22",label="\n{2,2}");
#     # m = m %>% add_state("21b",label="\n{2,1,b}");
#     # m = m %>% add_state("12r",label="\n{1,2,r}");
#     # m = m %>% add_state("11r",label="\n{1,1,r}");
#     # m = m %>% add_state("11b",label="\n{1,1,b}");
#     # m = m %>% add_state("02r",label="\n{0,2,r}");
#     # m = m %>% add_state("01r",label="\n{0,1,r}");
#     # m = m %>% add_state("10b",label="\n{1,0,b}");
#     # m = m %>% add_state("01b",label="\n{0,1,b}");
#     # m = m %>% add_state("00",label="\n{0,0}");
#
#
#     # m %>% add_edge_by_label("22","21b",prob = 0.5, label="\n1/2");
#     # m %>% add_edge_by_label("22","12r",prob = 0.5, label="\n1/2");
#     # m %>% add_edge_by_label("21b","21b",prob = 1/3, label="\n1/3");
#     # m %>% add_edge_by_label("21b","11r",prob = 2/3, label="\n2/3");
#     # m %>% add_edge_by_label("12r","11b",prob = 2/3, label="\n2/3");
#     # m %>% add_edge_by_label("12r","02r",prob = 1/3, label="\n1/3");
#     # m %>% add_edge_by_label("11r","01r",prob = 0.5, label="\n1/2");
#     # m %>% add_edge_by_label("11r","10b",prob = 0.5, label="\n1/2"); #
#     # m %>% add_edge_by_label("11b","11b",prob = 0.5, label="\n1/2");
#     # m %>% add_edge_by_label("11b","01r",prob = 0.5, label="\n1/2");
#     # m %>% add_edge_by_label("02r","01b",prob = 1, label="\n1");
#     # m %>% add_edge_by_label("01r","00",prob = 1, label="\n1");
#     # m %>% add_edge_by_label("10b","00",prob = 1, label="\n1");
#     # m %>% add_edge_by_label("01b","01b",prob = 1, label="\n1");
#     # m %>% add_edge_by_label("00","00",prob = 1, label="\n1");
#
#     # m = m %>% set_loop_angle("21b","-60")
#     # m = m %>% set_loop_angle("11b","d")
#
#
#
#     # m = m %>% compute();
#
#     # # Layout
#     # ###############
#     # m = m %>% set_canvas(180,110)
#     # pre_layout = graphviz_layout(m, prog="dot", args = "-GNodesep=2")
#     # layout = _rotate_scale_translate(pre_layout, angle = -90)
#     # m = m %>% set_layout(layout)
#     # return(m)
#
#
# def _largest_initial(sofar, pat):
#     assert len(pat) >= len(sofar), "Something wrong."
#     if pat == sofar:
#         return(TRUE, pat)
#     else:
#         s = list(sofar)
#         p = list(pat)
#         while s:
#             if s == p[:(len(s))]:
#                 break
#             s.pop(0)
#         bigger = len(s) == len(sofar)
#         return(bigger, "".join(s))
#
# def patterns(pat = "HTH"):
#     """A chain used to analyze coin-tossing patterns
#
#     Args:
#         pat (str): a string pattern consisting of Hs and Ts
#     """
#
#     m=mc(title = "Patterns")
#
#     for i in (1:(len(pat-1))):
#         m = m %>% add_state(pat[:i], position = [30*i,0])
#     m = m %>% add_state("",position = [0,0])
#     m = m %>% add_state(pat,position = [30*len(pat),0], color = "orange")
#     m %>% add_edge_by_label(pat,pat)
#     for s in m = m %>% states():
#         if not s == pat:
#             biggerT, sT = _largest_initial(s+"T", pat)
#             biggerH, sH = _largest_initial(s+"H", pat)
#             extraT = len(s)+1 -  len(sT)
#             extraH = len(s)+1 -  len(sH)
#             if biggerT: extraT = 0;
#             if biggerH: extraH = 0;
#             m %>% add_edge_by_label(s,sT,prob=0.5,
#                     label="\n1/2", curve = -0.15*math.sqrt(extraT))
#             m %>% add_edge_by_label(s,sH,prob=0.5,
#                     label="\n1/2", curve = -0.15*math.sqrt(extraH))
#     m = m %>% set_name("","0")
#     m = m %>% set_name(pat,"Win")
#     m = m %>% set_label("0","0")
#     m = m %>% set_label("Win","Win")
#     for s in m = m %>% states():
#         m = m %>% set_loop_angle(s,"u")
#     m = m %>% set_canvas(50*len(pat),50)
#     _curve_doubles(m, curve = -0.15)
#     m = m %>% compute()
#     return(m)
#
# def patterns_HHH():
#     """A chain used to analyze coin-tossing patterns"""
#
#     m=mc(title = "Patterns")
#     states = ["0","H","HH","Win"]
#     for i,s in enumerate(states):
#         m = m %>% add_state(s, position = [float(i),0])
#     m = m %>% set_state_color("Win","orange")
#     m %>% add_edge_by_label("0","0", prob = 0.5, label = "1/2")
#     m %>% add_edge_by_label("0","H",prob = 0.5, label = "1/2")
#     m %>% add_edge_by_label("H","0",prob = 0.5, label = "1/2", curve = 0.3)
#     m %>% add_edge_by_label("H","HH",prob = 0.5, label = "1/2")
#     m %>% add_edge_by_label("HH","0",prob = 0.5, label = "1/2", curve = -0.3)
#     m %>% add_edge_by_label("HH","Win",prob = 0.5, label = "1/2")
#     m %>% add_edge_by_label("Win","Win")
#
#     m = m %>% set_loop_angle("0","u")
#     m = m %>% set_loop_angle("H","u")
#     m = m %>% set_loop_angle("Win","u")
#
#     m = m %>% set_canvas(180,50)
#     m = m %>% compute()
#     return(m)

# testing, testing
###################

# m = attached_cycles(n1=3, n2=4)

