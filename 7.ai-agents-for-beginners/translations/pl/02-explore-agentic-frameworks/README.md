<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T09:31:34+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "pl"
}
-->
. Według Wikipedii, aktor to _podstawowy element obliczeń współbieżnych. W odpowiedzi na otrzymaną wiadomość aktor może: podejmować lokalne decyzje, tworzyć kolejnych aktorów, wysyłać kolejne wiadomości oraz decydować, jak odpowiedzieć na następną otrzymaną wiadomość_.

**Przypadki użycia**: Automatyzacja generowania kodu, zadania analizy danych oraz tworzenie niestandardowych agentów do funkcji planowania i badań.

Oto kilka ważnych podstawowych koncepcji AutoGen:

- **Agenci**. Agent to jednostka programowa, która:
  - **Komunikuje się za pomocą wiadomości**, które mogą być synchroniczne lub asynchroniczne.
  - **Utrzymuje własny stan**, który może być modyfikowany przez przychodzące wiadomości.
  - **Wykonuje działania** w odpowiedzi na otrzymane wiadomości lub zmiany stanu. Działania te mogą modyfikować stan agenta i wywoływać efekty zewnętrzne, takie jak aktualizacja dzienników wiadomości, wysyłanie nowych wiadomości, wykonywanie kodu lub wywoływanie API.
    
  Poniżej znajduje się krótki fragment kodu, w którym tworzysz własnego agenta z funkcjami czatu:

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
    
    W powyższym kodzie `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` to gotowy agent, który obsługuje uzupełnienia czatu.


    Teraz poinformujmy AutoGen o tym typie agenta i uruchommy program:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    W powyższym kodzie agenci są rejestrowani w środowisku uruchomieniowym, a następnie wysyłana jest do agenta wiadomość, co skutkuje następującym wyjściem:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **Wielu agentów**. AutoGen wspiera tworzenie wielu agentów, którzy mogą współpracować, aby realizować złożone zadania. Agenci mogą się komunikować, dzielić informacjami i koordynować swoje działania, aby efektywniej rozwiązywać problemy. Aby stworzyć system wieloagentowy, możesz zdefiniować różne typy agentów z wyspecjalizowanymi funkcjami i rolami, takimi jak pobieranie danych, analiza, podejmowanie decyzji czy interakcja z użytkownikiem. Spójrzmy, jak wygląda takie tworzenie:

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

    W powyższym kodzie mamy `GroupChatManager` zarejestrowanego w środowisku uruchomieniowym. Ten menedżer odpowiada za koordynację interakcji między różnymi typami agentów, takimi jak pisarze, ilustratorzy, redaktorzy i użytkownicy.

- **Środowisko uruchomieniowe agenta**. Framework dostarcza środowisko uruchomieniowe, które umożliwia komunikację między agentami, zarządza ich tożsamościami i cyklem życia oraz egzekwuje granice bezpieczeństwa i prywatności. Oznacza to, że możesz uruchamiać swoich agentów w bezpiecznym i kontrolowanym środowisku, zapewniając, że mogą oni bezpiecznie i efektywnie się komunikować. Istnieją dwa interesujące środowiska uruchomieniowe:
  - **Środowisko samodzielne**. To dobre rozwiązanie dla aplikacji jednoprzebiegowych, gdzie wszyscy agenci są zaimplementowani w tym samym języku programowania i działają w tym samym procesie. Oto ilustracja, jak to działa:

Stos aplikacji

    *agenci komunikują się za pomocą wiadomości przez środowisko uruchomieniowe, które zarządza cyklem życia agentów*

  - **Rozproszone środowisko uruchomieniowe agentów** jest odpowiednie dla aplikacji wieloprocesowych, gdzie agenci mogą być zaimplementowani w różnych językach programowania i działać na różnych maszynach. Oto ilustracja, jak to działa:

## Semantic Kernel + Agent Framework

Semantic Kernel to gotowy do zastosowań korporacyjnych SDK do orkiestracji AI. Składa się z konektorów AI i pamięci oraz Frameworka Agentów.

Najpierw omówmy kilka podstawowych komponentów:

- **Konektory AI**: To interfejs do zewnętrznych usług AI i źródeł danych, dostępny zarówno w Pythonie, jak i C#.

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

    Poniżej prosty przykład tworzenia kernela i dodania usługi uzupełniania czatu. Semantic Kernel tworzy połączenie z zewnętrzną usługą AI, w tym przypadku Azure OpenAI Chat Completion.

- **Wtyczki**: To kapsułki funkcji, które aplikacja może wykorzystać. Istnieją gotowe wtyczki oraz te, które możesz stworzyć samodzielnie. Powiązanym pojęciem są "funkcje prompt". Zamiast podawać naturalne wskazówki do wywołania funkcji, udostępniasz modelowi określone funkcje. Na podstawie aktualnego kontekstu czatu model może wybrać wywołanie jednej z tych funkcji, aby zrealizować żądanie lub zapytanie. Oto przykład:

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

    Tutaj mamy szablon promptu `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`. Zwróć uwagę na nazwę funkcji, która pomaga Semantic Kernel zrozumieć, co funkcja robi i kiedy powinna być wywołana.

- **Funkcja natywna**: Istnieją również funkcje natywne, które framework może wywołać bezpośrednio, aby wykonać zadanie. Oto przykład funkcji pobierającej zawartość pliku:

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

- **Pamięć**: Upraszcza zarządzanie kontekstem dla aplikacji AI. Idea pamięci polega na tym, że jest to coś, o czym LLM powinien wiedzieć. Możesz przechowywać te informacje w wektorowej bazie danych, która działa jak baza danych w pamięci lub podobna. Oto przykład bardzo uproszczonego scenariusza, w którym *fakty* są dodawane do pamięci:

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

    Fakty te są następnie przechowywane w kolekcji pamięci `SummarizedAzureDocs`. To bardzo uproszczony przykład, ale widać, jak można przechowywać informacje w pamięci, aby LLM mogło je wykorzystać.

To podstawy frameworka Semantic Kernel, a co z Agent Framework?

## Azure AI Agent Service

Azure AI Agent Service to nowszy dodatek, zaprezentowany na Microsoft Ignite 2024. Umożliwia tworzenie i wdrażanie agentów AI z bardziej elastycznymi modelami, takimi jak bezpośrednie wywoływanie otwartoźródłowych LLM, np. Llama 3, Mistral i Cohere.

Azure AI Agent Service oferuje silniejsze mechanizmy bezpieczeństwa korporacyjnego i metody przechowywania danych, co czyni go odpowiednim do zastosowań biznesowych.

Działa od razu z frameworkami orkiestracji wieloagentowej, takimi jak AutoGen i Semantic Kernel.

Usługa jest obecnie w Public Preview i wspiera Pythona oraz C# do budowania agentów.

Korzystając z Semantic Kernel Python, możemy stworzyć Azure AI Agenta z wtyczką zdefiniowaną przez użytkownika:

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

### Kluczowe koncepcje

Azure AI Agent Service posiada następujące kluczowe koncepcje:

- **Agent**. Azure AI Agent Service integruje się z Azure AI Foundry. W ramach AI Foundry agent AI działa jako „inteligentna” mikrousługa, którą można używać do odpowiadania na pytania (RAG), wykonywania działań lub całkowitej automatyzacji przepływów pracy. Osiąga to poprzez połączenie mocy generatywnych modeli AI z narzędziami pozwalającymi na dostęp i interakcję z rzeczywistymi źródłami danych. Oto przykład agenta:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    W tym przykładzie agent jest tworzony z modelem `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`. Agent jest wyposażony w narzędzia i zasoby do wykonywania zadań interpretacji kodu.

- **Wątek i wiadomości**. Wątek to kolejna ważna koncepcja. Reprezentuje rozmowę lub interakcję między agentem a użytkownikiem. Wątki służą do śledzenia postępu rozmowy, przechowywania informacji kontekstowych oraz zarządzania stanem interakcji. Oto przykład wątku:

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

    W powyższym kodzie tworzony jest wątek. Następnie wysyłana jest do niego wiadomość. Wywołując `create_and_process_run`, agent jest proszony o wykonanie pracy na wątku. Na końcu pobierane i logowane są wiadomości, aby zobaczyć odpowiedź agenta. Wiadomości pokazują postęp rozmowy między użytkownikiem a agentem. Ważne jest również zrozumienie, że wiadomości mogą mieć różne typy, takie jak tekst, obraz czy plik — to efekt pracy agenta, np. wygenerowany obraz lub odpowiedź tekstowa. Jako deweloper możesz wykorzystać te informacje do dalszego przetwarzania odpowiedzi lub prezentacji użytkownikowi.

- **Integracja z innymi frameworkami AI**. Azure AI Agent Service może współdziałać z innymi frameworkami, takimi jak AutoGen i Semantic Kernel, co oznacza, że możesz budować część aplikacji w jednym z tych frameworków, a np. korzystać z Agent Service jako orkiestratora lub budować wszystko w ramach Agent Service.

**Przypadki użycia**: Azure AI Agent Service jest zaprojektowany dla zastosowań korporacyjnych wymagających bezpiecznego, skalowalnego i elastycznego wdrażania agentów AI.

## Jakie są różnice między tymi frameworkami?

Rzeczywiście, istnieje wiele nakładania się funkcji między tymi frameworkami, ale są też kluczowe różnice pod względem konstrukcji, możliwości i docelowych zastosowań:

- **AutoGen**: To framework eksperymentalny skoncentrowany na najnowszych badaniach nad systemami wieloagentowymi. To najlepsze miejsce do eksperymentowania i prototypowania zaawansowanych systemów wieloagentowych.
- **Semantic Kernel**: To biblioteka gotowa do produkcji, służąca do budowy korporacyjnych aplikacji agentowych. Skupia się na zdarzeniowo sterowanych, rozproszonych aplikacjach agentowych, umożliwiając korzystanie z wielu LLM i SLM, narzędzi oraz wzorców projektowych dla pojedynczych i wielu agentów.
- **Azure AI Agent Service**: To platforma i usługa wdrożeniowa w Azure Foundry dla agentów. Oferuje wsparcie dla łączenia się z usługami Azure, takimi jak Azure OpenAI, Azure AI Search, Bing Search oraz wykonywanie kodu.

Wciąż nie jesteś pewien, który wybrać?

### Przypadki użycia

Sprawdźmy, czy możemy pomóc, przechodząc przez kilka typowych scenariuszy:

> P: Eksperymentuję, uczę się i buduję aplikacje agentowe typu proof-of-concept, chcę szybko tworzyć i testować prototypy
>

> O: AutoGen będzie dobrym wyborem, ponieważ koncentruje się na zdarzeniowo sterowanych, rozproszonych aplikacjach agentowych i wspiera zaawansowane wzorce projektowe systemów wieloagentowych.

> P: Co sprawia, że AutoGen jest lepszym wyborem niż Semantic Kernel i Azure AI Agent Service w tym przypadku?
>
> O: AutoGen jest specjalnie zaprojektowany do zdarzeniowo sterowanych, rozproszonych aplikacji agentowych, co czyni go idealnym do automatyzacji generowania kodu i analizy danych. Zapewnia niezbędne narzędzia i możliwości do efektywnego budowania złożonych systemów wieloagentowych.

> P: Wydaje się, że Azure AI Agent Service też tu pasuje, ma narzędzia do generowania kodu i nie tylko?

>
> O: Tak, Azure AI Agent Service to platformowa usługa dla agentów, która dodaje wbudowane możliwości dla wielu modeli, Azure AI Search, Bing Search i Azure Functions. Ułatwia budowanie agentów w portalu Foundry i ich skalowalne wdrażanie.
 
> P: Wciąż się zastanawiam, podaj mi jedną opcję
>
> O: Dobrym wyborem jest najpierw zbudować aplikację w Semantic Kernel, a następnie użyć Azure AI Agent Service do wdrożenia agenta. Takie podejście pozwala łatwo zachować agentów, korzystając jednocześnie z mocy budowy systemów wieloagentowych w Semantic Kernel. Dodatkowo Semantic Kernel ma konektor w AutoGen, co ułatwia używanie obu frameworków razem.

Podsumujmy kluczowe różnice w tabeli:

| Framework             | Skupienie                                      | Kluczowe koncepcje                        | Przypadki użycia                      |
|-----------------------|------------------------------------------------|------------------------------------------|-------------------------------------|
| AutoGen               | Zdarzeniowo sterowane, rozproszone aplikacje agentowe | Agenci, Persony, Funkcje, Dane           | Generowanie kodu, zadania analizy danych |
| Semantic Kernel       | Rozumienie i generowanie tekstu podobnego do ludzkiego | Agenci, Komponenty modularne, Współpraca | Rozumienie języka naturalnego, generowanie treści |
| Azure AI Agent Service | Elastyczne modele, bezpieczeństwo korporacyjne, generowanie kodu, wywoływanie narzędzi |
## Poprzednia lekcja

[Wprowadzenie do agentów AI i przypadków użycia agentów](../01-intro-to-ai-agents/README.md)

## Następna lekcja

[Zrozumienie agentowych wzorców projektowych](../03-agentic-design-patterns/README.md)

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najbardziej precyzyjne, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako źródło ostateczne. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.