#!/bin/bash

# gunzip ../data/gencode.v41.basic.annotation.gff3.gz

mkdir -p terminal_task/results

awk -F'\t' 'BEGIN{OFS="\t"} $3 == "gene" && $9 ~ /(^|;)gene_type=unprocessed_pseudogene(;|$)/ {print $1, $4, $5, $7, $9}' ../data/gencode.v41.basic.annotation.gff3 \
  | sed 's/[^\t]*gene_name=\([^;]*\).*$/\1/' \
  | awk -F'\t' 'BEGIN{OFS="\t"} {
      if ($4 == "+") {
        $3 = $2 + 1
      } else {
        $2 = $3
        $3 = $3 + 1
      }
      print
    }' > terminal_task/results/result.tsv
