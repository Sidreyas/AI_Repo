<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T07:47:40+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "fr"
}
-->
. Selon Wikipedia, un acteur est _le bloc de base du calcul concurrent. En réponse à un message reçu, un acteur peut : prendre des décisions locales, créer d’autres acteurs, envoyer davantage de messages et déterminer comment répondre au prochain message reçu_.

**Cas d'utilisation** : automatisation de la génération de code, tâches d’analyse de données, et création d’agents personnalisés pour la planification et les fonctions de recherche.

Voici quelques concepts clés importants d’AutoGen :

- **Agents**. Un agent est une entité logicielle qui :
  - **Communique via des messages**, ces messages pouvant être synchrones ou asynchrones.
  - **Maintient son propre état**, qui peut être modifié par les messages entrants.
  - **Effectue des actions** en réponse aux messages reçus ou aux changements d’état. Ces actions peuvent modifier l’état de l’agent et produire des effets externes, comme la mise à jour des journaux de messages, l’envoi de nouveaux messages, l’exécution de code ou des appels API.
    
  Voici un court extrait de code dans lequel vous créez votre propre agent avec des capacités de chat :

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
    
    Dans le code précédent, `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` est un agent préconstruit capable de gérer des complétions de chat.

    Informons maintenant AutoGen de ce type d’agent et lançons le programme :

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    Dans le code précédent, les agents sont enregistrés dans l’environnement d’exécution, puis un message est envoyé à l’agent, ce qui produit la sortie suivante :

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **Multi-agents**. AutoGen supporte la création de plusieurs agents pouvant collaborer pour accomplir des tâches complexes. Les agents peuvent communiquer, partager des informations et coordonner leurs actions pour résoudre des problèmes plus efficacement. Pour créer un système multi-agent, vous pouvez définir différents types d’agents avec des fonctions et rôles spécialisés, tels que la récupération de données, l’analyse, la prise de décision et l’interaction utilisateur. Voyons à quoi cela ressemble :

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

    Dans le code précédent, nous avons un `GroupChatManager` enregistré dans l’environnement d’exécution. Ce gestionnaire coordonne les interactions entre différents types d’agents, comme les rédacteurs, illustrateurs, éditeurs et utilisateurs.

- **Environnement d’exécution des agents**. Le framework fournit un environnement d’exécution qui permet la communication entre agents, gère leurs identités et cycles de vie, et applique des règles de sécurité et de confidentialité. Cela signifie que vous pouvez exécuter vos agents dans un environnement sécurisé et contrôlé, garantissant des interactions sûres et efficaces. Il existe deux environnements d’exécution principaux :
  - **Environnement autonome**. Idéal pour les applications à processus unique où tous les agents sont implémentés dans le même langage de programmation et s’exécutent dans le même processus. Voici une illustration de son fonctionnement :

Pile applicative

    *les agents communiquent via des messages transmis par l’environnement d’exécution, qui gère leur cycle de vie*

  - **Environnement distribué**, adapté aux applications multi-processus où les agents peuvent être implémentés dans différents langages et s’exécuter sur plusieurs machines. Voici une illustration de son fonctionnement :

## Semantic Kernel + Agent Framework

Semantic Kernel est un SDK d’orchestration IA prêt pour l’entreprise. Il comprend des connecteurs AI et mémoire, ainsi qu’un Agent Framework.

Commençons par quelques composants clés :

- **Connecteurs AI** : Interface avec des services AI externes et des sources de données, utilisable en Python et C#.

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

    Voici un exemple simple de création d’un kernel avec un service de complétion de chat. Semantic Kernel établit une connexion à un service AI externe, ici Azure OpenAI Chat Completion.

- **Plugins** : Encapsulent des fonctions qu’une application peut utiliser. Il existe des plugins prêts à l’emploi ainsi que des personnalisés que vous pouvez créer. Un concept lié est celui des "fonctions prompt". Au lieu de fournir des instructions en langage naturel pour invoquer une fonction, vous diffusez certaines fonctions au modèle. Selon le contexte actuel du chat, le modèle peut choisir d’appeler une de ces fonctions pour compléter une requête. Exemple :

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

    Ici, vous avez un template prompt `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`. Notez le nom de la fonction qui aide Semantic Kernel à comprendre ce que fait la fonction et quand elle doit être appelée.

- **Fonction native** : Le framework peut aussi appeler directement des fonctions natives pour exécuter une tâche. Voici un exemple d’une fonction récupérant le contenu d’un fichier :

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

- **Mémoire** : Simplifie la gestion du contexte pour les applications AI. L’idée est que le LLM doit pouvoir accéder à ces informations. Vous pouvez stocker ces données dans une base vectorielle, qui peut être une base en mémoire, une base vectorielle ou similaire. Voici un exemple simplifié où des *faits* sont ajoutés à la mémoire :

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

    Ces faits sont ensuite stockés dans la collection mémoire `SummarizedAzureDocs`. C’est un exemple très simplifié, mais vous pouvez voir comment stocker des informations en mémoire pour que le LLM les utilise.

Voilà les bases du framework Semantic Kernel, qu’en est-il de l’Agent Framework ?

## Azure AI Agent Service

Azure AI Agent Service est une addition plus récente, présentée lors de Microsoft Ignite 2024. Il permet le développement et le déploiement d’agents IA avec des modèles plus flexibles, comme l’appel direct de LLM open source tels que Llama 3, Mistral et Cohere.

Azure AI Agent Service offre des mécanismes de sécurité d’entreprise renforcés et des méthodes de stockage des données adaptées aux applications professionnelles.

Il fonctionne nativement avec des frameworks d’orchestration multi-agents comme AutoGen et Semantic Kernel.

Ce service est actuellement en aperçu public et supporte Python et C# pour la création d’agents.

Avec Semantic Kernel Python, on peut créer un agent Azure AI avec un plugin défini par l’utilisateur :

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

### Concepts clés

Azure AI Agent Service comprend les concepts suivants :

- **Agent**. Azure AI Agent Service s’intègre avec Azure AI Foundry. Dans AI Foundry, un agent AI agit comme un microservice "intelligent" pouvant répondre à des questions (RAG), effectuer des actions ou automatiser complètement des workflows. Il combine la puissance des modèles génératifs AI avec des outils lui permettant d’accéder à des sources de données réelles. Exemple d’agent :

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    Ici, un agent est créé avec le modèle `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`. L’agent est équipé d’outils et ressources pour exécuter des tâches d’interprétation de code.

- **Fil de discussion et messages**. Le fil de discussion est un autre concept important. Il représente une conversation ou interaction entre un agent et un utilisateur. Les fils permettent de suivre la progression d’une conversation, stocker le contexte et gérer l’état de l’interaction. Exemple de fil :

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

    Dans le code précédent, un fil est créé, puis un message est envoyé. En appelant `create_and_process_run`, l’agent est invité à travailler sur ce fil. Enfin, les messages sont récupérés et affichés pour voir la réponse de l’agent. Les messages peuvent être de différents types : texte, image, fichier, etc., reflétant les résultats du travail de l’agent. En tant que développeur, vous pouvez ensuite utiliser ces informations pour traiter la réponse ou l’afficher à l’utilisateur.

- **Intégration avec d’autres frameworks AI**. Azure AI Agent Service peut interagir avec d’autres frameworks comme AutoGen et Semantic Kernel, ce qui permet de construire une partie de votre application avec ces frameworks et, par exemple, d’utiliser le service Agent comme orchestrateur, ou bien de tout construire dans le service Agent.

**Cas d’utilisation** : Azure AI Agent Service est conçu pour les applications d’entreprise nécessitant un déploiement d’agents AI sécurisé, évolutif et flexible.

## Quelles sont les différences entre ces frameworks ?

Il semble y avoir beaucoup de recoupements entre ces frameworks, mais voici quelques différences clés en termes de conception, capacités et cas d’usage ciblés :

- **AutoGen** : Framework d’expérimentation axé sur la recherche avancée en systèmes multi-agents. Idéal pour expérimenter et prototyper des systèmes multi-agents sophistiqués.
- **Semantic Kernel** : Bibliothèque d’agents prête pour la production, pour construire des applications agentiques en entreprise. Concentre sur des applications agentiques distribuées et pilotées par événements, supportant plusieurs LLMs, SLMs, outils, et modèles agentiques simples ou multi-agents.
- **Azure AI Agent Service** : Plateforme et service de déploiement dans Azure Foundry pour agents. Offre une connectivité avec les services Azure comme Azure OpenAI, Azure AI Search, Bing Search et l’exécution de code.

Vous hésitez encore sur le choix ?

### Cas d’usage

Voyons si cela peut vous aider avec quelques scénarios fréquents :

> Q : Je fais de l’expérimentation, j’apprends et je construis des applications agents en preuve de concept, je veux pouvoir construire et expérimenter rapidement.
>
> R : AutoGen est un bon choix ici, car il se concentre sur les applications agentiques pilotées par événements et distribuées, et supporte des modèles avancés multi-agents.

> Q : Qu’est-ce qui fait d’AutoGen un meilleur choix que Semantic Kernel et Azure AI Agent Service pour ce cas ?
>
> R : AutoGen est spécialement conçu pour les applications agentiques distribuées pilotées par événements, ce qui le rend bien adapté à l’automatisation de la génération de code et des tâches d’analyse de données. Il offre les outils et capacités nécessaires pour construire efficacement des systèmes multi-agents complexes.

> Q : Il semble que Azure AI Agent Service pourrait aussi fonctionner ici, il a des outils pour la génération de code et plus encore ?
>
> R : Oui, Azure AI Agent Service est un service plateforme pour agents, avec des capacités intégrées pour plusieurs modèles, Azure AI Search, Bing Search et Azure Functions. Il facilite la construction d’agents via le portail Foundry et leur déploiement à grande échelle.

> Q : Je suis encore confus, donnez-moi une seule option.
>
> R : Un excellent choix est de construire votre application d’abord avec Semantic Kernel, puis d’utiliser Azure AI Agent Service pour déployer votre agent. Cette approche vous permet de persister facilement vos agents tout en tirant parti de la puissance de Semantic Kernel pour construire des systèmes multi-agents. De plus, Semantic Kernel dispose d’un connecteur dans AutoGen, facilitant l’utilisation conjointe des deux frameworks.

Résumons les différences clés dans un tableau : | Framework | Focus | Concepts Clés | Cas d’Usage | | --- | --- | --- | --- | | AutoGen | Applications agentiques distribuées pilotées par événements | Agents, Personas, Fonctions, Données | Génération de code, tâches d’analyse de données | | Semantic Kernel | Compréhension et génération de texte naturel | Agents, Composants modulaires, Collaboration | Compréhension du langage naturel, génération de contenu | | Azure AI Agent Service | Modèles flexibles, sécurité d’entreprise, génération de code, appels d’outils |
## Leçon précédente

[Introduction aux agents IA et cas d'utilisation des agents](../01-intro-to-ai-agents/README.md)

## Leçon suivante

[Comprendre les modèles de conception agentique](../03-agentic-design-patterns/README.md)

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.