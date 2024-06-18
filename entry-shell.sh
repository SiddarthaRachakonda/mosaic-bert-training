# Installign requirements
pip install -r requirements.txt

# WANDB Login
export WANDB_KEY=777e13e6bfaa395c8748c8d3ff505085ae47f162

# Downloading small set of data for evaluation
python src/convert_dataset.py --dataset allenai/c4 --data_subset en --out_root ./my-copy-c4 --splits train_small val

# Converting to streaming data
python src/text_data.py --local_path ./my-copy-c4 --tokenizer bert-base-uncased

# Testing the pre-training
composer main.py yamls/test/main.yaml
