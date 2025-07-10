<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T07:10:34+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "zh"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.zh.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(点击上方图片观看本课视频)_

# Agentic RAG

本课全面介绍了Agentic Retrieval-Augmented Generation（Agentic RAG），这是一种新兴的AI范式，其中大型语言模型（LLM）能够自主规划下一步行动，同时从外部资源中提取信息。不同于静态的先检索后阅读模式，Agentic RAG涉及对LLM的迭代调用，穿插使用工具或函数调用并输出结构化结果。系统会评估结果，优化查询，必要时调用更多工具，并持续循环，直到获得满意的解决方案。

## 介绍

本课内容包括：

- **理解Agentic RAG：** 了解这一AI新兴范式，LLM自主规划下一步动作，同时从外部数据源获取信息。
- **掌握迭代的制造者-检查者模式：** 理解对LLM的迭代调用循环，穿插工具或函数调用与结构化输出，旨在提升正确性并处理格式错误的查询。
- **探索实际应用场景：** 识别Agentic RAG擅长的场景，如以正确性为先的环境、复杂数据库交互和延展工作流。

## 学习目标

完成本课后，你将能够/理解：

- **理解Agentic RAG：** 了解这一AI新兴范式，LLM自主规划下一步动作，同时从外部数据源获取信息。
- **迭代的制造者-检查者模式：** 掌握对LLM的迭代调用循环，穿插工具或函数调用与结构化输出，提升正确性并处理格式错误的查询。
- **掌控推理过程：** 理解系统自主掌控推理过程，能自主决策如何解决问题，而非依赖预定义路径。
- **工作流：** 理解一个agentic模型如何独立决定检索市场趋势报告、识别竞争对手数据、关联内部销售指标、综合分析并评估策略。
- **迭代循环、工具集成与记忆：** 了解系统依赖循环交互模式，跨步骤维护状态和记忆，避免重复循环并做出更明智的决策。
- **处理失败模式与自我纠正：** 探索系统强大的自我纠正机制，包括迭代重查、使用诊断工具以及依赖人工监督。
- **自主性的边界：** 理解Agentic RAG的局限性，聚焦于特定领域的自主性、基础设施依赖以及对安全规则的遵守。
- **实际用例与价值：** 识别Agentic RAG在需要迭代精炼和高精度的场景中的优势。
- **治理、透明度与信任：** 了解治理和透明度的重要性，包括可解释推理、偏见控制和人工监督。

## 什么是Agentic RAG？

Agentic Retrieval-Augmented Generation（Agentic RAG）是一种新兴的AI范式，其中大型语言模型（LLM）自主规划下一步行动，同时从外部资源提取信息。不同于静态的先检索后阅读模式，Agentic RAG涉及对LLM的迭代调用，穿插使用工具或函数调用并输出结构化结果。系统评估结果，优化查询，必要时调用更多工具，并持续循环，直到获得满意的解决方案。这种迭代的“制造者-检查者”模式提升了正确性，处理格式错误的查询，并确保结果质量。

系统主动掌控其推理过程，会重写失败的查询，选择不同的检索方式，整合多种工具——例如Azure AI Search中的向量搜索、SQL数据库或自定义API——然后才最终给出答案。agentic系统的显著特点是能够自主掌控推理过程。传统的RAG实现依赖预定义路径，而agentic系统则基于所获信息质量自主决定步骤顺序。

## 定义Agentic Retrieval-Augmented Generation（Agentic RAG）

Agentic Retrieval-Augmented Generation（Agentic RAG）是AI开发中的一种新兴范式，LLM不仅从外部数据源提取信息，还能自主规划下一步动作。不同于静态的先检索后阅读模式或精心设计的提示序列，Agentic RAG涉及对LLM的迭代调用循环，穿插工具或函数调用与结构化输出。每一步，系统都会评估结果，决定是否优化查询，必要时调用更多工具，并持续循环，直到获得满意的解决方案。

这种迭代的“制造者-检查者”操作模式旨在提升正确性，处理结构化数据库中格式错误的查询（如NL2SQL），并确保结果均衡且高质量。系统不仅依赖精心设计的提示链，而是主动掌控推理过程。它可以重写失败的查询，选择不同的检索方法，并整合多种工具——如Azure AI Search中的向量搜索、SQL数据库或自定义API——然后才最终给出答案。这消除了对过于复杂的编排框架的需求。相反，一个相对简单的“LLM调用 → 工具使用 → LLM调用 → …”循环就能产出复杂且扎实的结果。

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.zh.png)

## 掌控推理过程

使系统具备“agentic”特质的关键在于其能自主掌控推理过程。传统的RAG实现通常依赖人类预先定义模型的路径：一个列明检索内容及顺序的思路链。
但真正的agentic系统会内部决定如何解决问题。它不仅仅是在执行脚本，而是根据所获信息的质量自主确定步骤顺序。
例如，当被要求制定产品发布策略时，它不会仅依赖一个详尽描述整个研究和决策流程的提示。相反，agentic模型会自主决定：

1. 使用Bing Web Grounding检索当前市场趋势报告
2. 通过Azure AI Search识别相关竞争对手数据
3. 利用Azure SQL Database关联历史内部销售指标
4. 通过Azure OpenAI Service整合分析结果，形成连贯策略
5. 评估策略是否存在缺口或不一致，必要时再次检索

所有这些步骤——优化查询、选择数据源、反复迭代直到“满意”答案——均由模型自主决定，而非人工预设。

## 迭代循环、工具集成与记忆

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.zh.png)

agentic系统依赖循环交互模式：

- **初始调用：** 用户目标（即用户提示）传递给LLM。
- **工具调用：** 如果模型发现信息缺失或指令模糊，便选择工具或检索方式——如向量数据库查询（例如Azure AI Search的混合搜索）或结构化SQL调用——以获取更多上下文。
- **评估与优化：** 审核返回数据后，模型判断信息是否充分。若不够，便优化查询、尝试不同工具或调整策略。
- **循环直到满意：** 该过程持续，直到模型认为已获得足够清晰和充分的证据，能给出最终、合理的答复。
- **记忆与状态：** 系统跨步骤维护状态和记忆，能回忆先前尝试及结果，避免重复循环并做出更明智的决策。

随着时间推移，这种机制让模型形成逐步深化的理解，能处理复杂多步任务，无需人工频繁干预或重塑提示。

## 处理失败模式与自我纠正

Agentic RAG的自主性还体现在强大的自我纠正机制。当系统遇到瓶颈——如检索到无关文档或遇到格式错误查询时，它可以：

- **迭代重查：** 不返回低质量回答，而是尝试新的搜索策略，重写数据库查询，或访问替代数据集。
- **使用诊断工具：** 系统可能调用额外函数帮助调试推理步骤或确认检索数据的正确性。Azure AI Tracing等工具对于实现强健的可观测性和监控至关重要。
- **依赖人工监督：** 对于高风险或反复失败的场景，模型会标记不确定性并请求人工指导。人工反馈后，模型能将其纳入后续学习。

这种迭代且动态的方法让模型持续进步，确保它不是一次性系统，而是在会话中不断从错误中学习。

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.zh.png)

## 自主性的边界

尽管在任务中具备自主性，Agentic RAG并非通用人工智能。其“agentic”能力局限于人类开发者提供的工具、数据源和政策。它不能自行创造工具，也无法超越既定领域边界。它擅长的是动态协调现有资源。
与更高级AI形式的主要区别包括：

1. **领域特定自主性：** Agentic RAG系统专注于在已知领域内实现用户定义目标，采用如查询重写或工具选择等策略提升效果。
2. **依赖基础设施：** 系统能力依赖开发者集成的工具和数据，无法在无人干预下突破这些限制。
3. **遵守安全规则：** 道德准则、合规规定和业务政策始终至关重要。agent的自由度受安全措施和监督机制严格约束（理想情况）。

## 实际用例与价值

Agentic RAG在需要反复优化和高精度的场景中表现突出：

1. **以正确性为先的环境：** 在合规检查、法规分析或法律研究中，agentic模型能反复核实事实，咨询多方数据源，重写查询，直至产出全面审查的答案。
2. **复杂数据库交互：** 处理结构化数据时，查询常常失败或需调整，系统能自主优化Azure SQL或Microsoft Fabric OneLake中的查询，确保最终检索结果符合用户意图。
3. **延展工作流：** 长时会话中，随着新信息出现，Agentic RAG能持续整合数据，动态调整策略，更好地理解问题空间。

## 治理、透明度与信任

随着系统推理自主性的增强，治理和透明度变得尤为重要：

- **可解释推理：** 模型能提供查询轨迹、所咨询的来源及推理步骤的审计记录。Azure AI Content Safety和Azure AI Tracing / GenAIOps等工具有助于保持透明并降低风险。
- **偏见控制与均衡检索：** 开发者可调整检索策略，确保考虑均衡且具代表性的数据源，定期审计输出以检测偏见或偏斜，借助Azure Machine Learning为高级数据科学团队提供定制模型。
- **人工监督与合规：** 对于敏感任务，人工审核依然必不可少。Agentic RAG不是替代人工判断，而是通过提供更全面审查的选项来辅助决策。

具备清晰行动记录的工具至关重要。没有这些，调试多步流程将非常困难。以下示例来自Literal AI（Chainlit背后的公司）展示一次Agent运行：

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.zh.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.zh.png)

## 结论

Agentic RAG代表了AI系统处理复杂、数据密集型任务的自然演进。通过采用循环交互模式，自主选择工具，并不断优化查询直到获得高质量结果，系统超越了静态提示执行，成为更具适应性和上下文感知的决策者。虽然仍受限于人类定义的基础设施和伦理规范，这些agentic能力使企业和终端用户都能享受更丰富、更动态且更实用的AI交互体验。

## 附加资源

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">使用Azure OpenAI Service实现检索增强生成（RAG）：学习如何使用自己的数据配合Azure OpenAI Service。本微软学习模块提供RAG实现的全面指南</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">利用Azure AI Foundry评估生成式AI应用：本文涵盖公开数据集上模型的评估与比较，包括Agentic AI应用和RAG架构</a>
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">什么是Agentic RAG | Weaviate</a>
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG：基于代理的检索增强生成完整指南 – generation RAG新闻</a>
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG：通过查询重写和自我查询提升你的RAG性能！Hugging Face开源AI教程</a>
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">为RAG添加Agentic层</a>
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">知识助理的未来：Jerry Liu演讲</a>
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">如何构建Agentic RAG系统</a>
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">使用Azure AI Foundry Agent Service扩展你的AI代理</a>

### 学术论文

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine：基于自我反馈的迭代优化</a>
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion：带有语言强化学习的语言代理</a>
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC：大型语言模型可通过工具交互批评自我纠正</a>
- <a href="https://arxiv.org/abs/2501.09136" target="_blank">2501.09136 Agentic Retrieval-Augmented Generation：Agentic RAG综述</a>

## 上一课

[工具使用设计模式](../04-tool-use/README.md)

## 下一课

[构建可信赖的AI代理](../06-building-trustworthy-agents/README.md)

**免责声明**：  
本文件使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们力求准确，但请注意，自动翻译可能存在错误或不准确之处。原始语言的文件应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们概不负责。