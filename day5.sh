*Use SAMtools to generate mapping QC
*go to the right directory in the terminal 
cd /project/clab0482/linux/2_rnaseq/3_analysis
*open  slurm template
nano  Hislurm_template.sh
*Modidy and save it as modification with ctl O and save under Hislurm_template_BAM.sh
* Write the write commands - careful by pipe in the middle no file name, the first 2 isntructions together!
samtools view -b aln-pe.sam | samtools sort > sorted_aln-pe.bam
samtools index sorted_aln-pe.bam
samtools flagstat sorted_aln-pe.bam > sorted_aln-pe.flagstat
samtools idxstats sorted_aln-pe.bam > sorted_aln-pe.indxstats

* run the program 
sbatch Hislurm_template_BAM.sh

*check if you have all of the data in ?project/clab0482/linux/2_rnaseq/3_analasys with ls -a
* download  sorted_aln-pe.bm and sorted_aln-pe.bam.bai to computer OBDS folder through Filezilla (last long)

* multiqc of the whole folder of 3_analysis (all of the files will be multiqc
* go to a directory one level higher 2_rnaseq (multiqc has to be done in the 2_rnaseq from the directory 3_analysis)
cd ..
load_mamba
multiqc 3_analysis
*download html to to laptop OBDS folder

*Run featureCounts to generate a count matrix
• Read the manual to find the necessary parameters
• Remember this is stranded data it has to have -s 
• Submit as a job to the cluster it has to have - p  you can have it at any position 
The annotation was at a different directory under 2_genome as gtf.gz file 

short, 8G, ntasks 1, 30 min 

featureCounts -s 1 -t exon -g gene_id -p -a /project/clab0482/linux/2_rnaseq/2_genome/Mus_musculus.GRCm39.115.gtf.gz -o counts.txt sorted_aln-pe.bam

*Use MultiQC to visualise quantification QC
load_mamba
multiqc 3_analysis
*download html to to laptop OBDS folder

Visualise BAM file with IGV on your laptop
https://igv.org/app/
