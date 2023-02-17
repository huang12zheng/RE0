## 流程
1. 数据
2. 模型(网络,块)
3. 训练(算力)
4. 微调

## tricks
1. Dropout: 随机“丢弃”计算
2. arxiv-init
3. batch normalization 批处理(隐式的负样本)
4. Transfer learning. finetune
5. 数据增强
6. ResNet
7. NiN,1*1卷积
8. Early stopping
9. 学习率调度
10. 集成学习
11. multi-crop
12. 分治,互信息不多不少最好
13. 分治之后MLP
14. 动量编码
15. 学习联系self-attention
16. prior,生成后判别(Diffusion Models),实现多样性

## 架构
MLP、CNN、RNN,Attention,VAE,GAN
MLP-Mixer

## 网络
* 单网络(ResNet,ViT分治)
* 多网络(集成学习,对比学习,GoogleNet)

## 重点
更大的训练数据集
更好的网络
更好的模型,或更合适的模型
> 数据的质量
> loss的互补


### 比较
```
BERT VS MAE :mask 完型填空的重要性
ViT VS Self-Attention: 学习部分间的关系
MoCoV1 做了什么: 对比学习问题变为字典问题(负样本),提出了动量编码,和队列

SimCLRv1提出了project,图片进入,编码器编码,project降维,算个loss.
> project 就是一个MLP-LR层
> SimCLRv1提出了多种图片数据增强方案.(Color+裁剪最早有较)


对比学习的技术:
1. 动量编码器,队列,字典问题(MoCo)
2. 图片数据增强(Color+裁剪),project 就是一个MLP-LR层(SimCLRv1)
3. 特征和聚类比(SWaV)
4. 使用ViT
```
> ChatGPT补充:
> 1. 硬负挖掘:这是一种技术，您可以找到模型难以区分的负示例和正示例，并在这些示例上进行训练，以提高模型的辨别能力。
> 2. 归一化:该技术涉及将特征嵌入归一化，使之具有单元范数。这可以通过使嵌入更具鉴别性来提高模型的性能。
> 3. 多作物和多视图训练:该技术涉及在同一图像的多个作物或视图上训练模型。这可以通过将模型暴露在图像的不同部分来提高模型的性能。
> 4. 课程学习:这是一种随着时间的推移逐渐增加训练示例难度的技巧。这可以通过帮助模型学习更复杂的表示来提高模型的性能。
> 5. 自监督预训练:这是一种使用自监督学习在大型数据集上训练模型的技术，然后在较小的标记数据集上对模型进行微调。这可以通过允许模型从大型数据集中学习有用的表示来提高模型的性能。

生成技术:
1. GAN: Z->G->X->D
2. AE: X->E->Z->D->X'
3. VAE: X->E->分布->Z->D->X'
4. VQVAE: X->E(->f->聚类)->Z(f_a)->D->X'
5. DM: Xt-X_(t-1)的ResNet
> DALL.E2, 依据CLIP生成文字的特征,然后生成图片与CLIP的图特征判别. prior+层级式生成(64-256-...)

多模态:
```
1. 文字+图片+transformer
2. VSE,CLIP,ViLBERT,ViLT
    ViLBERT=OD+WPA+MLM+ITM
    CLIP=Big ViT(VE=TE>MI)
    ViLT = MI>VE=TE
    ViLT -- MLM,ITM,WPA
    > WPA Word Patch Alignment(文本单词与图片的关系).但因为目标检测没有了,WPA就慢
```
> 模态交互是更重要的, 
> 
> ITM loss：Image Text Matching
> MLM loss：BERT用的完形填空
> 这个ITC loss 生成硬负样本
> 动量蒸馏
> OD(目标检检)太费时了
1. BLIP, Bootstrapping Language-Image Pre-training for Vi...
   > 解码器输出的 caption很好
2. CoCa, 去掉了 ITM loss来更快
3. BEiTV3 https://arxiv.org/pdf/2208.10442.pdf
> Backbone Network: Multiway Transformers
>   or VLMO提出的MOME
> Pretraining Task: Masked Data Modeling
> Scaling Up: BEIT-3 Pretraining
>
> dual encoder -- retrieval
> 双编码器--检索
>
> Encoder-Decoder,可以输入图像也可以是文字,但做什么,由文本的prompt决定的.
> 输入文字,文字说VQT,生成一个答案
> 输入图,文字说做分类,生成一个标签(语义的词)
