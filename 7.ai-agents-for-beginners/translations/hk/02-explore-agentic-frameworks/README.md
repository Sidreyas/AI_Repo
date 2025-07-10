<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T07:35:54+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "hk"
}
-->
根據維基百科，actor 是 _並行計算的基本構建單元。當收到訊息時，actor 可以：做出本地決策、創建更多 actor、發送更多訊息，以及決定如何回應下一個收到的訊息_。

**使用案例**：自動化代碼生成、數據分析任務，以及為規劃和研究功能建立自訂代理。

以下是 AutoGen 的一些重要核心概念：

- **Agents（代理）**。代理是一個軟件實體，具備以下特性：
  - **透過訊息溝通**，這些訊息可以是同步或非同步的。
  - **維護自身狀態**，該狀態可被收到的訊息修改。
  - **根據收到的訊息或狀態變化執行動作**。這些動作可能會改變代理的狀態並產生外部效應，例如更新訊息日誌、發送新訊息、執行代碼或調用 API。
    
  這裡有一段簡短的程式碼範例，展示如何創建具備聊天功能的代理：

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
    
    在上述程式碼中，`MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` 是一個內建代理，能處理聊天完成。

    接著讓 AutoGen 知道此代理類型並啟動程式：

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    上述程式碼中，代理被註冊到執行環境，然後向代理發送訊息，結果輸出如下：

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **多代理**。AutoGen 支援創建多個能協同工作的代理。代理可以互相溝通、分享資訊並協調行動，以更有效地解決複雜任務。要建立多代理系統，可以定義不同類型的代理，分別負責資料檢索、分析、決策和使用者互動等專門功能。以下示範這種創建方式：

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

    在上述程式碼中，我們有一個註冊到執行環境的 `GroupChatManager`，負責協調不同類型代理間的互動，如作家、插畫師、編輯及使用者。

- **代理執行環境**。框架提供執行環境，促進代理間溝通，管理代理身份和生命週期，並強制執行安全與隱私邊界。這意味著你可以在安全且受控的環境中運行代理，確保代理能安全有效地互動。有兩種重要執行環境：
  - **獨立執行環境**。適合所有代理以相同程式語言在同一進程中實作的單進程應用。以下是其運作示意：

應用堆疊

    *代理透過執行環境以訊息溝通，執行環境管理代理的生命週期*

  - **分散式代理執行環境**，適用於多進程應用，代理可能以不同程式語言實作並分布於不同機器。以下是其運作示意：

## Semantic Kernel + 代理框架

Semantic Kernel 是一個企業級的 AI 編排 SDK。它包含 AI 和記憶體連接器，以及一個代理框架。

先介紹一些核心組件：

- **AI 連接器**：這是連接外部 AI 服務和資料來源的介面，支援 Python 和 C#。

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

    這裡有一個簡單範例，示範如何建立 kernel 並新增聊天完成服務。Semantic Kernel 會建立與外部 AI 服務（此例為 Azure OpenAI 聊天完成）的連線。

- **插件**：封裝應用可用的函式。既有現成插件，也能自訂。相關概念為「prompt 函式」。不需用自然語言提示函式調用，而是將某些函式廣播給模型。根據當前聊天上下文，模型可選擇呼叫這些函式完成請求或查詢。範例如下：

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

    這裡先有一個範本提示 `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`。請注意函式名稱，協助 Semantic Kernel 理解函式作用及呼叫時機。

- **原生函式**：框架也能直接呼叫原生函式以執行任務。以下為讀取檔案內容的範例：

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

- **記憶體**：抽象並簡化 AI 應用的上下文管理。記憶體是 LLM 應該知道的資訊。可將資訊存於向量庫，實際上是記憶體資料庫或向量資料庫。以下為一個簡化範例，將 *事實* 新增至記憶體：

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

    這些事實儲存在記憶體集合 `SummarizedAzureDocs` 中。雖是簡化範例，但可見如何將資訊存入記憶體供 LLM 使用。

以上是 Semantic Kernel 框架的基礎，那代理框架呢？

## Azure AI Agent Service

Azure AI Agent Service 是較新的服務，於 Microsoft Ignite 2024 推出。它允許開發與部署更靈活模型的 AI 代理，例如直接調用開源 LLM，如 Llama 3、Mistral 和 Cohere。

Azure AI Agent Service 提供更強的企業安全機制和資料存儲方式，適合企業應用。

它與 AutoGen、Semantic Kernel 等多代理編排框架即裝即用整合。

目前服務處於公開預覽階段，支援 Python 和 C# 建構代理。

使用 Semantic Kernel Python，可建立帶有自訂插件的 Azure AI 代理：

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

- **代理（Agent）**。Azure AI Agent Service 與 Azure AI Foundry 整合。在 AI Foundry 中，AI 代理扮演「智慧」微服務角色，可用於回答問題（RAG）、執行操作或完全自動化工作流程。它結合生成式 AI 模型的能力與可存取、互動真實世界資料來源的工具。以下為代理範例：

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    此範例中，代理使用模型 `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`，並配備工具和資源以執行代碼解釋任務。

- **對話線程與訊息**。線程是另一重要概念，代表代理與使用者間的對話或互動。線程可用來追蹤對話進度、儲存上下文資訊，並管理互動狀態。以下為線程範例：

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

    上述程式碼建立一個線程，接著向線程發送訊息。透過呼叫 `create_and_process_run`，代理會在該線程上執行工作。最後取得並記錄訊息，查看代理回應。訊息顯示使用者與代理間對話進展。訊息類型可包含文字、圖片或檔案，表示代理工作產生的結果，例如圖片或文字回應。開發者可利用這些資訊進一步處理回應或呈現給使用者。

- **與其他 AI 框架整合**。Azure AI Agent Service 可與 AutoGen、Semantic Kernel 等框架互動，表示你可在其中一框架建構部分應用，再用代理服務做為編排器，或全部使用代理服務建構。

**使用案例**：Azure AI Agent Service 設計用於需要安全、可擴展及靈活 AI 代理部署的企業應用。

## 這些框架有何差異？

這些框架確實有不少重疊，但在設計、能力和目標使用案例上有些關鍵差異：

## AutoGen

AutoGen 是由 Microsoft Research AI Frontiers Lab 開發的開源框架，專注於事件驅動、分散式 *agentic* 應用，支援多個 LLM 和 SLM、工具以及先進的多代理設計模式。

AutoGen 建立於代理核心概念之上，代理是能感知環境、做決策並採取行動以達成特定目標的自治實體。代理透過非同步訊息溝通，使其能獨立且並行運作，提升系統擴展性與反應速度。

根據維基百科，actor 是 _並行計算的基本構建單元。當收到訊息時，actor 可以：做出本地決策、創建更多 actor、發送更多訊息，以及決定如何回應下一個收到的訊息_。

**使用案例**：自動化代碼生成、數據分析任務，以及為規劃和研究功能建立自訂代理。

以下是 AutoGen 的一些重要核心概念：

- **Agents（代理）**。代理是一個軟件實體，具備以下特性：
  - **透過訊息溝通**，這些訊息可以是同步或非同步的。
  - **維護自身狀態**，該狀態可被收到的訊息修改。
  - **根據收到的訊息或狀態變化執行動作**。這些動作可能會改變代理的狀態並產生外部效應，例如更新訊息日誌、發送新訊息、執行代碼或調用 API。
    
  這裡有一段簡短的程式碼範例，展示如何創建具備聊天功能的代理：

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
    
    在上述程式碼中，`MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` 是一個內建代理，能處理聊天完成。

    接著讓 AutoGen 知道此代理類型並啟動程式：

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    上述程式碼中，代理被註冊到執行環境，然後向代理發送訊息，結果輸出如下：

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **多代理**。AutoGen 支援創建多個能協同工作的代理。代理可以互相溝通、分享資訊並協調行動，以更有效地解決複雜任務。要建立多代理系統，可以定義不同類型的代理，分別負責資料檢索、分析、決策和使用者互動等專門功能。以下示範這種創建方式：

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

    在上述程式碼中，我們有一個註冊到執行環境的 `GroupChatManager`，負責協調不同類型代理間的互動，如作家、插畫師、編輯及使用者。

- **代理執行環境**。框架提供執行環境，促進代理間溝通，管理代理身份和生命週期，並強制執行安全與隱私邊界。這意味著你可以在安全且受控的環境中運行代理，確保代理能安全有效地互動。有兩種重要執行環境：
  - **獨立執行環境**。適合所有代理以相同程式語言在同一進程中實作的單進程應用。以下是其運作示意：

應用堆疊

    *代理透過執行環境以訊息溝通，執行環境管理代理的生命週期*

  - **分散式代理執行環境**，適用於多進程應用，代理可能以不同程式語言實作並分布於不同機器。以下是其運作示意：

## Semantic Kernel + 代理框架

Semantic Kernel 是一個企業級的 AI 編排 SDK。它包含 AI 和記憶體連接器，以及一個代理框架。

先介紹一些核心組件：

- **AI 連接器**：這是連接外部 AI 服務和資料來源的介面，支援 Python 和 C#。

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

    這裡有一個簡單範例，示範如何建立 kernel 並新增聊天完成服務。Semantic Kernel 會建立與外部 AI 服務（此例為 Azure OpenAI 聊天完成）的連線。

- **插件**：封裝應用可用的函式。既有現成插件，也能自訂。相關概念為「prompt 函式」。不需用自然語言提示函式調用，而是將某些函式廣播給模型。根據當前聊天上下文，模型可選擇呼叫這些函式完成請求或查詢。範例如下：

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

    這裡先有一個範本提示 `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`。請注意函式名稱，協助 Semantic Kernel 理解函式作用及呼叫時機。

- **原生函式**：框架也能直接呼叫原生函式以執行任務。以下為讀取檔案內容的範例：

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

- **記憶體**：抽象並簡化 AI 應用的上下文管理。記憶體是 LLM 應該知道的資訊。可將資訊存於向量庫，實際上是記憶體資料庫或向量資料庫。以下為一個簡化範例，將 *事實* 新增至記憶體：

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

    這些事實儲存在記憶體集合 `SummarizedAzureDocs` 中。雖是簡化範例，但可見如何將資訊存入記憶體供 LLM 使用。

以上是 Semantic Kernel 框架的基礎，那代理框架呢？

## Azure AI Agent Service

Azure AI Agent Service 是較新的服務，於 Microsoft Ignite 2024 推出。它允許開發與部署更靈活模型的 AI 代理，例如直接調用開源 LLM，如 Llama 3、Mistral 和 Cohere。

Azure AI Agent Service 提供更強的企業安全機制和資料存儲方式，適合企業應用。

它與 AutoGen、Semantic Kernel 等多代理編排框架即裝即用整合。

目前服務處於公開預覽階段，支援 Python 和 C# 建構代理。

使用 Semantic Kernel Python，可建立帶有自訂插件的 Azure AI 代理：

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

- **代理（Agent）**。Azure AI Agent Service 與 Azure AI Foundry 整合。在 AI Foundry 中，AI 代理扮演「智慧」微服務角色，可用於回答問題（RAG）、執行操作或完全自動化工作流程。它結合生成式 AI 模型的能力與可存取、互動真實世界資料來源的工具。以下為代理範例：

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    此範例中，代理使用模型 `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`，並配備工具和資源以執行代碼解釋任務。

- **對話線程與訊息**。線程是另一重要概念，代表代理與使用者間的對話或互動。線程可用來追蹤對話進度、儲存上下文資訊，並管理互動狀態。以下為線程範例：

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

    上述程式碼建立一個線程，接著向線程發送訊息。透過呼叫 `create_and_process_run`，代理會在該線程上執行工作。最後取得並記錄訊息，查看代理回應。訊息顯示使用者與代理間對話進展。訊息類型可包含文字、圖片或檔案，表示代理工作產生的結果，例如圖片或文字回應。開發者可利用這些資訊進一步處理回應或呈現給使用者。

- **與其他 AI 框架整合**。Azure AI Agent Service 可與 AutoGen、Semantic Kernel 等框架互動，表示你可在其中一框架建構部分應用，再用代理服務做為編排器，或全部使用代理服務建構。

**使用案例**：Azure AI Agent Service 設計用於需要安全、可擴展及靈活 AI 代理部署的企業應用。

## 這些框架有何差異？

這些框架確實有不少重疊，但在設計、能力和目標使用案例上有些關鍵差異：

- **AutoGen**：專注於事件驅動、分散式代理應用的實驗框架
## 上一課

[AI 代理及代理使用案例簡介](../01-intro-to-ai-agents/README.md)

## 下一課

[理解代理設計模式](../03-agentic-design-patterns/README.md)

**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議使用專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或誤釋承擔責任。