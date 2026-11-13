#!/bin/bash
#combining FASTA files into a single working directory
#adding outlet name to each other

mkdir -p data/processed
> data/processed/combined.fasta

for dir in data/raw/outlet_*/; do
  outlet=$(basename "$dir") #find outlet name
  for fasta in "$dir"*.fasta; do
    sed "s/^>/>${outlet}_/" "$fasta" >> data/processed/combined.fasta  
    done

done

echo "Sequences in combined.fasta:"
grep -c ">" data/processed/combined.fasta
