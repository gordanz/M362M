
pca_rotate <- function(points) {
  prc = prcomp(points)
  new_points = points %*% prc$rotation
  return(new_points*0.5)
}

stretch <- function(points, ax,ay){
  A = matrix(c(ax,0,0,ay),nrow=2)
  return(points %*% A)
}
shift <- function(points, ax,ay){
  A = matrix(c(ax,ay),byrow = TRUE, ncol=2, nrow=nrow(points))
  return(points + A)
}


plot.mc <- function(m) {
  g = graph_from_data_frame(m$edges, directed = TRUE, vertices = m$states)
  mad = m$additional_arguments
  # do not put layout here
  sad  =
    list( edge.curved = m$edges$curved,
          vertex.color = m$states$color,
          vertex.label = m$states$label,
          edge.loop.angle = m$edges$loop_angle,
          vertex.size =30,
          vertex.label.cex = 1,
          edge.arrow.size = 0.6,
          edge.color = "grey",
          rescale = FALSE
    )
  # pull out the layout specification
  if ("layout" %in% names(mad)) {
    pre_layout = mad$layout
  }
  else{
    pre_layout = layout_nicely
  }

  switch ( typeof(pre_layout),
           "character"   = {
             the_layout = as.matrix( m$states %>% select(x,y) )
             if ("transform" %in% names(mad)){
               print("Transforming (exp).")
               the_layout = do.call(mad$transform, args=list(the_layout))
             }
           },
           "closure" = {
             the_layout = pre_layout(g)
             if ("transform" %in% names(mad)){
               print("Transforming (fun).")
               the_layout = do.call(mad$transform, args=list(the_layout))
             }
           },
           the_layout = pre_layout
  )
  mad$layout = the_layout

  arguments=c( mad, sad )
  gplot <- function(...) plot(g,...)
  do.call(gplot, args=arguments)
  return(the_layout)
}
