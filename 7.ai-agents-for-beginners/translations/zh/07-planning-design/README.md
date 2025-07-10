<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e4e06d3b5d6207459a019c05fee5eb4b",
  "translation_date": "2025-05-20T07:11:40+00:00",
  "source_file": "07-planning-design/README.md",
  "language_code": "zh"
}
-->
以解决复杂任务。

## 总结

本文展示了如何创建一个能够动态选择可用代理的规划器示例。规划器的输出会将任务分解并分配给相应的代理执行。假设这些代理可以访问执行任务所需的函数或工具。除了代理之外，还可以加入反思、摘要和轮询聊天等模式以进一步定制。

## 额外资源

* AutoGen Magnetic One —— 一个通用的多代理系统，用于解决复杂任务，在多个具有挑战性的代理基准测试中取得了令人印象深刻的成果。参考：

在此实现中，协调者会创建针对具体任务的计划，并将这些任务委派给可用的代理。除了规划外，协调者还采用跟踪机制来监控任务进展，并根据需要重新规划。

## 前一课

[构建可信赖的 AI 代理](../06-building-trustworthy-agents/README.md)

## 下一课

[多代理设计模式](../08-multi-agent/README.md)

**免责声明**：  
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译而成。虽然我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始文件的母语版本应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们不对因使用本翻译而产生的任何误解或误释承担责任。