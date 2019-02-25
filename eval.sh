SRLPATH="/home/rizwan/SBCR/preprocess-conll05-master/srlconll-1.1"
TAGGERPATH="/home/rizwan/SBCR/Tagger"
DATAPATH="/home/rizwan/SBCR/data/deep_srl/conll05"

export PERL5LIB="$SRLPATH/lib:$PERL5LIB"
export PATH="$SRLPATH/bin:$PATH"

CONLL='conll05'
#DATA='.test.wsj'
DATA='devel'
#DATA='.test.brown'
MODEL_NAME='deepatt'
MODEL_DIR='train'
EMB_PATH='/home/rizwan/.allennlp/cache/glove.6B.100d.txt'


python $TAGGERPATH/main.py predict --data_path $DATAPATH/$CONLL.$DATA.txt \
  --model_dir $MODEL_DIR  --model_name $MODEL_NAME \
  --vocab_path $DATAPATH/deep_srl/word_dict $DATAPATH/deep_srl/label_dict \
  --device_list 6 \
  --decoding_params="decode_batch_size=512" \
  --model_params="num_hidden_layers=10,feature_size=100,hidden_size=200,filter_size=800" \
  --emb_path $EMB_PATH

#python $TAGGERPATH/scripts/convert_to_conll.py $CONLL.$DATA.txt.$MODEL_NAME.decodes $DATAPATH/$CONLL.$DATA.props.gold.txt output
#perl $SRLPATH/bin/srl-eval.pl $DATAPATH/$CONLL.$DATA.props.* output
