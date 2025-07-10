<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7e92870dc0843e13d4dabc620c09d2d9",
  "translation_date": "2025-05-20T07:34:49+00:00",
  "source_file": "02-explore-agentic-frameworks/azure-ai-foundry-agent-creation.md",
  "language_code": "hk"
}
-->
# Azure AI Agent Service 開發

喺呢個練習入面，你會用到 [Azure AI Foundry portal](https://ai.azure.com/?WT.mc_id=academic-105485-koreyst) 嘅 Azure AI Agent 服務工具，去建立一個飛行訂票嘅 agent。呢個 agent 可以同用戶互動，並提供有關航班嘅資訊。

## 先決條件

完成呢個練習，你需要以下條件：
1. 一個有有效訂閱嘅 Azure 帳戶。[免費建立帳戶](https://azure.microsoft.com/free/?WT.mc_id=academic-105485-koreyst)。
2. 你需要有權限去建立 Azure AI Foundry hub，或者有人為你建立好。
    - 如果你係 Contributor 或 Owner 角色，可以跟呢個教學嘅步驟。

## 建立 Azure AI Foundry hub

> **Note:** Azure AI Foundry 之前叫做 Azure AI Studio。

1. 跟住呢篇 [Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-studio/?WT.mc_id=academic-105485-koreyst) blog 文章嘅指引去建立 Azure AI Foundry hub。
2. 當你嘅專案建立好後，關閉所有彈出嘅提示，然後檢視 Azure AI Foundry portal 入面嘅專案頁面，佢應該同以下圖片差唔多：

    ![Azure AI Foundry Project](../../../translated_images/azure-ai-foundry.8a2b56713298fd09de77022ab1ba07ebc681ea4cd4438a46c4a6fc6b6f077962.hk.png)

## 部署模型

1. 喺你專案左邊嘅窗格，喺 **My assets** 部分，揀選 **Models + endpoints** 頁面。
2. 喺 **Models + endpoints** 頁面，喺 **Model deployments** 分頁，喺 **+ Deploy model** 選單入面，揀選 **Deploy base model**。
3. 喺列表入面搵 `gpt-4o-mini` 模型，然後揀選並確認。

    > **Note**: 降低 TPM 可以避免用超你訂閱可用嘅配額。

    ![Model Deployed](../../../translated_images/model-deployment.4adf429ebdf42103d7a759087fe0da91aeb70d2204cc8bdca70cc6c53c627938.hk.png)

## 建立 agent

而家你已經部署咗模型，可以建立 agent。agent 係一個會話式 AI 模型，可以用嚟同用戶互動。

1. 喺你專案左邊嘅窗格，喺 **Build & Customize** 部分，揀選 **Agents** 頁面。
2. 撳 **+ Create agent** 去建立新 agent。喺 **Agent Setup** 對話框入面：
    - 輸入 agent 嘅名稱，例如 `FlightAgent`。
    - 確保之前建立嘅 `gpt-4o-mini` 模型部署被揀選咗。
    - 根據你想 agent 遵循嘅提示，設定 **Instructions**。以下係一個例子：
    ```
    You are FlightAgent, a virtual assistant specialized in handling flight-related queries. Your role includes assisting users with searching for flights, retrieving flight details, checking seat availability, and providing real-time flight status. Follow the instructions below to ensure clarity and effectiveness in your responses:

    ### Task Instructions:
    1. **Recognizing Intent**:
       - Identify the user's intent based on their request, focusing on one of the following categories:
         - Searching for flights
         - Retrieving flight details using a flight ID
         - Checking seat availability for a specified flight
         - Providing real-time flight status using a flight number
       - If the intent is unclear, politely ask users to clarify or provide more details.
        
    2. **Processing Requests**:
        - Depending on the identified intent, perform the required task:
        - For flight searches: Request details such as origin, destination, departure date, and optionally return date.
        - For flight details: Request a valid flight ID.
        - For seat availability: Request the flight ID and date and validate inputs.
        - For flight status: Request a valid flight number.
        - Perform validations on provided data (e.g., formats of dates, flight numbers, or IDs). If the information is incomplete or invalid, return a friendly request for clarification.

    3. **Generating Responses**:
    - Use a tone that is friendly, concise, and supportive.
    - Provide clear and actionable suggestions based on the output of each task.
    - If no data is found or an error occurs, explain it to the user gently and offer alternative actions (e.g., refine search, try another query).
    
    ```
> [!NOTE]
> 如果想要詳細啲嘅提示，可以參考 [呢個 repository](https://github.com/ShivamGoyal03/RoamMind) 了解更多。

> 此外，你可以加 **Knowledge Base** 同 **Actions**，提升 agent 嘅能力，提供更多資訊同埋根據用戶要求自動執行任務。呢個練習可以唔理呢啲步驟。

![Agent Setup](../../../translated_images/agent-setup.68a0c72f47bd1383584c52f14d694b54ea96c56c49660222409f83451b8220a8.hk.png)

3. 如果想建立多 AI agent，只要撳 **New Agent**。新建立嘅 agent 會喺 Agents 頁面顯示。

## 測試 agent

建立咗 agent 之後，可以喺 Azure AI Foundry portal 嘅 playground 測試 agent 點回應用戶嘅查詢。

1. 喺 agent 嘅 **Setup** 窗格頂部，揀選 **Try in playground**。
2. 喺 **Playground** 窗格，你可以喺聊天視窗輸入查詢同 agent 互動。例如，可以問 agent 幫你搵 28 號由 Seattle 飛去 New York 嘅航班。

    > **Note**: agent 可能唔會提供準確答案，因為呢個練習冇用實時數據。目的係測試 agent 根據指示理解同回應用戶查詢嘅能力。

    ![Agent Playground](../../../translated_images/agent-playground.847acb21209744353080ead65ec9326b917a6b90121d4b63f6f412a4d65af2a0.hk.png)

3. 測試完 agent 後，你可以繼續自訂，加多啲意圖、訓練數據同動作，提升佢嘅功能。

## 清理資源

測試完成後，可以刪除 agent，避免產生額外費用。
1. 開啟 [Azure portal](https://portal.azure.com)，檢視你用嚟部署 hub 資源嘅資源群組內容。
2. 喺工具列揀選 **Delete resource group**。
3. 輸入資源群組名稱，確認刪除。

## 資源

- [Azure AI Foundry documentation](https://learn.microsoft.com/en-us/azure/ai-studio/?WT.mc_id=academic-105485-koreyst)
- [Azure AI Foundry portal](https://ai.azure.com/?WT.mc_id=academic-105485-koreyst)
- [Getting Started with Azure AI Studio](https://techcommunity.microsoft.com/blog/educatordeveloperblog/getting-started-with-azure-ai-studio/4095602?WT.mc_id=academic-105485-koreyst)
- [Fundamentals of AI agents on Azure](https://learn.microsoft.com/en-us/training/modules/ai-agent-fundamentals/?WT.mc_id=academic-105485-koreyst)
- [Azure AI Discord](https://aka.ms/AzureAI/Discord)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我哋致力於確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件嘅母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我哋對因使用本翻譯而引致嘅任何誤解或誤釋概不負責。