<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f0ce2d470f3efad6f8c7df376f416a4b",
  "translation_date": "2025-05-20T07:33:45+00:00",
  "source_file": "00-course-setup/AzureSearch.md",
  "language_code": "hk"
}
-->
# Azure AI Search 設定指南

本指南會教你點樣用 Azure 入口網站設定 Azure AI Search。跟住以下步驟去建立同配置你嘅 Azure AI Search 服務。

## 預備條件

開始之前，請確保你有以下條件：

- 一個 Azure 訂閱。如果你未有 Azure 訂閱，可以喺 [Azure Free Account](https://azure.microsoft.com/free/?wt.mc_id=studentamb_258691) 創建免費帳戶。

## 第一步：建立 Azure AI Search 服務

1. 登入 [Azure portal](https://portal.azure.com/?wt.mc_id=studentamb_258691)。
2. 喺左邊導航欄，點擊 **Create a resource**。
3. 喺搜尋框輸入「Azure AI Search」，然後喺結果中揀選 **Azure AI Search**。
4. 點擊 **Create** 按鈕。
5. 喺 **Basics** 分頁，填寫以下資料：
   - **Subscription**：揀選你嘅 Azure 訂閱。
   - **Resource group**：新建資源組或揀現有資源組。
   - **Resource name**：輸入你嘅搜尋服務嘅獨特名稱。
   - **Region**：選擇最接近用戶嘅地區。
   - **Pricing tier**：揀一個適合你需要嘅收費層級。測試期間可以用 Free 層。
6. 點擊 **Review + create**。
7. 檢查設定無誤後，點擊 **Create** 建立搜尋服務。

## 第二步：開始使用 Azure AI Search

1. 部署完成後，喺 Azure 入口網站去到你嘅搜尋服務。
2. 喺搜尋服務概覽頁面，點擊 **Quickstart** 按鈕。
3. 跟住 Quickstart 指引建立索引、上載資料，並執行搜尋查詢。

### 建立索引

1. 喺 Quickstart 指引中，點擊 **Create an index**。
2. 定義索引架構，指定欄位同其屬性（例如資料類型、可搜尋、可篩選）。
3. 點擊 **Create** 建立索引。

### 上載資料

1. 喺 Quickstart 指引中，點擊 **Upload data**。
2. 選擇資料來源（例如 Azure Blob Storage、Azure SQL Database），並提供所需連接資料。
3. 將資料來源欄位對應到索引欄位。
4. 點擊 **Submit** 將資料上載到索引。

### 執行搜尋查詢

1. 喺 Quickstart 指引中，點擊 **Search explorer**。
2. 喺搜尋框輸入查詢內容，測試搜尋功能。
3. 查看搜尋結果，按需要調整索引架構或資料。

## 第三步：使用 Azure AI Search 工具

Azure AI Search 支援多種工具，幫助你提升搜尋能力。你可以用 Azure CLI、Python SDK 等工具做進階設定同操作。

### 使用 Azure CLI

1. 根據 [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?wt.mc_id=studentamb_258691) 指示安裝 Azure CLI。
2. 用以下指令登入 Azure CLI：
   ```bash
   az login
   ```
3. 用 Azure CLI 建立新嘅搜尋服務：
   ```bash
   az search service create --resource-group <resource-group> --name <service-name> --sku Free
   ```
4. 用 Azure CLI 建立索引：
   ```bash
   az search index create --service-name <service-name> --name <index-name> --fields "field1:type, field2:type"
   ```

### 使用 Python SDK

1. 安裝 Azure Cognitive Search Python 用戶端庫：
   ```bash
   pip install azure-search-documents
   ```
2. 用以下 Python 代碼建立索引並上載文件：
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

如需更詳細資料，請參考以下文件：

- [Create an Azure Cognitive Search service](https://learn.microsoft.com/en-us/azure/search/search-create-service-portal?wt.mc_id=studentamb_258691)
- [Get started with Azure Cognitive Search](https://learn.microsoft.com/en-us/azure/search/search-get-started-portal?wt.mc_id=studentamb_258691)
- [Azure AI Search Tools](https://learn.microsoft.com/en-us/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=code-examples?wt.mc_id=studentamb_258691)

## 總結

你已成功用 Azure 入口網站同整合工具設定咗 Azure AI Search。依家你可以進一步探索 Azure AI Search 嘅高級功能，提升你嘅搜尋方案。

如需進一步協助，請瀏覽 [Azure Cognitive Search documentation](https://learn.microsoft.com/en-us/azure/search/?wt.mc_id=studentamb_258691)。

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我哋致力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件嘅母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。因使用此翻譯而引致嘅任何誤解或誤譯，我哋概不負責。