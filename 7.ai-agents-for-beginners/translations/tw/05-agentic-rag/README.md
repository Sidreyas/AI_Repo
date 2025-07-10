<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T07:25:46+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "tw"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.tw.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(點擊上方圖片觀看本課影片)_

# Agentic RAG

本課程全面介紹 Agentic Retrieval-Augmented Generation（Agentic RAG），這是一種新興的 AI 範式，大型語言模型（LLMs）能自主規劃下一步行動，同時從外部資源擷取資訊。與傳統靜態的先檢索再閱讀模式不同，Agentic RAG 採用迭代呼叫 LLM，並穿插工具或函式調用與結構化輸出。系統會評估結果、優化查詢、必要時調用更多工具，並持續循環直到達成滿意的解決方案。

## 介紹

本課將涵蓋：

- **理解 Agentic RAG：** 認識這個新興的 AI 範式，LLMs 可自主規劃下一步，同時從外部資料來源擷取資訊。
- **掌握迭代 Maker-Checker 風格：** 了解透過迭代呼叫 LLM，穿插工具或函式調用與結構化輸出，以提升正確性及處理錯誤查詢的流程。
- **探索實務應用：** 辨識 Agentic RAG 發揮優勢的場景，例如重視正確性的環境、複雜資料庫互動與延伸工作流程。

## 學習目標

完成本課後，你將能：

- **理解 Agentic RAG：** 了解 LLMs 如何自主規劃步驟並從外部資料擷取資訊。
- **迭代 Maker-Checker 風格：** 掌握迴圈式呼叫 LLM，穿插工具調用與結構化輸出，提升結果正確性並處理錯誤查詢。
- **掌握推理流程：** 理解系統如何自主掌控推理過程，決定問題解決方式而非依賴預設路徑。
- **工作流程：** 了解 agentic 模型如何自主決定擷取市場趨勢報告、辨識競爭者資料、關聯內部銷售指標、整合分析結果並評估策略。
- **迭代循環、工具整合與記憶：** 瞭解系統如何依賴循環互動模式，跨步驟保持狀態與記憶，避免重複循環並做出更明智決策。
- **失敗處理與自我修正：** 探索系統強健的自我修正機制，包括迭代重查、使用診斷工具及必要時仰賴人工監督。
- **代理界限：** 理解 Agentic RAG 的限制，專注於特定領域自治、基礎設施依賴及遵守規範。
- **實務案例與價值：** 辨識 Agentic RAG 在重視正確性、複雜資料庫互動與延伸工作流程的應用場景。
- **治理、透明度與信任：** 了解治理與透明度的重要性，包括可解釋推理、偏誤控制與人工監督。

## 什麼是 Agentic RAG？

Agentic Retrieval-Augmented Generation（Agentic RAG）是一種新興 AI 範式，大型語言模型（LLMs）能自主規劃下一步行動，同時從外部來源擷取資訊。與靜態的先檢索再閱讀模式不同，Agentic RAG 採用迭代呼叫 LLM，穿插工具或函式調用與結構化輸出。系統會評估結果、優化查詢、必要時調用更多工具，並持續循環直到達成滿意解決方案。這種迭代的「maker-checker」風格能提升正確性、處理錯誤查詢，並確保結果品質。

系統積極掌控推理過程，重寫失敗查詢、選擇不同檢索方法，並整合多種工具，例如 Azure AI Search 向量搜尋、SQL 資料庫或自訂 API，然後才完成回答。Agentic 系統的關鍵特質是能自主掌控推理流程。傳統 RAG 實作依賴預先定義路徑，而 agentic 系統會根據資訊品質自主決定步驟順序。

## 定義 Agentic Retrieval-Augmented Generation（Agentic RAG）

Agentic Retrieval-Augmented Generation（Agentic RAG）是 AI 發展中的新範式，LLMs 不僅從外部資料擷取資訊，還能自主規劃後續步驟。與靜態的先檢索再閱讀模式或精心設計的提示序列不同，Agentic RAG 採用迴圈式呼叫 LLM，穿插工具或函式調用與結構化輸出。系統在每一步評估結果，決定是否優化查詢、調用更多工具，持續循環直到達成滿意解決方案。

這種迭代「maker-checker」風格旨在提升正確性、處理結構化資料庫的錯誤查詢（如 NL2SQL），並確保結果平衡且高品質。系統不僅依賴精心設計的提示鏈，而是積極掌控推理流程。它能重寫失敗查詢、選擇不同檢索方式，整合多種工具（如 Azure AI Search 向量搜尋、SQL 資料庫或自訂 API），完成回答前不需複雜的編排框架。相反地，一個簡單的「LLM 呼叫 → 工具使用 → LLM 呼叫 → …」迴圈即可產出成熟且有根據的輸出。

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.tw.png)

## 掌控推理流程

讓系統具備「agentic」特質的關鍵，是它能自主掌控推理流程。傳統 RAG 實作通常依賴人類預先定義模型的路徑：一串思考鏈指明何時擷取什麼資料。
但真正 agentic 的系統會內部決定如何解決問題。它不只是執行腳本，而是根據找到的資訊品質自主決定步驟順序。
舉例來說，若被要求制定產品上市策略，它不會只依賴完整描述研究與決策流程的提示。相反地，agentic 模型會獨立決定：

1. 使用 Bing Web Grounding 擷取當前市場趨勢報告
2. 利用 Azure AI Search 辨識相關競爭者資料
3. 使用 Azure SQL Database 關聯歷史內部銷售指標
4. 透過 Azure OpenAI Service 整合分析結果形成策略
5. 評估策略是否有缺口或不一致，必要時再進行新一輪擷取
這些步驟——優化查詢、選擇來源、反覆迭代直到「滿意」答案——皆由模型決定，而非人類預先編寫。

## 迭代循環、工具整合與記憶

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.tw.png)

agentic 系統依賴迴圈互動模式：

- **初始呼叫：** 將使用者目標（即使用者提示）傳給 LLM。
- **工具調用：** 若模型發現資訊不足或指令模糊，會選擇工具或檢索方法，如向量資料庫查詢（例如 Azure AI Search 混合搜尋私人資料）或結構化 SQL 呼叫，以獲取更多上下文。
- **評估與優化：** 查看回傳資料後，模型判斷資訊是否足夠，若不足，會優化查詢、嘗試不同工具或調整策略。
- **持續迴圈直到滿意：** 反覆進行此循環，直到模型認為已具備足夠清晰與證據，能給出最終且合理的回答。
- **記憶與狀態：** 系統跨步驟維持狀態與記憶，能回顧先前嘗試與結果，避免重複循環並做出更明智的決策。

隨著時間推移，這帶來逐步深化的理解，使模型能處理複雜多步任務，無需人類持續介入或重塑提示。

## 失敗模式處理與自我修正

Agentic RAG 的自治也包含強健的自我修正機制。當系統遭遇死胡同——如擷取無關文件或遇到錯誤查詢——它能：

- **迭代重查：** 不會只回傳低價值回應，而是嘗試新搜尋策略、重寫資料庫查詢或查看替代資料集。
- **使用診斷工具：** 可能調用額外函式協助除錯推理步驟或確認檢索資料正確性。像 Azure AI Tracing 這類工具對強化觀察與監控非常重要。
- **仰賴人工監督：** 對高風險或反覆失敗情況，模型可能標記不確定性並請求人工指導。人類提供修正回饋後，模型能將經驗納入後續使用。

這種迭代且動態的方法讓模型持續進步，確保它不是一次性系統，而是能在同一會話中從錯誤中學習。

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.tw.png)

## 代理界限

儘管在任務中具自治能力，Agentic RAG 並非通用人工智慧。其「agentic」能力侷限於人類開發者提供的工具、資料來源與政策。它無法自行發明工具或跳脫設定的領域界限。相反地，它擅長動態編排手邊資源。
與更進階 AI 形式的主要差異包括：

1. **領域專屬自治：** Agentic RAG 系統專注於在已知領域內達成使用者定義目標，透過查詢重寫或工具選擇提升成果。
2. **基礎設施依賴：** 系統能力取決於開發者整合的工具與資料，無法無人介入突破這些限制。
3. **尊重規範限制：** 倫理指引、合規規則與商業政策極為重要。代理自由度始終受限於安全措施與監督機制（希望如此）。

## 實務案例與價值

Agentic RAG 在需反覆優化與精確度的場景中表現出色：

1. **重視正確性的環境：** 在合規檢查、法規分析或法律研究中，agentic 模型可反覆驗證事實、查詢多重來源，重寫查詢直到產出嚴謹答案。
2. **複雜資料庫互動：** 面對結構化資料且查詢常失敗或需調整時，系統能自主優化查詢（如使用 Azure SQL 或 Microsoft Fabric OneLake），確保最終檢索符合使用者意圖。
3. **延伸工作流程：** 長期會話會隨新資訊演進。Agentic RAG 可持續整合新資料，隨著學習問題空間調整策略。

## 治理、透明度與信任

隨著系統推理越來越自治，治理與透明度至關重要：

- **可解釋推理：** 模型能提供查詢紀錄、參考來源及推理步驟的審計軌跡。工具如 Azure AI Content Safety 及 Azure AI Tracing / GenAIOps 有助維持透明度與風險控管。
- **偏誤控制與平衡檢索：** 開發者可調整檢索策略，確保考慮平衡且具代表性的資料來源，並定期審核輸出，利用自訂模型監測偏誤或失衡，特別是進階資料科學組織使用 Azure Machine Learning。
- **人工監督與合規：** 對敏感任務，人工審核仍不可或缺。Agentic RAG 不取代高風險決策中的人類判斷，而是透過提供更嚴謹的選項來輔助。

擁有能清楚記錄行動的工具非常重要。缺乏這些，除錯多步流程將非常困難。以下為 Literal AI（Chainlit 背後公司）提供的 Agent 運行範例：

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.tw.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.tw.png)

## 結論

Agentic RAG 代表 AI 系統處理複雜且資料密集任務的自然演進。透過採用迴圈互動模式、自主選擇工具並優化查詢直到達成高品質結果，系統超越靜態提示執行，成為更具適應性與情境感知的決策者。雖然仍受限於人類定義的基礎設施與倫理規範，這些 agentic 能力使 AI 與企業及終端使用者的互動更豐富、動態且實用。

## 額外資源

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">使用 Azure OpenAI Service 實作 Retrieval Augmented Generation (RAG)：學習如何使用自己的資料與 Azure OpenAI Service。此 Microsoft Learn 模組提供完整的 RAG 實作指南</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">利用 Azure AI Foundry 評估生成式 AI 應用：本文涵蓋公開資料集上的模型評估與比較，包括 Agentic AI 應用與 RAG 架構</a>
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">什麼是 Agentic RAG | Weaviate</a>
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG：基於代理的 Retrieval Augmented Generation 完整指南 – Generation RAG 新聞</a>
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG：透過查詢重寫與自我查詢加速你的 RAG！Hugging Face 開源 AI 食譜</a>
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">為 RAG 加入 Agentic 層</a>
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">知識助理的未來：Jerry Liu</a>
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">如何打造 Agentic RAG 系統</a>
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">使用 Azure AI Foundry Agent Service 擴展你的 AI 代理</a>

### 學術論文

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine: Iterative Refinement with Self-Feedback</a>
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion: Language Agents with Verbal Reinforcement Learning</a>
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC: Large Language Models Can Self-Correct with Tool-Interactive Critiquing</a>
- <a href="https://arxiv.org/abs/2501.09136" target="_blank">2501.09136 Agentic Retrieval-Augmented Generation: A Survey on Agentic RAG</a>

## 上一課

[Tool Use Design Pattern](../04-tool-use/README.md)

## 下一課

[Building Trustworthy AI Agents](../06-building-trustworthy-agents/README.md)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保翻譯的準確性，但請注意，自動翻譯可能會包含錯誤或不準確之處。原始文件之母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所產生之任何誤解或誤譯負責。