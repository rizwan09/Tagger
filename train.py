import os

PYTHONPATH='/home/rizwan/SBCR/Tagger'

TRAIN_PATH='/home/rizwan/SBCR/data/deep_srl/conll05/deep_srl'
MODEL_DIR='train'
MODEL_NAME='deepatt'
EMB_PATH='/home/rizwan/.allennlp/cache/glove_100d.txt.gz'

# run_command = 'PYTHONPATH='+PYTHONPATH+' python ./main.py train '
run_command = 'python ./main.py train '
run_command += ' --data_path ' + TRAIN_PATH + ' --model_dir ' + MODEL_DIR + ' --model_name ' +  MODEL_NAME
run_command += ' --vocab_path word_dict label_dict --emb_path '+  EMB_PATH
run_command += ' --model_params feature_size=100,hidden_size=200,filter_size=800,residual_dropout=0.2,' 
run_command += 'num_hidden_layers=10,attention_dropout=0.1,relu_dropout=0.1'
run_command += ' --training_params batch_size=4096,eval_batch_size=1024,optimizer=Adadelta,initializer=orthogonal,'
run_command += 'use_global_initializer=false,initializer_gain=1.0,train_steps=600000,'
run_command += 'learning_rate_decay=piecewise_constant,learning_rate_values=[1.0,0.5,0.25],'
run_command += 'learning_rate_boundaries=[400000,500000],device_list=[0,1,2,3,4],clip_grad_norm=1.0'
run_command += ' --validation_params script=run.sh'
print(run_command)
os.system(run_command)


#for sh file
'''
python tagger/main.py train \
    --data_path /home/rizwan/SBCR/data/deep_srl/conll05/deep_srl --model_dir train --model_name deepatt \
    --vocab_path word_dict label_dict --emb_path /home/rizwan/.allennlp/cache/glove_100d.txt.gz \
    --model_params=feature_size=100,hidden_size=200,filter_size=800,residual_dropout=0.2, \
                   num_hidden_layers=10,attention_dropout=0.1,relu_dropout=0.1 \
    --training_params=batch_size=4096,eval_batch_size=1024,optimizer=Adadelta,initializer=orthogonal, \
                      use_global_initializer=false,initializer_gain=1.0,train_steps=600000, \
                      learning_rate_decay=piecewise_constant,learning_rate_values=[1.0,0.5,0.25], \
                      learning_rate_boundaries=[400000,500000],device_list=[0],clip_grad_norm=1.0 \
    --validation_params=script=run.sh
'''

