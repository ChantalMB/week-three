library('igraph')

nodes <- read.csv("texasnodes.csv", header=T, as.is=T)
links <- read.csv("texaslinks.csv", header=T, as.is=T)

head(nodes)
head(links)

# gives number of nodes in data
nrow(nodes); length(unique(nodes$id))

# gives number of sources and number of targets
nrow(links); nrow(unique(links[,c("source", "target")]))

links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$target, links$source),]

colnames(links)[3] <- "weight"
rownames(links) <- NULL
head(links)

net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
# net

plot(net, edge.arrow.size=.4,vertex.label=NA)

deg <- degree(net, mode="all")
hist(deg, breaks=1:vcount(net)-1, main="Histogram of node degree")
plot(net, vertex.size=deg*2, vertex.label = NA)

write.csv(deg, 'degree.csv')

closepeople <- closeness(net, mode="all", weights=NA)
sort(closepeople, decreasing = T) # so that we see who is most close first
write.csv(closepeople, 'closeness.csv') # so we have it on file.

hs <- hub_score(net, weights=NA)$vector
as <- authority_score(net, weights=NA)$vector

par(mfrow=c(1,2))

# vertex.label.cex sets the size of the label; play with the sizes until you see something appealing.
plot(net, vertex.size=hs*40, vertex.label.cex =.2, edge.arrow.size=.1, main="Hubs")
plot(net, vertex.size=as*20, vertex.label = NA, edge.arrow.size=.1, main="Authorities")

# writes hs and as to file
write.csv(hs, 'hub-score.csv')
write.csv(as, 'auth-score.csv')

cfg <- cluster_fast_greedy(as.undirected(net))

lapply(cfg, function(x) write.table( data.frame(x), 'cfg.csv'  , append= T, sep=',' ))

plot(cfg, net, vertex.size = 1, vertex.label.cex =.2, edge.arrow.size=.1, main="Communities")

l1 <- layout_with_fr(net) # ‘Fruchterman-Reingold’ algorithm

# played with label colour to make more readable
plot(cfg, net, layout=l1, vertex.size = 1, vertex.label.cex =.07, vertex.label.color =435, edge.arrow.size=.01, main="Communities")
