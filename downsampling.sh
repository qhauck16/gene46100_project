#!/bin/bash

# Count number of columns
num_cols=$(head -n1 input.tsv | awk -F'\t' '{print NF}')

# Determine how many to keep (1/10 of total)
keep_cols=$(echo "$num_cols / 10" | bc)

# Generate random column indices
cols=$(seq 1 "$num_cols" | shuf -n "$keep_cols" | sort -n | paste -sd, -)

# Use cut to extract those columns
cut -f"$cols" $1 > $2

