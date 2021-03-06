% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mle.kraftMcMillan.r
\name{mle.kraftMcMillan}
\alias{mle.kraftMcMillan}
\title{Apply the Kraft-McMillian Inequality using a specific encoding algorithm.}
\usage{
mle.kraftMcMillan(G, k, multiNode = FALSE)
}
\arguments{
\item{G}{- A character vector of all node names in the background knowledge graph.}

\item{k}{- The size of the node name subsets of G.}

\item{multiNode}{- Boolean, indicating whether to use the multi-node diffusion encoding algorithm (TRUE) or the single-node
diffusion encoding algorithm (FALSE). Default is FALSE.}
}
\value{
IA - a list of bitlengths associated with all outcomes in the N choose K outcome space, with the names of the list elements the node names of the encoded nodes
}
\description{
A power analysis of the encoding algorithm using to encode subsets of S in G.
}
\examples{
G = list(A=0, B=0, C=0, D=0, E=0, F=0, G=0)
names(G) = tolower(names(G))
adj_mat = rbind(c(0,2,1,0,0,0,0), #A's neighbors
                c(2,0,1,0,0,0,0), #B's neighbors
                c(1,1,0,1,0,0,0), #C's neighbors
                c(0,0,1,0,2,1,0), #D's neighbors
                c(0,0,0,2,0,2,1), #E's neighbors
                c(0,0,0,1,2,0,1), #F's neighbors
                c(0,0,0,0,1,1,0)  #G's neighbors
                )
rownames(adj_mat) = names(G)
colnames(adj_mat) = names(G)
adjacency_matrix = list(adj_mat)
IA = mle.kraftMcMillian(G, 2)
# Power to find effects is
sum(2^-unlist(IA))
}
