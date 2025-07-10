<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T08:57:39+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "es"
}
-->
. Según Wikipedia, un actor es _el bloque básico de construcción de la computación concurrente. En respuesta a un mensaje que recibe, un actor puede: tomar decisiones locales, crear más actores, enviar más mensajes y determinar cómo responder al siguiente mensaje recibido_.

**Casos de uso**: Automatización de generación de código, tareas de análisis de datos y creación de agentes personalizados para funciones de planificación e investigación.

Aquí algunos conceptos clave de AutoGen:

- **Agentes**. Un agente es una entidad de software que:
  - **Se comunica mediante mensajes**, los cuales pueden ser síncronos o asíncronos.
  - **Mantiene su propio estado**, que puede ser modificado por mensajes entrantes.
  - **Realiza acciones** en respuesta a los mensajes recibidos o cambios en su estado. Estas acciones pueden modificar el estado del agente y producir efectos externos, como actualizar registros de mensajes, enviar nuevos mensajes, ejecutar código o realizar llamadas a APIs.
    
  Aquí tienes un fragmento de código corto donde creas tu propio agente con capacidades de chat:

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
    
    En el código anterior, `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` es un agente preconstruido que puede manejar completaciones de chat.

    Vamos a informar a AutoGen sobre este tipo de agente y a iniciar el programa a continuación:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    En el código anterior, los agentes se registran con el entorno de ejecución y luego se envía un mensaje al agente, lo que resulta en la siguiente salida:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **Multiagentes**. AutoGen soporta la creación de múltiples agentes que pueden trabajar juntos para lograr tareas complejas. Los agentes pueden comunicarse, compartir información y coordinar sus acciones para resolver problemas de forma más eficiente. Para crear un sistema multiagente, puedes definir diferentes tipos de agentes con funciones y roles especializados, como recuperación de datos, análisis, toma de decisiones e interacción con el usuario. Veamos cómo se ve tal creación para entenderlo mejor:

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

    En el código anterior tenemos un `GroupChatManager` que está registrado en el entorno de ejecución. Este administrador es responsable de coordinar las interacciones entre diferentes tipos de agentes, como escritores, ilustradores, editores y usuarios.

- **Entorno de ejecución de agentes**. El framework proporciona un entorno de ejecución que permite la comunicación entre agentes, gestiona sus identidades y ciclos de vida, y aplica límites de seguridad y privacidad. Esto significa que puedes ejecutar tus agentes en un entorno seguro y controlado, asegurando que puedan interactuar de forma segura y eficiente. Hay dos entornos de ejecución de interés:
  - **Entorno de ejecución independiente**. Es una buena opción para aplicaciones de un solo proceso donde todos los agentes están implementados en el mismo lenguaje de programación y se ejecutan en el mismo proceso. Aquí tienes una ilustración de cómo funciona:

Pila de aplicación

    *los agentes se comunican mediante mensajes a través del entorno de ejecución, y este gestiona el ciclo de vida de los agentes*

  - **Entorno de ejecución distribuido**, es adecuado para aplicaciones multiproceso donde los agentes pueden estar implementados en diferentes lenguajes de programación y ejecutarse en distintas máquinas. Aquí tienes una ilustración de cómo funciona:

## Semantic Kernel + Agent Framework

Semantic Kernel es un SDK de orquestación de IA listo para empresas. Consiste en conectores de IA y memoria, junto con un Framework de Agentes.

Primero cubramos algunos componentes básicos:

- **Conectores de IA**: Es una interfaz con servicios externos de IA y fuentes de datos para usar tanto en Python como en C#.

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

    Aquí tienes un ejemplo simple de cómo crear un kernel y añadir un servicio de completado de chat. Semantic Kernel crea una conexión con un servicio externo de IA, en este caso, Azure OpenAI Chat Completion.

- **Plugins**: Estos encapsulan funciones que una aplicación puede usar. Hay plugins ya hechos y otros personalizados que puedes crear. Un concepto relacionado es el de "funciones de prompt". En lugar de proporcionar indicaciones en lenguaje natural para invocar funciones, transmites ciertas funciones al modelo. Basado en el contexto actual del chat, el modelo puede elegir llamar a una de estas funciones para completar una solicitud o consulta. Aquí tienes un ejemplo:

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

    Aquí, primero tienes una plantilla de prompt `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions`. Observa el nombre de la función que ayuda a Semantic Kernel a entender qué hace la función y cuándo debe ser llamada.

- **Función nativa**: También hay funciones nativas que el framework puede llamar directamente para realizar la tarea. Aquí un ejemplo de una función que recupera el contenido de un archivo:

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

- **Memoria**: Abstrae y simplifica la gestión del contexto para aplicaciones de IA. La idea con la memoria es que es algo que el LLM debería conocer. Puedes almacenar esta información en un vector store que termina siendo una base de datos en memoria, una base de datos vectorial o similar. Aquí un ejemplo de un escenario muy simplificado donde se agregan *hechos* a la memoria:

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

    Estos hechos se almacenan en la colección de memoria `SummarizedAzureDocs`. Este es un ejemplo muy simplificado, pero puedes ver cómo almacenar información en la memoria para que el LLM la use.

Eso cubre lo básico del framework Semantic Kernel, ¿qué hay del Agent Framework?

## Azure AI Agent Service

Azure AI Agent Service es una incorporación más reciente, presentada en Microsoft Ignite 2024. Permite el desarrollo y despliegue de agentes de IA con modelos más flexibles, como llamar directamente a LLMs de código abierto como Llama 3, Mistral y Cohere.

Azure AI Agent Service proporciona mecanismos de seguridad empresarial más robustos y métodos de almacenamiento de datos, haciéndolo adecuado para aplicaciones empresariales.

Funciona de forma nativa con frameworks de orquestación multiagente como AutoGen y Semantic Kernel.

Este servicio está actualmente en vista previa pública y soporta Python y C# para construir agentes.

Usando Semantic Kernel Python, podemos crear un Azure AI Agent con un plugin definido por el usuario:

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

### Conceptos clave

Azure AI Agent Service tiene los siguientes conceptos clave:

- **Agente**. Azure AI Agent Service se integra con Azure AI Foundry. Dentro de AI Foundry, un agente de IA actúa como un microservicio "inteligente" que puede usarse para responder preguntas (RAG), realizar acciones o automatizar completamente flujos de trabajo. Lo logra combinando el poder de modelos generativos de IA con herramientas que le permiten acceder e interactuar con fuentes de datos del mundo real. Aquí un ejemplo de un agente:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    En este ejemplo, se crea un agente con el modelo `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent`. El agente está equipado con herramientas y recursos para realizar tareas de interpretación de código.

- **Hilo y mensajes**. El hilo es otro concepto importante. Representa una conversación o interacción entre un agente y un usuario. Los hilos pueden usarse para seguir el progreso de una conversación, almacenar información de contexto y gestionar el estado de la interacción. Aquí un ejemplo de un hilo:

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

    En el código anterior, se crea un hilo. Luego, se envía un mensaje al hilo. Al llamar a `create_and_process_run`, se le pide al agente que realice trabajo en el hilo. Finalmente, los mensajes se obtienen y registran para ver la respuesta del agente. Los mensajes indican el progreso de la conversación entre el usuario y el agente. También es importante entender que los mensajes pueden ser de diferentes tipos como texto, imagen o archivo; por ejemplo, el trabajo del agente puede haber generado una imagen o una respuesta de texto. Como desarrollador, puedes usar esta información para procesar la respuesta o presentarla al usuario.

- **Integración con otros frameworks de IA**. Azure AI Agent Service puede interactuar con otros frameworks como AutoGen y Semantic Kernel, lo que significa que puedes construir parte de tu aplicación en uno de estos frameworks y, por ejemplo, usar el Agent Service como orquestador, o construir todo dentro del Agent Service.

**Casos de uso**: Azure AI Agent Service está diseñado para aplicaciones empresariales que requieren un despliegue seguro, escalable y flexible de agentes de IA.

## ¿Cuál es la diferencia entre estos frameworks?

Parece que hay mucha superposición entre estos frameworks, pero existen diferencias clave en cuanto a diseño, capacidades y casos de uso objetivo:

- **AutoGen**: Es un framework de experimentación enfocado en investigación avanzada sobre sistemas multiagente. Es el mejor lugar para experimentar y prototipar sistemas multiagente sofisticados.
- **Semantic Kernel**: Es una biblioteca lista para producción para construir aplicaciones agenticas empresariales. Se enfoca en aplicaciones agenticas distribuidas y orientadas a eventos, habilitando múltiples LLMs y SLMs, herramientas y patrones de diseño para agentes únicos o múltiples.
- **Azure AI Agent Service**: Es una plataforma y servicio de despliegue en Azure Foundry para agentes. Ofrece conectividad a servicios soportados por Azure Foundry como Azure OpenAI, Azure AI Search, Bing Search y ejecución de código.

¿Aún no sabes cuál elegir?

### Casos de uso

Veamos si podemos ayudarte repasando algunos casos comunes:

> P: Estoy experimentando, aprendiendo y construyendo aplicaciones de agentes para pruebas de concepto, y quiero poder construir y experimentar rápido.
>
> R: AutoGen sería una buena opción para este escenario, ya que se enfoca en aplicaciones agenticas distribuidas y orientadas a eventos, y soporta patrones avanzados de diseño multiagente.

> P: ¿Qué hace que AutoGen sea mejor opción que Semantic Kernel y Azure AI Agent Service para este caso?
>
> R: AutoGen está diseñado específicamente para aplicaciones agenticas distribuidas y orientadas a eventos, lo que lo hace ideal para automatizar generación de código y tareas de análisis de datos. Proporciona las herramientas y capacidades necesarias para construir sistemas multiagente complejos de manera eficiente.

> P: Parece que Azure AI Agent Service también podría funcionar aquí, tiene herramientas para generación de código y más.
>
> R: Sí, Azure AI Agent Service es un servicio de plataforma para agentes y añade capacidades integradas para múltiples modelos, Azure AI Search, Bing Search y Azure Functions. Facilita construir tus agentes en el Portal Foundry y desplegarlos a escala.

> P: Sigo confundido, solo dame una opción.
>
> R: Una excelente opción es construir tu aplicación primero en Semantic Kernel y luego usar Azure AI Agent Service para desplegar tu agente. Este enfoque te permite persistir fácilmente tus agentes mientras aprovechas el poder para construir sistemas multiagente en Semantic Kernel. Además, Semantic Kernel tiene un conector en AutoGen, facilitando usar ambos frameworks juntos.

Resumamos las diferencias clave en una tabla:

| Framework           | Enfoque                                      | Conceptos clave                        | Casos de uso                          |
|---------------------|----------------------------------------------|--------------------------------------|-------------------------------------|
| AutoGen             | Aplicaciones agenticas distribuidas y orientadas a eventos | Agentes, Personas, Funciones, Datos  | Generación de código, análisis de datos |
| Semantic Kernel     | Comprensión y generación de texto humanoide | Agentes, Componentes modulares, Colaboración | Comprensión de lenguaje natural, generación de contenido |
| Azure AI Agent Service | Modelos flexibles, seguridad empresarial, generación de código, llamadas a herramientas |
## Lección Anterior

[Introducción a los Agentes de IA y Casos de Uso de Agentes](../01-intro-to-ai-agents/README.md)

## Próxima Lección

[Entendiendo los Patrones de Diseño Agéntico](../03-agentic-design-patterns/README.md)

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea derivada del uso de esta traducción.