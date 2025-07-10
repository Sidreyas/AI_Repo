<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T08:45:24+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "pt"
}
-->
. De acordo com a Wikipedia, um ator é _o bloco básico da computação concorrente. Em resposta a uma mensagem que recebe, um ator pode: tomar decisões locais, criar mais atores, enviar mais mensagens e determinar como responder à próxima mensagem recebida_.

**Casos de Uso**: Automatizar geração de código, tarefas de análise de dados e construir agentes personalizados para funções de planejamento e pesquisa.

Aqui estão alguns conceitos centrais importantes do AutoGen:

- **Agentes**. Um agente é uma entidade de software que:
  - **Comunica-se via mensagens**, que podem ser síncronas ou assíncronas.
  - **Mantém seu próprio estado**, que pode ser modificado por mensagens recebidas.
  - **Executa ações** em resposta às mensagens recebidas ou mudanças em seu estado. Essas ações podem modificar o estado do agente e produzir efeitos externos, como atualizar logs de mensagens, enviar novas mensagens, executar código ou fazer chamadas de API.

  Aqui você tem um pequeno trecho de código em que cria seu próprio agente com capacidades de chat:

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
    
    No código anterior, `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` é um agente pré-construído que pode lidar com completions de chat.

    Vamos informar o AutoGen sobre esse tipo de agente e iniciar o programa a seguir:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    No código acima, os agentes são registrados no runtime e então uma mensagem é enviada ao agente, resultando na seguinte saída:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **Multi agentes**. O AutoGen suporta a criação de múltiplos agentes que podem trabalhar juntos para realizar tarefas complexas. Os agentes podem se comunicar, compartilhar informações e coordenar suas ações para resolver problemas de forma mais eficiente. Para criar um sistema multi-agente, você pode definir diferentes tipos de agentes com funções e papéis especializados, como recuperação de dados, análise, tomada de decisões e interação com o usuário. Vamos ver como essa criação fica para termos uma ideia:

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

    No código anterior, temos um `GroupChatManager` registrado no runtime. Esse gerente é responsável por coordenar as interações entre diferentes tipos de agentes, como escritores, ilustradores, editores e usuários.

- **Runtime do Agente**. O framework fornece um ambiente de runtime, permitindo a comunicação entre agentes, gerenciando suas identidades e ciclos de vida, e aplicando limites de segurança e privacidade. Isso significa que você pode executar seus agentes em um ambiente seguro e controlado, garantindo que eles possam interagir de forma segura e eficiente. Existem dois runtimes de interesse:
  - **Runtime stand-alone**. É uma boa escolha para aplicações de processo único onde todos os agentes são implementados na mesma linguagem de programação e executados no mesmo processo. Aqui está uma ilustração de como funciona:

Pilha de aplicação

    *os agentes se comunicam via mensagens através do runtime, que gerencia o ciclo de vida dos agentes*

  - **Runtime distribuído**, adequado para aplicações multi-processo onde agentes podem ser implementados em diferentes linguagens de programação e executados em máquinas diferentes. Aqui está uma ilustração de como funciona:

## Semantic Kernel + Agent Framework

Semantic Kernel é um SDK de orquestração de IA pronto para uso empresarial. Ele consiste em conectores de IA e memória, junto com um Agent Framework.

Vamos primeiro cobrir alguns componentes centrais:

- **Conectores de IA**: Interface com serviços externos de IA e fontes de dados para uso tanto em Python quanto em C#.

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

    Aqui você tem um exemplo simples de como criar um kernel e adicionar um serviço de chat completion. O Semantic Kernel cria uma conexão com um serviço externo de IA, neste caso, Azure OpenAI Chat Completion.

- **Plugins**: Encapsulam funções que uma aplicação pode usar. Existem plugins prontos e também customizados que você pode criar. Um conceito relacionado são as "funções de prompt". Em vez de fornecer comandos em linguagem natural para invocar funções, você disponibiliza certas funções para o modelo. Baseado no contexto atual do chat, o modelo pode escolher chamar uma dessas funções para completar uma solicitação ou consulta. Veja um exemplo:

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

    Aqui, você primeiro tem um template de prompt `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`. Note o nome da função que ajuda o Semantic Kernel a entender o que a função faz e quando deve ser chamada.

- **Função nativa**: Também há funções nativas que o framework pode chamar diretamente para realizar a tarefa. Aqui está um exemplo de uma função que recupera o conteúdo de um arquivo:

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

- **Memória**: Abstrai e simplifica o gerenciamento de contexto para apps de IA. A ideia da memória é que isso é algo que o LLM deve conhecer. Você pode armazenar essa informação em um repositório vetorial que funciona como um banco de dados em memória, banco de dados vetorial ou similar. Aqui está um exemplo de um cenário muito simplificado onde *fatos* são adicionados à memória:

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

    Esses fatos são então armazenados na coleção de memória `SummarizedAzureDocs`. Este é um exemplo bem simples, mas você pode ver como armazenar informações na memória para o LLM usar.

Então esses são os conceitos básicos do framework Semantic Kernel, e quanto ao Agent Framework?

## Azure AI Agent Service

Azure AI Agent Service é uma adição mais recente, apresentada na Microsoft Ignite 2024. Permite o desenvolvimento e implantação de agentes de IA com modelos mais flexíveis, como a chamada direta a LLMs open-source como Llama 3, Mistral e Cohere.

O Azure AI Agent Service oferece mecanismos de segurança empresarial mais robustos e métodos de armazenamento de dados, tornando-o adequado para aplicações empresariais.

Funciona pronto para uso com frameworks de orquestração multi-agentes como AutoGen e Semantic Kernel.

Este serviço está atualmente em Public Preview e suporta Python e C# para construção de agentes.

Usando Semantic Kernel Python, podemos criar um Azure AI Agent com um plugin definido pelo usuário:

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

### Conceitos centrais

O Azure AI Agent Service possui os seguintes conceitos centrais:

- **Agente**. O Azure AI Agent Service integra-se ao Azure AI Foundry. Dentro do AI Foundry, um AI Agent atua como um microsserviço "inteligente" que pode ser usado para responder perguntas (RAG), realizar ações ou automatizar completamente fluxos de trabalho. Isso é alcançado combinando o poder dos modelos generativos de IA com ferramentas que permitem acessar e interagir com fontes de dados do mundo real. Aqui está um exemplo de agente:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    Neste exemplo, um agente é criado com o modelo `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`. O agente está equipado com ferramentas e recursos para realizar tarefas de interpretação de código.

- **Thread e mensagens**. A thread é outro conceito importante. Representa uma conversa ou interação entre um agente e um usuário. Threads podem ser usadas para acompanhar o progresso da conversa, armazenar informações de contexto e gerenciar o estado da interação. Aqui está um exemplo de thread:

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

    No código anterior, uma thread é criada. Em seguida, uma mensagem é enviada para a thread. Ao chamar `create_and_process_run`, o agente é solicitado a trabalhar na thread. Finalmente, as mensagens são recuperadas e registradas para ver a resposta do agente. As mensagens indicam o progresso da conversa entre usuário e agente. Também é importante entender que as mensagens podem ser de tipos diferentes, como texto, imagem ou arquivo, resultado do trabalho do agente, por exemplo, uma imagem ou uma resposta em texto. Como desenvolvedor, você pode usar essas informações para processar ainda mais a resposta ou apresentá-la ao usuário.

- **Integração com outros frameworks de IA**. O Azure AI Agent Service pode interagir com outros frameworks como AutoGen e Semantic Kernel, o que significa que você pode construir parte do seu app em um desses frameworks e, por exemplo, usar o Agent Service como orquestrador, ou construir tudo no Agent Service.

**Casos de Uso**: O Azure AI Agent Service é projetado para aplicações empresariais que exigem implantação segura, escalável e flexível de agentes de IA.

## Qual a diferença entre esses frameworks?

Parece que há muita sobreposição entre esses frameworks, mas existem diferenças-chave em termos de design, capacidades e casos de uso-alvo:

- **AutoGen**: É um framework experimental focado em pesquisa avançada sobre sistemas multi-agentes. É o melhor lugar para experimentar e prototipar sistemas sofisticados multi-agentes.
- **Semantic Kernel**: É uma biblioteca pronta para produção para construir aplicações agentic empresariais. Foca em aplicações agentic distribuídas e orientadas a eventos, permitindo múltiplos LLMs e SLMs, ferramentas e padrões de design single/multi-agente.
- **Azure AI Agent Service**: É uma plataforma e serviço de implantação no Azure Foundry para agentes. Oferece conectividade para serviços suportados pelo Azure Foundry como Azure OpenAI, Azure AI Search, Bing Search e execução de código.

Ainda não sabe qual escolher?

### Casos de Uso

Vamos tentar ajudar passando por alguns casos comuns:

> Q: Estou experimentando, aprendendo e construindo aplicações de agentes para prova de conceito, e quero construir e experimentar rapidamente.

> A: AutoGen seria uma boa escolha para este cenário, pois foca em aplicações agentic distribuídas e orientadas a eventos e suporta padrões avançados de design multi-agente.

> Q: O que torna o AutoGen uma escolha melhor que Semantic Kernel e Azure AI Agent Service para este caso?

> A: AutoGen é especificamente desenhado para aplicações agentic distribuídas e orientadas a eventos, tornando-o adequado para automatizar geração de código e tarefas de análise de dados. Ele oferece as ferramentas e capacidades necessárias para construir sistemas multi-agentes complexos de forma eficiente.

> Q: Parece que o Azure AI Agent Service também poderia funcionar aqui, pois tem ferramentas para geração de código e mais?

> A: Sim, o Azure AI Agent Service é um serviço de plataforma para agentes e adiciona capacidades integradas para múltiplos modelos, Azure AI Search, Bing Search e Azure Functions. Facilita construir seus agentes no Foundry Portal e implantá-los em escala.

> Q: Ainda estou confuso, me dê apenas uma opção.

> A: Uma ótima escolha é construir sua aplicação primeiro no Semantic Kernel e depois usar o Azure AI Agent Service para implantar seu agente. Essa abordagem permite persistir facilmente seus agentes enquanto aproveita o poder de construir sistemas multi-agentes no Semantic Kernel. Além disso, o Semantic Kernel possui um conector no AutoGen, facilitando o uso de ambos os frameworks juntos.

Vamos resumir as diferenças principais em uma tabela: 

| Framework             | Foco                                       | Conceitos Centrais                    | Casos de Uso                           |
|-----------------------|--------------------------------------------|-------------------------------------|--------------------------------------|
| AutoGen               | Aplicações agentic distribuídas e orientadas a eventos | Agentes, Personas, Funções, Dados   | Geração de código, tarefas de análise de dados |
| Semantic Kernel       | Compreensão e geração de texto humano       | Agentes, Componentes Modulares, Colaboração | Compreensão de linguagem natural, geração de conteúdo |
| Azure AI Agent Service | Modelos flexíveis, segurança empresarial, geração de código, chamada de ferramentas |  |
## Aula Anterior

[Introdução aos Agentes de IA e Casos de Uso de Agentes](../01-intro-to-ai-agents/README.md)

## Próxima Aula

[Compreendendo Padrões de Design Agêntico](../03-agentic-design-patterns/README.md)

**Aviso Legal**:  
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.