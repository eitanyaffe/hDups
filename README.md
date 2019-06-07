# hDups

Remove read duplicates from pair ended fastq files and computes the multiplicity table.

## Installation

1. Clone repository:
```
git clone https://github.com/eitanyaffe/hDups.git
```

2. Build binary
```
cd hDups
make all
```

3. Run on small example
```
make test
```

3. Plot example
```
make test_plot
```

## Syntax

```
usage: ./bin/hDups [options]
 -ifn1 <fn>: input fasta read1 file, can have more than one
 -ifn2 <fn>: input fasta read2 file
 -ofn1 <fn>: output fasta read1
 -ofn2 <fn>: output fasta read2
 -mfn <fn>: multiplexcity output table
 -sfn <fn>: stats output table
example: ./bin/hDups -ifn1 A_R1.fastq -ifn2 A_R2.fastq -ifn1 B_R1.fastq -ifn2 B_R2.fastq -ofn1 O_R1.fastq -ofn2 O_R2.fastq -mfn multi.txt -sfn summary.txt
```