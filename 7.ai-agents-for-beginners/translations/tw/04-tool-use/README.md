<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88258b03f2893aa2e69eb8fb24baabbc",
  "translation_date": "2025-05-20T07:24:23+00:00",
  "source_file": "04-tool-use/README.md",
  "language_code": "tw"
}
-->
[![How to Design Good AI Agents](../../../translated_images/lesson-4-thumbnail.2c292cd87b951b3e914e9548b46cb4d14a0852f9c8d75e9566d46da839c983d9.tw.png)](https://youtu.be/vieRiPRx-gI?si=cEZ8ApnT6Sus9rhn)

> _(點擊上方圖片觀看本課程影片)_

# 工具使用設計模式

工具很有趣，因為它們讓 AI 代理人擁有更廣泛的能力。代理人不再只有有限的動作選擇，透過加入工具，代理人現在可以執行多種不同的操作。在本章中，我們將探討工具使用設計模式，說明 AI 代理人如何利用特定工具達成目標。

## 介紹

在這堂課中，我們將嘗試回答以下問題：

- 什麼是工具使用設計模式？
- 它適用於哪些使用場景？
- 實作此設計模式需要哪些元素／組件？
- 使用工具使用設計模式打造值得信賴的 AI 代理人時，有哪些特別注意事項？

## 學習目標

完成本課後，你將能夠：

- 定義工具使用設計模式及其目的。
- 識別適用工具使用設計模式的使用案例。
- 了解實作該設計模式所需的關鍵元素。
- 了解使用此設計模式確保 AI 代理人可信度的考量。

## 什麼是工具使用設計模式？

**工具使用設計模式**著重於賦予大型語言模型（LLM）與外部工具互動的能力，以達成特定目標。工具是代理人可執行的程式碼，用來完成各種操作。工具可以是簡單的函式，例如計算機，也可以是第三方服務的 API 呼叫，如股票價格查詢或天氣預報。在 AI 代理人的情境下，工具設計成由代理人依據**模型產生的函式呼叫**來執行。

## 它適用於哪些使用場景？

AI 代理人可以利用工具完成複雜任務、取得資訊或做出決策。工具使用設計模式常用於需要與外部系統動態互動的情境，例如資料庫、網路服務或程式碼解譯器。此能力適用於多種不同場景，包括：

- **動態資訊擷取：** 代理人能查詢外部 API 或資料庫以取得最新資料（例如查詢 SQLite 資料庫做資料分析、取得股票價格或天氣資訊）。
- **程式碼執行與解譯：** 代理人能執行程式碼或腳本，解決數學問題、產生報告或執行模擬。
- **工作流程自動化：** 透過整合排程工具、電子郵件服務或資料管線，自動化重複或多步驟流程。
- **客戶支援：** 代理人可與 CRM 系統、工單平台或知識庫互動，解決使用者問題。
- **內容產生與編輯：** 代理人可利用文法檢查、文字摘要或內容安全評估工具，協助內容創作。

## 實作工具使用設計模式需要哪些元素／組件？

這些組件讓 AI 代理人能執行各種任務。以下是實作工具使用設計模式的關鍵元素：

- **函式／工具結構定義（Schemas）**：詳細定義可用工具，包括函式名稱、用途、必要參數及預期輸出。這些結構讓 LLM 理解有哪些工具可用，並如何構造有效請求。

- **函式執行邏輯**：根據使用者意圖和對話上下文，決定何時及如何呼叫工具。可能包含規劃模組、路由機制或條件流程，以動態決定工具使用。

- **訊息處理系統**：管理使用者輸入、LLM 回應、工具呼叫與工具輸出之間的對話流程。

- **工具整合框架**：連接代理人與各種工具的基礎架構，無論是簡單函式還是複雜的外部服務。

- **錯誤處理與驗證**：處理工具執行失敗、驗證參數以及管理意外回應的機制。

- **狀態管理**：追蹤對話上下文、先前工具互動與持續資料，確保多輪互動的一致性。

接著，我們將更詳細介紹函式／工具呼叫。

### 函式／工具呼叫

函式呼叫是讓大型語言模型（LLM）與工具互動的主要方式。你會發現「函式」和「工具」常被交替使用，因為「函式」（可重複使用的程式碼區塊）就是代理人用來執行任務的「工具」。為了呼叫函式的程式碼，LLM 必須將使用者請求與函式描述做比對。為此，我們會將所有可用函式的描述放入結構定義（schema）並傳給 LLM。LLM 隨後會選擇最適合該任務的函式，並回傳函式名稱與參數。被選中的函式會被執行，回應結果送回 LLM，LLM 再根據這些資訊回應使用者請求。

開發者若要為代理人實作函式呼叫，需要：

1. 支援函式呼叫的 LLM 模型
2. 包含函式描述的結構定義
3. 每個函式的實作程式碼

以下用取得某城市當前時間的範例說明：

1. **初始化支援函式呼叫的 LLM：**

    並非所有模型都支援函式呼叫，使用前需確認所用 LLM 是否支援。<a href="https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling" target="_blank">Azure OpenAI</a> 支援函式呼叫。我們可以先建立 Azure OpenAI 用戶端。

    ```python
    # Initialize the Azure OpenAI client
    client = AzureOpenAI(
        azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT"), 
        api_key=os.getenv("AZURE_OPENAI_API_KEY"),  
        api_version="2024-05-01-preview"
    )
    ```

1. **建立函式結構定義（Function Schema）：**

    接著定義一個 JSON schema，包含函式名稱、函式功能描述，以及函式參數的名稱和描述。
    再將此 schema 與使用者請求一起傳給先前建立的用戶端，請求查詢 San Francisco 的時間。重要的是，回傳的是一個**工具呼叫**，**不是**問題的最終答案。正如前述，LLM 回傳的是它選擇用於該任務的函式名稱與參數。

    ```python
    # Function description for the model to read
    tools = [
        {
            "type": "function",
            "function": {
                "name": "get_current_time",
                "description": "Get the current time in a given location",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "location": {
                            "type": "string",
                            "description": "The city name, e.g. San Francisco",
                        },
                    },
                    "required": ["location"],
                },
            }
        }
    ]
    ```
   
    ```python
  
    # Initial user message
    messages = [{"role": "user", "content": "What's the current time in San Francisco"}] 
  
    # First API call: Ask the model to use the function
      response = client.chat.completions.create(
          model=deployment_name,
          messages=messages,
          tools=tools,
          tool_choice="auto",
      )
  
      # Process the model's response
      response_message = response.choices[0].message
      messages.append(response_message)
  
      print("Model's response:")  

      print(response_message)
  
    ```

    ```bash
    Model's response:
    ChatCompletionMessage(content=None, role='assistant', function_call=None, tool_calls=[ChatCompletionMessageToolCall(id='call_pOsKdUlqvdyttYB67MOj434b', function=Function(arguments='{"location":"San Francisco"}', name='get_current_time'), type='function')])
    ```
  
1. **執行任務所需的函式程式碼：**

    LLM 選定要執行的函式後，就需要實作並執行該函式的程式碼。
    我們可以用 Python 撰寫取得當前時間的程式碼，並撰寫程式碼從 response_message 中擷取函式名稱與參數，取得最終結果。

    ```python
      def get_current_time(location):
        """Get the current time for a given location"""
        print(f"get_current_time called with location: {location}")  
        location_lower = location.lower()
        
        for key, timezone in TIMEZONE_DATA.items():
            if key in location_lower:
                print(f"Timezone found for {key}")  
                current_time = datetime.now(ZoneInfo(timezone)).strftime("%I:%M %p")
                return json.dumps({
                    "location": location,
                    "current_time": current_time
                })
      
        print(f"No timezone data found for {location_lower}")  
        return json.dumps({"location": location, "current_time": "unknown"})
    ```

    ```python
     # Handle function calls
      if response_message.tool_calls:
          for tool_call in response_message.tool_calls:
              if tool_call.function.name == "get_current_time":
     
                  function_args = json.loads(tool_call.function.arguments)
     
                  time_response = get_current_time(
                      location=function_args.get("location")
                  )
     
                  messages.append({
                      "tool_call_id": tool_call.id,
                      "role": "tool",
                      "name": "get_current_time",
                      "content": time_response,
                  })
      else:
          print("No tool calls were made by the model.")  
  
      # Second API call: Get the final response from the model
      final_response = client.chat.completions.create(
          model=deployment_name,
          messages=messages,
      )
  
      return final_response.choices[0].message.content
     ```

    ```bash
      get_current_time called with location: San Francisco
      Timezone found for san francisco
      The current time in San Francisco is 09:24 AM.
     ```

函式呼叫是大多數（如果不是全部）代理人工具使用設計的核心，但從頭實作有時會有挑戰。
正如我們在[第二課](../../../02-explore-agentic-frameworks)所學，agentic 框架提供了預先構建的組件，幫助實作工具使用。

## 使用 agentic 框架的工具使用範例

以下是使用不同 agentic 框架實作工具使用設計模式的範例：

### Semantic Kernel

<a href="https://learn.microsoft.com/azure/ai-services/agents/overview" target="_blank">Semantic Kernel</a> 是一個開源 AI 框架，支援 .NET、Python 與 Java 開發者使用大型語言模型（LLM）。它透過一種稱為<a href="https://learn.microsoft.com/semantic-kernel/concepts/ai-services/chat-completion/function-calling/?pivots=programming-language-python#1-serializing-the-functions" target="_blank">序列化（serializing）</a>的過程，自動將你的函式及其參數描述傳給模型，簡化函式呼叫的流程。它也處理模型與程式碼之間的雙向通訊。使用像 Semantic Kernel 這樣的 agentic 框架的另一個優點是，能使用預建工具，例如<a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step4_assistant_tool_file_search.py" target="_blank">檔案搜尋</a>和<a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step3_assistant_tool_code_interpreter.py" target="_blank">程式碼解譯器</a>。

下圖說明了使用 Semantic Kernel 的函式呼叫流程：

![function calling](../../../translated_images/functioncalling-diagram.b5493ea5154ad8e3e4940d2e36a49101eec1398948e5d1039942203b4f5a4209.tw.png)

在 Semantic Kernel 中，函式／工具稱為<a href="https://learn.microsoft.com/semantic-kernel/concepts/plugins/?pivots=programming-language-python" target="_blank">外掛（Plugins）</a>。我們可以用 `get_current_time` function we saw earlier into a plugin by turning it into a class with the function in it. We can also import the `kernel_function` 裝飾器，並帶入函式描述。當你使用 GetCurrentTimePlugin 建立 kernel 時，kernel 會自動序列化函式及其參數，建立要傳給 LLM 的結構定義。

```python
from semantic_kernel.functions import kernel_function

class GetCurrentTimePlugin:
    async def __init__(self, location):
        self.location = location

    @kernel_function(
        description="Get the current time for a given location"
    )
    def get_current_time(location: str = ""):
        ...

```

```python 
from semantic_kernel import Kernel

# Create the kernel
kernel = Kernel()

# Create the plugin
get_current_time_plugin = GetCurrentTimePlugin(location)

# Add the plugin to the kernel
kernel.add_plugin(get_current_time_plugin)
```
  
### Azure AI Agent Service

<a href="https://learn.microsoft.com/azure/ai-services/agents/overview" target="_blank">Azure AI Agent Service</a> 是較新的 agentic 框架，設計目標是讓開發者能安全地構建、部署並擴展高品質且可擴充的 AI 代理人，無需管理底層的運算與儲存資源。它對企業應用特別有用，因為它是完全託管的服務，具備企業級安全性。

與直接使用 LLM API 開發相比，Azure AI Agent Service 有以下優勢：

- 自動工具呼叫 – 不需要自己解析工具呼叫、執行工具及處理回應，這些都由伺服器端完成
- 安全管理資料 – 不需自己管理對話狀態，可以依賴 threads 存儲所需所有資訊
- 現成工具 – 提供與資料來源互動的工具，例如 Bing、Azure AI Search 和 Azure Functions

Azure AI Agent Service 中的工具可分為兩類：

1. 知識工具：
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/bing-grounding?tabs=python&pivots=overview" target="_blank">Bing 搜尋輔助</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/file-search?tabs=python&pivots=overview" target="_blank">檔案搜尋</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=overview-azure-ai-search" target="_blank">Azure AI Search</a>

2. 動作工具：
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/function-calling?tabs=python&pivots=overview" target="_blank">函式呼叫</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/code-interpreter?tabs=python&pivots=overview" target="_blank">程式碼解譯器</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/openapi-spec?tabs=python&pivots=overview" target="_blank">OpenAI 定義工具</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/azure-functions?pivots=overview" target="_blank">Azure Functions</a>

Agent Service 讓我們能以 `toolset`. It also utilizes `threads` which keep track of the history of messages from a particular conversation.

Imagine you are a sales agent at a company called Contoso. You want to develop a conversational agent that can answer questions about your sales data.

The following image illustrates how you could use Azure AI Agent Service to analyze your sales data:

![Agentic Service In Action](../../../translated_images/agent-service-in-action.8c2d8aa8e9d91feeb29549b3fde529f8332b243875154d03907616a69198afbc.tw.jpg)

To use any of these tools with the service we can create a client and define a tool or toolset. To implement this practically we can use the following Python code. The LLM will be able to look at the toolset and decide whether to use the user created function, `fetch_sales_data_using_sqlite_query` 或預建的 Code Interpreter，依據使用者請求來使用這些工具。

```python 
import os
from azure.ai.projects import AIProjectClient
from azure.identity import DefaultAzureCredential
from fecth_sales_data_functions import fetch_sales_data_using_sqlite_query # fetch_sales_data_using_sqlite_query function which can be found in a fetch_sales_data_functions.py file.
from azure.ai.projects.models import ToolSet, FunctionTool, CodeInterpreterTool

project_client = AIProjectClient.from_connection_string(
    credential=DefaultAzureCredential(),
    conn_str=os.environ["PROJECT_CONNECTION_STRING"],
)

# Initialize function calling agent with the fetch_sales_data_using_sqlite_query function and adding it to the toolset
fetch_data_function = FunctionTool(fetch_sales_data_using_sqlite_query)
toolset = ToolSet()
toolset.add(fetch_data_function)

# Initialize Code Interpreter tool and adding it to the toolset. 
code_interpreter = code_interpreter = CodeInterpreterTool()
toolset = ToolSet()
toolset.add(code_interpreter)

agent = project_client.agents.create_agent(
    model="gpt-4o-mini", name="my-agent", instructions="You are helpful agent", 
    toolset=toolset
)
```

## 使用工具使用設計模式打造值得信賴 AI 代理人的特別考量？

LLM 動態產生的 SQL 常見的疑慮是安全性，尤其是 SQL 注入攻擊或惡意操作（如刪除或竄改資料庫）的風險。雖然這些疑慮合理，但透過妥善設定資料庫存取權限可以有效降低風險。大多數資料庫會將存取設定為唯讀。對於 PostgreSQL 或 Azure SQL 等資料庫服務，應為應用程式分配唯讀（SELECT）角色。

在安全環境中執行應用程式更能提升防護。在企業場景中，資料通常從營運系統抽取並轉換到唯讀資料庫或資料倉儲，且採用易用的資料結構。這種方式確保資料安全、效能與可用性，同時應用程式擁有受限且唯讀的存取權限。

## 其他資源

- <a href="https://microsoft.github.io/build-your-first-agent-with-azure-ai-agent-service-workshop/" target="_blank">Azure AI Agents Service 工作坊</a>
- <a href="https://github.com/Azure-Samples/contoso-creative-writer/tree/main/docs/workshop" target="_blank">Contoso 創意寫作多代理人工作坊</a>
- <a href="https://learn.microsoft.com/semantic-kernel/concepts/ai-services/chat-completion/function-calling/?pivots=programming-language-python#1-serializing-the-functions" target="_blank">Semantic Kernel 函式呼叫教學</a>
- <a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step3_assistant_tool_code_interpreter.py" target="_blank">Semantic Kernel 程式碼解譯器</a>
- <a href="https://microsoft.github.io/autogen/dev/user-guide/core-user-guide/components/tools.html" target="_blank">Autogen 工具</a>

## 前一課

[理解 Agentic 設計模式](../03-agentic-design-patterns/README.md)

## 下一課

[Agentic RAG](../05-agentic-rag/README.md)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於翻譯的準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤譯負責。