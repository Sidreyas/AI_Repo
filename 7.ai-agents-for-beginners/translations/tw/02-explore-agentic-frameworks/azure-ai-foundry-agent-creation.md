<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7e92870dc0843e13d4dabc620c09d2d9",
  "translation_date": "2025-05-20T07:22:54+00:00",
  "source_file": "02-explore-agentic-frameworks/azure-ai-foundry-agent-creation.md",
  "language_code": "tw"
}
-->
# Azure AI Agent Service 開發

在這個練習中，你會使用 [Azure AI Foundry portal](https://ai.azure.com/?WT.mc_id=academic-105485-koreyst) 裡的 Azure AI Agent 服務工具來建立一個航班預訂的 agent。這個 agent 能與使用者互動並提供航班相關資訊。

## 先決條件

完成此練習，你需要以下條件：
1. 一個有啟用訂閱的 Azure 帳戶。[免費建立帳戶](https://azure.microsoft.com/free/?WT.mc_id=academic-105485-koreyst)。
2. 你需要有權限建立 Azure AI Foundry hub，或已經有人幫你建立好。
    - 如果你的角色是 Contributor 或 Owner，可以依照本教學的步驟進行。

## 建立 Azure AI Foundry hub

> **Note:** Azure AI Foundry 之前稱為 Azure AI Studio。

1. 參考 [Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-studio/?WT.mc_id=academic-105485-koreyst) 部落格文章中的指引來建立 Azure AI Foundry hub。
2. 當你的專案建立完成後，關閉任何顯示的提示，並檢視 Azure AI Foundry portal 中的專案頁面，應該會類似以下圖片：

    ![Azure AI Foundry Project](../../../translated_images/azure-ai-foundry.8a2b56713298fd09de77022ab1ba07ebc681ea4cd4438a46c4a6fc6b6f077962.tw.png)

## 部署模型

1. 在專案左側面板的 **My assets** 區段，選擇 **Models + endpoints** 頁面。
2. 在 **Models + endpoints** 頁面裡，切換到 **Model deployments** 分頁，點選 **+ Deploy model** 選單，然後選擇 **Deploy base model**。
3. 在清單中搜尋 `gpt-4o-mini` 模型，選擇後確認部署。

    > **Note**: 降低 TPM 可以避免超過你訂閱可用的配額。

    ![Model Deployed](../../../translated_images/model-deployment.4adf429ebdf42103d7a759087fe0da91aeb70d2204cc8bdca70cc6c53c627938.tw.png)

## 建立 agent

既然模型已部署完成，就可以建立 agent。agent 是一種對話式 AI 模型，可以用來與使用者互動。

1. 在專案左側面板的 **Build & Customize** 區段，選擇 **Agents** 頁面。
2. 點擊 **+ Create agent** 來建立新 agent。在 **Agent Setup** 對話框中：
    - 輸入 agent 的名稱，例如 `FlightAgent`。
    - 確認先前建立的 `gpt-4o-mini` 模型部署已被選取。
    - 設定 **Instructions**，讓 agent 依照你希望的提示執行。以下是一個範例：
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
> 若要更詳細的提示，可以參考 [這個資源庫](https://github.com/ShivamGoyal03/RoamMind) 了解更多資訊。
    
> 此外，你也可以加入 **Knowledge Base** 和 **Actions** 來增強 agent 的能力，提供更多資訊並根據使用者請求執行自動化任務。此練習中可跳過這些步驟。
    
![Agent Setup](../../../translated_images/agent-setup.68a0c72f47bd1383584c52f14d694b54ea96c56c49660222409f83451b8220a8.tw.png)

3. 若要建立新的多 AI agent，只需點擊 **New Agent**。新建立的 agent 會顯示在 Agents 頁面上。

## 測試 agent

建立 agent 後，可以在 Azure AI Foundry portal 的 playground 測試它如何回應使用者問題。

1. 在 agent 的 **Setup** 面板頂端，選擇 **Try in playground**。
2. 在 **Playground** 面板，你可以透過聊天視窗輸入問題與 agent 互動。例如，你可以請 agent 搜尋 28 號從 Seattle 飛往 New York 的航班。

    > **Note**: agent 可能不會給出準確回應，因為此練習沒有使用即時資料。目的是測試 agent 根據指示理解並回應使用者查詢的能力。

    ![Agent Playground](../../../translated_images/agent-playground.847acb21209744353080ead65ec9326b917a6b90121d4b63f6f412a4d65af2a0.tw.png)

3. 測試完 agent 後，你可以進一步自訂，新增更多意圖、訓練資料和動作來提升功能。

## 清除資源

測試完成後，可以刪除 agent 以避免產生額外費用。
1. 開啟 [Azure portal](https://portal.azure.com)，查看你用來部署 hub 資源的資源群組內容。
2. 在工具列選擇 **Delete resource group**。
3. 輸入資源群組名稱並確認刪除。

## 資源

- [Azure AI Foundry 文件](https://learn.microsoft.com/en-us/azure/ai-studio/?WT.mc_id=academic-105485-koreyst)
- [Azure AI Foundry portal](https://ai.azure.com/?WT.mc_id=academic-105485-koreyst)
- [Getting Started with Azure AI Studio](https://techcommunity.microsoft.com/blog/educatordeveloperblog/getting-started-with-azure-ai-studio/4095602?WT.mc_id=academic-105485-koreyst)
- [Fundamentals of AI agents on Azure](https://learn.microsoft.com/en-us/training/modules/ai-agent-fundamentals/?WT.mc_id=academic-105485-koreyst)
- [Azure AI Discord](https://aka.ms/AzureAI/Discord)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所導致的任何誤解或誤譯負責。