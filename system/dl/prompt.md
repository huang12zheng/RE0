1. Define a task
   输入形式,任务要求,模型输出
2. Obtain a PLM
3. Define a Templat
4. Define a Verbalizer(Optional)
5. Construct a PromptModel
6. Define a DataLoader
7. Train and inference

---
1. Classification: Start Text Extract
2. Entailment: Start Premise Delim Hypothesis Extract
3. Similarity:
   Strat Text1 Delim Text2 Extract
   Strat Text2 Delim Text1 Extract
4. Multiple Choice:
   Start Context Delim Answer1 Extract
   Start Context Delim Answer2 Extract
   Start Context Delim Answer3 Extract
---
* Sentiment:
  I hove this movic
  X the movie is Z  (great,fantatic)
* Topics:
  He prompted the LM
  X The text is about Z (sports,science)
* Itention:
  X The question is about Z
* Aspect Sentiment:
  X What about service Z   (Bad,Terrible)
* NLI:
  X1 ? Z,X2  (yes,no)
* NER:
  X1 X2 is a Z entity  (organizaion,location)
* Summarization
  X TL;DR: Z
* Translation
  French: X English: Z
---
{"meta": "sentence"}. It is {"mask"}.
A {"mask"} news : {"meta": "title"} {"meta": "description"}
{"meta": "sentence"} {"text": "In this sentence,"} {"meta": "entity"} {"text": "is a"} {"mask"},

{"meta": "sentence"}. In this sentence, {"meta": "entity"} is a {"mask"},
---