library(Biostrings)

sequence <- readDNAStringSet("rosalind_gc.txt",format = "fasta")

length_seq <- c(width(sequence))
num_G <- letterFrequency(sequence,letters = "G")
num_C <- letterFrequency(sequence,letter = "C")
total_gc <- num_C+num_G
percent_gc <- (total_gc/length_seq)*100
names(percent_gc) <- names(sequence)

for (i in 1:length(percent_gc)) {
  if (percent_gc[i]==max(percent_gc)) {
    print(names(percent_gc[i]))
    print(max(percent_gc))
    }
}
