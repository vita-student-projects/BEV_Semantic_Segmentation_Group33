module load gcc/8.4.0-cuda python/3.7.7 cuda/11.1.1

CUDA_VISIBLE_DEVICES=0\
python3 -m torch.distributed.launch --nproc_per_node=1 --master_addr={IP ADDR} --master_port={PORT NUM} eval_panoptic_bev.py \
                                    --run_name={NAME OF THE RUN} \
                                    --project_root_dir={PATH OF THE TOP panoptic_bev FOLDER} \
                                    --seam_root_dir={PATH OF THE NUSCENES SEAMLESS DATASET} \
                                    --dataset_root_dir={PATH OF THE NUSCENES DATASET} \
                                    --mode=test \
                                    --test_dataset=nuScenes \
                                    --resume={PATH OF THE SAVED PTH MODEL TO USE FOR INFERENCE} \
                                    --config=nuscenes.ini \
