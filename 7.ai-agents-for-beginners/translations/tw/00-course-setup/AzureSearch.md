<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f0ce2d470f3efad6f8c7df376f416a4b",
  "translation_date": "2025-05-20T07:22:06+00:00",
  "source_file": "00-course-setup/AzureSearch.md",
  "language_code": "tw"
}
-->
# Azure AI Search 設定指南

本指南將協助你使用 Azure 入口網站設定 Azure AI Search。請依照以下步驟建立並設定你的 Azure AI Search 服務。

## 前置條件

開始之前，請確認你具備以下條件：

- 一個 Azure 訂閱。如果你還沒有 Azure 訂閱，可以在 [Azure Free Account](https://azure.microsoft.com/free/?wt.mc_id=studentamb_258691) 註冊免費帳號。

## 步驟 1：建立 Azure AI Search 服務

1. 登入 [Azure portal](https://portal.azure.com/?wt.mc_id=studentamb_258691)。
2. 在左側導覽窗格中，點選 **Create a resource**。
3. 在搜尋框輸入「Azure AI Search」，並從結果中選擇 **Azure AI Search**。
4. 點選 **Create** 按鈕。
5. 在 **Basics** 標籤頁中，填寫以下資訊：
   - **Subscription**：選擇你的 Azure 訂閱。
   - **Resource group**：建立新的資源群組或選擇現有的。
   - **Resource name**：輸入搜尋服務的唯一名稱。
   - **Region**：選擇最接近使用者的區域。
   - **Pricing tier**：選擇符合需求的價格層級。測試時可先使用免費層級。
6. 點選 **Review + create**。
7. 確認設定後，點選 **Create** 建立搜尋服務。

## 步驟 2：開始使用 Azure AI Search

1. 部署完成後，前往 Azure 入口網站中的搜尋服務頁面。
2. 在搜尋服務總覽頁面，點選 **Quickstart** 按鈕。
3. 依照 Quickstart 指南的步驟建立索引、上傳資料，並執行搜尋查詢。

### 建立索引

1. 在 Quickstart 指南中，點選 **Create an index**。
2. 定義索引結構，指定欄位及其屬性（例如資料型別、是否可搜尋、是否可篩選）。
3. 點選 **Create** 建立索引。

### 上傳資料

1. 在 Quickstart 指南中，點選 **Upload data**。
2. 選擇資料來源（例如 Azure Blob Storage、Azure SQL Database），並提供必要的連線資訊。
3. 將資料來源欄位對應到索引欄位。
4. 點選 **Submit** 將資料上傳到索引。

### 執行搜尋查詢

1. 在 Quickstart 指南中，點選 **Search explorer**。
2. 在搜尋框輸入查詢語句，測試搜尋功能。
3. 檢視搜尋結果，並依需求調整索引結構或資料。

## 步驟 3：使用 Azure AI Search 工具

Azure AI Search 可整合多種工具，提升搜尋功能。你可以使用 Azure CLI、Python SDK 及其他工具進行進階設定與操作。

### 使用 Azure CLI

1. 依照 [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?wt.mc_id=studentamb_258691) 的說明安裝 Azure CLI。
2. 使用以下指令登入 Azure CLI：
   ```bash
   az login
   ```
3. 使用 Azure CLI 建立新的搜尋服務：
   ```bash
   az search service create --resource-group <resource-group> --name <service-name> --sku Free
   ```
4. 使用 Azure CLI 建立索引：
   ```bash
   az search index create --service-name <service-name> --name <index-name> --fields "field1:type, field2:type"
   ```

### 使用 Python SDK

1. 安裝 Azure Cognitive Search 的 Python 客戶端函式庫：
   ```bash
   pip install azure-search-documents
   ```
2. 使用以下 Python 程式碼建立索引並上傳文件：
   ```python
   from azure.core.credentials import AzureKeyCredential
   from azure.search.documents import SearchClient
   from azure.search.documents.indexes import SearchIndexClient
   from azure.search.documents.indexes.models import SearchIndex, SimpleField, edm

   service_endpoint = "https://<service-name>.search.windows.net"
   api_key = "<api-key>"

   index_client = SearchIndexClient(service_endpoint, AzureKeyCredential(api_key))

   fields = [
       SimpleField(name="id", type=edm.String, key=True),
       SimpleField(name="content", type=edm.String, searchable=True),
   ]

   index = SearchIndex(name="sample-index", fields=fields)

   index_client.create_index(index)

   search_client = SearchClient(service_endpoint, "sample-index", AzureKeyCredential(api_key))

   documents = [
       {"id": "1", "content": "Hello world"},
       {"id": "2", "content": "Azure Cognitive Search"}
   ]

   search_client.upload_documents(documents)
   ```

更多詳細資訊，請參考以下文件：

- [Create an Azure Cognitive Search service](https://learn.microsoft.com/en-us/azure/search/search-create-service-portal?wt.mc_id=studentamb_258691)
- [Get started with Azure Cognitive Search](https://learn.microsoft.com/en-us/azure/search/search-get-started-portal?wt.mc_id=studentamb_258691)
- [Azure AI Search Tools](https://learn.microsoft.com/en-us/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=code-examples?wt.mc_id=studentamb_258691)

## 結論

你已成功使用 Azure 入口網站及整合工具設定 Azure AI Search。接下來可以探索更多 Azure AI Search 的進階功能與能力，強化你的搜尋解決方案。

如需進一步協助，請造訪 [Azure Cognitive Search documentation](https://learn.microsoft.com/en-us/azure/search/?wt.mc_id=studentamb_258691)。

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所產生的任何誤解或誤譯負責。