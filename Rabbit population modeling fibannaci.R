data <- read.table("rosalind_fib.txt")

n <- as.numeric(data[1])
k <- as.numeric(data[2])

rabbit_pair <- function(num_months, num_offspring){
  
  if (num_months == 1) {
    return(1)
  } else if (num_months == 2) {
    return(num_offspring)
  }
  
  one_gen <- rabbit_pair(num_months-1, num_offspring) 
  two_gen <- rabbit_pair(num_months-2, num_offspring)
  
  if(num_months<=4){
    return(one_gen+two_gen)
  } 
  return((two_gen*num_offspring)+one_gen)
}

write(rabbit_pair(n,k), file = "rosalind_fib_solution.txt")
