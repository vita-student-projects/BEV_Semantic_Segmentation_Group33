module load gcc/9.3.0 python/3.7.7
python -m venv --system-site-packages DLAV6
source DLAV6/bin/activate

pip install --upgrade pip
pip install jupyter ipyparallel

ipcluster start --init --profile=default --ip="*" -n=4 --engines=Slurm --SlurmEngineSetLauncher.timelimit=01:00:00 --SlurmEngineSetLauncher.queue=debug --SlurmEngineSetLauncher.account=myaccount &