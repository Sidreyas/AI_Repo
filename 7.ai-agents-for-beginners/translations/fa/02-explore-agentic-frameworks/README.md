<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "da3523bf8fa456371e21d8d14c67305d",
  "translation_date": "2025-05-20T09:19:04+00:00",
  "source_file": "02-explore-agentic-frameworks/README.md",
  "language_code": "fa"
}
-->
. طبق ویکی‌پدیا، بازیگر _بلوک اصلی محاسبات همزمان است. در پاسخ به پیامی که دریافت می‌کند، یک بازیگر می‌تواند: تصمیمات محلی بگیرد، بازیگران بیشتری ایجاد کند، پیام‌های بیشتری ارسال کند و تعیین کند که چگونه به پیام بعدی دریافتی پاسخ دهد_.

**موارد استفاده**: خودکارسازی تولید کد، وظایف تحلیل داده، و ساخت عوامل سفارشی برای برنامه‌ریزی و عملکردهای تحقیقاتی.

در اینجا برخی مفاهیم اصلی مهم AutoGen آورده شده است:

- **بازیگران**. یک بازیگر یک موجودیت نرم‌افزاری است که:
  - **از طریق پیام‌ها ارتباط برقرار می‌کند**، این پیام‌ها می‌توانند همزمان یا ناهمزمان باشند.
  - **حالت خود را حفظ می‌کند** که می‌تواند توسط پیام‌های ورودی تغییر کند.
  - **اقدامات انجام می‌دهد** در پاسخ به پیام‌های دریافتی یا تغییرات در حالت خود. این اقدامات ممکن است حالت بازیگر را تغییر داده و اثرات خارجی ایجاد کنند، مانند به‌روزرسانی لاگ پیام‌ها، ارسال پیام‌های جدید، اجرای کد یا فراخوانی API.
    
  در اینجا یک قطعه کد کوتاه دارید که در آن می‌توانید بازیگر خود را با قابلیت چت ایجاد کنید:

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
    
    در کد قبلی، `MyAssistant` has been created and inherits from `RoutedAgent`. It has a message handler that prints the content of the message and then sends a response using the `AssistantAgent` delegate. Especially note how we assign to `self._delegate` an instance of `AssistantAgent` که یک بازیگر از پیش ساخته شده است که می‌تواند تکمیل چت‌ها را مدیریت کند.

    حالا بیایید AutoGen را از این نوع بازیگر مطلع کنیم و برنامه را شروع کنیم:

    ```python
    
    # main.py
    runtime = SingleThreadedAgentRuntime()
    await MyAgent.register(runtime, "my_agent", lambda: MyAgent())

    runtime.start()  # Start processing messages in the background.
    await runtime.send_message(MyMessageType("Hello, World!"), AgentId("my_agent", "default"))
    ```

    در کد قبلی، بازیگران با زمان اجرا ثبت شده‌اند و سپس پیامی به بازیگر ارسال می‌شود که منجر به خروجی زیر می‌گردد:

    ```text
    # Output from the console:
    my_agent received message: Hello, World!
    my_assistant received message: Hello, World!
    my_assistant responded: Hello! How can I assist you today?
    ```

- **چند بازیگر**. AutoGen از ایجاد چندین بازیگر که می‌توانند با هم همکاری کنند تا وظایف پیچیده را انجام دهند پشتیبانی می‌کند. بازیگران می‌توانند ارتباط برقرار کنند، اطلاعات را به اشتراک بگذارند و هماهنگ عمل کنند تا مسائل را به شکل موثرتری حل کنند. برای ایجاد یک سیستم چند بازیگری، می‌توانید انواع مختلفی از بازیگران با وظایف و نقش‌های تخصصی مانند بازیابی داده، تحلیل، تصمیم‌گیری و تعامل با کاربر تعریف کنید. بیایید ببینیم چنین ساختاری چگونه است:

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

    در کد قبلی، یک `GroupChatManager` داریم که با زمان اجرا ثبت شده است. این مدیر مسئول هماهنگی تعاملات بین انواع مختلف بازیگران، مانند نویسندگان، تصویرگران، ویراستاران و کاربران است.

- **زمان اجرای بازیگر**. این چارچوب یک محیط زمان اجرا فراهم می‌کند که ارتباط بین بازیگران را ممکن می‌سازد، هویت‌ها و چرخه عمر آن‌ها را مدیریت می‌کند و مرزهای امنیتی و حریم خصوصی را اعمال می‌کند. این بدان معناست که می‌توانید بازیگران خود را در یک محیط امن و کنترل شده اجرا کنید، اطمینان حاصل کنید که آن‌ها می‌توانند به‌طور ایمن و کارآمد تعامل داشته باشند. دو نوع زمان اجرا وجود دارد:
  - **زمان اجرای مستقل**. این گزینه‌ای مناسب برای برنامه‌های تک‌فرآیندی است که همه بازیگران در همان زبان برنامه‌نویسی پیاده‌سازی شده و در همان فرآیند اجرا می‌شوند. در اینجا تصویری از نحوه کار آن آمده است:

پشته برنامه

    *بازیگران از طریق پیام‌ها با زمان اجرا ارتباط برقرار می‌کنند و زمان اجرا چرخه عمر بازیگران را مدیریت می‌کند*

  - **زمان اجرای توزیع‌شده بازیگر**، مناسب برنامه‌های چندفرآیندی است که بازیگران ممکن است در زبان‌های برنامه‌نویسی مختلف پیاده‌سازی شده و روی ماشین‌های مختلف اجرا شوند. در اینجا تصویری از نحوه کار آن آمده است:

## Semantic Kernel + چارچوب بازیگر

Semantic Kernel یک SDK سازمانی آماده ارکستراسیون هوش مصنوعی است. این شامل اتصال‌دهنده‌های AI و حافظه به همراه یک چارچوب بازیگر است.

ابتدا برخی اجزای اصلی را مرور کنیم:

- **اتصال‌دهنده‌های AI**: این رابطی است با سرویس‌ها و منابع داده خارجی AI برای استفاده در هر دو زبان Python و C#.

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

    در اینجا یک مثال ساده دارید که چگونه می‌توانید یک هسته ایجاد کرده و یک سرویس تکمیل چت اضافه کنید. Semantic Kernel یک اتصال به سرویس AI خارجی، در این مورد Azure OpenAI Chat Completion، ایجاد می‌کند.

- **افزونه‌ها**: این‌ها عملکردهایی را در بر می‌گیرند که یک برنامه می‌تواند استفاده کند. افزونه‌های آماده و همچنین افزونه‌های سفارشی وجود دارند که می‌توانید ایجاد کنید. یک مفهوم مرتبط "توابع پرامپت" است. به جای ارائه اشاره‌های زبان طبیعی برای فراخوانی تابع، شما توابع خاصی را به مدل پخش می‌کنید. بر اساس زمینه چت فعلی، مدل ممکن است یکی از این توابع را برای تکمیل درخواست یا پرسش فراخوانی کند. در اینجا یک مثال آمده است:

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

    در اینجا، ابتدا یک پرامپت قالبی `skPrompt` that leaves room for the user to input text, `$userInput`. Then you create the kernel function `SummarizeText` and then import it into the kernel with the plugin name `SemanticFunctions` دارید. نام تابعی که به Semantic Kernel کمک می‌کند بفهمد این تابع چه کاری انجام می‌دهد و چه زمانی باید فراخوانی شود را توجه کنید.

- **توابع بومی**: همچنین توابع بومی وجود دارند که چارچوب می‌تواند مستقیماً برای انجام وظیفه فراخوانی کند. در اینجا مثالی از تابعی که محتویات یک فایل را بازیابی می‌کند آمده است:

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

- **حافظه**: مدیریت زمینه برای برنامه‌های AI را انتزاعی و ساده می‌کند. ایده حافظه این است که این چیزی است که LLM باید از آن آگاه باشد. می‌توانید این اطلاعات را در یک فروشگاه برداری ذخیره کنید که در نهایت یک پایگاه داده در حافظه یا پایگاه داده برداری یا مشابه آن است. در اینجا یک مثال بسیار ساده از حالتی که *حقایق* به حافظه اضافه می‌شوند آمده است:

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

    این حقایق سپس در مجموعه حافظه `SummarizedAzureDocs` ذخیره می‌شوند. این مثال بسیار ساده است، اما می‌توانید ببینید چگونه می‌توانید اطلاعات را در حافظه ذخیره کنید تا LLM از آن استفاده کند.

پس این‌ها اصول اولیه چارچوب Semantic Kernel هستند، حالا درباره چارچوب بازیگر چه؟

## سرویس Azure AI Agent

سرویس Azure AI Agent یک افزوده جدیدتر است که در Microsoft Ignite 2024 معرفی شده است. این سرویس امکان توسعه و استقرار عوامل AI با مدل‌های انعطاف‌پذیرتر، مانند فراخوانی مستقیم مدل‌های LLM متن‌باز مانند Llama 3، Mistral و Cohere را فراهم می‌کند.

سرویس Azure AI Agent مکانیزم‌های امنیتی قوی‌تر سازمانی و روش‌های ذخیره‌سازی داده ارائه می‌دهد که آن را برای برنامه‌های سازمانی مناسب می‌سازد.

این سرویس به‌صورت آماده با چارچوب‌های ارکستراسیون چند بازیگری مانند AutoGen و Semantic Kernel کار می‌کند.

این سرویس در حال حاضر در حالت پیش‌نمایش عمومی است و از Python و C# برای ساخت عوامل پشتیبانی می‌کند.

با استفاده از Semantic Kernel Python، می‌توانیم یک عامل Azure AI با یک افزونه تعریف شده توسط کاربر ایجاد کنیم:

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

### مفاهیم اصلی

سرویس Azure AI Agent دارای مفاهیم اصلی زیر است:

- **عامل**. سرویس Azure AI Agent با Azure AI Foundry ادغام شده است. در AI Foundry، یک عامل AI به عنوان یک "میکروسرویس هوشمند" عمل می‌کند که می‌تواند برای پاسخ به سوالات (RAG)، انجام اقدامات یا خودکارسازی کامل جریان‌های کاری استفاده شود. این امر با ترکیب قدرت مدل‌های مولد AI و ابزارهایی که به آن اجازه می‌دهند به منابع داده دنیای واقعی دسترسی داشته و با آن‌ها تعامل کند، محقق می‌شود. در اینجا یک مثال از یک عامل آمده است:

    ```python
    agent = project_client.agents.create_agent(
        model="gpt-4o-mini",
        name="my-agent",
        instructions="You are helpful agent",
        tools=code_interpreter.definitions,
        tool_resources=code_interpreter.resources,
    )
    ```

    در این مثال، یک عامل با مدل `gpt-4o-mini`, a name `my-agent`, and instructions `You are helpful agent` ایجاد شده است. این عامل مجهز به ابزارها و منابعی برای انجام وظایف تفسیر کد است.

- **رشته و پیام‌ها**. رشته یک مفهوم مهم دیگر است. این رشته نمایانگر یک مکالمه یا تعامل بین یک عامل و یک کاربر است. رشته‌ها می‌توانند برای پیگیری پیشرفت مکالمه، ذخیره اطلاعات زمینه و مدیریت وضعیت تعامل استفاده شوند. در اینجا یک مثال از رشته آمده است:

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

    در کد قبلی، یک رشته ایجاد شده است. سپس پیامی به رشته ارسال می‌شود. با فراخوانی `create_and_process_run` از عامل خواسته می‌شود روی رشته کار کند. در نهایت، پیام‌ها بازیابی و ثبت می‌شوند تا پاسخ عامل دیده شود. پیام‌ها پیشرفت مکالمه بین کاربر و عامل را نشان می‌دهند. همچنین مهم است بدانید که پیام‌ها می‌توانند انواع مختلفی داشته باشند مانند متن، تصویر یا فایل، یعنی کار عامل ممکن است به عنوان مثال منجر به یک تصویر یا پاسخ متنی شده باشد. به عنوان توسعه‌دهنده، می‌توانید از این اطلاعات برای پردازش بیشتر پاسخ یا ارائه آن به کاربر استفاده کنید.

- **ادغام با چارچوب‌های دیگر AI**. سرویس Azure AI Agent می‌تواند با چارچوب‌های دیگر مانند AutoGen و Semantic Kernel تعامل داشته باشد، به این معنی که می‌توانید بخشی از برنامه خود را در یکی از این چارچوب‌ها بسازید و به عنوان مثال از سرویس Agent به عنوان ارکستراتور استفاده کنید یا همه چیز را در سرویس Agent بسازید.

**موارد استفاده**: سرویس Azure AI Agent برای برنامه‌های سازمانی طراحی شده است که نیاز به استقرار عوامل AI امن، مقیاس‌پذیر و انعطاف‌پذیر دارند.

## تفاوت این چارچوب‌ها چیست؟

به نظر می‌رسد که همپوشانی زیادی بین این چارچوب‌ها وجود دارد، اما تفاوت‌های کلیدی در طراحی، قابلیت‌ها و موارد استفاده هدفمند آن‌ها وجود دارد:

- **AutoGen**: چارچوبی برای آزمایش است که بر تحقیق پیشرفته در سیستم‌های چند بازیگری تمرکز دارد. بهترین مکان برای آزمایش و نمونه‌سازی سیستم‌های پیچیده چند بازیگری است.
- **Semantic Kernel**: یک کتابخانه آماده برای تولید عامل برای ساخت برنامه‌های سازمانی عامل‌محور است. تمرکز بر برنامه‌های عامل‌محور توزیع‌شده و رویدادمحور دارد که امکان استفاده از چندین LLM و SLM، ابزارها و الگوهای طراحی تک یا چند بازیگری را فراهم می‌کند.
- **Azure AI Agent Service**: پلتفرم و سرویس استقرار در Azure Foundry برای عوامل است. اتصال به سرویس‌هایی مانند Azure OpenAI، Azure AI Search، Bing Search و اجرای کد را ارائه می‌دهد.

اگر هنوز مطمئن نیستید کدام را انتخاب کنید؟

### موارد استفاده

بیایید ببینیم آیا می‌توانیم با مرور برخی موارد استفاده رایج به شما کمک کنیم:

> پرسش: من در حال آزمایش، یادگیری و ساخت برنامه‌های اثبات مفهوم عامل هستم و می‌خواهم بتوانم سریع بسازم و آزمایش کنم.
>

> پاسخ: AutoGen گزینه مناسبی برای این سناریو است، زیرا بر برنامه‌های عامل‌محور توزیع‌شده و رویدادمحور تمرکز دارد و از الگوهای طراحی پیشرفته چند بازیگری پشتیبانی می‌کند.

> پرسش: چه چیزی AutoGen را نسبت به Semantic Kernel و Azure AI Agent Service برای این مورد بهتر می‌کند؟
>
> پاسخ: AutoGen به طور خاص برای برنامه‌های عامل‌محور توزیع‌شده و رویدادمحور طراحی شده است که آن را برای خودکارسازی تولید کد و وظایف تحلیل داده مناسب می‌سازد. ابزارها و قابلیت‌های لازم برای ساخت سیستم‌های پیچیده چند بازیگری را به شکل کارآمد فراهم می‌کند.

> پرسش: به نظر می‌رسد Azure AI Agent Service هم می‌تواند اینجا کار کند، ابزارهایی برای تولید کد و موارد دیگر دارد؟
>
> پاسخ: بله، Azure AI Agent Service یک سرویس پلتفرمی برای عوامل است و قابلیت‌های داخلی برای مدل‌های متعدد، Azure AI Search، Bing Search و Azure Functions دارد. این سرویس ساخت عوامل شما در پرتال Foundry و استقرار آن‌ها در مقیاس را آسان می‌کند.

> پرسش: هنوز سردرگمم، فقط یک گزینه به من بدهید.
>
> پاسخ: انتخاب عالی این است که ابتدا برنامه خود را در Semantic Kernel بسازید و سپس از Azure AI Agent Service برای استقرار عامل خود استفاده کنید. این رویکرد به شما امکان می‌دهد عوامل خود را به آسانی نگهداری کنید و در عین حال قدرت ساخت سیستم‌های چند بازیگری را در Semantic Kernel بهره‌مند شوید. علاوه بر این، Semantic Kernel در AutoGen یک اتصال‌دهنده دارد که استفاده همزمان از هر دو چارچوب را آسان می‌کند.

بیایید تفاوت‌های کلیدی را در یک جدول خلاصه کنیم: | چارچوب | تمرکز | مفاهیم اصلی | موارد استفاده | | --- | --- | --- | --- | | AutoGen | برنامه‌های عامل‌محور توزیع‌شده و رویدادمحور | بازیگران، شخصیت‌ها، توابع، داده‌ها | تولید کد، وظایف تحلیل داده | | Semantic Kernel | درک و تولید محتوای متنی شبیه انسان | بازیگران، اجزای مدولار، همکاری | درک زبان طبیعی، تولید محتوا | | Azure AI Agent Service | مدل‌های انعطاف‌پذیر، امنیت سازمانی، تولید کد، فراخوانی ابزار |
## درس قبلی

[مقدمه‌ای بر عوامل هوش مصنوعی و موارد استفاده از عامل‌ها](../01-intro-to-ai-agents/README.md)

## درس بعدی

[درک الگوهای طراحی عاملی](../03-agentic-design-patterns/README.md)

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان بومی خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده شود. ما مسئول هیچ گونه سوءتفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، نیستیم.