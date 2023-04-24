# NeSI-Project-Template

[NeSI](https://www.nesi.org.nz/) HPC project Scaffolding Template. This project aims to fasciliate the process of deep learning project deployment.

[NeSI's documentation](https://support.nesi.org.nz/hc/en-gb/articles/360000684396-Submitting-your-first-job) is quite comprehensive. but this template seeks the use of `python venvs` in order to have better dependency management, environment isolation and code reproducibility.


## How to (RUN)?

1. Login into any of `Māui` or `Mahuika` based on your project resource allocation.

    > you can do:
        `ssh -J ACC_ID@lander.nesi.org.nz ACC_ID@login.mahuika.nesi.org.nz` for mahuika.
        `ssh -J ACC_ID@lander.nesi.org.nz ACC_ID@login.Maui.nesi.org.nz` for Māui.

2. `git clone https://github.com/alifzl/NeSI-Project-Template && cd NeSI-Project-Template` 
3.  deploy your code in `main.py`. do not delete the `if __name__ == "__main__":` statement.

4. modify the python version and add desired dependencies in `environment.yml`.
5. enter your NeSI account ID in `.env`. mind the double qoutes.
6. modify the first 10 lines of `project_name.sl` with your specifications like project ID, resources, etc.
7. rename the `project_name.sl` slurm file to your desired.

8. Prepare the Environment by doing:
    1. `module --force purge && module load NeSI Miniconda3`
    2. `source $(conda info --base)/etc/profile.d/conda.sh`
    3. `conda env create -f environment.yml -p ./venv`
    
    this will create a `venv` folder in the project directory.

9. `sbatch project_name.sl`
10. check the status by `make my`.


## How to (MONITOR)?

after a successfull submission of task, you can use `make my` command in order to check the current status of your tasks.


## How to (RE-BUILD)?

if you want to make a change in source code, dependencies, etc. you will be need to do as below:

1. cancel currently unwanted running tasks, if any, by:

    `make cancel_all`
2. `make clean` deletes any existing venv folder
3. `module --force purge && module load NeSI Miniconda3`
4. `source $(conda info --base)/etc/profile.d/conda.sh`
5. `conda env create -f environment.yml -p ./venv`
6. `sbatch project_name.sl`

## Acknowledgements

This repo is highly inspired by [NeSI's templating example](https://github.com/nesi/ddp_example).
