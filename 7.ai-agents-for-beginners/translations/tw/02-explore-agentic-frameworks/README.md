<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T07:23:38+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "tw"
}
-->
根據維基百科，actor 是「並行運算的基本構建塊。當收到訊息時，actor 可以：做出本地決策、創建更多 actors、發送更多訊息，以及決定如何回應下一個收到的訊息」。

**使用案例**：自動化程式碼生成、資料分析任務，以及打造用於規劃和研究功能的客製化代理人。

以下是 AutoGen 的一些重要核心概念：

- **代理人 (Agents)**。代理人是一種軟體實體，具備以下特性：
  - **透過訊息溝通**，這些訊息可以是同步或非同步的。
  - **維護自己的狀態**，狀態可被傳入的訊息所修改。
  - **根據收到的訊息或狀態變化執行動作**。這些動作可能會修改代理人的狀態並產生外部效果，例如更新訊息紀錄、發送新訊息、執行程式碼或呼叫 API。
  
  這裡有一段簡短的程式碼範例，展示如何建立具備聊天功能的代理人：

    ```python
    from autogen_agentchat.agents import AssistantAgent
    from autogen_agentchat.messages import TextMessage
    from autogen_ext.models.openai import OpenAIChatCompletionClient


    class MyAssistant(RoutedAgent):
        def __init__(self, name: str) -> None:
            super().__init__(name)
            model_client = OpenAIChatCompletionClient(model="gpt-4o")
            self._delegate = AssistantAgent(name, model_client=model_client)
    
        @message_handler
        async def handle_my_message_type(self, message: MyMessageType, ctx: MessageContext) -> None:
            print(f"{self.id.type} received message: {message.content}")
            response = await self._delegate.on_messages(
                [TextMessage(content=message.content, source="user")], ctx.cancellation_token
            )
            print(f"{self.id.type} responded: {response.chat_message.content}")
    ```
    
    在上面的程式碼中，`MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` 是一個預先建立好的代理人，能處理聊天完成。

    接著讓 AutoGen 知道這個代理人類型，並啟動程式：

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    在上述程式碼中，代理人被註冊到執行時環境，然後發送訊息給代理人，產生以下輸出：

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **多代理人 (Multi agents)**。AutoGen 支援建立多個代理人共同合作完成複雜任務。代理人可以彼此溝通、分享資訊並協調行動以更有效率地解決問題。建立多代理人系統時，你可以定義不同類型的代理人，分別負責資料擷取、分析、決策及用戶互動等專門功能。以下範例展示了這樣的建立方式：

    ```python
    editor_description = "Editor for planning and reviewing the content."

    # Example of declaring an Agent
    editor_agent_type = await EditorAgent.register(
    runtime,
    editor_topic_type,  # Using topic type as the agent type.
    lambda: EditorAgent(
        description=editor_description,
        group_chat_topic_type=group_chat_topic_type,
        model_client=OpenAIChatCompletionClient(
            model="gpt-4o-2024-08-06",
            # api_key="YOUR_API_KEY",
        ),
        ),
    )

    # remaining declarations shortened for brevity

    # Group chat
    group_chat_manager_type = await GroupChatManager.register(
    runtime,
    "group_chat_manager",
    lambda: GroupChatManager(
        participant_topic_types=[writer_topic_type, illustrator_topic_type, editor_topic_type, user_topic_type],
        model_client=OpenAIChatCompletionClient(
            model="gpt-4o-2024-08-06",
            # api_key="YOUR_API_KEY",
        ),
        participant_descriptions=[
            writer_description, 
            illustrator_description, 
            editor_description, 
            user_description
        ],
        ),
    )
    ```

    在上述程式碼中，我們有一個 `GroupChatManager`，它被註冊到執行時環境，負責協調不同類型代理人（如作家、插畫家、編輯及用戶）之間的互動。

- **代理人執行時環境 (Agent Runtime)**。此框架提供執行時環境，使代理人間能溝通，管理代理人身份與生命週期，並強制執行安全與隱私邊界。這表示你可以在安全且受控的環境中執行代理人，確保他們能安全且高效地互動。有兩種執行時環境值得注意：
  - **獨立執行時環境 (Stand-alone runtime)**。適用於單一程序應用程式，所有代理人使用相同程式語言且運行於同一程序中。以下是其運作示意：

應用程式堆疊

    *代理人透過執行時環境傳遞訊息溝通，執行時環境管理代理人的生命週期*

  - **分散式代理人執行時環境 (Distributed agent runtime)**，適合多程序應用，代理人可能使用不同程式語言並分散於不同機器上執行。以下是其運作示意：

## Semantic Kernel + Agent Framework

Semantic Kernel 是一套企業級的 AI 編排 SDK，包含 AI 與記憶體連接器以及代理人框架。

先來介紹一些核心元件：

- **AI 連接器 (AI Connectors)**：這是與外部 AI 服務和資料來源介接的介面，支援 Python 和 C#。

  ```python
  # Semantic Kernel Python
  from semantic_kernel.connectors.ai.open_ai import AzureChatCompletion
  from semantic_kernel.kernel import Kernel

  kernel = Kernel()
  kernel.add_service(
    AzureChatCompletion(
        deployment_name="your-deployment-name",
        api_key="your-api-key",
        endpoint="your-endpoint",
    )
  )
  ```  

    ```csharp
    // Semantic Kernel C#
    using Microsoft.SemanticKernel;

    // Create kernel
    var builder = Kernel.CreateBuilder();
    
    // Add a chat completion service:
    builder.Services.AddAzureOpenAIChatCompletion(
        "your-resource-name",
        "your-endpoint",
        "your-resource-key",
        "deployment-model");
    var kernel = builder.Build();
    ```

    這裡有個簡單範例，展示如何建立一個 kernel 並加入聊天完成服務。Semantic Kernel 會連接到外部 AI 服務，這例子是 Azure OpenAI 聊天完成。

- **插件 (Plugins)**：封裝應用程式可使用的功能。既有現成插件，也能自行建立客製插件。相關概念是「prompt functions」，不是透過自然語言提示呼叫功能，而是將特定功能廣播給模型，模型根據當前聊天上下文選擇呼叫相應功能以完成請求或查詢。範例如下：

  ```python
  from semantic_kernel.connectors.ai.open_ai.services.azure_chat_completion import AzureChatCompletion


  async def main():
      from semantic_kernel.functions import KernelFunctionFromPrompt
      from semantic_kernel.kernel import Kernel

      kernel = Kernel()
      kernel.add_service(AzureChatCompletion())

      user_input = input("User Input:> ")

      kernel_function = KernelFunctionFromPrompt(
          function_name="SummarizeText",
          prompt="""
          Summarize the provided unstructured text in a sentence that is easy to understand.
          Text to summarize: {{$user_input}}
          """,
      )

      response = await kernel_function.invoke(kernel=kernel, user_input=user_input)
      print(f"Model Response: {response}")

      """
      Sample Console Output:

      User Input:> I like dogs
      Model Response: The text expresses a preference for dogs.
      """


  if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
  ```

    ```csharp
    var userInput = Console.ReadLine();

    // Define semantic function inline.
    string skPrompt = @"Summarize the provided unstructured text in a sentence that is easy to understand.
                        Text to summarize: {{$userInput}}";
    
    // create the function from the prompt
    KernelFunction summarizeFunc = kernel.CreateFunctionFromPrompt(
        promptTemplate: skPrompt,
        functionName: "SummarizeText"
    );

    //then import into the current kernel
    kernel.ImportPluginFromFunctions("SemanticFunctions", [summarizeFunc]);

    ```

    這裡先有一個模板提示 `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`。注意函數名稱，幫助 Semantic Kernel 了解此函數的用途及何時呼叫。

- **原生函數 (Native function)**：框架也能直接呼叫原生函數來執行任務。以下範例為從檔案讀取內容的函數：

    ```csharp
    public class NativeFunctions {

        [SKFunction, Description("Retrieve content from local file")]
        public async Task<string> RetrieveLocalFile(string fileName, int maxSize = 5000)
        {
            string content = await File.ReadAllTextAsync(fileName);
            if (content.Length <= maxSize) return content;
            return content.Substring(0, maxSize);
        }
    }
    
    //Import native function
    string plugInName = "NativeFunction";
    string functionName = "RetrieveLocalFile";

   //To add the functions to a kernel use the following function
    kernel.ImportPluginFromType<NativeFunctions>();

    ```

- **記憶體 (Memory)**：抽象化並簡化 AI 應用的上下文管理。記憶體是 LLM 應該知道的資訊。你可以將資料存放在向量庫，作為記憶體資料庫或向量資料庫等。以下是簡化範例，將 *facts* 加入記憶體：

    ```csharp
    var facts = new Dictionary<string,string>();
    facts.Add(
        "Azure Machine Learning; https://learn.microsoft.com/azure/machine-learning/",
        @"Azure Machine Learning is a cloud service for accelerating and
        managing the machine learning project lifecycle. Machine learning professionals,
        data scientists, and engineers can use it in their day-to-day workflows"
    );
    
    facts.Add(
        "Azure SQL Service; https://learn.microsoft.com/azure/azure-sql/",
        @"Azure SQL is a family of managed, secure, and intelligent products
        that use the SQL Server database engine in the Azure cloud."
    );
    
    string memoryCollectionName = "SummarizedAzureDocs";
    
    foreach (var fact in facts) {
        await memoryBuilder.SaveReferenceAsync(
            collection: memoryCollectionName,
            description: fact.Key.Split(";")[1].Trim(),
            text: fact.Value,
            externalId: fact.Key.Split(";")[2].Trim(),
            externalSourceName: "Azure Documentation"
        );
    }
    ```

    這些事實會被存入名為 `SummarizedAzureDocs` 的記憶體集合。雖然是簡化範例，但能看出如何將資訊存入記憶體供 LLM 使用。

這就是 Semantic Kernel 框架的基礎，那代理人框架呢？

## Azure AI Agent Service

Azure AI Agent Service 是較新的服務，於 Microsoft Ignite 2024 發表。它允許開發與部署更靈活模型的 AI 代理人，例如可直接呼叫開源 LLM，如 Llama 3、Mistral 與 Cohere。

Azure AI Agent Service 提供更強的企業安全機制與資料儲存方式，適合企業應用。

它與多代理人編排框架如 AutoGen 與 Semantic Kernel 無縫整合。

此服務目前為公開預覽階段，支援 Python 與 C# 來建構代理人。

使用 Semantic Kernel Python，我們可以建立帶有使用者定義插件的 Azure AI Agent：

```python
import asyncio
from typing import Annotated

from azure.identity.aio import DefaultAzureCredential

from semantic_kernel.agents import AzureAIAgent, AzureAIAgentSettings, AzureAIAgentThread
from semantic_kernel.contents import ChatMessageContent
from semantic_kernel.contents import AuthorRole
from semantic_kernel.functions import kernel_function


# Define a sample plugin for the sample
class MenuPlugin:
    """A sample Menu Plugin used for the concept sample."""

    @kernel_function(description="Provides a list of specials from the menu.")
    def get_specials(self) -> Annotated[str, "Returns the specials from the menu."]:
        return """
        Special Soup: Clam Chowder
        Special Salad: Cobb Salad
        Special Drink: Chai Tea
        """

    @kernel_function(description="Provides the price of the requested menu item.")
    def get_item_price(
        self, menu_item: Annotated[str, "The name of the menu item."]
    ) -> Annotated[str, "Returns the price of the menu item."]:
        return "$9.99"


async def main() -> None:
    ai_agent_settings = AzureAIAgentSettings.create()

    async with (
        DefaultAzureCredential() as creds,
        AzureAIAgent.create_client(
            credential=creds,
            conn_str=ai_agent_settings.project_connection_string.get_secret_value(),
        ) as client,
    ):
        # Create agent definition
        agent_definition = await client.agents.create_agent(
            model=ai_agent_settings.model_deployment_name,
            name="Host",
            instructions="Answer questions about the menu.",
        )

        # Create the AzureAI Agent using the defined client and agent definition
        agent = AzureAIAgent(
            client=client,
            definition=agent_definition,
            plugins=[MenuPlugin()],
        )

        # Create a thread to hold the conversation
        # If no thread is provided, a new thread will be
        # created and returned with the initial response
        thread: AzureAIAgentThread | None = None

        user_inputs = [
            "Hello",
            "What is the special soup?",
            "How much does that cost?",
            "Thank you",
        ]

        try:
            for user_input in user_inputs:
                print(f"# User: '{user_input}'")
                # Invoke the agent for the specified thread
                response = await agent.get_response(
                    messages=user_input,
                    thread_id=thread,
                )
                print(f"# {response.name}: {response.content}")
                thread = response.thread
        finally:
            await thread.delete() if thread else None
            await client.agents.delete_agent(agent.id)


if __name__ == "__main__":
    asyncio.run(main())
```

### 核心概念

Azure AI Agent Service 有以下核心概念：

- **代理人 (Agent)**。Azure AI Agent Service 與 Azure AI Foundry 整合。在 AI Foundry 中，AI 代理人是「智慧」微服務，可用來回答問題（RAG）、執行動作或完全自動化工作流程。它結合生成式 AI 模型與工具，讓代理人能存取並互動真實世界資料來源。以下是一個代理人範例：

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    此範例中，代理人使用模型 `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`。代理人配備工具與資源來執行程式碼解譯任務。

- **對話串與訊息 (Thread and messages)**。對話串代表代理人與使用者間的對話或互動。對話串可用來追蹤對話進度、儲存上下文資訊及管理互動狀態。以下為對話串範例：

    ```python
    thread = project_client.agents.create_thread()
    message = project_client.agents.create_message(
        thread_id=thread.id,
        role="user",
        content="Could you please create a bar chart for the operating profit using the following data and provide the file to me? Company A: $1.2 million, Company B: $2.5 million, Company C: $3.0 million, Company D: $1.8 million",
    )
    
    # Ask the agent to perform work on the thread
    run = project_client.agents.create_and_process_run(thread_id=thread.id, agent_id=agent.id)
    
    # Fetch and log all messages to see the agent's response
    messages = project_client.agents.list_messages(thread_id=thread.id)
    print(f"Messages: {messages}")
    ```

    在上面程式碼中，建立了一個對話串，接著發送訊息給對話串。呼叫 `create_and_process_run` 後，代理人會針對該對話串執行工作。最後擷取並紀錄訊息，以查看代理人回應。訊息可為文字、圖片或檔案，表示代理人的工作成果。開發者可利用這些資訊進一步處理回應或呈現給使用者。

- **與其他 AI 框架整合**。Azure AI Agent Service 能與 AutoGen、Semantic Kernel 等框架互動，表示你可以在這些框架之一中構建應用部分，再用 Agent Service 做為編排者，或全部使用 Agent Service 來建置。

**使用案例**：Azure AI Agent Service 適合需要安全、可擴展及靈活 AI 代理人部署的企業應用。

## 這些框架有什麼差異？

這些框架看起來有很多重疊，但在設計、能力與目標使用場景上有些關鍵差異：

- **AutoGen**：專注於多代理人系統的前沿研究與實驗框架。是快速實驗與原型開發複雜多代理人系統的最佳選擇。
- **Semantic Kernel**：適合用於生產環境的代理人函式庫，打造企業級代理人應用。聚焦事件驅動、分散式代理人應用，支援多種 LLM 與 SLM、工具以及單一或多代理人設計模式。
- **Azure AI Agent Service**：Azure Foundry 中的代理人平台與部署服務。支援多模型建置與 Azure 服務連接，如 Azure OpenAI、Azure AI Search、Bing Search 與程式碼執行。

還是不確定怎麼選？

### 使用案例

讓我們透過常見使用情境來幫助你：

> 問：我正在實驗、學習並建構概念驗證代理人應用，想快速建立與測試
>

> 答：AutoGen 是此場景的好選擇，因為它專注於事件驅動、分散式代理人應用，並支援進階多代理人設計模式。

> 問：為什麼 AutoGen 比 Semantic Kernel 和 Azure AI Agent Service 更適合此用例？
>
> 答：AutoGen 專為事件驅動、分散式代理人應用設計，非常適合自動化程式碼生成和資料分析任務。它提供建構複雜多代理人系統所需的工具與能力。

> 問：看起來 Azure AI Agent Service 也能用，有程式碼生成等工具？
>
> 答：是的，Azure AI Agent Service 是代理人平台服務，內建多模型、Azure AI Search、Bing Search 及 Azure Functions 支援。可輕鬆在 Foundry Portal 建構代理人並大規模部署。

> 問：我還是不確定，給我一個選擇吧
>
> 答：建議先用 Semantic Kernel 建構應用，再用 Azure AI Agent Service 部署代理人。這樣可輕鬆持久化代理人，並利用 Semantic Kernel 的多代理人建構能力。此外，Semantic Kernel 在 AutoGen 中有連接器，方便兩框架整合使用。

讓我們用表格總結關鍵差異：

| 框架              | 重點                              | 核心概念                         | 使用案例                 |
|------------------|---------------------------------|------------------------------|------------------------|
| AutoGen          | 事件驅動、分散式代理人應用             | 代理人、角色、功能、資料              | 程式碼生成、資料分析任務       |
| Semantic Kernel  | 理解並生成類人文字內容                  | 代理人、模組化元件、協作                | 自然語言理解、內容生成         |
| Azure AI Agent Service | 靈活模型、企業安全、程式碼生成、工具呼叫 | —（未提供完整表格內容）               | —（未提供完整表格內容）         |
## 前一課

[AI 代理與代理使用案例介紹](../01-intro-to-ai-agents/README.md)

## 下一課

[理解代理設計模式](../03-agentic-design-patterns/README.md)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件之母語版本應視為權威資料來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生之任何誤解或誤譯負責。