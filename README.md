# Bird's-Eye-View Panoptic Segmentation Using Monocular Frontal View Images

This is the repository for group 33 in the course Deep Learning for Autonomous Vehicles (CIVIL-459) at EPFL, spring 2023.

The repository is forked and modified from https://github.com/robot-learning-freiburg/PanopticBEV.


## Setup on SCITAS
1. Connect to izar server
```shell
ssh -X username@izar.epfl.ch
```

2. Create new folder
```shell
mkdir DLAV
cd DLAV
```

3. Setup environment
```shell
module load gcc/8.4.0-cuda python/3.7.7 cuda/11.1.1
python3 -m venv venv/panoptic_bev
source venv/panoptic_bev/bin/activate
```

4. Install dependecies
```shell
python -m pip install torch==1.8.1+cu111 -f https://download.pytorch.org/whl/cu111/torch_stable.html --no-cache-dir
python -m pip install torchvision==0.9.1+cu111 -f https://download.pytorch.org/whl/cu111/torch_stable.html --no-cache-dir
```

5. Double check
```shell
python --version
nvcc --version
python -c "import torch; print(torch.__version__)"
which python
```

Should give respectively 3.7.7, 11.1, 1.8.1+cu111, and lastly point to python environment.

6. More dependencies
```shell
python -m pip install -r requirements.txt --no-cache-dir
```

7. inplace_abn package needs to be install while connected to a gpu (ex. in Sinteract):
```shell
Sinteract -g gpu:1 -p gpu -c 1 -m 10G -t 00:90:00
python -m pip install git+https://github.com/mapillary/inplace_abn.git --no-cache-dir
```

8. Clone this repository
```shell
git clone https://github.com/SamiLaubo/PanopticBEV.git
```

9. Run setup
```shell
cd PanopticBEV
python setup.py develop
```
