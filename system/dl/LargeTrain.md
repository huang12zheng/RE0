第一步,计算显存都去了哪里
第二步,计算模式是怎么样的,显卡之间的如何合作

1. 模型的参数放在显卡
2. 反向传播时的梯度,同样需要保存(和模型的参数量是一个数量级的),(可能取决于优化器)
3. 中间计算结果

1. 数据分成n份,减小batch
> 梯度要进行一个取平均
> 每张显卡上至少得是一中间结果
2. 模型并行
a. 参数,梯度和参数优化器,中间结果,拆分到多张的计算显卡
b. (多个小的矩阵乘法的拼接)
c. (那么,一部分的这个模型参数)
> 它对模型的中间结果没有进行有效的划分
3. 梯度的显存释放提前到取平均后
(在计算第i层的反向传播之前,我们就可以把提前的把第2+1层的梯度,进行一个reduce scatter)
(前向传播的过程中,计算di+1,di层已经没用了)

(前向传播,各张显卡得到第i层的完整参数,计算di+1,di短期内已经就不用了)
(反向传播的计算,再一次的临时的把这个d i层,拼接)
(时间换取空间)
(hidden state通过显卡之间传输)(即流水的并行)
(那么参数优化器和中间结果,都得到了划分)
(注意,这里是模型层数不是多少部分)
---

double变为 scale*(a+b)[因为小数精度不足和整数范围是可以的]
(并且,参数保存在内存中)
(通过多个CPU进行参数的更新)
---
通信计算重叠,即提前拼接di+1层

check pointing