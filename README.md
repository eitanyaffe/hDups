# hDups

Remove read duplicates from pair ended fastq files and computes the multiplicity table.

## Installation

1. Clone repository.
```
git clone https://github.com/eitanyaffe/hDups.git
```

2. Build binary.
```
cd hDups
make all
```

3. Run on small example.
```
make test
```

3. Plot example.
```
make test_plot
```

## Syntax

### Running hDups

```
usage: ./bin/hDups [options]
 -ifn1 <fn>: input fasta read1 file, can have more than one
 -ifn2 <fn>: input fasta read2 file
 -ofn1 <fn>: output fasta read1
 -ofn2 <fn>: output fasta read2
 -mfn <fn>: multiplexcity output table
 -sfn <fn>: stats output table
```

For example:
```
./bin/hDups \
		-ifn1 example/R1.fastq -ifn2 example/R2.fastq \
		-ofn1 output/unique_R1.fastq -ofn2 output/unique_R2.fastq \
		-mfn output/multiplicity.txt -sfn output/summary.txt
```

### Plotting

```
usage: Rscript R/R_call.r R/plot_dup.r plot.dup.f ifn=<filename> odir=<plot directory>
ifn: multiplicity table
odir: output directory
```

For example:
```
Rscript R/R_call.r R/plot_dup.r plot.dup.f ifn=output/multiplicity.txt odir=output/figures
```