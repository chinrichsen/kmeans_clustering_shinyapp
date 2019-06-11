library(shiny)
pageWithSidebar(
        headerPanel('K-means clustering using Iris DataSet (by Carlos Hinrichsen)'),
        sidebarPanel(
                sliderInput('clusters', 'Number of Clusters to assess', min = 1,
                            max = 20,
                            value = 2)
                
                
        ),
        mainPanel(
                tabsetPanel(type = "tabs", 
                            tabPanel("Number of Instances by Cluster", plotOutput('cplot2'), h4("The plot above shows the elements by Cluster using K-means algorithm. In red there is a line that represents the average number of elements by Cluster")), 
                            tabPanel("Plots considering Clusters", plotOutput('cplot'),h4("The plot above shows the different Cluster using colors, considering the relation between all the variables within the Iris Data Set")),
                            tabPanel("Documentation", h4("K-Means Algorithm App"), textOutput("text1"),textOutput("text2"),textOutput("text3"))
                )
                            
                
        )
)
