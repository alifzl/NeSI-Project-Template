#!make
include .env
export $(shell sed 's/=.*//' .env)


init:
	@read -p "what is your NeSI account ID? : " ID \
  	&& echo "your account: : $${ID}"


clean:
	rm -rf slurm*.out && rm -rf venv/


my:
	sacct -u $(ID)


cancel_all:
	scancel -u $(ID)


queue:
	squeue -u $(ID)


info:
	nn_seff $(JOBID)
