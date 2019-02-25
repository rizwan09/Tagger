SRLPATH="/home/rizwan/SBCR/preprocess-conll05-master/srlconll-1.1"
TAGGERPATH="/home/rizwan/SBCR/Tagger/"
DATAPATH="/home/rizwan/SBCR/data/deep_srl/conll05"

export PERL5LIB="$SRLPATH/lib:$PERL5LIB"
export PATH="$SRLPATH/bin:$PATH"

python $TAGGERPATH/main.py predict --data_path $DATAPATH/conll05.devel.txt \
  --model_dir train  --model_name deepatt \
  --vocab_path $DATAPATH/deep_srl/word_dict $DATAPATH/deep_srl/label_dict \
  --device_list 6 \
  --decoding_params="decode_batch_size=512" \
  --model_params="num_hidden_layers=10,feature_size=100,hidden_size=200,filter_size=800"
python $TAGGERPATH/scripts/convert_to_conll.py conll05.devel.txt.deepatt.decodes $DATAPATH/conll05.devel.props.gold.txt output
perl $SRLPATH/bin/srl-eval.pl $DATAPATH/conll05.devel.props.* output
