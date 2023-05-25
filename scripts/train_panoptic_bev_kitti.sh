module load gcc/8.4.0-cuda python/3.7.7 cuda/11.1.1
CUDA_VISIBLE_DEVICES=0 \
python3 -m torch.distributed.launch --nproc_per_node={NUM GPUs} --master_addr={IP ADDR} --master_port={PORT NUM} train_panoptic_bev.py \
                                    --run_name={NAME OF THE RUN} \
                                    --project_root_dir={PATH OF THE panoptic_bev FOLDER} \
                                    --seam_root_dir={PATH OF THE KITTI360 SEAMLESS DIRECTORY} \
                                    --dataset_root_dir={PATH OF THE KITTI360 DATASET} \
                                    --mode=train \
                                    --train_dataset=Kitti360 \
                                    --val_dataset=Kitti360 \
                                    --config=kitti.ini
