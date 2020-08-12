

library(readxl)
dados_observations <- read_excel("C:/Users/risel/Desktop/dados_observations.xlsx")
View(dados_observations)

> #COLOCA A COLUNA COMO ROTULO
dados1 <- dados_observations[,-1]
View(dados1)
dados <- scale(dados1)


fviz_nbclust(dados, kmeans, method = "silhouette", barfill = "steelblue",
                            barcolor = "steelblue",
                            linecolor = "steelblue",
                            print.summary = TRUE)
dados_kmeans <- kmeans(dados, 2)
fviz_cluster(dados_kmeans, data = dados,
                             stand = TRUE,
                             axes = c(1, 2),
                             geom = c("point"),
                             repel = TRUE,
                             show.clust.cent = TRUE,
                             ellipse = TRUE,
                             ellipse.type = "convex",
                             ellipse.level = 0.95,
                             ellipse.alpha = 0.2,
                             shape = TRUE,
                             pointsize = 2,
                             labelsize = 14,
                             main = "Cluster plot",
                             xlab = TRUE,
                             ylab = TRUE,
                             outlier.color = "black",
                             outlier.shape = 22,
                             outlier.pointsize = pointsize,
                             outlier.labelsize = labelsize)


lista <- dados_kmeans$cluster
dados2 <- cbind(dados1, lista)
View(list)
dados2 <- cbind(dados, lista)

RESULTS <- kmeans(dados1, 2)
RESULTS
RESULTS$size
RESULTS$cluster
table(dados_observations$bloco, RESULTS$cluster)
