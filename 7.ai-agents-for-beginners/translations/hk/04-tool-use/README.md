<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88258b03f2893aa2e69eb8fb24baabbc",
  "translation_date": "2025-05-20T07:36:39+00:00",
  "source_file": "04-tool-use/README.md",
  "language_code": "hk"
}
-->
[![How to Design Good AI Agents](../../../translated_images/lesson-4-thumbnail.2c292cd87b951b3e914e9548b46cb4d14a0852f9c8d75e9566d46da839c983d9.hk.png)](https://youtu.be/vieRiPRx-gI?si=cEZ8ApnT6Sus9rhn)

> _(撳上面張相睇本課堂嘅影片)_

# 工具使用設計模式

工具好有趣，因為佢哋令 AI agents 可以做到更多唔同嘅功能。唔係淨係靠 agent 本身有限嘅動作，加入工具之後，agent 可以做更廣泛嘅動作。今章我哋會講解工具使用設計模式，講下 AI agents 點樣用指定嘅工具嚟達成目標。

## 簡介

今課我哋會解答以下問題：

- 乜嘢係工具使用設計模式？
- 有啲乜嘢場合適合用呢個模式？
- 實現呢個設計模式需要啲乜嘢元素或組件？
- 用工具使用設計模式建立可信 AI agents 時，有啲咩特別注意事項？

## 學習目標

完成本課後，你會做到：

- 解釋工具使用設計模式同佢嘅目的。
- 識別啲適合用工具使用設計模式嘅場景。
- 明白實現呢個設計模式所需嘅主要元素。
- 了解用呢個設計模式建立可信 AI agents 嘅注意事項。

## 乜嘢係工具使用設計模式？

**工具使用設計模式** 着重畀 LLMs 可以同外部工具互動，去完成指定目標。工具係可以俾 agent 執行嘅程式碼。工具可以係簡單嘅函數，好似計算機，又或者係第三方服務嘅 API 調用，好似查股票價或者天氣預報。喺 AI agents 嘅範疇，工具係設計嚟俾 agents 根據**模型生成嘅函數調用**執行。

## 適用嘅使用場景係啲乜？

AI Agents 可以用工具完成複雜任務、攞資料或者做決策。工具使用設計模式通常用喺需要同外部系統動態互動嘅場景，好似數據庫、網絡服務或者代碼解釋器。呢啲功能適用於唔同嘅場景，包括：

- **動態資料檢索：** Agents 可以查外部 API 或數據庫攞最新資料（例如查 SQLite 數據庫做數據分析，或者攞股票價同天氣資料）。
- **代碼執行同解釋：** Agents 可以執行代碼或腳本，解決數學問題、生成報告或者做模擬。
- **工作流程自動化：** 用工具自動化重複或者多步嘅工作流程，例如任務排程、電郵服務或者數據管道。
- **客戶支援：** Agents 可以同 CRM 系統、工單平台或者知識庫互動，解決用戶問題。
- **內容生成同編輯：** Agents 可以用文法檢查、文本摘要或者內容安全評估等工具，幫助內容創作。

## 實現工具使用設計模式需要啲乜嘢元素/組件？

呢啲組件令 AI agent 可以完成多種任務。以下係實現工具使用設計模式嘅關鍵元素：

- **函數/工具結構定義（Schemas）**：詳細定義可用嘅工具，包括函數名、用途、所需參數同預期輸出。呢啲結構令 LLM 明白邊啲工具可用同點樣構造有效請求。

- **函數執行邏輯**：控制幾時同點樣根據用戶意圖同對話上下文去調用工具。可能包括規劃模塊、路由機制或者條件流程，動態決定工具使用。

- **訊息處理系統**：管理用戶輸入、LLM 回應、工具調用同工具輸出之間嘅對話流程。

- **工具整合框架**：連接 agent 同各種工具嘅基礎設施，無論係簡單函數定係複雜外部服務。

- **錯誤處理同驗證**：處理工具執行失敗、驗證參數同管理意外回應嘅機制。

- **狀態管理**：追蹤對話上下文、之前嘅工具互動同持久化數據，確保多輪互動嘅一致性。

下一步，我哋詳細睇下函數/工具調用。

### 函數/工具調用

函數調用係令大型語言模型（LLMs）同工具互動嘅主要方法。你會經常見到「函數」同「工具」互換使用，因為「函數」係一段可重用代碼，而「工具」就係 agents 用嚟完成任務嘅函數。要調用一個函數嘅代碼，LLM 需要將用戶嘅請求同函數描述比對。為此，一個包含所有可用函數描述嘅結構會發送畀 LLM。LLM 會揀出最合適嘅函數執行任務，然後返回函數名稱同參數。揀好嘅函數會被執行，結果再回傳畀 LLM，LLM 就用呢啲資訊回應用戶請求。

開發者要實現函數調用，需要：

1. 支援函數調用嘅 LLM 模型
2. 包含函數描述嘅結構定義
3. 每個函數嘅代碼

用搵城市當前時間做例子：

1. **初始化支援函數調用嘅 LLM：**

    唔係所有模型都支援函數調用，所以要先確認你用嘅 LLM 支援。<a href="https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling" target="_blank">Azure OpenAI</a> 就支援。你可以由建立 Azure OpenAI 客戶端開始。

    ```python
    # Initialize the Azure OpenAI client
    client = AzureOpenAI(
        azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT"), 
        api_key=os.getenv("AZURE_OPENAI_API_KEY"),  
        api_version="2024-05-01-preview"
    )
    ```

1. **建立函數結構定義：**

    定義一個 JSON 結構，包含函數名稱、功能描述同函數參數嘅名稱同描述。
    將呢個結構同用戶請求一齊傳畀之前建立嘅客戶端，請求搵出舊金山時間。要注意係，返回嘅係**工具調用**，**唔係**問題嘅最終答案。正如之前講，LLM 會返回佢揀選嘅函數名稱同要傳入嘅參數。

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
  
1. **執行任務嘅函數代碼：**

    LLM 揀咗要執行嘅函數後，就要實現同執行呢段代碼。
    我哋可以用 Python 撰寫代碼去攞當前時間。亦要寫代碼從 response_message 中抽取函數名同參數，攞到最終結果。

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

函數調用係大部分 agent 工具使用設計嘅核心，但自己由零開始實現有時會有挑戰。
正如我哋喺[課堂 2](../../../02-explore-agentic-frameworks)學到，agentic 框架提供咗預建組件，幫助實現工具使用。

## 用 Agentic 框架嘅工具使用示例

以下係用唔同 agentic 框架實現工具使用設計模式嘅示例：

### Semantic Kernel

<a href="https://learn.microsoft.com/azure/ai-services/agents/overview" target="_blank">Semantic Kernel</a> 係一個開源 AI 框架，支援 .NET、Python 同 Java 開發者用大型語言模型（LLMs）。佢透過一個叫<a href="https://learn.microsoft.com/semantic-kernel/concepts/ai-services/chat-completion/function-calling/?pivots=programming-language-python#1-serializing-the-functions" target="_blank">序列化</a>嘅過程，自動幫你描述函數同參數畀模型，簡化咗函數調用。佢亦處理模型同代碼之間嘅來回溝通。用 Semantic Kernel 呢類 agentic 框架嘅另一好處係可以用預建工具，好似<a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step4_assistant_tool_file_search.py" target="_blank">文件搜索</a>同<a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step3_assistant_tool_code_interpreter.py" target="_blank">代碼解釋器</a>。

下面嘅圖解釋咗 Semantic Kernel 嘅函數調用過程：

![function calling](../../../translated_images/functioncalling-diagram.b5493ea5154ad8e3e4940d2e36a49101eec1398948e5d1039942203b4f5a4209.hk.png)

喺 Semantic Kernel 裡面，函數/工具叫做<a href="https://learn.microsoft.com/semantic-kernel/concepts/plugins/?pivots=programming-language-python" target="_blank">插件</a>。我哋可以用 `get_current_time` function we saw earlier into a plugin by turning it into a class with the function in it. We can also import the `kernel_function` 裝飾器，佢會帶入函數描述。當你用 GetCurrentTimePlugin 建立 kernel，kernel 會自動序列化函數同參數，喺傳畀 LLM 嘅過程中創建結構定義。

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

<a href="https://learn.microsoft.com/azure/ai-services/agents/overview" target="_blank">Azure AI Agent Service</a> 係較新嘅 agentic 框架，設計俾開發者安全咁建、部署同擴展高質量、可擴展嘅 AI agents，唔使自己管理底層運算同存儲資源。特別適合企業應用，因為佢係全託管服務，有企業級安全。

相比直接用 LLM API，Azure AI Agent Service 有啲優勢，包括：

- 自動工具調用 — 唔使自己解析工具調用、執行工具同處理回應，全部由服務端完成
- 安全管理數據 — 唔使自己管理對話狀態，可以靠 threads 儲存所有所需資訊
- 開箱即用嘅工具 — 有啲工具可以同你嘅數據源互動，好似 Bing、Azure AI Search 同 Azure Functions。

Azure AI Agent Service 提供嘅工具可分兩大類：

1. 知識工具：
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/bing-grounding?tabs=python&pivots=overview" target="_blank">Bing 搜索輔助</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/file-search?tabs=python&pivots=overview" target="_blank">文件搜索</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=overview-azure-ai-search" target="_blank">Azure AI 搜索</a>

2. 行動工具：
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/function-calling?tabs=python&pivots=overview" target="_blank">函數調用</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/code-interpreter?tabs=python&pivots=overview" target="_blank">代碼解釋器</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/openapi-spec?tabs=python&pivots=overview" target="_blank">OpenAI 定義工具</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/azure-functions?pivots=overview" target="_blank">Azure Functions</a>

Agent Service 令我哋可以將呢啲工具一齊用，組成 `toolset`. It also utilizes `threads` which keep track of the history of messages from a particular conversation.

Imagine you are a sales agent at a company called Contoso. You want to develop a conversational agent that can answer questions about your sales data.

The following image illustrates how you could use Azure AI Agent Service to analyze your sales data:

![Agentic Service In Action](../../../translated_images/agent-service-in-action.8c2d8aa8e9d91feeb29549b3fde529f8332b243875154d03907616a69198afbc.hk.jpg)

To use any of these tools with the service we can create a client and define a tool or toolset. To implement this practically we can use the following Python code. The LLM will be able to look at the toolset and decide whether to use the user created function, `fetch_sales_data_using_sqlite_query`，或者根據用戶請求用預建嘅 Code Interpreter。

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

## 用工具使用設計模式建立可信 AI agents 嘅特別注意事項係乜？

一個常見嘅擔心係 LLM 動態生成嘅 SQL 會唔安全，特別係 SQL 注入或者惡意行為，好似刪除或者篡改數據庫。呢啲擔心係合理嘅，但可以透過正確設定數據庫存取權限有效減低風險。大部分數據庫做法係設置為只讀。對於 PostgreSQL 或 Azure SQL 等數據庫服務，應用程式應該被分配只讀（SELECT）角色。

喺安全環境運行應用程式可以進一步提升保護。企業場景通常會將數據從運營系統提取同轉換到只讀數據庫或數據倉庫，並設計用戶友好嘅結構。咁樣做確保數據安全、性能優化同易用，應用程式只會有受限嘅只讀存取權。

## 額外資源

- <a href="https://microsoft.github.io/build-your-first-agent-with-azure-ai-agent-service-workshop/" target="_blank">Azure AI Agents Service 工作坊</a>
- <a href="https://github.com/Azure-Samples/contoso-creative-writer/tree/main/docs/workshop" target="_blank">Contoso 創意寫手多代理工作坊</a>
- <a href="https://learn.microsoft.com/semantic-kernel/concepts/ai-services/chat-completion/function-calling/?pivots=programming-language-python#1-serializing-the-functions" target="_blank">Semantic Kernel 函數調用教學</a>
- <a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step3_assistant_tool_code_interpreter.py" target="_blank">Semantic Kernel 代碼解釋器</a>
- <a href="https://microsoft.github.io/autogen/dev/user-guide/core-user-guide/components/tools.html" target="_blank">Autogen 工具</a>

## 上一課

[理解 Agentic 設計模式](../03-agentic-design-patterns/README.md)

## 下一課

[Agentic RAG](../05-agentic-rag/README.md)

**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯而引致的任何誤解或誤釋承擔責任。