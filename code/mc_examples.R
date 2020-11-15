# MC Examples -------------------------------------------------------------

#' Random walk as a MC
#'
#' @param p
#' @param reflecting
#'
#' @return
#' @export
#'
#' @examples
random_walk <- function(T=3, p=0.5, reflecting = FALSE, with_dots = FALSE) {
  m = new_mc(name="Random Walk")
  if (with_dots)
    reflecting = FALSE

  # states
  for (i in 1:(2*T+1))
    m = m %>% add_state( label = paste(i - T - 1), x=0.7*(i-T-1), y=0 )

  # transitions
  if (reflecting) {
    m = m %>% add_edge_by_indices(1, 2, prob=1,
                                label="1\n\n", curve=0.5)
    m = m %>% add_edge_by_indices(length(m), length(m)-1, prob=1,
                                label="\n1", curve=0.5)
  } else {
    if (!with_dots) {
      m = m %>% add_edge_by_indices(1, 1, prob=1,
                                  label="\n\n 1", curve=0, loop_angle=-pi/2)
      m = m %>% add_edge_by_indices(length(m), length(m), prob=1,
                                  label="\n1",curve=0, loop_angle=-pi/2)
    } else {
      m = m %>% add_edge_by_indices(1, 2, prob=p,
                                    curve = 0.5, color=pkg.env$default.p.color)
      m = m %>% add_edge_by_indices(length(m), length(m)-1, prob= 1-p,
                                    curve = 0.5, color=pkg.env$default.q.color)
    }

  }

  for (i in 2:(length(m)-1)) {
    m = m %>% add_edge_by_indices(i,  i + 1, prob = p,
                       label = "p\n\n", curve = 0.5,
                       color=pkg.env$default.p.color )
    m = m %>% add_edge_by_indices(i, i - 1, prob = 1-p,
                       label = "\nq", curve = 0.5,
                       color=pkg.env$default.q.color )
  }

  # with_dots options for lecture notes
  if (with_dots) {
    m = m %>% set_state_shape_by_index(1, shape="none")
    m = m %>% set_state_label_by_index(1, label="...")

    m = m %>% set_state_shape_by_index(length(m), shape="none")
    m = m %>% set_state_label_by_index(length(m), label="...")

  }

  # layout
  m$layout = m$layout %>%
      stretch(0.6,1)


  m$graphics_parameters = list(
    vertex.size = 20,
    rescale = FALSE,
    edge.label = NA
  )

  return(m)
}

deterministically_monotone = function(T=100) {
  m = new_mc(name="Deterministically Monotone Chain")
  for (i in 1:T) {
    m = m %>% add_state(paste(i-1), x = i-1, y=0)
  }
  m = m %>% add_state("...", x = T, y=0, shape="none")

  for (i in 1:T) {
    m = m %>% add_edge_by_indices(i, i+1, prob=1)
  }

  # layout
  m$layout = m$layout %>%
      stretch(0.3,1)

  m$graphics_parameters = list(
    edge.label = NA,
    vertex.size = 19,
    rescale=T
  )

  return(m)
}



attached_cycles <- function(n1 = 4, n2 = 6, pA = 0.5, tail = FALSE) {

  if (n1 <= 1 | n2 <= 1)
    stop("Cycles need to be at least 2 states in length")

  m=new_mc(name="Attached_Cycles")
  m = m %>% add_state("AB1")
  for (i in (2:n1))
    m = m %>%  add_state(paste0("A",i))
  for (i in (2:n2))
    m = m %>% add_state(paste0("B",i))

  m = m %>% add_edge_by_labels("AB1","A2", prob = pA,
                               color = pkg.env$default.p.color)
  m = m %>% add_edge_by_labels("AB1","B2", prob = pA,
                               color = pkg.env$default.p.color)
  m = m %>% add_edge_by_labels(paste0("A",n1),"AB1")
  m = m %>% add_edge_by_labels(paste0("B",n2),"AB1")

  if (n1 > 2)
    for (i in (2:(n1-1)))
      m = m %>% add_edge_by_labels(paste0("A",i), paste0("A",i+1))

  if (n2 > 2)
    for (i in (2:(n2-1)))
      m = m %>% add_edge_by_labels(paste0("B",i), paste0("B",i+1))


  # adding a tail
  if (tail) {
    m = m %>% add_state("C2")
    m = m %>% add_edge_by_labels("AB1","C2", prob = pA/2,
                                 color = pkg.env$default.q.color)
    m = m %>% add_edge_by_labels("C2","C2", loop_angle = -pi/2)
    m = m %>% set_edge_prob_by_labels("AB1","A2", prob = pA/2)
    m = m %>% set_edge_color_by_labels("AB1","A2", color = pkg.env$default.p.color)

    m = m %>% set_edge_prob_by_labels("AB1","C2", prob = pA/2)
    m = m %>% set_edge_prob_by_labels("AB1","C2", prob = pA/2)


    m = m %>% set_edge_color_by_labels("AB1","C2", color = pkg.env$default.q.color)
  }

  # # layout
  m = m %>%  set_fancy_layout(algorithm = igraph::layout_with_kk)
  m$layout = m$layout %>%
      pca_rotate %>%
      stretch(1.6,1.6) %>%
      shift(0,0)
  m$graphics_parameters = list(
    vertex.size=20,
    edge.label = NA
  )

  return(m)
}



gamblers_ruin <- function(a=5, p=0.25) {

  if (a<=2) stop("a must be at least 3")
  if (p<=0 | p>=1) stop("p must be in (0,1)")

  m=new_mc(name=paste0("Gambler's Ruin, a=",a))

  # states
  for (i in 1:(a+1))
    m = m %>% add_state(paste(i-1), x = 2*i-a-1, y=0)

  m = m %>% set_state_color_by_index(1,
                                     color=pkg.env$default.absorbing.color)
  m = m %>% set_state_color_by_index(a+1,
                                     color=pkg.env$default.absorbing.color)


  # edges
  for (i in 2:a) {
    m = m %>% add_edge_by_indices(i, i-1, prob = 1-p,
                                label = "\n1-p", curve = 0.6,
                                color=pkg.env$default.q.color)
    m = m %>% add_edge_by_indices(i, i+1, prob = p,
                                label = "p\n", curve = 0.6,
                                color=pkg.env$default.p.color)
  }

  m = m %>% add_edge_by_labels("0","0",
                              loop_angle=pi)
  m = m %>% add_edge_by_labels(paste(a), paste(a),
                              loop_angle = 0)

  # Layout
  m$layout = m$layout %>%
    stretch(0.2,1) %>%
    shift(-0.2,0)

  m$graphics_parameters = list(
    vertex.size = 20,
    rescale = FALSE,
    edge.label = NA
  )

  return(m)
}

regime_switching = function(p12 = 0.4, p21 = 0.7) {
  m = new_mc(name="Regime Switching")

  m = m %>% add_state("1",
                      x=-0.3, y=0)
  m = m %>% add_state("2",
                      x=0.3, y=0)


  s= expression(latex2exp::TeX("$p_{22}$"))
  m = m %>% add_edge_by_indices(1, 1, prob = 1-p12,
                                label="p11\n\n\n", loop_angle=pi)
  m = m %>% add_edge_by_indices(1, 2, prob = 1-p12,
                                label="p12\n\n", curve = 0.6)
  m = m %>% add_edge_by_indices(2, 1, prob = p21,
                                label="\n\np21", curve = 0.6)
  m = m %>% add_edge_by_indices(2, 2, prob = 1-p21,
                                label= "\n\np22")

  m$graphics_parameters = list(
    vertex.size = 20
    # edge.label = NA
  )

return(m)

}




tennis <- function(p=0.4) {
  m = new_mc(name = "Tennis")
  states = c()
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
      "40-0","P1",
      "15-40","30-40",
      "30-30","40-30",
      "40-15","P1",
      "40-30","P1",
      "30-40","40-40",
      "40-40","A-40",
      "40-A","40-40",
      "A-40","P1"), ncol=2, byrow=TRUE)

  qs = matrix(
    c("0-0","0-15",
      "0-15","0-30",
      "15-0","15-15",
      "0-30","0-40",
      "15-15","15-30",
      "30-0","30-15",
      "0-40","P2",
      "15-30","15-40",
      "30-15","30-30",
      "40-0","40-15",
      "15-40","P2",
      "30-30","30-40",
      "40-15","40-30",
      "40-30","40-40",
      "30-40","P2",
      "40-40","40-A",
      "40-A","P2",
      "A-40","40-40"), ncol=2, byrow=TRUE)

  state_labels = unique(c(ps,qs))
  for (label in state_labels) {
    m = m %>%  add_state(label=label)
  }

  for (i in 1:dim(qs)[1]){
    m = m %>% add_edge_by_labels(qs[i,1], qs[i,2], prob = 1-p,
                                label = "\n1-p", color="red3")
  }

  for (i in 1:dim(ps)[1]){
    m = m %>% add_edge_by_labels(ps[i,1], ps[i,2], prob = p,
                                 label = "p\n\n",color = "seagreen")
  }

  m = m %>% add_edge_by_labels("P1","P1",
                              loop_angle=-45)
  m = m %>% add_edge_by_labels("P2","P2",
                              loop_angle=45)

  # touchups

  m = m %>%
    set_edge_curve_by_labels("40-40","A-40",
                                   curve = 0.6) %>%
    set_edge_curve_by_labels("40-40","40-A",
                             curve = 0.6) %>%
    set_edge_curve_by_labels("A-40","40-40",
                             curve = 0.6) %>%
    set_edge_curve_by_labels("40-A","40-40",
                             curve = 0.6) %>%
    set_state_color_by_label("P1", "orange") %>%
    set_state_color_by_label("P2", "orange")


set_fancy_layout(algorithm = igraph::layout_with_kk)

  m$layout = m$layout %>%
        pca_rotate() %>%
        stretch(1.5,-1) %>%
        shift(0,0)

  m$graphics_parameters = list(
    vertex.size = 25,
    layout = igraph::layout_with_kk,
    edge.label = NA

  )

  return(m)
}

deck22 = function() {
  m = new_mc(name = "Deck-2-2")

  # States
  states = c("22", "21b", "12r", "11r", "11b", "02r", "01r", "10b", "01b", "00")
  for (s in states) m = m %>% add_state(s)

# Edges
m = m %>%
 add_edge_by_labels("22", "21b", prob = 0.5,
               label = "\n  1/2", color = pkg.env$default.p.color) %>%
 add_edge_by_labels("22", "12r", prob = 0.5,
               label = "   1/2\n\n", color = pkg.env$default.p.color) %>%
 add_edge_by_labels("21b","21b", prob = 1 / 3,
               label = "\n\n1/3", loop_angle = -pi/2, color = pkg.env$default.q.color) %>%
 add_edge_by_labels("21b", "11r", prob = 2 / 3,
               label = "        2/3", color = pkg.env$default.r.color) %>%
 add_edge_by_labels("12r", "11b", prob = 2 / 3,
               label = "\n   2/3", color = pkg.env$default.r.color) %>%
 add_edge_by_labels("12r", "02r", prob = 1 / 3,
               label = "\n1/3", color = pkg.env$default.q.color) %>%
 add_edge_by_labels("11r", "01r", prob = 0.5,
               label = "      1/2\n\n", color = pkg.env$default.p.color) %>%
 add_edge_by_labels("11r", "10b", prob = 0.5,
               label = "\n  1/2", color = pkg.env$default.p.color) %>%
 add_edge_by_labels("11b","11b",prob = 0.5,
            label = "1/2 \n\n",loop_angle = pi / 2,
            color = pkg.env$default.p.color) %>%
 add_edge_by_labels("11b", "01r", prob = 0.5,
               label = "\n1/2", color = pkg.env$default.p.color) %>%
 add_edge_by_labels("02r", "01b", prob = 1,
               label = "") %>%
 add_edge_by_labels("01r", "00", prob = 1,
               label = "") %>%
 add_edge_by_labels("10b", "00", prob = 1) %>%
 add_edge_by_labels("01b", "01b", prob = 1, loop_angle = -pi/2, label = "") %>%
 add_edge_by_labels("00", "00", prob = 1,
               label = "", loop_angle = -pi/2)

  # Layout
  ###############
  m = m %>% set_fancy_layout(algorithm = igraph::layout_with_kk)
  m$layout = m$layout %>%
    pca_rotate %>%
    stretch(2,2)

  m$graphics_parameters = list(
    vertex.size = 20
  )
  return(m)
}
