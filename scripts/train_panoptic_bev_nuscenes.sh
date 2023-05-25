module load gcc/8.4.0-cuda python/3.7.7 cuda/11.1.1
source ../../venv/panoptic_bev/bin/activate

CUDA_VISIBLE_DEVICES=0,1 \
../../venv/panoptic_bev/bin/python -m torch.distributed.launch --nproc_per_node=2 --master_addr=172.19.19.51 --master_port=37599 train_panoptic_bev.py \
                                    --run_name=run1 \
                                    --project_root_dir=/home/laubo/DLAV/PanopticBEV \
                                    --seam_root_dir=/home/laubo/DLAV/nuscenes/nuScenes_panopticbev\
                                    --dataset_root_dir=/work/scitas-share/datasets/Vita/civil-459/NuScenes_full/US \
                                    --mode=train \
                                    --train_dataset=nuScenes \
                                    --val_dataset=nuScenes \
                                    --config=nuscenes.ini