library(shiny)
library(tidyverse)

coverage_plot = function(radius) {
    # constants for the normal plot
    x_min = -4
    x_max = 4
    color_normal = "skyblue"
    mu_x = 0.1
    mu_y = -0.04
    mu_mu = paste(expression(mu))
    
    # constants for lines
    num_lines = 20
    first_line = -0.1
    last_line  = -1
    bar_whisker_heigth  = 0.8*(first_line - last_line)/num_lines
    color_line = "grey"
    color_vertical_line = "orange"
    yes_no_colors = c("black","red")
    
    # set.seed(1009)
    
    # data for normal curve
    df_normal =
        data.frame(x = seq(x_min, x_max, length.out = 500)) %>%
        mutate(y = dnorm(x)) 
    
    # plotting normal curve
    p = ggplot(data=df_normal, aes(x,y))+
        geom_area(fill=color_normal)+
        geom_line(size=1)+
        annotate("segment", x=x_min, y=0, xend=x_max, yend=0, size=0.5)+
        annotate("text", x=mu_x, y=mu_y, label=mu_mu, parse = T)
    
    # data for horizontal lines 
    df_lines = data.frame(
        x = rnorm(num_lines),
        y=seq(first_line, last_line, length.out=num_lines) ) %>% 
        mutate( x_left = x - radius,  x_right = x + radius ) %>% 
        mutate( covers = factor( ifelse(x_left < 0 & x_right > 0, "yes", "no"), levels=c("yes","no") ) )
    
    # plotting horizontal lines
    p = p+
        geom_segment( data = df_lines,
                      aes(x=x_min, xend=x_max, y=y, yend=y), 
                      color=color_line, size=0.5)+
        geom_errorbarh( data = df_lines, 
                        aes(xmin=x_left, xmax=x_right, y=y,  height=bar_whisker_heigth, color=covers))+
        scale_color_manual(values=yes_no_colors) # error bar colors
    
    # vertical line
    p = p + 
        annotate("segment", x=0, xend=0, y = 0.5, yend = last_line-2*bar_whisker_heigth,
                 color = color_vertical_line)
    
    # theme
    p = p + theme_void()  + theme(legend.position = "None") # no legend
    
    
    # output
    return(p)

}


# Shiny stuff
# copied from here: https://shiny.rstudio.com/articles/basics.html


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Coverage of confidence intervals"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("radius",
                        "Radius:",
                        min = 0,
                        max = 3,
                        step=0.01,
                        value = 1.96)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("coveragePlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$coveragePlot <- renderPlot({
        coverage_plot(input$radius)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
