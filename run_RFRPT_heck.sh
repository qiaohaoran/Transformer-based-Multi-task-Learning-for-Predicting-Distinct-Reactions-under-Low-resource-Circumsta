mkdir -p checkpoints
fairseq-train data \
    --max-epoch 1500 \
    --task multilingual_translation --lang-pairs heck_src-heck_tgt,heck_tgt-heck_src \ #RFRPT just swap tgt and src
    --arch multilingual_transformer_iwslt_de_en \
    --validate-after-updates '6000'\
    --report-accuracy \
    --batch-size-valid 1 \
    --validate-interval 15 \
    --best-checkpoint-metric sentence_accuracy \
    --maximize-best-checkpoint-metric \
    --optimizer adam --adam-betas '(0.9, 0.997)' \
    --lr 0.001 --lr-scheduler inverse_sqrt \
    --warmup-updates 16000 --warmup-init-lr '1e-07' \
    --criterion label_smoothed_cross_entropy \
    --dropout 0.3\
    --save-dir checkpoints/RFRPT_heck \
    --max-tokens 6144 \
    --fp16 \
    --keep-last-epochs 2 \
    --tensorboard-logdir tf_logs
