### Main Analysis: LDA Analysis with Gibbs Sampling ###

K = 34
G <- 10000   # Default value of Iteration = 2000
alpha <- 1.5

#m = LDA(dtm, method = "Gibbs", k = K,  control = list(iter=G, alpha = alpha))
m = LDA(dtm, method = "Gibbs", k = K,  control = list(iter=G, alpha = alpha), mc.cores = 8)
m = LDA(dtm, method = "Gibbs", k = K,  control = list(iter=G), mc.cores = 8)
m = LDA(dtm, method = "Gibbs", k = K,  control = list(alpha=alpha, 
                                                      estimate.beta=TRUE, 
                                                      verbose=0, 
                                                      prefix=tempfile(), 
                                                      save=0, 
                                                      keep=0, 
                                                      seed=as.integer(Sys.time()), 
                                                      nstart=1, 
                                                      best=TRUE, 
                                                      delta=0.1, 
                                                      iter=G, 
                                                      burnin=0, 
                                                      thin=2000),
        mc.cores=8)

# m = LDA(dtm, method = "Gibbs", k = K,  control = list(alpha=50/K, 
#                                                       estimate.beta=TRUE, 
#                                                       verbose=0, 
#                                                       prefix=tempfile(), 
#                                                       save=0, 
#                                                       keep=0, 
#                                                       seed=as.integer(Sys.time()), 
#                                                       nstart=1, 
#                                                       best=TRUE, 
#                                                       delta=0.1, 
#                                                       iter=2000, 
#                                                       burnin=0, 
#                                                       thin=2000),
#         mc.cores=8)

### Model Save

m_n1321_k34_R01s <- m
# m <- m_n1321_k34_R1s


##############################################################################
### LDA Visualization ###


library(LDAvis)

dtm = dtm[slam::row_sums(dtm) > 0, ]
phi = as.matrix(posterior(m)$terms)
### dentist code 
### phi <- posterior(m)$terms %>% as.matrix
theta <- as.matrix(posterior(m)$topics)
vocab <- colnames(phi)
doc.length = slam::row_sums(dtm) 
doc.length = slam::row_sums(dtm)
term.freq = slam::col_sums(dtm)[match(vocab, colnames(dtm))]

json = createJSON(phi = phi,
                  theta = theta,
                  vocab = vocab,
                  doc.length = doc.length,
                  term.frequency = term.freq)
serVis(json)

serVis(json, out.dir = '/Users/yhn_hac/Hanyang University/01-2. Study_Alone/R Data Analysis/LDA/Results_LDAvis/20210109/vis_n1321_k34_R01s', open.browser = FALSE)


#serVis(json, out.dir = 'vis', open.browser = FALSE)
#serVis(json, out.dir='LDAvis_20201229_k33_a1.5', open.browser=FALSE)
