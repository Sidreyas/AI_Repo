<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T08:34:03+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "ko"
}
-->
. 위키피디아에 따르면, 액터(actor)는 _동시 계산의 기본 구성 요소입니다. 수신한 메시지에 응답하여 액터는 로컬 결정을 내리고, 더 많은 액터를 생성하며, 더 많은 메시지를 보내고, 다음에 수신할 메시지에 어떻게 응답할지 결정할 수 있습니다_.

**사용 사례**: 코드 생성 자동화, 데이터 분석 작업, 계획 및 연구 기능을 위한 맞춤형 에이전트 구축.

AutoGen의 중요한 핵심 개념은 다음과 같습니다:

- **에이전트(Agents)**. 에이전트는 다음과 같은 소프트웨어 엔티티입니다:
  - **메시지를 통해 통신**하며, 이 메시지는 동기식 또는 비동기식일 수 있습니다.
  - **자신만의 상태를 유지**하며, 수신된 메시지에 의해 상태가 변경될 수 있습니다.
  - **수신된 메시지나 상태 변화에 따라 동작을 수행**합니다. 이러한 동작은 에이전트 상태를 변경하거나 메시지 로그 업데이트, 새로운 메시지 전송, 코드 실행, API 호출 등의 외부 효과를 생성할 수 있습니다.
    
  다음은 채팅 기능을 가진 자체 에이전트를 생성하는 간단한 코드 스니펫입니다:

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
    
    이전 코드에서 `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent`는 채팅 완성을 처리할 수 있는 사전 구축된 에이전트입니다.

    이제 AutoGen에 이 에이전트 유형을 알려주고 프로그램을 시작해 봅시다:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    이전 코드에서 에이전트가 런타임에 등록되고, 에이전트에 메시지가 전송되어 다음과 같은 출력이 생성됩니다:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **다중 에이전트(Multi agents)**. AutoGen은 여러 에이전트를 생성하여 함께 작업할 수 있도록 지원합니다. 에이전트는 통신하고 정보를 공유하며 행동을 조율하여 더 효율적으로 문제를 해결할 수 있습니다. 다중 에이전트 시스템을 만들려면 데이터 검색, 분석, 의사결정, 사용자 상호작용 등과 같은 전문화된 기능과 역할을 가진 다양한 유형의 에이전트를 정의할 수 있습니다. 다음은 그런 생성 과정의 예입니다:

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

    이전 코드에서는 `GroupChatManager`가 런타임에 등록되어 있습니다. 이 매니저는 작가, 일러스트레이터, 편집자, 사용자 등 다양한 유형의 에이전트 간 상호작용을 조율하는 역할을 합니다.

- **에이전트 런타임(Agent Runtime)**. 이 프레임워크는 에이전트 간 통신을 가능하게 하는 런타임 환경을 제공하며, 에이전트의 신원과 수명 주기를 관리하고 보안 및 개인정보 보호 경계를 강화합니다. 즉, 안전하고 통제된 환경에서 에이전트를 실행할 수 있어 에이전트가 안전하고 효율적으로 상호작용할 수 있습니다. 관심 있는 두 가지 런타임이 있습니다:
  - **독립 실행형 런타임(Stand-alone runtime)**. 모든 에이전트가 동일한 프로그래밍 언어로 구현되고 동일 프로세스에서 실행되는 단일 프로세스 애플리케이션에 적합합니다. 작동 방식을 다음과 같이 설명할 수 있습니다:

애플리케이션 스택

    *에이전트는 런타임을 통해 메시지로 통신하며, 런타임은 에이전트의 수명 주기를 관리합니다*

  - **분산 에이전트 런타임(Distributed agent runtime)**. 에이전트가 서로 다른 프로그래밍 언어로 구현되고 서로 다른 머신에서 실행되는 다중 프로세스 애플리케이션에 적합합니다. 작동 방식을 다음과 같이 설명할 수 있습니다:

## Semantic Kernel + Agent Framework

Semantic Kernel은 엔터프라이즈용 AI 오케스트레이션 SDK입니다. AI 및 메모리 커넥터와 에이전트 프레임워크로 구성되어 있습니다.

먼저 핵심 구성 요소부터 살펴보겠습니다:

- **AI 커넥터(AI Connectors)**: Python과 C# 모두에서 외부 AI 서비스 및 데이터 소스와 인터페이스하는 기능입니다.

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

    여기서는 커널을 생성하고 채팅 완성 서비스를 추가하는 간단한 예를 보여줍니다. Semantic Kernel은 외부 AI 서비스, 이 경우 Azure OpenAI 채팅 완성에 연결을 생성합니다.

- **플러그인(Plugins)**: 애플리케이션에서 사용할 수 있는 기능을 캡슐화합니다. 기본 제공 플러그인과 사용자가 직접 생성할 수 있는 커스텀 플러그인이 있습니다. 관련 개념으로 "프롬프트 함수(prompt functions)"가 있습니다. 함수 호출을 위해 자연어 신호를 제공하는 대신 특정 함수를 모델에 브로드캐스트합니다. 현재 채팅 컨텍스트에 따라 모델은 요청이나 쿼리를 완료하기 위해 이 함수들 중 하나를 호출할 수 있습니다. 예시는 다음과 같습니다:

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

    여기서는 템플릿 프롬프트 `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`가 있습니다. 이 함수 이름은 Semantic Kernel이 함수의 역할과 호출 시기를 이해하도록 돕습니다.

- **네이티브 함수(Native function)**: 프레임워크가 직접 호출하여 작업을 수행하는 네이티브 함수도 있습니다. 예를 들어 파일에서 내용을 가져오는 함수는 다음과 같습니다:

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

- **메모리(Memory)**: AI 앱의 컨텍스트 관리를 추상화하고 단순화합니다. 메모리는 LLM이 알아야 할 정보를 저장하는 공간입니다. 이 정보는 벡터 저장소, 즉 인메모리 데이터베이스나 벡터 데이터베이스 등에 저장될 수 있습니다. 다음은 매우 단순화된 시나리오로, *facts*를 메모리에 추가하는 예시입니다:

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

    이 사실들은 `SummarizedAzureDocs`라는 메모리 컬렉션에 저장됩니다. 매우 단순한 예지만, LLM이 사용할 정보를 메모리에 저장하는 방법을 알 수 있습니다.

이상이 Semantic Kernel 프레임워크의 기본 내용이며, 에이전트 프레임워크는 어떤가요?

## Azure AI Agent Service

Azure AI Agent Service는 Microsoft Ignite 2024에서 소개된 최신 서비스입니다. Llama 3, Mistral, Cohere 같은 오픈 소스 LLM을 직접 호출하는 등 더 유연한 모델로 AI 에이전트를 개발 및 배포할 수 있습니다.

엔터프라이즈 보안 메커니즘과 데이터 저장 방식을 강화하여 기업용 애플리케이션에 적합합니다.

AutoGen, Semantic Kernel 같은 다중 에이전트 오케스트레이션 프레임워크와 즉시 연동됩니다.

현재 퍼블릭 프리뷰 상태이며 Python과 C#을 지원하여 에이전트를 구축할 수 있습니다.

Semantic Kernel Python을 사용해 사용자 정의 플러그인으로 Azure AI 에이전트를 생성하는 예:

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

### 핵심 개념

Azure AI Agent Service의 핵심 개념은 다음과 같습니다:

- **에이전트(Agent)**. Azure AI Agent Service는 Azure AI Foundry와 통합됩니다. AI Foundry 내에서 AI 에이전트는 질문 응답(RAG), 작업 수행, 워크플로우 완전 자동화에 사용할 수 있는 "스마트" 마이크로서비스 역할을 합니다. 생성 AI 모델의 힘과 실제 데이터 소스에 접근하고 상호작용할 수 있는 도구를 결합하여 이를 실현합니다. 에이전트 예시는 다음과 같습니다:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    이 예시에서 `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` 모델을 가진 에이전트가 생성됩니다. 이 에이전트는 코드 해석 작업을 수행할 수 있는 도구와 자원을 갖추고 있습니다.

- **스레드와 메시지(Thread and messages)**. 스레드는 에이전트와 사용자 간 대화나 상호작용을 나타내는 또 다른 중요한 개념입니다. 스레드는 대화 진행 상황을 추적하고, 컨텍스트 정보를 저장하며, 상호작용 상태를 관리하는 데 사용됩니다. 스레드 예시는 다음과 같습니다:

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

    이전 코드에서 스레드가 생성되고 메시지가 스레드에 전송됩니다. `create_and_process_run` 호출로 에이전트가 스레드에서 작업을 수행하도록 요청합니다. 마지막으로 메시지를 가져와 에이전트의 응답을 기록합니다. 메시지는 사용자와 에이전트 간 대화 진행 상황을 나타냅니다. 메시지는 텍스트, 이미지, 파일 등 다양한 유형일 수 있는데, 예를 들어 에이전트 작업 결과가 이미지나 텍스트 응답일 수 있습니다. 개발자는 이 정보를 활용해 응답을 추가 처리하거나 사용자에게 표시할 수 있습니다.

- **다른 AI 프레임워크와의 통합**. Azure AI Agent Service는 AutoGen, Semantic Kernel 같은 다른 프레임워크와 상호작용할 수 있습니다. 즉, 앱의 일부를 이들 프레임워크 중 하나에서 빌드하고 에이전트 서비스를 오케스트레이터로 사용하거나, 모든 것을 에이전트 서비스 내에서 구축할 수 있습니다.

**사용 사례**: Azure AI Agent Service는 보안성, 확장성, 유연한 AI 에이전트 배포가 필요한 엔터프라이즈 애플리케이션을 위해 설계되었습니다.

## 이 프레임워크들의 차이점은 무엇인가요?

이 프레임워크들은 겹치는 부분이 많지만, 설계, 기능, 대상 사용 사례 측면에서 몇 가지 핵심 차이가 있습니다:

## AutoGen

AutoGen은 Microsoft Research AI Frontiers Lab에서 개발한 오픈 소스 프레임워크입니다. 이벤트 기반, 분산 *에이전틱(agentic)* 애플리케이션에 중점을 두어 여러 LLM과 SLM, 도구, 고급 다중 에이전트 설계 패턴을 지원합니다.

AutoGen은 환경을 인지하고, 결정을 내리며, 특정 목표를 달성하기 위해 행동하는 자율적 엔티티인 에이전트를 핵심 개념으로 합니다. 에이전트는 비동기 메시지를 통해 통신하여 독립적이고 병렬로 작업할 수 있어 시스템 확장성과 응답성을 향상시킵니다.

위키피디아에 따르면 액터는 동시 계산의 기본 단위로, 받은 메시지에 대해 로컬 결정을 내리고, 더 많은 액터를 생성하며, 메시지를 보내고 다음 메시지에 어떻게 응답할지 결정할 수 있습니다.

**사용 사례**: 코드 생성 자동화, 데이터 분석 작업, 계획 및 연구 기능을 위한 맞춤형 에이전트 구축.

AutoGen의 핵심 개념은 다음과 같습니다:

- **에이전트**: 메시지로 통신하며 자체 상태를 유지하고, 메시지에 반응하여 동작을 수행하는 소프트웨어 엔티티.
- **다중 에이전트**: 협업하여 복잡한 작업을 수행하는 여러 에이전트 생성 지원.
- **에이전트 런타임**: 에이전트 간 통신, 신원 및 수명 주기 관리, 보안 경계 제공.

## Semantic Kernel + Agent Framework

Semantic Kernel은 엔터프라이즈용 AI 오케스트레이션 SDK로, AI 및 메모리 커넥터와 에이전트 프레임워크로 구성됩니다.

- **AI 커넥터**: 외부 AI 서비스와의 인터페이스 제공.
- **플러그인**: 애플리케이션 기능을 캡슐화하며, 함수 호출을 모델이 선택적으로 수행.
- **네이티브 함수**: 프레임워크가 직접 호출하는 함수.
- **메모리**: LLM이 참조할 정보를 저장하는 벡터 저장소 등으로 컨텍스트 관리 단순화.

에이전트 프레임워크는 모듈식 구성 요소, 협업 도구, 실시간 학습을 지원하여 빠른 프로토타입 제작과 반복 개선을 가능하게 합니다.

## Azure AI Agent Service

Azure AI Agent Service는 Azure Foundry 내 플랫폼 및 배포 서비스로, Llama 3, Mistral, Cohere 등 다양한 모델과 강력한 엔터프라이즈 보안, 데이터 저장 기능을 제공합니다.

AutoGen, Semantic Kernel과 같은 다중 에이전트 오케스트레이션 프레임워크와 원활하게 연동되며, Python과 C#을 지원합니다.

에이전트는 Azure AI Foundry에서 "스마트" 마이크로서비스로 동작하며, 스레드와 메시지 개념을 통해 대화 및 작업 상태를 관리합니다.

## 어떤 프레임워크를 선택해야 할까요?

### 사용 사례별 가이드

> Q: 실험, 학습, 개념 증명용 에이전트 애플리케이션을 빠르게 빌드하고 실험하고 싶습니다.
>
> A: AutoGen이 좋은 선택입니다. 이벤트 기반 분산 에이전틱 애플리케이션에 중점을 두고 고급 다중 에이전트 설계 패턴을 지원합니다.

> Q: 이 경우 AutoGen이 Semantic Kernel이나 Azure AI Agent Service보다 나은 이유는 무엇인가요?
>
> A: AutoGen은 이벤트 기반 분산 에이전틱 애플리케이션에 특화되어 있어 코드 생성과 데이터 분석 작업 자동화에 적합한 도구와 기능을 제공합니다.

> Q: Azure AI Agent Service도 코드 생성 도구를 제공하니 적합하지 않을까요?
>
> A: 네, Azure AI Agent Service는 여러 모델, Azure AI Search, Bing Search, Azure Functions 등을 지원하는 플랫폼 서비스로, Foundry 포털에서 에이전트를 쉽게 구축하고 대규모로 배포할 수 있습니다.

> Q: 아직도 헷갈리는데 한 가지 옵션만 추천해 주세요.
>
> A: Semantic Kernel에서 애플리케이션을 먼저 구축하고 Azure AI Agent Service를 통해 배포하는 것이 좋은 접근법입니다. 이렇게 하면 에이전트를 쉽게 지속시키면서 Semantic Kernel의 다중 에이전트 시스템 구축 역량을 활용할 수 있습니다. 또한 Semantic Kernel은 AutoGen과의 커넥터를 제공해 두 프레임워크를 함께 사용하기 쉽습니다.

다음 표는 주요 차이점을 요약한 것입니다:

| 프레임워크           | 초점                              | 핵심 개념                              | 사용 사례                      |
|---------------------|----------------------------------|-------------------------------------|------------------------------|
| AutoGen             | 이벤트 기반, 분산 에이전틱 애플리케이션 | 에이전트, 페르소나, 함수, 데이터          | 코드 생성, 데이터 분석 작업     |
| Semantic Kernel     | 인간과 유사한 텍스트 이해 및 생성       | 에이전트, 모듈식 구성 요소, 협업            | 자연어 이해, 콘텐츠 생성        |
| Azure AI Agent Service | 유연한 모델, 엔터프라이즈 보안, 코드 생성, 도구 호출 | 에이전트, 스레드, 메시지, 통합 서비스          | 엔터프라이즈용 에이전트 배포     |
## 이전 강의

[AI 에이전트 및 에이전트 사용 사례 소개](../01-intro-to-ai-agents/README.md)

## 다음 강의

[에이전트 디자인 패턴 이해하기](../03-agentic-design-patterns/README.md)

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확성이 포함될 수 있음을 유의해 주시기 바랍니다. 원본 문서는 해당 언어의 원문이 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.