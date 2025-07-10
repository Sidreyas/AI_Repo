<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T09:42:51+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "hi"
}
-->
. विकिपीडिया के अनुसार, एक actor _समवर्ती गणना की मूल इकाई है। इसे प्राप्त संदेश के जवाब में, एक actor कर सकता है: स्थानीय निर्णय लेना, अधिक actors बनाना, और अधिक संदेश भेजना, और अगले प्राप्त संदेश के जवाब का निर्धारण करना_।

**उपयोग के मामले**: कोड जनरेशन, डेटा विश्लेषण कार्यों को स्वचालित करना, और योजना और अनुसंधान कार्यों के लिए कस्टम एजेंट बनाना।

यहाँ AutoGen के कुछ महत्वपूर्ण मूल अवधारणाएँ हैं:

- **एजेंट्स**। एक एजेंट एक सॉफ्टवेयर इकाई है जो:
  - **संदेशों के माध्यम से संवाद करता है**, ये संदेश सिंक्रोनस या असिंक्रोनस हो सकते हैं।
  - **अपनी स्थिति बनाए रखता है**, जिसे आने वाले संदेशों द्वारा संशोधित किया जा सकता है।
  - **प्राप्त संदेशों या अपनी स्थिति में बदलाव के जवाब में क्रियाएँ करता है।** ये क्रियाएँ एजेंट की स्थिति को बदल सकती हैं और बाहरी प्रभाव पैदा कर सकती हैं, जैसे संदेश लॉग अपडेट करना, नए संदेश भेजना, कोड निष्पादित करना, या API कॉल करना।

  यहाँ एक छोटा कोड स्निपेट है जिसमें आप चैट क्षमताओं के साथ अपना एजेंट बना सकते हैं:

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
    
    पिछले कोड में, `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` एक पूर्व-निर्मित एजेंट है जो चैट पूर्णताओं को संभाल सकता है।

    चलिए AutoGen को इस एजेंट प्रकार के बारे में बताते हैं और प्रोग्राम शुरू करते हैं:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    पिछले कोड में एजेंट्स को रनटाइम के साथ पंजीकृत किया गया है और फिर एजेंट को एक संदेश भेजा गया है, जिसके परिणामस्वरूप निम्नलिखित आउटपुट प्राप्त होता है:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **मल्टी एजेंट्स**। AutoGen कई एजेंट्स के निर्माण का समर्थन करता है जो मिलकर जटिल कार्यों को पूरा कर सकते हैं। एजेंट्स संवाद कर सकते हैं, जानकारी साझा कर सकते हैं, और अपनी क्रियाओं का समन्वय कर सकते हैं ताकि समस्याओं को अधिक कुशलता से हल किया जा सके। मल्टी-एजेंट सिस्टम बनाने के लिए, आप विशिष्ट कार्यों और भूमिकाओं वाले विभिन्न प्रकार के एजेंट्स परिभाषित कर सकते हैं, जैसे डेटा पुनःप्राप्ति, विश्लेषण, निर्णय-निर्माण, और उपयोगकर्ता इंटरैक्शन। आइए देखें ऐसा निर्माण कैसा दिखता है:

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

    पिछले कोड में, हमारे पास एक `GroupChatManager` है जो रनटाइम के साथ पंजीकृत है। यह प्रबंधक विभिन्न प्रकार के एजेंट्स जैसे लेखक, चित्रकार, संपादक, और उपयोगकर्ताओं के बीच संवाद का समन्वय करता है।

- **एजेंट रनटाइम**। यह फ्रेमवर्क एक रनटाइम वातावरण प्रदान करता है, जो एजेंट्स के बीच संचार सक्षम करता है, उनकी पहचान और जीवनचक्र का प्रबंधन करता है, और सुरक्षा व गोपनीयता सीमाओं को लागू करता है। इसका मतलब है कि आप अपने एजेंट्स को सुरक्षित और नियंत्रित वातावरण में चला सकते हैं, यह सुनिश्चित करते हुए कि वे सुरक्षित और प्रभावी ढंग से इंटरैक्ट कर सकें। दो प्रकार के रनटाइम हैं:
  - **स्टैंडअलोन रनटाइम**। यह एक अच्छा विकल्प है उन सिंगल-प्रोसेस एप्लिकेशन के लिए जहां सभी एजेंट्स एक ही प्रोग्रामिंग भाषा में बनाए गए हों और एक ही प्रोसेस में चल रहे हों। यह कैसे काम करता है, इसका चित्रण इस प्रकार है:

एप्लिकेशन स्टैक

    *एजेंट्स संदेशों के माध्यम से रनटाइम के साथ संवाद करते हैं, और रनटाइम एजेंट्स के जीवनचक्र का प्रबंधन करता है*

  - **वितरित एजेंट रनटाइम**, यह मल्टी-प्रोसेस एप्लिकेशन के लिए उपयुक्त है जहाँ एजेंट्स विभिन्न प्रोग्रामिंग भाषाओं में बनाए जा सकते हैं और अलग-अलग मशीनों पर चल रहे होते हैं। यह कैसे काम करता है, इसका चित्रण इस प्रकार है:

## Semantic Kernel + Agent Framework

Semantic Kernel एक एंटरप्राइज-तैयार AI ऑर्केस्ट्रेशन SDK है। इसमें AI और मेमोरी कनेक्टर्स के साथ एक Agent Framework शामिल है।

पहले कुछ मूल घटकों को कवर करते हैं:

- **AI कनेक्टर्स**: यह बाहरी AI सेवाओं और डेटा स्रोतों के साथ इंटरफेस है, जो Python और C# दोनों में उपयोग के लिए उपलब्ध है।

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

    यहाँ एक सरल उदाहरण है कि आप कैसे एक kernel बना सकते हैं और चैट पूर्णता सेवा जोड़ सकते हैं। Semantic Kernel एक बाहरी AI सेवा, इस मामले में Azure OpenAI Chat Completion से कनेक्शन बनाता है।

- **प्लगइन्स**: ये उन फंक्शन्स को समाहित करते हैं जिन्हें कोई एप्लिकेशन उपयोग कर सकता है। कुछ रेडीमेड प्लगइन्स होते हैं और कुछ आप स्वयं बना सकते हैं। एक संबंधित अवधारणा है "प्रॉम्प्ट फंक्शन्स"। फंक्शन को कॉल करने के लिए प्राकृतिक भाषा संकेत देने के बजाय, आप कुछ फंक्शन्स को मॉडल को प्रसारित करते हैं। वर्तमान चैट संदर्भ के आधार पर, मॉडल इनमें से किसी एक फंक्शन को कॉल कर सकता है ताकि अनुरोध या क्वेरी पूरी हो सके। उदाहरण:

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

    यहाँ, आपके पास एक टेम्पलेट प्रॉम्प्ट `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions` है। ध्यान दें फंक्शन का नाम जो Semantic Kernel को समझने में मदद करता है कि फंक्शन क्या करता है और इसे कब कॉल किया जाना चाहिए।

- **नेटिव फंक्शन**: ऐसे नेटिव फंक्शन्स भी होते हैं जिन्हें फ्रेमवर्क सीधे कॉल कर सकता है ताकि कार्य पूरा हो सके। यहाँ एक उदाहरण है जो किसी फ़ाइल से सामग्री प्राप्त करता है:

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

- **मेमोरी**: AI एप्स के लिए संदर्भ प्रबंधन को सरल बनाता है। मेमोरी का विचार यह है कि यह LLM के लिए ज्ञात होनी चाहिए। आप इस जानकारी को वेक्टर स्टोर में संग्रहीत कर सकते हैं जो अंततः एक इन-मेमोरी डेटाबेस या वेक्टर डेटाबेस जैसा होता है। यहाँ एक बहुत ही सरल उदाहरण है जहाँ *तथ्यों* को मेमोरी में जोड़ा जाता है:

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

    ये तथ्य मेमोरी संग्रह `SummarizedAzureDocs` में संग्रहित होते हैं। यह एक सरल उदाहरण है, लेकिन आप देख सकते हैं कि आप LLM के उपयोग के लिए जानकारी मेमोरी में कैसे स्टोर कर सकते हैं।

तो यह Semantic Kernel फ्रेमवर्क का मूल है, एजेंट फ्रेमवर्क के बारे में क्या?

## Azure AI Agent Service

Azure AI Agent Service Microsoft Ignite 2024 में पेश की गई एक नवीन सेवा है। यह अधिक लचीले मॉडलों के साथ AI एजेंट्स के विकास और तैनाती की अनुमति देती है, जैसे कि सीधे ओपन-सोर्स LLMs जैसे Llama 3, Mistral, और Cohere को कॉल करना।

Azure AI Agent Service मजबूत एंटरप्राइज सुरक्षा तंत्र और डेटा संग्रहण विधियाँ प्रदान करती है, जो इसे एंटरप्राइज एप्लिकेशन के लिए उपयुक्त बनाती हैं।

यह सेवा AutoGen और Semantic Kernel जैसे मल्टी-एजेंट ऑर्केस्ट्रेशन फ्रेमवर्क्स के साथ आउट-ऑफ-द-बॉक्स काम करती है।

यह सेवा वर्तमान में Public Preview में है और एजेंट्स बनाने के लिए Python और C# का समर्थन करती है।

Semantic Kernel Python का उपयोग करते हुए, हम एक Azure AI Agent बना सकते हैं जिसमें उपयोगकर्ता-परिभाषित प्लगइन शामिल है:

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

### मूल अवधारणाएँ

Azure AI Agent Service की निम्नलिखित मूल अवधारणाएँ हैं:

- **एजेंट**। Azure AI Agent Service Azure AI Foundry के साथ एकीकृत होता है। AI Foundry में, एक AI एजेंट एक "स्मार्ट" माइक्रोसर्विस के रूप में कार्य करता है जिसे प्रश्नों का उत्तर देने (RAG), क्रियाएँ करने, या कार्यप्रवाहों को पूरी तरह से स्वचालित करने के लिए उपयोग किया जा सकता है। यह जनरेटिव AI मॉडलों की शक्ति को उन उपकरणों के साथ मिलाकर करता है जो इसे वास्तविक दुनिया के डेटा स्रोतों तक पहुंचने और इंटरैक्ट करने की अनुमति देते हैं। यहाँ एक एजेंट का उदाहरण है:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    इस उदाहरण में, एक एजेंट मॉडल `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` के साथ बनाया गया है। एजेंट कोड व्याख्या कार्यों को करने के लिए उपकरणों और संसाधनों से लैस है।

- **थ्रेड और संदेश**। थ्रेड एक और महत्वपूर्ण अवधारणा है। यह एजेंट और उपयोगकर्ता के बीच बातचीत या इंटरैक्शन का प्रतिनिधित्व करता है। थ्रेड्स का उपयोग बातचीत की प्रगति को ट्रैक करने, संदर्भ जानकारी संग्रहीत करने, और इंटरैक्शन की स्थिति प्रबंधित करने के लिए किया जाता है। यहाँ एक थ्रेड का उदाहरण है:

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

    पिछले कोड में, एक थ्रेड बनाया गया है। उसके बाद, थ्रेड को एक संदेश भेजा गया है। `create_and_process_run` कॉल करके, एजेंट से कहा गया है कि वह थ्रेड पर कार्य करे। अंत में, संदेश प्राप्त किए गए और लॉग किए गए ताकि एजेंट की प्रतिक्रिया देखी जा सके। संदेश बातचीत की प्रगति को दर्शाते हैं। यह भी महत्वपूर्ण है कि संदेश विभिन्न प्रकार के हो सकते हैं जैसे टेक्स्ट, इमेज, या फाइल, जो एजेंट के कार्य का परिणाम हो सकते हैं। एक डेवलपर के रूप में, आप इस जानकारी का उपयोग प्रतिक्रिया को और प्रोसेस करने या उपयोगकर्ता को प्रस्तुत करने के लिए कर सकते हैं।

- **अन्य AI फ्रेमवर्क्स के साथ एकीकरण**। Azure AI Agent Service AutoGen और Semantic Kernel जैसे फ्रेमवर्क्स के साथ इंटरैक्ट कर सकता है, जिसका मतलब है कि आप अपने एप्लिकेशन का हिस्सा इन फ्रेमवर्क्स में बना सकते हैं और उदाहरण के लिए Agent Service को ऑर्केस्ट्रेटर के रूप में उपयोग कर सकते हैं, या आप पूरी चीज़ Agent Service में बना सकते हैं।

**उपयोग के मामले**: Azure AI Agent Service उन एंटरप्राइज एप्लिकेशन के लिए डिज़ाइन किया गया है जिन्हें सुरक्षित, स्केलेबल, और लचीली AI एजेंट तैनाती की आवश्यकता होती है।

## इन फ्रेमवर्क्स के बीच क्या अंतर है?

ऐसा लगता है कि इन फ्रेमवर्क्स में बहुत अधिक ओवरलैप है, लेकिन उनके डिजाइन, क्षमताओं, और लक्षित उपयोग मामलों के संदर्भ में कुछ मुख्य अंतर हैं:

- **AutoGen**: यह एक प्रयोगात्मक फ्रेमवर्क है जो मल्टी-एजेंट सिस्टम्स पर अग्रणी शोध पर केंद्रित है। यह जटिल मल्टी-एजेंट सिस्टम्स को तेजी से प्रोटोटाइप और प्रयोग करने के लिए सबसे अच्छा स्थान है।
- **Semantic Kernel**: यह एंटरप्राइज एजेंटिक एप्लिकेशन बनाने के लिए उत्पादन-तैयार एजेंट लाइब्रेरी है। यह ईवेंट-ड्रिवन, वितरित एजेंटिक एप्लिकेशन पर केंद्रित है, जो कई LLMs और SLMs, टूल्स, और सिंगल/मल्टी-एजेंट डिजाइन पैटर्न्स को सक्षम बनाता है।
- **Azure AI Agent Service**: यह Azure Foundry में एजेंट्स के लिए एक प्लेटफ़ॉर्म और तैनाती सेवा है। यह Azure OpenAI, Azure AI Search, Bing Search, और कोड निष्पादन जैसी Azure Foundry सेवाओं से कनेक्टिविटी प्रदान करता है।

फिर भी तय नहीं कर पाए कि किसे चुनें?

### उपयोग के मामले

आइए कुछ सामान्य उपयोग मामलों के माध्यम से देखें कि क्या हम आपकी मदद कर सकते हैं:

> प्रश्न: मैं प्रयोग कर रहा हूँ, सीख रहा हूँ और प्रूफ-ऑफ-कॉन्सेप्ट एजेंट एप्लिकेशन बना रहा हूँ, और मैं जल्दी से निर्माण और प्रयोग करना चाहता हूँ।
>
> उत्तर: इस परिदृश्य के लिए AutoGen एक अच्छा विकल्प होगा, क्योंकि यह ईवेंट-ड्रिवन, वितरित एजेंटिक एप्लिकेशन पर केंद्रित है और उन्नत मल्टी-एजेंट डिजाइन पैटर्न्स का समर्थन करता है।

> प्रश्न: इस उपयोग मामले के लिए AutoGen को Semantic Kernel और Azure AI Agent Service की तुलना में बेहतर विकल्प क्या बनाता है?
>
> उत्तर: AutoGen विशेष रूप से ईवेंट-ड्रिवन, वितरित एजेंटिक एप्लिकेशन के लिए डिज़ाइन किया गया है, जो कोड जनरेशन और डेटा विश्लेषण कार्यों को स्वचालित करने के लिए उपयुक्त है। यह जटिल मल्टी-एजेंट सिस्टम्स को कुशलता से बनाने के लिए आवश्यक उपकरण और क्षमताएँ प्रदान करता है।

> प्रश्न: ऐसा लगता है कि Azure AI Agent Service भी यहाँ काम कर सकता है, इसमें कोड जनरेशन और अधिक के लिए टूल्स हैं?
>
> उत्तर: हाँ, Azure AI Agent Service एजेंट्स के लिए एक प्लेटफ़ॉर्म सेवा है और इसमें कई मॉडलों, Azure AI Search, Bing Search, और Azure Functions के लिए अंतर्निहित क्षमताएँ हैं। यह Foundry Portal में आपके एजेंट्स को आसानी से बनाने और बड़े पैमाने पर तैनात करने में मदद करता है।

> प्रश्न: मैं अभी भी उलझन में हूँ, मुझे बस एक विकल्प बताएं।
>
> उत्तर: एक बढ़िया विकल्प है कि आप पहले Semantic Kernel में अपना एप्लिकेशन बनाएं और फिर Azure AI Agent Service का उपयोग करके अपने एजेंट को तैनात करें। यह दृष्टिकोण आपको अपने एजेंट्स को आसानी से स्थायी बनाने की अनुमति देता है, साथ ही Semantic Kernel में मल्टी-एजेंट सिस्टम्स बनाने की शक्ति का लाभ उठाता है। इसके अलावा, Semantic Kernel का AutoGen में एक कनेक्टर है, जिससे दोनों फ्रेमवर्क्स को साथ में उपयोग करना आसान हो जाता है।

आइए मुख्य अंतर एक तालिका में सारांशित करें:

| Framework | फोकस | मुख्य अवधारणाएँ | उपयोग के मामले |
| --- | --- | --- | --- |
| AutoGen | ईवेंट-ड्रिवन, वितरित एजेंटिक एप्लिकेशन | एजेंट्स, पर्सोनास, फंक्शन्स, डेटा | कोड जनरेशन, डेटा विश्लेषण कार्य |
| Semantic Kernel | मानव-समान टेक्स्ट सामग्री की समझ और निर्माण | एजेंट्स, मॉड्यूलर घटक, सहयोग | प्राकृतिक भाषा समझ, सामग्री निर्माण |
| Azure AI Agent Service | लचीले मॉडल, एंटरप्राइज सुरक्षा, कोड जनरेशन, टूल कॉलिंग | ... | ... |
## पिछला पाठ

[AI एजेंट्स और एजेंट उपयोग मामलों का परिचय](../01-intro-to-ai-agents/README.md)

## अगला पाठ

[एजेंटिक डिज़ाइन पैटर्न को समझना](../03-agentic-design-patterns/README.md)

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या गलतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।