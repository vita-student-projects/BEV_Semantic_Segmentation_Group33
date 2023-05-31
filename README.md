# Bird's-Eye-View Panoptic Segmentation Using Monocular Frontal View Images

This is the repository for group 33 in the course Deep Learning for Autonomous Vehicles (CIVIL-459) at EPFL, spring 2023. The task of this project is to assign semantic labels to every pixel of an aerial image viewed from a top-down view perspective (bird's eye view). The goal is to segment the image into different regions based on the objects or areas present in the scene, such as roads, vehicles, buildings etc.
 

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

3. Clone this repository
```shell
git clone https://github.com/SamiLaubo/PanopticBEV.git
```

4. Setup environment
```shell
module load gcc/8.4.0-cuda python/3.7.7 cuda/11.1.1
python3 -m venv venv/panoptic_bev
source venv/panoptic_bev/bin/activate
```

5. Install torch with CUDA
```shell
python -m pip install torch==1.8.1+cu111 -f https://download.pytorch.org/whl/cu111/torch_stable.html --no-cache-dir
python -m pip install torchvision==0.9.1+cu111 -f https://download.pytorch.org/whl/cu111/torch_stable.html --no-cache-dir
```

6. Double check
```shell
python --version
nvcc --version
python -c "import torch; print(torch.__version__)"
which python
```

Should give respectively 3.7.7, 11.1, 1.8.1+cu111, and lastly point to python environment.

7. More dependencies
```shell
cd PanopticBEV
python -m pip install -r requirements.txt --no-cache-dir
```

8. inplace_abn package needs to be install while connected to a gpu (ex. in Sinteract):
```shell
Sinteract -g gpu:1 -p gpu -c 1 -m 10G -t 00:90:00
python -m pip install git+https://github.com/mapillary/inplace_abn.git --no-cache-dir
```

9. Run setup
```shell
python setup.py develop
```

## Import dataset
For this project, we use two datasets, the nuscenes dataset and a modified version of it: nuscenes PanopticBEV. The first one consists of 1000 20 seconds long driving scenes collected in Boston and Sinagapore. The second one is a new dataset introduced in the paper that provides ground truths for the nuscenes dataset.
The nuscenes dataset is already in the shared directory on scitas.

1. Download NuScenes PanopticBEV dataset from http://panoptic-bev.cs.uni-freiburg.de/#dataset.
2. Make folder for data
```shell
cd .. (Back to DLAV)
mkdir nuscenes
```
4. Copy from loacal folder to server:
  - Open new cmd or exit ssh (make sure to be on local computer)
```shell
scp -r /path/to/nuscenes_panopticbev.zip username@izar.epfl.ch:/home/username/DLAV/nuscenes
```
  - Full path to file can on Windows be found by right-click -> properties
5. Unpack
```shell
cd nuscenes
unzip nuscenes_panopticbev.zip
```
## Results

|Dataset  | Method      | PQ    | SQ    | RQ    | PQ_th | SQ_th | RQ_th | PQ_st | SQ_st | RQ_st |
|---------|-------------|-------|-------|-------|-------|-------|-------|-------|-------|-------|
|nuscenes | PanopticBEV | 19.84 | 64.38 | 28.44 | 14.64 | 66.37 | 20.39 | 23.30 | 63.05 | 33.81 | 
|nuscenes | 96          | 10.18 | 48.35 | 15.61 | 1.83  | 30.63 | 3.01  | 15.75 | 60.17 | 24.01 |
|nuscenes | 64          | 10.09 | 55.06 | 15.38 | 1.69  | 46.44 | 2.81  | 15.69 | 60.81 | 23.75 |

|Dataset  | Method     |Road  |Side. |Build.|Wall  |Manm. | Veg. | Ter. | Occ. | Per. | 2-Wh.| Car  | Truck| mIoU |
|---------|------------|------|------|------|----- |------|----- |------|------|------|------|------|------|------|
|nuscenes | PanopticBEV| 75.50| 40.08| 28.68| 16.41|      | 40.91| 35.58| 48.29| 4.76 | 8.46 | 42.48| 15.30| 32.4 |
|nuscenes | 96         | 63.98| 15.95|      |      | 29.17| 27.65| 23.13| 28.09|  2.3 |  0.61|  22.8| 18.37|      |
|nuscenes | 64         | 67.11| 16.68|      |      | 28.57| 32.22| 19.17| 27.72| 2.69 |  0.09| 24.93|  22.4|      |
## Conclusion
