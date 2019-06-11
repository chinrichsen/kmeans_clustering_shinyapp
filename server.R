function(input, output) {
        
        Data <- reactive({
                iris[, -c(5)]
                
        })
        
        clusters <- reactive({
                kmeans(Data(), input$clusters)
        })
        
                output$cplot <- renderPlot({
                
                plot(Data(),
                     col = clusters()$cluster,
                     pch = 1, cex = 1,lower.panel = NULL, main="Iris Plots coloured by Clusters")
                
        })
        
        output$cplot2 <- renderPlot({
                tablec <- (table((data.frame(kmeans(Data(), input$clusters)$cluster))))
                plot(tablec,type = "p",main="Number of Instances by Cluster",xlab="Cluster Number", ylab="Number of Instances")
                abline(h=150/input$clusters,col="red")
        })
        output$text1 <- renderText({
                "1. The basic idea of the Application is to show how the elements by Cluster could change in the Iris DataSet using the K-Means agorithm. This is particularly relevant because the results of this algorithm are sensitive of the number of cluster that the user sets."
        })
        
        output$text2 <- renderText({
                "2. The algorithm uses the default distance method calculation, Euclidean distance, and uses all the information of the Iris DataSet (except the classification of flowers) to perform the clustering."
        })
        
        output$text3 <- renderText({
                "3. The user needs to change the number of Cluster desired to understand the sensitivity of the test with the provided plots."
        })
        
        
}


