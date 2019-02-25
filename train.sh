TRAIN_PATH='/home/rizwan/SBCR/data/deep_srl/conll05/deep_srl/'
MODEL_DIR='train'
MODEL_NAME='deepatt'
EMB_PATH='/home/rizwan/.allennlp/cache/glove.6B.100d.txt'
WORD_DICT_PATH="/home/rizwan/SBCR/data/deep_srl/conll05/deep_srl/word_dict"
LABEL_DICT_PATH="/home/rizwan/SBCR/data/deep_srl/conll05/deep_srl/label_dict"

python ./main.py train \
    --data_path $TRAIN_PATH --model_dir $MODEL_DIR --model_name $MODEL_NAME \
    --vocab_path $WORD_DICT_PATH $LABEL_DICT_PATH --emb_path $EMB_PATH \
    --model_params="feature_size=100,hidden_size=200,filter_size=800,residual_dropout=0.2,num_hidden_layers=10,attention_dropout=0.1,relu_dropout=0.1" \
    --training_params="batch_size=4096,eval_batch_size=1024,optimizer=Adadelta,initializer=orthogonal,use_global_initializer=false,initializer_gain=1.0,train_steps=600000,learning_rate_decay=piecewise_constant,learning_rate_values=[1.0,0.5,0.25],learning_rate_boundaries=[400000,500000],device_list=[0],clip_grad_norm=1.0" \
    --validation_params="script=run.sh"
