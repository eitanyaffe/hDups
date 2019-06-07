bin/hDups:
	mkdir -p bin
	g++ cpp/remove_duplicates.cpp -O2 -o $@ -Wall -Wno-write-strings -std=c++0x

all: bin/hDups
	@echo "binary created: bin/hDups"

############################################################
# test
############################################################

# run on small example
test:
	mkdir -p output
	./bin/hDups \
		-ifn1 example/R1.fastq -ifn2 example/R2.fastq \
		-ofn1 output/unique_R1.fastq -ofn2 output/unique_R2.fastq \
		-mfn output/multiplicity.txt -sfn output/summary.txt


test_plot:
	./R/R_call.r R/plot_dup.r plot.dup.f \
		ifn=$(CURDIR)/output/multiplicity.txt \
		odir=$(CURDIR)/output/figures
