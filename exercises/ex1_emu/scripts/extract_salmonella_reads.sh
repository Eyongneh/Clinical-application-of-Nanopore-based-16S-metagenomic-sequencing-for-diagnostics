#!/usr/bin/env bash

set -euo pipefail

SAM_FILE="results/emuout/sample01.fq_emu_alignments.sam"
OUT_DIR="results/read_extraction"

mkdir -p "$OUT_DIR"

samtools view "$SAM_FILE" \
  | cut -f3 \
  | cut -d: -f1 \
  | sort \
  | uniq -c \
  | sort -nr \
  > "$OUT_DIR/taxid_counts.tsv"

samtools view -e "mapq > 0" "$SAM_FILE" \
  | awk -F"\t" '$3 ~ "28901:emu_db.*"' \
  | cut -f 1,10 \
  | seqkit tab2fx > "$OUT_DIR/salmonella_enterica.fa"

samtools view -e "mapq > 0" "$SAM_FILE" \
  | awk -F"\t" '$3 ~ "28901:emu_db.*"' \
  | cut -f 1,10,11 \
  | seqkit tab2fx > "$OUT_DIR/salmonella_enterica.fq"