# Exercise 1: Taxonomic Classification of Oxford Nanopore 16S Data Using Emu

## Objective

The objective of this exercise was to install and configure the Emu taxonomic classification pipeline and use it to analyze Oxford Nanopore Technologies (ONT) 16S rDNA sequencing data. The goal was to estimate the relative abundance of bacterial species present in the sample and gain familiarity with taxonomic profiling workflows used in microbial genomics and diagnostic microbiology.

---

## Environment Setup

To ensure a reproducible analysis environment, I used Pixi as the package manager and Bioconda as the source for bioinformatics software.

### Tools Installed

* Pixi
* Emu
* OSF Client

### Database Setup

The pre-built Emu reference database was downloaded from the Open Science Framework (OSF) repository and extracted locally. This database contains the taxonomy and reference sequences required for taxonomic classification.

---

## Data

The exercise used Oxford Nanopore 16S sequencing data provided as part of the training materials.

### Input File

```text
sample01.fq.gz
```

This FASTQ file contains long-read 16S rDNA sequences generated using Oxford Nanopore sequencing technology.

---

## Analysis

The Emu abundance estimation workflow was executed using the following command:

```bash
emu abundance \
  --db emudb \
  --type map-ont \
  --output-dir results/emuout \
  --threads 2 \
  --keep-files \
  --keep-counts \
  --keep-read-assignments \
  data/emu_data/sample01.fq.gz
```

### Key Parameters

| Parameter                 | Description                                                 |
| ------------------------- | ----------------------------------------------------------- |
| `--db`                    | Path to the Emu reference database                          |
| `--type map-ont`          | Uses alignment settings optimized for Oxford Nanopore reads |
| `--output-dir`            | Directory for generated results                             |
| `--threads 2`             | Number of CPU threads used                                  |
| `--keep-files`            | Retains intermediate files                                  |
| `--keep-counts`           | Reports estimated read counts                               |
| `--keep-read-assignments` | Saves read-level taxonomic assignments                      |

---

## Results

The analysis generated three primary output files:

```text
sample01.fq_rel-abundance.tsv
sample01.fq_emu_alignments.sam
sample01.fq_read-assignment-distributions.tsv
```

The relative abundance table revealed a diverse microbial community containing multiple bacterial taxa.

### Most Abundant Species Identified

| Species                       | Relative Abundance |
| ----------------------------- | ------------------ |
| Bacillus subtilis             | 16.3%              |
| Staphylococcus aureus         | 13.3%              |
| Listeria monocytogenes        | 13.0%              |
| Limosilactobacillus fermentum | 11.1%              |
| Enterococcus faecalis         | 10.8%              |
| Bifidobacterium adolescentis  | 6.7%               |
| Escherichia coli              | 5.1%               |
| Salmonella enterica           | 4.4%               |

One notable finding was the detection of **Salmonella enterica**, which was selected for further investigation and validation in the next exercise.

---

## Key Learning Points

Through this exercise, I learned how to:

* Install and configure bioinformatics software using Pixi and Bioconda.
* Download and manage reference databases required for taxonomic classification.
* Perform taxonomic profiling of Oxford Nanopore 16S sequencing data using Emu.
* Interpret microbial abundance tables and taxonomic assignments.
* Identify potentially important organisms for downstream validation.
* Understand the importance of independent verification of taxonomic classifications using complementary approaches such as BLAST.

The results generated in this exercise provide the foundation for subsequent validation and troubleshooting analyses.
