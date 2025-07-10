<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T07:37:20+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "hk"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.hk.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(撳上面張相睇今堂嘅影片)_

# Agentic RAG

今堂課會全面介紹 Agentic Retrieval-Augmented Generation（Agentic RAG），呢個新興嘅 AI 模式，係大型語言模型（LLMs）可以自主規劃下一步，並且從外部資源攞資訊。唔同於傳統嘅先檢索再閱讀嘅靜態模式，Agentic RAG 係透過反覆呼叫 LLM，期間會穿插工具或者函數調用同結構化輸出。系統會評估結果，優化查詢，必要時調用更多工具，直到搵到滿意嘅答案為止。

## 介紹

今堂會涵蓋：

- **認識 Agentic RAG：** 了解呢個新興 AI 模式，LLMs 可以自主計劃下一步，同時從外部數據源提取資訊。
- **掌握反覆 Maker-Checker 模式：** 明白點樣透過反覆呼叫 LLM，穿插工具或函數調用同結構化輸出，提升準確度同處理錯誤查詢。
- **探索實際應用：** 識得邊啲場景適合用 Agentic RAG，好似注重準確度嘅環境、複雜數據庫互動同長流程工作。

## 學習目標

完成今堂後，你會識得：

- **理解 Agentic RAG：** 了解大型語言模型自主計劃同從外部數據拉取資訊嘅新興 AI 模式。
- **反覆 Maker-Checker 風格：** 掌握穿插工具調用嘅反覆呼叫 LLM 循環，提升結果準確度同處理錯誤查詢。
- **掌控推理過程：** 理解系統點樣自主擁有推理過程，唔靠預設流程作決策。
- **工作流程：** 了解 agentic 模型點樣自主決定去攞市場趨勢報告、識別競爭對手數據、關聯內部銷售指標、整合結果同評估策略。
- **反覆循環、工具整合同記憶：** 知道系統點樣用循環互動模式，保持狀態同記憶，避免重複循環，做出更精準決策。
- **處理失敗模式同自我修正：** 探索系統嘅強大自我修正機制，包括反覆查詢、用診斷工具、同依靠人工監督。
- **代理界限：** 了解 Agentic RAG 嘅限制，包括專業領域自主性、基礎設施依賴同守則遵守。
- **實際用例同價值：** 識得 Agentic RAG 喺邊啲場景最有效，例如注重準確度嘅環境、複雜數據庫互動同長流程工作。
- **治理、透明度同信任：** 了解治理同透明度嘅重要性，包括可解釋推理、偏見控制同人工監督。

## 乜嘢係 Agentic RAG？

Agentic Retrieval-Augmented Generation（Agentic RAG）係一種新興嘅 AI 模式，大型語言模型（LLMs）可以自主規劃下一步，同時從外部資源拉取資訊。唔似傳統先檢索再讀嘅靜態模式，Agentic RAG 係透過反覆呼叫 LLM，穿插工具或函數調用同結構化輸出。系統會評估結果，優化查詢，必要時調用更多工具，直到搵到滿意答案。呢個反覆嘅 “maker-checker” 模式可以提升準確度，處理錯誤查詢，確保高質素結果。

系統積極掌控推理過程，會重寫失敗嘅查詢，揀唔同嘅檢索方法，整合多個工具，例如 Azure AI Search 嘅向量搜尋、SQL 數據庫或者自訂 API，先至完成答案。Agentic 系統最大嘅特點係可以自主掌控推理過程。傳統 RAG 多數靠預設流程，但 agentic 系統會根據資訊質素，自主決定步驟次序。

## 定義 Agentic Retrieval-Augmented Generation（Agentic RAG）

Agentic Retrieval-Augmented Generation（Agentic RAG）係 AI 開發中新興嘅一種模式，LLMs 不但會從外部數據源攞資訊，仲會自主規劃下一步。唔似傳統先檢索再讀或者預設嘅 prompt 序列，Agentic RAG 係一個反覆呼叫 LLM 嘅循環，穿插工具或函數調用同結構化輸出。每一步系統都會評估結果，決定係咪要優化查詢，必要時調用更多工具，直到搵到滿意答案。

呢種反覆嘅 “maker-checker” 操作風格，係為咗提升準確度，處理結構化數據庫嘅錯誤查詢（例如 NL2SQL），確保結果平衡同高質素。系統唔係淨係靠預設嘅 prompt 鏈，而係積極掌控推理過程。佢可以重寫失敗查詢，揀唔同檢索方法，整合多個工具，例如 Azure AI Search 嘅向量搜尋、SQL 數據庫或者自訂 API，最後先完成答案。咁樣就唔使用太複雜嘅編排框架，一個簡單嘅 “LLM 呼叫 → 工具使用 → LLM 呼叫 → …” 循環已經可以產生精密同有根據嘅輸出。

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.hk.png)

## 掌控推理過程

令系統成為 “agentic” 嘅最大特點係佢可以自主掌控推理過程。傳統 RAG 多數依賴人類預先定好流程：即一條思考鏈，指示咩時候檢索乜嘢。
但真正 agentic 嘅系統，會自己決定點樣處理問題。佢唔係淨係執行腳本，而係根據資訊質素自主決定步驟順序。
例如，要佢做產品發布策略，佢唔會淨係靠一個寫晒所有研究同決策流程嘅 prompt，而係自主決定：

1. 用 Bing Web Grounding 攞最新市場趨勢報告
2. 用 Azure AI Search 揾相關競爭對手數據
3. 用 Azure SQL Database 關聯歷史內部銷售數據
4. 透過 Azure OpenAI Service 將結果整合成完整策略
5. 評估策略有冇漏洞或矛盾，必要時再做一次檢索
呢啲步驟——優化查詢、揀資料來源、反覆執行直到滿意——全部都係模型自己決定，唔係人預先寫好。

## 反覆循環、工具整合同記憶

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.hk.png)

agentic 系統係依賴一個循環互動模式：

- **初步呼叫：** 用戶目標（即用戶 prompt）會交畀 LLM。
- **工具調用：** 如果模型覺得資訊不足或者指令含糊，佢會揀用工具或者檢索方法，例如向量數據庫查詢（例如 Azure AI Search 混合搜索私人數據）或者結構化 SQL 查詢，攞多啲背景資料。
- **評估同優化：** 模型睇完返回嘅資料，判斷夠唔夠用。如果唔夠，佢會優化查詢、試另一個工具或者調整策略。
- **反覆直到滿意：** 呢個循環會一直做，直到模型覺得有足夠清晰同證據，交出最終合邏輯嘅答案。
- **記憶同狀態：** 系統會保持狀態同記憶，記得之前嘅嘗試同結果，避免重複循環，做更精明嘅決策。

隨住時間推移，系統會有不斷進化嘅理解力，令模型可以處理複雜多步嘅任務，唔使人類不斷介入或者改 prompt。

## 處理失敗模式同自我修正

Agentic RAG 嘅自主性仲包括強大嘅自我修正機制。當系統遇到死胡同，例如攞咗無關文件或者查詢錯誤，佢可以：

- **反覆同重查詢：** 唔係交返低質素答案，而係嘗試新嘅搜索策略，重寫數據庫查詢，或者睇其他數據集。
- **用診斷工具：** 系統會調用額外功能，幫助排查推理步驟或者確認檢索資料嘅準確度。工具例如 Azure AI Tracing 好重要，可以幫助做好可觀察性同監控。
- **依賴人工監督：** 喺高風險或者反覆失敗嘅情況，模型會標示唔確定，請人類介入指導。人類提供糾正意見後，模型會吸收經驗改進。

呢種反覆同動態嘅方式，令模型可以持續進步，唔係一次過完成，而係喺一次會話中從錯誤中學習。

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.hk.png)

## 代理界限

雖然有自主性，但 Agentic RAG 唔等同人工通用智能（AGI）。佢嘅 “agentic” 能力只限於人類開發者提供嘅工具、數據源同政策。佢唔會自己發明工具，亦唔會越界到設定嘅領域範圍之外。佢擅長係動態調配手頭資源。
同更高階 AI 形式嘅主要分別有：

1. **專業領域自主性：** Agentic RAG 系統專注於已知領域內達成用戶目標，會用查詢重寫或者工具揀選策略提升效果。
2. **基礎設施依賴：** 系統嘅能力依賴開發者整合嘅工具同數據，無人介入佢唔能突破呢啲界限。
3. **遵守守則：** 道德準則、合規規則同商業政策非常重要。agent 自由度始終受安全措施同監管機制限制（希望係咁）。

## 實際用例同價值

Agentic RAG 喺需要反覆優化同高準確度嘅場景特別出色：

1. **準確度優先環境：** 喺合規審查、法規分析或者法律研究中，agentic 模型可以反覆驗證事實、參考多個來源、重寫查詢，直到產生經過全面審核嘅答案。
2. **複雜數據庫互動：** 處理結構化數據時，查詢經常失敗或者需要調整，系統可以自主優化查詢，利用 Azure SQL 或 Microsoft Fabric OneLake，確保最終檢索結果符合用戶意圖。
3. **長流程工作：** 長時間運行嘅會話可能隨新資訊出現而演變。Agentic RAG 可以持續整合新數據，隨學習調整策略。

## 治理、透明度同信任

隨住系統推理愈來愈自主，治理同透明度變得至關重要：

- **可解釋推理：** 模型可以提供查詢歷史、參考來源同推理步驟嘅審計軌跡。工具例如 Azure AI Content Safety 同 Azure AI Tracing / GenAIOps 幫助保持透明度同減低風險。
- **偏見控制同平衡檢索：** 開發者可以調校檢索策略，確保考慮平衡同具代表性嘅數據源，並定期審計輸出，利用自訂模型偵測偏見或者失衡，特別係用於進階數據科學組織嘅 Azure Machine Learning。
- **人工監督同合規：** 喺敏感任務中，人類審核依然必需。Agentic RAG 唔會取代高風險決策中嘅人工判斷，而係通過提供更全面審核過嘅選項輔助判斷。

擁有提供清晰行動紀錄嘅工具好重要。冇咗佢哋，排查多步驟過程會好困難。以下係 Literal AI（Chainlit 背後公司）嘅一個 Agent 運行例子：

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.hk.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.hk.png)

## 總結

Agentic RAG 代表 AI 系統處理複雜、數據密集任務嘅自然演進。透過採用循環互動模式、自主揀工具、優化查詢直到達到高質素結果，系統超越咗靜態 prompt 跟隨，成為更具適應性、情境感知嘅決策者。雖然仍受限於人類設定嘅基礎設施同道德準則，呢啲 agentic 能力令 AI 互動對企業同終端用戶嚟講更加豐富、動態同實用。

## 額外資源

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">用 Azure OpenAI Service 實現 Retrieval Augmented Generation (RAG)：學習如何用你自己嘅數據同 Azure OpenAI Service。呢個 Microsoft Learn 模組提供全面嘅 RAG 實施指南</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">用 Azure AI Foundry 評估生成式 AI 應用：文章涵蓋公開數據集上模型嘅評估同比較，包括 Agentic AI 應用同 RAG 架構</a>
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">乜嘢係 Agentic RAG | Weaviate</a>
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG：代理基 Retrieval Augmented Generation 完整指南 – generation RAG 新聞</a>
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG：用查詢重寫同自我查詢加速你嘅 RAG！Hugging Face 開源 AI 食譜</a>
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">為 RAG 加入 Agentic 層</a>
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">知識助理嘅未來：Jerry Liu</a>
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">點樣建立 Agentic RAG 系統</a>
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">用 Azure AI Foundry Agent Service 擴展你嘅 AI 代理</a>

### 學術論文

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine：反覆優化同自我反饋</a>
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion：具口頭強化學習嘅語言代理</a>
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC：大型語言模型可透過工具互動批評自我修正</a>
- <a href="https://arxiv.org/abs/2501.09136" target="_blank">2501.09136 Agentic Retrieval-Augmented Generation：Agentic RAG 調查報告</a>

## 上一堂

[Tool Use Design Pattern](../04-tool-use/README.md)

## 下一堂

[Building Trustworthy AI Agents](../06-building-trustworthy-agents/README.md)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我哋盡力確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件嘅母語版本應視為權威來源。對於重要資料，建議採用專業人工翻譯。因使用本翻譯而引起嘅任何誤解或誤譯，我哋概不負責。