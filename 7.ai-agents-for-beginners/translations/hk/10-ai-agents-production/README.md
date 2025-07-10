<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1ad5de6a6388d02c145a92dd04358bab",
  "translation_date": "2025-05-20T07:44:03+00:00",
  "source_file": "10-ai-agents-production/README.md",
  "language_code": "hk"
}
-->
[![AI Agents In Production](../../../translated_images/lesson-10-thumbnail.0b68f4240618b3d5b26693b78cf2cf0a8b36131b50bb08daf91d548cecc87424.hk.png)](https://youtu.be/l4TP6IyJxmQ?si=IvCW3cbw0NJ2mUMV)

> _(撳上面嘅相睇呢課嘅影片)_
# AI Agents 喺生產環境嘅應用

## 簡介

今課會講：

- 點樣有效規劃你嘅 AI Agent 喺生產環境嘅部署。
- 喺部署 AI Agent 去生產時，常見嘅錯誤同問題。
- 點樣控制成本同時保持 AI Agent 嘅效能。

## 學習目標

完成今課後，你會識得/了解：

- 提升生產環境 AI Agent 系統嘅效能、成本同效果嘅技巧。
- 點樣評估你嘅 AI Agents。
- 喺部署 AI Agents 去生產時點樣控制成本。

部署可信賴嘅 AI Agents 好重要。記得去睇埋「Building Trustworthy AI Agents」呢課。

## 評估 AI Agents

喺部署 AI Agents 前、中、後，擁有一套合適嘅評估系統係好關鍵。咁可以確保你嘅系統同你同用戶嘅目標一致。

評估 AI Agent 時，唔單止要評估 agent 嘅輸出，仲要評估 AI Agent 運行嘅整個系統。呢啲包括但唔限於：

- 初始嘅模型請求。
- agent 識得判斷用戶意圖嘅能力。
- agent 識得揀啱嘅工具去完成任務嘅能力。
- 工具對 agent 請求嘅回應。
- agent 解析工具回應嘅能力。
- 用戶對 agent 回應嘅反饋。

咁樣可以幫你以模組化嘅方式識別改進嘅地方。你可以更有效率咁監察模型、提示詞、工具同其他組件嘅改動影響。

## AI Agents 常見問題同解決方案

| **問題**                                     | **潛在解決方案**                                                                                                                                                                                                                  |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AI Agent 表現唔穩定                         | - 優化畀 AI Agent 嘅提示詞，清晰列明目標。<br>- 識別邊啲任務可以拆分成細任務，由多個 agents 一齊處理。                                                                                                                        |
| AI Agent 進入無限循環                       | - 確保有清晰嘅終止條件，令 Agent 知道幾時停止程序。<br>- 對於需要推理同規劃嘅複雜任務，使用更大嘅專門推理模型。                                                                                                            |
| AI Agent 嘅工具調用表現唔理想               | - 喺 agent 系統外測試同驗證工具嘅輸出。<br>- 優化工具嘅參數設定、提示詞同命名。                                                                                                                                                |
| 多 Agent 系統表現唔穩定                     | - 優化畀每個 agent 嘅提示詞，確保佢哋具體同互相有區別。<br>- 建立層級系統，用「routing」或控制 agent 去決定邊個 agent 係最啱嘅。                                                                                           |

## 控制成本

以下係啲控制部署 AI Agents 去生產成本嘅策略：

- **緩存回應** — 識別常見請求同任務，喺經過 agentic 系統前先提供回應，可以減少相似請求嘅數量。你甚至可以用較簡單嘅 AI 模型實現流程，判斷請求同緩存請求嘅相似度。

- **使用較細嘅模型** — 細型語言模型（SLMs）喺某啲 agentic 用例表現都幾好，而且成本大幅降低。如之前所講，建立評估系統去比較同判斷 SLM 同較大模型嘅效能係最有效嘅方法。

- **使用路由模型** — 類似策略係用唔同大小同類型嘅模型。你可以用 LLM/SLM 或 serverless 函數根據複雜度將請求路由到最合適嘅模型。咁樣可以減低成本，同時確保喺啱嘅任務上有好嘅效能。

## 恭喜你

呢課係「AI Agents for Beginners」嘅最後一課。

我哋會根據反饋同行業變化繼續新增課程，記得以後再返嚟睇。

如果你想繼續學習同實踐 AI Agents，可以加入 <a href="https://discord.gg/kzRShWzttr" target="_blank">Azure AI Community Discord</a>。

我哋喺度舉辦工作坊、社區圓桌會議同「ask me anything」環節。

我哋仲有一個 Learn 系列，提供額外資料幫你開始喺生產環境建立 AI Agents。

## 上一課

[Metacognition Design Pattern](../09-metacognition/README.md)

**免責聲明**：  
本文件係用AI翻譯服務[Co-op Translator](https://github.com/Azure/co-op-translator)進行翻譯。雖然我哋盡力確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件嘅母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。本公司對因使用此翻譯而引致嘅任何誤解或誤釋概不負責。