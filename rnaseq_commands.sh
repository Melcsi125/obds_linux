 *Activate Conda environment 
Load mamba
fastqc --help

*Change into the folder /project/clab0482/linux/2_rnaseq/
cd /project/clab0482/linux/2_rnaseq/

*Run FASTQC
fastqc cd4_rep1_read2.fast.gz 
fastqc cd4_rep1_read1.fast.gz

*direct its output to 3_analysis/1_fastqc/
fastqc -o ../3_analysis/1_fas qc cd4_rep1_read._fast.gz
fastqc -o ../3_analysis/1_fastqc cd4_rep1_read2.fast.gz

*Examine output - download HTML files to web browser
Filezilla location in /nvme/project/clab0482

*Find and run MultiQC
mamba list 
multiqc /project/clab0482/linux/2_rnaseq/3_analysis/1_fastqc

*direct its output into 3_analysis/reports/
cd ..
mkdir reports
fastqc -o /project/blab0482/linux/2_rnaseq/3_analysis/reports/multiqc /project/clab0482/linux/2_rnaseq/3_analysis/1_fastqc -o. 
