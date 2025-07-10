<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T07:08:32+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "zh"
}
-->
根据维基百科，actor 是“并发计算的基本构建块。它在接收到消息后，可以：做出本地决策、创建更多的 actors、发送更多消息，以及决定如何响应接收到的下一条消息”。

**使用场景**：自动化代码生成、数据分析任务，以及构建用于规划和研究功能的自定义代理。

以下是 AutoGen 的一些重要核心概念：

- **Agents（代理）**。代理是一个软件实体，它：
  - **通过消息进行通信**，这些消息可以是同步或异步的。
  - **维护自己的状态**，该状态可以被传入的消息修改。
  - **执行动作**以响应接收到的消息或状态变化。这些动作可能修改代理的状态并产生外部效果，例如更新消息日志、发送新消息、执行代码或调用 API。

  下面是一个简短的代码片段，展示如何创建具有聊天功能的代理：

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

    在上面的代码中，`MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` 是一个预构建的代理，能够处理聊天完成。

    下面让 AutoGen 知道这个代理类型并启动程序：

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    在上面的代码中，代理被注册到运行时，随后发送消息给代理，产生如下输出：

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **多代理（Multi agents）**。AutoGen 支持创建多个代理协同工作以完成复杂任务。代理可以通信、共享信息并协调行动，更高效地解决问题。要创建多代理系统，可以定义不同类型的代理，赋予其专门的功能和角色，如数据检索、分析、决策和用户交互。下面是一个示例：

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

    在上述代码中，有一个 `GroupChatManager` 被注册到运行时。该管理器负责协调不同类型代理之间的交互，比如写手、插画师、编辑和用户。

- **代理运行时（Agent Runtime）**。框架提供运行时环境，支持代理间通信，管理它们的身份和生命周期，并实施安全和隐私边界。这意味着你可以在安全受控的环境中运行代理，确保它们安全高效地交互。有两个值得关注的运行时：
  - **独立运行时（Stand-alone runtime）**。适合单进程应用，所有代理用相同编程语言实现并运行在同一进程中。工作原理示意如下：

应用栈

    *代理通过运行时发送消息通信，运行时管理代理的生命周期*

  - **分布式代理运行时（Distributed agent runtime）**，适合多进程应用，代理可能用不同编程语言实现并运行在不同机器上。工作原理示意如下：

## Semantic Kernel + 代理框架

Semantic Kernel 是一个面向企业的 AI 协同 SDK。它由 AI 和内存连接器以及一个代理框架组成。

先介绍一些核心组件：

- **AI 连接器**：这是与外部 AI 服务和数据源的接口，支持 Python 和 C#。

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

    这里展示了如何创建一个 kernel 并添加聊天完成服务。Semantic Kernel 创建了与外部 AI 服务（本例为 Azure OpenAI 聊天完成）的连接。

- **插件（Plugins）**：封装应用可调用的函数。既有现成插件，也可自定义。相关概念是“提示函数（prompt functions）”。与其用自然语言提示函数调用，不如将某些函数广播给模型，模型根据当前聊天上下文选择调用这些函数完成请求或查询。示例如下：

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

    这里你先看到一个模板提示 `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`。注意函数名称，帮助 Semantic Kernel 理解函数作用及调用时机。

- **本地函数（Native function）**：框架还可以直接调用本地函数执行任务。下面是一个从文件读取内容的示例：

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

- **内存（Memory）**：抽象并简化 AI 应用的上下文管理。内存的理念是让 LLM 记住信息。你可以将信息存储在向量存储中，类似内存数据库或向量数据库。下面是一个极简示例，向内存添加“事实”：

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

    这些事实存储在内存集合 `SummarizedAzureDocs` 中。虽然示例简单，但可以看出如何存储信息供 LLM 使用。

这就是 Semantic Kernel 框架的基础，代理框架又是怎样的呢？

## Azure AI Agent Service

Azure AI Agent Service 是较新的产品，于 Microsoft Ignite 2024 发布。它支持更灵活的模型开发和部署，比如直接调用开源 LLM，如 Llama 3、Mistral 和 Cohere。

Azure AI Agent Service 提供更强的企业安全机制和数据存储方式，适合企业级应用。

它可以开箱即用地与多代理编排框架如 AutoGen 和 Semantic Kernel 配合使用。

该服务目前处于公开预览阶段，支持用 Python 和 C# 构建代理。

使用 Semantic Kernel Python，我们可以创建带有用户定义插件的 Azure AI 代理：

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

- **Agent（代理）**。Azure AI Agent Service 集成了 Azure AI Foundry。在 AI Foundry 中，AI Agent 是一个“智能”微服务，可用于回答问题（RAG）、执行操作或完全自动化工作流。它通过结合生成式 AI 模型与访问和交互现实世界数据源的工具来实现。下面是一个代理示例：

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    该示例中，代理使用模型 `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` 创建。代理配备了执行代码解释任务的工具和资源。

- **线程和消息（Thread and messages）**。线程是另一个重要概念，代表代理与用户之间的对话或交互。线程用于跟踪对话进度、存储上下文信息和管理交互状态。下面是线程示例：

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

    上述代码中创建了线程，随后向线程发送消息。通过调用 `create_and_process_run`，代理被请求对线程执行工作。最后获取消息并记录，查看代理的响应。消息显示用户与代理间对话进展。消息类型可以不同，如文本、图片或文件，表示代理工作产生的结果。开发者可据此进一步处理响应或呈现给用户。

- **与其他 AI 框架集成**。Azure AI Agent Service 能与 AutoGen 和 Semantic Kernel 等框架交互，这意味着你可以部分应用用这些框架构建，例如用 Agent Service 作为编排器，或者全部用 Agent Service 构建。

**使用场景**：Azure AI Agent Service 面向需要安全、可扩展和灵活 AI 代理部署的企业应用。

## 这些框架有什么区别？

这些框架确实存在较多重叠，但在设计、功能和目标用例上有一些关键差异：

## AutoGen

AutoGen 是微软研究院 AI Frontiers Lab 开发的开源框架。它聚焦于事件驱动的分布式*代理*应用，支持多 LLM 和 SLM、工具以及高级多代理设计模式。

AutoGen 构建于代理核心概念之上，代理是自主实体，能感知环境、做决策并采取行动以达成特定目标。代理通过异步消息通信，支持独立并行工作，提高系统可扩展性和响应性。

根据维基百科，actor 是“并发计算的基本构建块。它在接收到消息后，可以：做出本地决策、创建更多的 actors、发送更多消息，以及决定如何响应接收到的下一条消息”。

**使用场景**：自动化代码生成、数据分析任务，以及构建用于规划和研究功能的自定义代理。

以下是 AutoGen 的一些重要核心概念：

- **Agents（代理）**。代理是一个软件实体，它：
  - **通过消息进行通信**，这些消息可以是同步或异步的。
  - **维护自己的状态**，该状态可以被传入的消息修改。
  - **执行动作**以响应接收到的消息或状态变化。这些动作可能修改代理的状态并产生外部效果，例如更新消息日志、发送新消息、执行代码或调用 API。

  下面是一个简短的代码片段，展示如何创建具有聊天功能的代理：

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

    在上面的代码中，`MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` 是一个预构建的代理，能够处理聊天完成。

    下面让 AutoGen 知道这个代理类型并启动程序：

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    在上面的代码中，代理被注册到运行时，随后发送消息给代理，产生如下输出：

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **多代理（Multi agents）**。AutoGen 支持创建多个代理协同工作以完成复杂任务。代理可以通信、共享信息并协调行动，更高效地解决问题。要创建多代理系统，可以定义不同类型的代理，赋予其专门的功能和角色，如数据检索、分析、决策和用户交互。下面是一个示例：

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

    在上述代码中，有一个 `GroupChatManager` 被注册到运行时。该管理器负责协调不同类型代理之间的交互，比如写手、插画师、编辑和用户。

- **代理运行时（Agent Runtime）**。框架提供运行时环境，支持代理间通信，管理它们的身份和生命周期，并实施安全和隐私边界。这意味着你可以在安全受控的环境中运行代理，确保它们安全高效地交互。有两个值得关注的运行时：
  - **独立运行时（Stand-alone runtime）**。适合单进程应用，所有代理用相同编程语言实现并运行在同一进程中。工作原理示意如下：

应用栈

    *代理通过运行时发送消息通信，运行时管理代理的生命周期*

  - **分布式代理运行时（Distributed agent runtime）**，适合多进程应用，代理可能用不同编程语言实现并运行在不同机器上。工作原理示意如下：

## Semantic Kernel + 代理框架

Semantic Kernel 是一个面向企业的 AI 协同 SDK。它由 AI 和内存连接器以及一个代理框架组成。

先介绍一些核心组件：

- **AI 连接器**：这是与外部 AI 服务和数据源的接口，支持 Python 和 C#。

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

    这里展示了如何创建一个 kernel 并添加聊天完成服务。Semantic Kernel 创建了与外部 AI 服务（本例为 Azure OpenAI 聊天完成）的连接。

- **插件（Plugins）**：封装应用可调用的函数。既有现成插件，也可自定义。相关概念是“提示函数（prompt functions）”。与其用自然语言提示函数调用，不如将某些函数广播给模型，模型根据当前聊天上下文选择调用这些函数完成请求或查询。示例如下：

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

    这里你先看到一个模板提示 `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`。注意函数名称，帮助 Semantic Kernel 理解函数作用及调用时机。

- **本地函数（Native function）**：框架还可以直接调用本地函数执行任务。下面是一个从文件读取内容的示例：

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

- **内存（Memory）**：抽象并简化 AI 应用的上下文管理。内存的理念是让 LLM 记住信息。你可以将信息存储在向量存储中，类似内存数据库或向量数据库。下面是一个极简示例，向内存添加“事实”：

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

    这些事实存储在内存集合 `SummarizedAzureDocs` 中。虽然示例简单，但可以看出如何存储信息供 LLM 使用。

这就是 Semantic Kernel 框架的基础，代理框架又是怎样的呢？

## Azure AI Agent Service

Azure AI Agent Service 是较新的产品，于 Microsoft Ignite 2024 发布。它支持更灵活的模型开发和部署，比如直接调用开源 LLM，如 Llama 3、Mistral 和 Cohere。

Azure AI Agent Service 提供更强的企业安全机制和数据存储方式，适合企业级应用。

它可以开箱即用地与多代理编排框架如 AutoGen 和 Semantic Kernel 配合使用。

该服务目前处于公开预览阶段，支持用 Python 和 C# 构建代理。

使用 Semantic Kernel Python，我们可以创建带有用户定义插件的 Azure AI 代理：

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

- **Agent（代理）**。Azure AI Agent Service 集成了 Azure AI Foundry。在 AI Foundry 中，AI Agent 是一个“智能”微服务，可用于回答问题（RAG）、执行操作或完全自动化工作流。它通过结合生成式 AI 模型与访问和交互现实世界数据源的工具来实现。下面是一个代理示例：

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    该示例中，代理使用模型 `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` 创建。代理配备了执行代码解释任务的工具和资源。

- **线程和消息（Thread and messages）**。线程是另一个重要概念，代表代理与用户之间的对话或交互。线程用于跟踪对话进度、存储上下文信息和管理交互状态。下面是线程示例：

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

    上述代码中创建了线程，随后向线程发送消息。通过调用 `create_and_process_run`，代理被请求对线程执行工作。最后获取消息并记录，查看代理的响应。消息显示用户与代理间对话进展。消息类型可以不同，如文本、图片或文件，表示代理工作产生的结果。开发者可据此进一步处理响应或呈现给用户。

- **与其他 AI 框架集成**。Azure AI Agent Service 能与 AutoGen 和 Semantic Kernel 等框架交互，这意味着你可以部分应用用这些框架构建，例如用 Agent Service 作为编排器，或者全部用 Agent Service 构建。

**使用场景**：Azure AI Agent Service 面向需要安全、可扩展和灵活 AI 代理部署的企业应用。

## 这些框架有什么区别？

这些框架确实存在较多重叠，但在设计、功能和目标用例上有一些关键差异：

- **AutoGen**：是一个专注于多代理系统前沿研究的实验框架。它是实验和原型设计复杂多代理系统的最佳选择。
- **Semantic Kernel**：是面向生产环境的代理库，用于构建企业级代理应用。聚焦事件驱动、分布式代理应用，支持多 LLM 和 SLM、工具以及单/多代理设计模式。
- **Azure AI Agent Service**：是 Azure Foundry 中的代理平台和部署服务。提供与 Azure OpenAI、Azure AI Search、Bing Search 和代码执行等 Azure 服务的连接支持。

还不确定选哪个？

### 使用场景

我们通过几个常见场景帮你做参考：

> 问：我正在实验、学习和构建代理应用的概念验证，想快速构建和试验。
>
> 答：AutoGen 是不错的选择，因为它专注事件驱动、分布式代理应用，支持高级多代理设计模式。

> 问：为什么在这个场景下 AutoGen 比 Semantic Kernel 和 Azure AI Agent Service 更合适？
>
> 答：AutoGen 专为事件驱动、分布式代理应用设计，非常适合自动化代码生成和数据分析任务。它提供构建复杂多代理系统所需的工具和能力。

> 问：听起来 Azure AI Agent Service 也可以用，它有代码生成和更多工具？
>
> 答：是的，Azure AI Agent Service 是一个代理平台服务，内置多模型支持、Azure AI Search、Bing Search 和 Azure Functions。它让你轻松在 Foundry 门户构建代理并大规模部署。

> 问：我还是不确定，能给我一个建议吗？
>
> 答：一个不错的方案是先用 Semantic Kernel 构建应用，再用 Azure AI Agent Service 部署代理。这样既能轻松持久化代理，又能利用 Semantic Kernel 构建多代理系统的能力。此外，Semantic Kernel 在 AutoGen 中有连接器，方便两个框架协同使用。

我们用表格总结关键区别：

| 框架 | 重点 | 核心概念 | 使用场景 |
| --- | --- | --- | --- |
| AutoGen | 事件驱动、分布式代理应用 | 代理、角色、函数、数据 | 代码生成、数据分析任务 |
| Semantic Kernel | 理解和生成类人文本内容 | 代理、模块组件、协作 | 自然语言理解、内容生成 |
| Azure AI Agent Service | 灵活模型、企业安全、代码生成、工具调用 | 代理、线程、消息、多模型集成 | 企业级安全可扩展代理部署 |
## 上一课

[AI 代理及其使用案例介绍](../01-intro-to-ai-agents/README.md)

## 下一课

[理解代理设计模式](../03-agentic-design-patterns/README.md)

**免责声明**：  
本文件使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们力求准确，但请注意自动翻译可能包含错误或不准确之处。原始文件的原文版本应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们不承担任何责任。