<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T09:07:52+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "de"
}
-->
. Laut Wikipedia ist ein Actor _der grundlegende Baustein der nebenläufigen Berechnung. Als Reaktion auf eine empfangene Nachricht kann ein Actor: lokale Entscheidungen treffen, weitere Actors erstellen, weitere Nachrichten senden und bestimmen, wie auf die nächste empfangene Nachricht reagiert wird_.

**Anwendungsfälle**: Automatisierung der Codegenerierung, Datenanalyseaufgaben und Erstellung benutzerdefinierter Agenten für Planungs- und Forschungsfunktionen.

Hier sind einige wichtige Kernkonzepte von AutoGen:

- **Agenten**. Ein Agent ist eine Softwareeinheit, die:
  - **über Nachrichten kommuniziert**, diese Nachrichten können synchron oder asynchron sein.
  - **einen eigenen Zustand pflegt**, der durch eingehende Nachrichten verändert werden kann.
  - **Aktionen ausführt** als Reaktion auf empfangene Nachrichten oder Zustandsänderungen. Diese Aktionen können den Zustand des Agenten verändern und externe Effekte erzeugen, wie z. B. das Aktualisieren von Nachrichtenprotokollen, das Senden neuer Nachrichten, das Ausführen von Code oder das Aufrufen von APIs.
    
  Hier ein kurzer Codeausschnitt, in dem Sie Ihren eigenen Agenten mit Chat-Fähigkeiten erstellen:

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
    
    Im vorherigen Code ist `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` ein vorgefertigter Agent, der Chat-Komplettierungen verarbeiten kann.


    Lassen Sie AutoGen diesen Agententyp kennen und starten Sie anschließend das Programm:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    Im vorherigen Code werden die Agenten beim Runtime registriert und dann wird eine Nachricht an den Agenten gesendet, was zu folgender Ausgabe führt:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **Multi-Agenten**. AutoGen unterstützt die Erstellung mehrerer Agenten, die zusammenarbeiten können, um komplexe Aufgaben zu bewältigen. Agenten können kommunizieren, Informationen teilen und ihre Aktionen koordinieren, um Probleme effizienter zu lösen. Um ein Multi-Agenten-System zu erstellen, können Sie verschiedene Agententypen mit spezialisierten Funktionen und Rollen definieren, wie Datenabruf, Analyse, Entscheidungsfindung und Benutzerinteraktion. So sieht eine solche Erstellung aus, damit Sie ein Gefühl dafür bekommen:

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

    Im vorherigen Code haben wir einen `GroupChatManager`, der beim Runtime registriert ist. Dieser Manager koordiniert die Interaktionen zwischen verschiedenen Agententypen, wie Autoren, Illustratoren, Redakteuren und Benutzern.

- **Agent Runtime**. Das Framework stellt eine Laufzeitumgebung bereit, die die Kommunikation zwischen Agenten ermöglicht, ihre Identitäten und Lebenszyklen verwaltet und Sicherheits- sowie Datenschutzgrenzen durchsetzt. Das bedeutet, dass Sie Ihre Agenten in einer sicheren und kontrollierten Umgebung ausführen können, sodass sie sicher und effizient interagieren können. Es gibt zwei interessante Laufzeitumgebungen:
  - **Standalone Runtime**. Dies ist eine gute Wahl für Single-Process-Anwendungen, bei denen alle Agenten in derselben Programmiersprache implementiert sind und im selben Prozess laufen. Hier eine Illustration, wie es funktioniert:

Application-Stack

    *Agenten kommunizieren über Nachrichten durch die Runtime, und die Runtime verwaltet den Lebenszyklus der Agenten*

  - **Verteilte Agent Runtime**, geeignet für Multi-Process-Anwendungen, bei denen Agenten in verschiedenen Programmiersprachen implementiert sind und auf verschiedenen Maschinen laufen. Hier eine Illustration, wie es funktioniert:

## Semantic Kernel + Agent Framework

Semantic Kernel ist ein unternehmensbereites AI-Orchestrierungs-SDK. Es besteht aus AI- und Memory-Connectors sowie einem Agent Framework.

Lassen Sie uns zunächst einige Kernkomponenten betrachten:

- **AI Connectors**: Dies ist eine Schnittstelle zu externen AI-Diensten und Datenquellen für die Verwendung in Python und C#.

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

    Hier ein einfaches Beispiel, wie Sie einen Kernel erstellen und einen Chat Completion Service hinzufügen können. Semantic Kernel stellt eine Verbindung zu einem externen AI-Dienst her, in diesem Fall Azure OpenAI Chat Completion.

- **Plugins**: Diese kapseln Funktionen, die eine Anwendung verwenden kann. Es gibt sowohl fertige Plugins als auch benutzerdefinierte, die Sie erstellen können. Ein verwandtes Konzept sind „Prompt Functions“. Statt natürliche Sprachhinweise für Funktionsaufrufe zu geben, senden Sie bestimmte Funktionen an das Modell. Basierend auf dem aktuellen Chat-Kontext kann das Modell entscheiden, eine dieser Funktionen aufzurufen, um eine Anfrage oder Abfrage zu vervollständigen. Hier ein Beispiel:

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

    Hier haben Sie zunächst eine Template-Eingabeaufforderung `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`. Beachten Sie den Funktionsnamen, der Semantic Kernel hilft zu verstehen, was die Funktion macht und wann sie aufgerufen werden soll.

- **Native Funktion**: Es gibt auch native Funktionen, die das Framework direkt aufrufen kann, um eine Aufgabe auszuführen. Hier ein Beispiel für eine Funktion, die den Inhalt einer Datei abruft:

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

- **Memory**: Abstrahiert und vereinfacht das Kontextmanagement für AI-Anwendungen. Die Idee hinter Memory ist, dass dies etwas ist, das das LLM kennen sollte. Sie können diese Informationen in einem Vektor-Store speichern, der letztlich eine In-Memory-Datenbank, eine Vektor-Datenbank oder Ähnliches ist. Hier ein Beispiel für ein sehr vereinfachtes Szenario, in dem *Fakten* im Memory gespeichert werden:

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

    Diese Fakten werden dann in der Memory-Sammlung `SummarizedAzureDocs` gespeichert. Dies ist ein sehr einfaches Beispiel, aber Sie sehen, wie Sie Informationen im Memory speichern können, damit das LLM sie verwenden kann.

Das sind also die Grundlagen des Semantic Kernel Frameworks, was ist mit dem Agent Framework?

## Azure AI Agent Service

Azure AI Agent Service ist eine neuere Ergänzung, vorgestellt auf der Microsoft Ignite 2024. Es ermöglicht die Entwicklung und Bereitstellung von AI-Agenten mit flexibleren Modellen, wie dem direkten Aufruf von Open-Source-LLMs wie Llama 3, Mistral und Cohere.

Azure AI Agent Service bietet stärkere Sicherheitsmechanismen für Unternehmen und Methoden zur Datenspeicherung, was es für Unternehmensanwendungen geeignet macht.

Es funktioniert sofort mit Multi-Agent-Orchestrierungsframeworks wie AutoGen und Semantic Kernel.

Dieser Dienst befindet sich derzeit in der öffentlichen Vorschau und unterstützt Python und C# zum Erstellen von Agenten.

Mit Semantic Kernel Python können wir einen Azure AI Agent mit einem benutzerdefinierten Plugin erstellen:

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

### Kernkonzepte

Azure AI Agent Service hat folgende Kernkonzepte:

- **Agent**. Azure AI Agent Service integriert sich in Azure AI Foundry. Innerhalb von AI Foundry agiert ein AI Agent als „intelligenter“ Microservice, der Fragen beantworten (RAG), Aktionen ausführen oder Workflows vollständig automatisieren kann. Dies wird erreicht durch die Kombination der Leistung generativer AI-Modelle mit Tools, die den Zugriff auf und die Interaktion mit realen Datenquellen ermöglichen. Hier ein Beispiel für einen Agenten:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    In diesem Beispiel wird ein Agent mit dem Modell `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` erstellt. Der Agent ist mit Werkzeugen und Ressourcen ausgestattet, um Code-Interpretationsaufgaben durchzuführen.

- **Thread und Nachrichten**. Der Thread ist ein weiteres wichtiges Konzept. Er repräsentiert eine Konversation oder Interaktion zwischen einem Agenten und einem Benutzer. Threads können verwendet werden, um den Fortschritt einer Konversation zu verfolgen, Kontextinformationen zu speichern und den Zustand der Interaktion zu verwalten. Hier ein Beispiel für einen Thread:

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

    Im vorherigen Code wird ein Thread erstellt. Danach wird eine Nachricht an den Thread gesendet. Durch den Aufruf von `create_and_process_run` wird der Agent gebeten, an dem Thread zu arbeiten. Schließlich werden die Nachrichten abgerufen und protokolliert, um die Antwort des Agenten zu sehen. Die Nachrichten zeigen den Fortschritt der Unterhaltung zwischen Benutzer und Agent. Es ist auch wichtig zu verstehen, dass Nachrichten unterschiedliche Typen haben können, wie Text, Bild oder Datei, also kann die Arbeit des Agenten z. B. in einer Bild- oder Textantwort resultieren. Als Entwickler können Sie diese Informationen nutzen, um die Antwort weiterzuverarbeiten oder dem Benutzer anzuzeigen.

- **Integration mit anderen AI-Frameworks**. Azure AI Agent Service kann mit anderen Frameworks wie AutoGen und Semantic Kernel interagieren, was bedeutet, dass Sie Teile Ihrer Anwendung in einem dieser Frameworks bauen können und z. B. den Agent Service als Orchestrator verwenden oder alles im Agent Service entwickeln.

**Anwendungsfälle**: Azure AI Agent Service ist für Unternehmensanwendungen konzipiert, die eine sichere, skalierbare und flexible Bereitstellung von AI-Agenten erfordern.

## Was sind die Unterschiede zwischen den Frameworks AutoGen, Semantic Kernel und Azure AI Agent Service?

Es gibt viele Möglichkeiten, diese Frameworks zu vergleichen, aber schauen wir uns einige wichtige Unterschiede hinsichtlich Design, Fähigkeiten und Zielanwendungen an:

## AutoGen

AutoGen ist ein Open-Source-Framework, entwickelt vom AI Frontiers Lab von Microsoft Research. Es konzentriert sich auf ereignisgesteuerte, verteilte *agentische* Anwendungen und ermöglicht den Einsatz mehrerer LLMs und SLMs, Tools sowie fortgeschrittener Multi-Agent-Designmuster.

AutoGen basiert auf dem Kernkonzept der Agenten, die autonome Einheiten sind, die ihre Umgebung wahrnehmen, Entscheidungen treffen und Aktionen ausführen können, um bestimmte Ziele zu erreichen. Agenten kommunizieren über asynchrone Nachrichten, was ihnen erlaubt, unabhängig und parallel zu arbeiten, was die Skalierbarkeit und Reaktionsfähigkeit des Systems verbessert.

. Laut Wikipedia ist ein Actor _der grundlegende Baustein der nebenläufigen Berechnung. Als Reaktion auf eine empfangene Nachricht kann ein Actor: lokale Entscheidungen treffen, weitere Actors erstellen, weitere Nachrichten senden und bestimmen, wie auf die nächste empfangene Nachricht reagiert wird_.

**Anwendungsfälle**: Automatisierung der Codegenerierung, Datenanalyseaufgaben und Erstellung benutzerdefinierter Agenten für Planungs- und Forschungsfunktionen.

Hier sind einige wichtige Kernkonzepte von AutoGen:

- **Agenten**. Ein Agent ist eine Softwareeinheit, die:
  - **über Nachrichten kommuniziert**, diese Nachrichten können synchron oder asynchron sein.
  - **einen eigenen Zustand pflegt**, der durch eingehende Nachrichten verändert werden kann.
  - **Aktionen ausführt** als Reaktion auf empfangene Nachrichten oder Zustandsänderungen. Diese Aktionen können den Zustand des Agenten verändern und externe Effekte erzeugen, wie z. B. das Aktualisieren von Nachrichtenprotokollen, das Senden neuer Nachrichten, das Ausführen von Code oder das Aufrufen von APIs.
    
  Hier ein kurzer Codeausschnitt, in dem Sie Ihren eigenen Agenten mit Chat-Fähigkeiten erstellen:

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
    
    Im vorherigen Code ist `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` ein vorgefertigter Agent, der Chat-Komplettierungen verarbeiten kann.


    Lassen Sie AutoGen diesen Agententyp kennen und starten Sie anschließend das Programm:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    Im vorherigen Code werden die Agenten beim Runtime registriert und dann wird eine Nachricht an den Agenten gesendet, was zu folgender Ausgabe führt:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **Multi-Agenten**. AutoGen unterstützt die Erstellung mehrerer Agenten, die zusammenarbeiten können, um komplexe Aufgaben zu bewältigen. Agenten können kommunizieren, Informationen teilen und ihre Aktionen koordinieren, um Probleme effizienter zu lösen. Um ein Multi-Agenten-System zu erstellen, können Sie verschiedene Agententypen mit spezialisierten Funktionen und Rollen definieren, wie Datenabruf, Analyse, Entscheidungsfindung und Benutzerinteraktion. So sieht eine solche Erstellung aus, damit Sie ein Gefühl dafür bekommen:

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

    Im vorherigen Code haben wir einen `GroupChatManager`, der beim Runtime registriert ist. Dieser Manager koordiniert die Interaktionen zwischen verschiedenen Agententypen, wie Autoren, Illustratoren, Redakteuren und Benutzern.

- **Agent Runtime**. Das Framework stellt eine Laufzeitumgebung bereit, die die Kommunikation zwischen Agenten ermöglicht, ihre Identitäten und Lebenszyklen verwaltet und Sicherheits- sowie Datenschutzgrenzen durchsetzt. Das bedeutet, dass Sie Ihre Agenten in einer sicheren und kontrollierten Umgebung ausführen können, sodass sie sicher und effizient interagieren können. Es gibt zwei interessante Laufzeitumgebungen:
  - **Standalone Runtime**. Dies ist eine gute Wahl für Single-Process-Anwendungen, bei denen alle Agenten in derselben Programmiersprache implementiert sind und im selben Prozess laufen. Hier eine Illustration, wie es funktioniert:

Application-Stack

    *Agenten kommunizieren über Nachrichten durch die Runtime, und die Runtime verwaltet den Lebenszyklus der Agenten*

  - **Verteilte Agent Runtime**, geeignet für Multi-Process-Anwendungen, bei denen Agenten in verschiedenen Programmiersprachen implementiert sind und auf verschiedenen Maschinen laufen. Hier eine Illustration, wie es funktioniert:

## Semantic Kernel + Agent Framework

Semantic Kernel ist ein unternehmensbereites AI-Orchestrierungs-SDK. Es besteht aus AI- und Memory-Connectors sowie einem Agent Framework.

Lassen Sie uns zunächst einige Kernkomponenten betrachten:

- **AI Connectors**: Dies ist eine Schnittstelle zu externen AI-Diensten und Datenquellen für die Verwendung in Python und C#.

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

    Hier ein einfaches Beispiel, wie Sie einen Kernel erstellen und einen Chat Completion Service hinzufügen können. Semantic Kernel stellt eine Verbindung zu einem externen AI-Dienst her, in diesem Fall Azure OpenAI Chat Completion.

- **Plugins**: Diese kapseln Funktionen, die eine Anwendung verwenden kann. Es gibt sowohl fertige Plugins als auch benutzerdefinierte, die Sie erstellen können. Ein verwandtes Konzept sind „Prompt Functions“. Statt natürliche Sprachhinweise für Funktionsaufrufe zu geben, senden Sie bestimmte Funktionen an das Modell. Basierend auf dem aktuellen Chat-Kontext kann das Modell entscheiden, eine dieser Funktionen aufzurufen, um eine Anfrage oder Abfrage zu vervollständigen. Hier ein Beispiel:

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

    Hier haben Sie zunächst eine Template-Eingabeaufforderung `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`. Beachten Sie den Funktionsnamen, der Semantic Kernel hilft zu verstehen, was die Funktion macht und wann sie aufgerufen werden soll.

- **Native Funktion**: Es gibt auch native Funktionen, die das Framework direkt aufrufen kann, um eine Aufgabe auszuführen. Hier ein Beispiel für eine Funktion, die den Inhalt einer Datei abruft:

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

- **Memory**: Abstrahiert und vereinfacht das Kontextmanagement für AI-Anwendungen. Die Idee hinter Memory ist, dass dies etwas ist, das das LLM kennen sollte. Sie können diese Informationen in einem Vektor-Store speichern, der letztlich eine In-Memory-Datenbank, eine Vektor-Datenbank oder Ähnliches ist. Hier ein Beispiel für ein sehr vereinfachtes Szenario, in dem *Fakten* im Memory gespeichert werden:

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

    Diese Fakten werden dann in der Memory-Sammlung `SummarizedAzureDocs` gespeichert. Dies ist ein sehr einfaches Beispiel, aber Sie sehen, wie Sie Informationen im Memory speichern können, damit das LLM sie verwenden kann.

Das sind also die Grundlagen des Semantic Kernel Frameworks, was ist mit dem Agent Framework?

## Azure AI Agent Service

Azure AI Agent Service ist eine neuere Ergänzung, vorgestellt auf der Microsoft Ignite 2024. Es ermöglicht die Entwicklung und Bereitstellung von AI-Agenten mit flexibleren Modellen, wie dem direkten Aufruf von Open-Source-LLMs wie Llama 3, Mistral und Cohere.

Azure AI Agent Service bietet stärkere Sicherheitsmechanismen für Unternehmen und Methoden zur Datenspeicherung, was es für Unternehmensanwendungen geeignet macht.

Es funktioniert sofort mit Multi-Agent-Orchestrierungsframeworks wie AutoGen und Semantic Kernel.

Dieser Dienst befindet sich derzeit in der öffentlichen Vorschau und unterstützt Python und C# zum Erstellen von Agenten.

Mit Semantic Kernel Python können wir einen Azure AI Agent mit einem benutzerdefinierten Plugin erstellen:

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

### Kernkonzepte

Azure AI Agent Service hat folgende Kernkonzepte:

- **Agent**. Azure AI Agent Service integriert sich in Azure AI Foundry. Innerhalb von AI Foundry agiert ein AI Agent als „intelligenter“ Microservice, der Fragen beantworten (RAG), Aktionen ausführen oder Workflows vollständig automatisieren kann. Dies wird erreicht durch die Kombination der Leistung generativer AI-Modelle mit Tools, die den Zugriff auf und die Interaktion mit realen Datenquellen ermöglichen. Hier ein Beispiel für einen Agenten:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    In diesem Beispiel wird ein Agent mit dem Modell `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` erstellt. Der Agent ist mit Werkzeugen und Ressourcen ausgestattet, um Code-Interpretationsaufgaben durchzuführen.

- **Thread und Nachrichten**. Der Thread ist ein weiteres wichtiges Konzept. Er repräsentiert eine Konversation oder Interaktion zwischen einem Agenten und einem Benutzer. Threads können verwendet werden, um den Fortschritt einer Konversation zu verfolgen, Kontextinformationen zu speichern und den Zustand der Interaktion zu verwalten. Hier ein Beispiel für einen Thread:

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

    Im vorherigen Code wird ein Thread erstellt. Danach wird eine Nachricht an den Thread gesendet. Durch den Aufruf von `create_and_process_run` wird der Agent gebeten, an dem Thread zu arbeiten. Schließlich werden die Nachrichten abgerufen und protokolliert, um die Antwort des Agenten zu sehen. Die Nachrichten zeigen den Fortschritt der Unterhaltung zwischen Benutzer und Agent. Es ist auch wichtig zu verstehen, dass Nachrichten unterschiedliche Typen haben können, wie Text, Bild oder Datei, also kann die Arbeit des Agenten z. B. in einer Bild- oder Textantwort resultieren. Als Entwickler können Sie diese Informationen nutzen, um die Antwort weiterzuverarbeiten oder dem Benutzer anzuzeigen.

- **Integration mit anderen AI-Frameworks**. Azure AI Agent Service kann mit anderen Frameworks wie AutoGen und Semantic Kernel interagieren, was bedeutet, dass Sie Teile Ihrer Anwendung in einem dieser Frameworks bauen können und z. B. den Agent Service als Orchestr
## Vorherige Lektion

[Einführung in KI-Agenten und Anwendungsfälle für Agenten](../01-intro-to-ai-agents/README.md)

## Nächste Lektion

[Verstehen von agentischen Designmustern](../03-agentic-design-patterns/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die durch die Verwendung dieser Übersetzung entstehen.