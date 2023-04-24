#!make
include .env
export $(shell sed 's/=.*//' .env)


init:
	@read -p "what is your NeSI account ID? : " ID \
  	&& echo "your account: : $${ID}"


clean:
	rm -rf slurm*.out && rm -rf venv/


build:
	module --force purge && module load NeSI Miniconda3 && \
	source $(conda info --base)/etc/profile.d/conda.sh && \
	conda env create -f environment.yml -p ./venv

my:
	sacct -u $(ID)


cancel_all:
	scancel -u $(ID)


queue:
	squeue -u $(ID)


info:
	nn_seff $(JOBID)
