prob <- read.table("rosalind_iprb.txt")

k <- as.numeric(prob[1])
m <- as.numeric(prob[2])
n <- as.numeric(prob[3])

total <- sum(as.numeric(prob))

prob_homoA <- (k/total)     #prob of homozygous first mate
prob_heteroA <- (m/total)   #prob of heterozygous first mate  
prob_recA <- (n/total)      #prob of homo recessive first mate

probA <- c(prob_homoA, prob_heteroA, prob_recA) # vector with probability of dom phenotype for 3 options

prob_heteroB1 <- ((m)/(total-1))              #prob of homozyougs second mate
prob_heteroB2 <- (((m-1)/(total-1))*(3/4))      #prob of heterozygous second mate
prob_heteroB3 <- (((m)/(total-1))*(2/4))      #prob of homo recessive second mate
prob_hetero <- c(prob_heteroB1, prob_heteroB2, prob_heteroB3) # vector for probabilites of dom phenotype after first mate hetero

prob_recB1 <- ((n)/(total-1))   #prob of homo second mate dom phenotype
prob_recB2 <- (((n)/(total-1))*(2/4))  #prob of hetero second mate dom phenotype
prob_recB3 <- 0
prob_rec <- c(prob_recB1,prob_recB2,prob_recB3)

prob_homoB1 <- ((k-1)/(total-1))
prob_homoB2 <- (k/(total-1))
prob_homoB3 <- (k/(total-1))
prob_homo <- c(prob_homoB1, prob_homoB2, prob_homoB3)


probB <- matrix(data = c(prob_homo, prob_hetero, prob_rec), nrow =3 , ncol =3 )

final_prob <- probA%*%probB

sum(final_prob)
