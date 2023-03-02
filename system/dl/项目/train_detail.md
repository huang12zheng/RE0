* 问答系统
a. 最开始已知信息极少,但需要明确基本的需求:
1. 输入问题及上下文,得到答案
2. 输入问题,得到答案
3. 能得到推理的过程
4. 根据上下文,提出问题
5. 通过ffi,直接在设备上运行,节约服务器成本.

b. 列举已知的信息:
1. 使用PLM, 最好是可以delta-finetune,来进行任务复用.
2. 市面上已经有的模型有哪些?
3. 我为什么要选择这个模型?
4. 如何减枝,蒸馏?
5. rust有rustbert,rust-tch,tokenizers可用

c. 传统IR问题及目标方案:
传统IR模型复杂,泛用性不好.
目标方案使用Retrieval+Re-ranking方案:
   1. 预先生成QC的token
   2. 使用KNN,具体是FAISS.
   3. Dual-Encoder后,拼接句子,Cross-Encoder分类.(Cross-Encoder训练时需要使用1-负样本+正样本)
   4. 使用BMCook工具,对模型进行"量化","减枝","蒸馏"
   模型量化(理论使用1/4存储空间)
   模型剪枝(理论剪枝50%参数)
   >BMCook 支持所有主流的预训练语言模型的加速方法
   5. OpenPromp+OpenDelta减少人力成本和工程难度