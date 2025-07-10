<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88258b03f2893aa2e69eb8fb24baabbc",
  "translation_date": "2025-05-20T09:19:52+00:00",
  "source_file": "04-tool-use/README.md",
  "language_code": "fa"
}
-->
[![چگونه عامل‌های هوش مصنوعی خوب طراحی کنیم](../../../translated_images/lesson-4-thumbnail.2c292cd87b951b3e914e9548b46cb4d14a0852f9c8d75e9566d46da839c983d9.fa.png)](https://youtu.be/vieRiPRx-gI?si=cEZ8ApnT6Sus9rhn)

> _(برای مشاهده ویدئوی این درس روی تصویر بالا کلیک کنید)_

# الگوی طراحی استفاده از ابزار

ابزارها جالب هستند چون به عامل‌های هوش مصنوعی امکان می‌دهند توانمندی‌های گسترده‌تری داشته باشند. به جای اینکه عامل فقط مجموعه محدودی از اقدامات را انجام دهد، با اضافه کردن یک ابزار، عامل می‌تواند طیف وسیعی از کارها را انجام دهد. در این فصل، به الگوی طراحی استفاده از ابزار می‌پردازیم که توضیح می‌دهد چگونه عامل‌های هوش مصنوعی می‌توانند از ابزارهای خاص برای رسیدن به اهدافشان استفاده کنند.

## مقدمه

در این درس قصد داریم به سوالات زیر پاسخ دهیم:

- الگوی طراحی استفاده از ابزار چیست؟
- در چه مواردی می‌توان از آن استفاده کرد؟
- چه عناصر یا بلوک‌های ساختاری برای پیاده‌سازی این الگو لازم است؟
- چه ملاحظات ویژه‌ای برای استفاده از این الگو جهت ساخت عامل‌های هوش مصنوعی قابل اعتماد وجود دارد؟

## اهداف یادگیری

پس از پایان این درس، قادر خواهید بود:

- الگوی طراحی استفاده از ابزار و هدف آن را تعریف کنید.
- موارد کاربردی که این الگو در آنها قابل استفاده است را شناسایی کنید.
- عناصر کلیدی لازم برای پیاده‌سازی این الگو را درک کنید.
- ملاحظات مربوط به اطمینان از قابلیت اعتماد عامل‌های هوش مصنوعی که از این الگو استفاده می‌کنند را بشناسید.

## الگوی طراحی استفاده از ابزار چیست؟

**الگوی طراحی استفاده از ابزار** بر توانمندسازی مدل‌های زبان بزرگ (LLM) برای تعامل با ابزارهای خارجی به منظور رسیدن به اهداف خاص تمرکز دارد. ابزارها کدهایی هستند که توسط عامل اجرا می‌شوند تا کارهایی انجام دهند. یک ابزار می‌تواند یک تابع ساده مانند ماشین حساب باشد یا یک فراخوان API به سرویس شخص ثالث مثل جستجوی قیمت سهام یا پیش‌بینی آب و هوا. در زمینه عامل‌های هوش مصنوعی، ابزارها به گونه‌ای طراحی شده‌اند که در پاسخ به **فراخوان‌های تابع تولید شده توسط مدل** توسط عامل اجرا شوند.

## موارد کاربردی که می‌توان از آن استفاده کرد کدامند؟

عامل‌های هوش مصنوعی می‌توانند از ابزارها برای انجام کارهای پیچیده، بازیابی اطلاعات یا اتخاذ تصمیمات استفاده کنند. الگوی طراحی استفاده از ابزار معمولاً در سناریوهایی به کار می‌رود که نیاز به تعامل پویا با سیستم‌های خارجی مانند پایگاه‌های داده، سرویس‌های وب یا مفسرهای کد دارند. این توانایی برای موارد متعددی مفید است، از جمله:

- **بازیابی اطلاعات پویا:** عامل‌ها می‌توانند از APIهای خارجی یا پایگاه‌های داده برای دریافت داده‌های به‌روز استفاده کنند (مثلاً پرس‌وجو از پایگاه داده SQLite برای تحلیل داده، دریافت قیمت سهام یا اطلاعات آب و هوا).
- **اجرای کد و تفسیر:** عامل‌ها می‌توانند کد یا اسکریپت اجرا کنند تا مسائل ریاضی را حل کنند، گزارش تولید کنند یا شبیه‌سازی انجام دهند.
- **اتوماسیون جریان کاری:** خودکارسازی کارهای تکراری یا چندمرحله‌ای با ادغام ابزارهایی مانند زمان‌بندهای کار، سرویس‌های ایمیل یا خطوط داده.
- **پشتیبانی مشتری:** عامل‌ها می‌توانند با سیستم‌های CRM، پلتفرم‌های تیکتینگ یا پایگاه‌های دانش تعامل داشته باشند تا سوالات کاربران را پاسخ دهند.
- **تولید و ویرایش محتوا:** عامل‌ها می‌توانند از ابزارهایی مانند بررسی دستور زبان، خلاصه‌ساز متن یا ارزیاب‌های ایمنی محتوا برای کمک به خلق محتوا استفاده کنند.

## عناصر یا بلوک‌های ساختاری لازم برای پیاده‌سازی الگوی استفاده از ابزار کدامند؟

این بلوک‌های ساختاری به عامل هوش مصنوعی اجازه می‌دهند تا طیف وسیعی از کارها را انجام دهد. بیایید به عناصر کلیدی برای پیاده‌سازی الگوی طراحی استفاده از ابزار نگاه کنیم:

- **اسکیماهای تابع/ابزار:** تعریف دقیق ابزارهای موجود شامل نام تابع، هدف، پارامترهای مورد نیاز و خروجی‌های مورد انتظار. این اسکیماها به مدل زبان بزرگ کمک می‌کنند بفهمد چه ابزارهایی در دسترس است و چگونه درخواست‌های معتبر بسازد.

- **منطق اجرای تابع:** تعیین می‌کند که چگونه و چه زمانی ابزارها بر اساس نیت کاربر و زمینه مکالمه فراخوانی شوند. این ممکن است شامل ماژول‌های برنامه‌ریز، مکانیزم‌های مسیریابی یا جریان‌های شرطی باشد که استفاده از ابزار را به صورت پویا مدیریت می‌کنند.

- **سیستم مدیریت پیام:** اجزایی که جریان مکالمه بین ورودی‌های کاربر، پاسخ‌های LLM، فراخوان‌های ابزار و خروجی‌های ابزار را مدیریت می‌کنند.

- **چارچوب یکپارچه‌سازی ابزار:** زیرساختی که عامل را به ابزارهای مختلف متصل می‌کند، چه توابع ساده و چه سرویس‌های خارجی پیچیده.

- **مدیریت خطا و اعتبارسنجی:** مکانیزم‌هایی برای مدیریت شکست‌ها در اجرای ابزار، اعتبارسنجی پارامترها و مدیریت پاسخ‌های غیرمنتظره.

- **مدیریت وضعیت:** پیگیری زمینه مکالمه، تعاملات قبلی با ابزارها و داده‌های پایدار برای اطمینان از ثبات در تعاملات چندمرحله‌ای.

حالا بیایید با جزئیات بیشتری به فراخوانی تابع/ابزار بپردازیم.

### فراخوانی تابع/ابزار

فراخوانی تابع اصلی‌ترین راهی است که به مدل‌های زبان بزرگ (LLM) امکان می‌دهد با ابزارها تعامل کنند. معمولاً 'تابع' و 'ابزار' به جای یکدیگر استفاده می‌شوند چون 'توابع' (بخش‌هایی از کد قابل استفاده مجدد) همان 'ابزارهایی' هستند که عامل‌ها برای انجام کارها استفاده می‌کنند. برای اینکه کد یک تابع اجرا شود، مدل زبان بزرگ باید درخواست کاربر را با توصیف توابع مقایسه کند. برای این کار، اسکیما حاوی توصیف همه توابع موجود به مدل ارسال می‌شود. سپس مدل مناسب‌ترین تابع را برای کار انتخاب کرده و نام و آرگومان‌های آن را برمی‌گرداند. تابع انتخاب شده اجرا می‌شود، پاسخ آن به مدل بازگردانده می‌شود و مدل از این اطلاعات برای پاسخ به درخواست کاربر استفاده می‌کند.

برای توسعه‌دهندگان جهت پیاده‌سازی فراخوانی تابع برای عامل‌ها، به موارد زیر نیاز دارید:

1. مدلی از LLM که از فراخوانی تابع پشتیبانی کند
2. اسکیما حاوی توصیف توابع
3. کد مربوط به هر تابع توصیف شده

بیایید با مثالی برای دریافت زمان فعلی در یک شهر توضیح دهیم:

1. **راه‌اندازی مدلی از LLM که از فراخوانی تابع پشتیبانی می‌کند:**

    همه مدل‌ها از فراخوانی تابع پشتیبانی نمی‌کنند، بنابراین مهم است مطمئن شوید مدلی که استفاده می‌کنید این قابلیت را دارد. <a href="https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling" target="_blank">Azure OpenAI</a> از فراخوانی تابع پشتیبانی می‌کند. ما می‌توانیم با راه‌اندازی کلاینت Azure OpenAI شروع کنیم.

    ```python
    # Initialize the Azure OpenAI client
    client = AzureOpenAI(
        azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT"), 
        api_key=os.getenv("AZURE_OPENAI_API_KEY"),  
        api_version="2024-05-01-preview"
    )
    ```

1. **ساخت اسکیما برای تابع:**

    سپس یک اسکیما JSON تعریف می‌کنیم که شامل نام تابع، توضیح عملکرد آن و نام‌ها و توضیحات پارامترهای تابع است.
    سپس این اسکیما را به کلاینت ایجاد شده قبلی همراه با درخواست کاربر برای یافتن زمان در سان‌فرانسیسکو ارسال می‌کنیم. نکته مهم این است که **فراخوانی ابزار** برگردانده می‌شود، **نه** پاسخ نهایی سوال. همانطور که پیش‌تر گفته شد، مدل نام تابع انتخاب شده برای کار و آرگومان‌های آن را بازمی‌گرداند.

    ```python
    # Function description for the model to read
    tools = [
        {
            "type": "function",
            "function": {
                "name": "get_current_time",
                "description": "Get the current time in a given location",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "location": {
                            "type": "string",
                            "description": "The city name, e.g. San Francisco",
                        },
                    },
                    "required": ["location"],
                },
            }
        }
    ]
    ```
   
    ```python
  
    # Initial user message
    messages = [{"role": "user", "content": "What's the current time in San Francisco"}] 
  
    # First API call: Ask the model to use the function
      response = client.chat.completions.create(
          model=deployment_name,
          messages=messages,
          tools=tools,
          tool_choice="auto",
      )
  
      # Process the model's response
      response_message = response.choices[0].message
      messages.append(response_message)
  
      print("Model's response:")  

      print(response_message)
  
    ```

    ```bash
    Model's response:
    ChatCompletionMessage(content=None, role='assistant', function_call=None, tool_calls=[ChatCompletionMessageToolCall(id='call_pOsKdUlqvdyttYB67MOj434b', function=Function(arguments='{"location":"San Francisco"}', name='get_current_time'), type='function')])
    ```
  
1. **کد تابع لازم برای انجام کار:**

    حال که مدل تابع مورد نیاز را انتخاب کرده، باید کدی که کار را انجام می‌دهد پیاده‌سازی و اجرا شود.
    می‌توانیم کدی برای دریافت زمان فعلی به زبان پایتون بنویسیم. همچنین باید کدی برای استخراج نام و آرگومان‌ها از response_message بنویسیم تا نتیجه نهایی به دست آید.

    ```python
      def get_current_time(location):
        """Get the current time for a given location"""
        print(f"get_current_time called with location: {location}")  
        location_lower = location.lower()
        
        for key, timezone in TIMEZONE_DATA.items():
            if key in location_lower:
                print(f"Timezone found for {key}")  
                current_time = datetime.now(ZoneInfo(timezone)).strftime("%I:%M %p")
                return json.dumps({
                    "location": location,
                    "current_time": current_time
                })
      
        print(f"No timezone data found for {location_lower}")  
        return json.dumps({"location": location, "current_time": "unknown"})
    ```

     ```python
     # Handle function calls
      if response_message.tool_calls:
          for tool_call in response_message.tool_calls:
              if tool_call.function.name == "get_current_time":
     
                  function_args = json.loads(tool_call.function.arguments)
     
                  time_response = get_current_time(
                      location=function_args.get("location")
                  )
     
                  messages.append({
                      "tool_call_id": tool_call.id,
                      "role": "tool",
                      "name": "get_current_time",
                      "content": time_response,
                  })
      else:
          print("No tool calls were made by the model.")  
  
      # Second API call: Get the final response from the model
      final_response = client.chat.completions.create(
          model=deployment_name,
          messages=messages,
      )
  
      return final_response.choices[0].message.content
     ```

     ```bash
      get_current_time called with location: San Francisco
      Timezone found for san francisco
      The current time in San Francisco is 09:24 AM.
     ```

فراخوانی تابع در قلب بیشتر، اگر نگوییم همه، طراحی استفاده از ابزار برای عامل‌ها قرار دارد، اما پیاده‌سازی آن از ابتدا گاهی چالش‌برانگیز است.
همانطور که در [درس ۲](../../../02-explore-agentic-frameworks) آموختیم، فریم‌ورک‌های عاملی بلوک‌های از پیش ساخته شده‌ای برای پیاده‌سازی استفاده از ابزار فراهم می‌کنند.

## نمونه‌هایی از استفاده از ابزار با فریم‌ورک‌های عاملی

در اینجا چند نمونه از نحوه پیاده‌سازی الگوی طراحی استفاده از ابزار با استفاده از فریم‌ورک‌های مختلف عاملی آورده شده است:

### Semantic Kernel

<a href="https://learn.microsoft.com/azure/ai-services/agents/overview" target="_blank">Semantic Kernel</a> یک فریم‌ورک هوش مصنوعی متن‌باز برای توسعه‌دهندگان .NET، پایتون و جاوا است که با مدل‌های زبان بزرگ کار می‌کنند. این فریم‌ورک فرآیند استفاده از فراخوانی تابع را با توصیف خودکار توابع و پارامترهایشان به مدل از طریق فرآیندی به نام <a href="https://learn.microsoft.com/semantic-kernel/concepts/ai-services/chat-completion/function-calling/?pivots=programming-language-python#1-serializing-the-functions" target="_blank">سریال‌سازی</a> ساده می‌کند. همچنین ارتباط دوطرفه بین مدل و کد شما را مدیریت می‌کند. یکی دیگر از مزایای استفاده از فریم‌ورک عاملی مانند Semantic Kernel این است که به شما اجازه می‌دهد به ابزارهای از پیش ساخته‌ای مانند <a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step4_assistant_tool_file_search.py" target="_blank">جستجوی فایل</a> و <a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step3_assistant_tool_code_interpreter.py" target="_blank">مفسر کد</a> دسترسی داشته باشید.

نمودار زیر فرآیند فراخوانی تابع با Semantic Kernel را نشان می‌دهد:

![function calling](../../../translated_images/functioncalling-diagram.b5493ea5154ad8e3e4940d2e36a49101eec1398948e5d1039942203b4f5a4209.fa.png)

در Semantic Kernel توابع/ابزارها به عنوان <a href="https://learn.microsoft.com/semantic-kernel/concepts/plugins/?pivots=programming-language-python" target="_blank">پلاگین‌ها</a> شناخته می‌شوند. ما می‌توانیم دکوراتور `get_current_time` function we saw earlier into a plugin by turning it into a class with the function in it. We can also import the `kernel_function` را تبدیل کنیم که توضیح تابع را می‌گیرد. وقتی کرنل را با GetCurrentTimePlugin می‌سازید، کرنل به طور خودکار تابع و پارامترهایش را سریال‌سازی می‌کند و در فرآیند، اسکیما را برای ارسال به LLM ایجاد می‌کند.

```python
from semantic_kernel.functions import kernel_function

class GetCurrentTimePlugin:
    async def __init__(self, location):
        self.location = location

    @kernel_function(
        description="Get the current time for a given location"
    )
    def get_current_time(location: str = ""):
        ...

```

```python 
from semantic_kernel import Kernel

# Create the kernel
kernel = Kernel()

# Create the plugin
get_current_time_plugin = GetCurrentTimePlugin(location)

# Add the plugin to the kernel
kernel.add_plugin(get_current_time_plugin)
```
  
### سرویس عامل هوش مصنوعی Azure

<a href="https://learn.microsoft.com/azure/ai-services/agents/overview" target="_blank">سرویس عامل هوش مصنوعی Azure</a> یک فریم‌ورک عاملی جدیدتر است که برای توانمندسازی توسعه‌دهندگان جهت ساخت، استقرار و مقیاس‌دهی امن عامل‌های هوش مصنوعی با کیفیت بالا و قابل توسعه بدون نیاز به مدیریت منابع محاسباتی و ذخیره‌سازی زیرساخت طراحی شده است. این سرویس به ویژه برای برنامه‌های سازمانی مفید است چون کاملاً مدیریت شده و دارای امنیت سطح سازمانی است.

در مقایسه با توسعه مستقیم با API مدل زبان بزرگ، سرویس عامل هوش مصنوعی Azure مزایایی ارائه می‌دهد از جمله:

- فراخوانی خودکار ابزار – نیازی به تجزیه فراخوان ابزار، اجرای آن و مدیریت پاسخ نیست؛ همه اینها اکنون سمت سرور انجام می‌شود
- مدیریت امن داده‌ها – به جای مدیریت وضعیت مکالمه خودتان، می‌توانید روی ذخیره همه اطلاعات مورد نیاز در threads حساب کنید
- ابزارهای آماده استفاده – ابزارهایی برای تعامل با منابع داده شما مانند Bing، Azure AI Search و Azure Functions.

ابزارهای موجود در سرویس عامل Azure به دو دسته تقسیم می‌شوند:

1. ابزارهای دانش:
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/bing-grounding?tabs=python&pivots=overview" target="_blank">مبنای جستجو با Bing</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/file-search?tabs=python&pivots=overview" target="_blank">جستجوی فایل</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=overview-azure-ai-search" target="_blank">جستجوی Azure AI</a>

2. ابزارهای عملیاتی:
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/function-calling?tabs=python&pivots=overview" target="_blank">فراخوانی تابع</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/code-interpreter?tabs=python&pivots=overview" target="_blank">مفسر کد</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/openapi-spec?tabs=python&pivots=overview" target="_blank">ابزارهای تعریف شده OpenAI</a>
    - <a href="https://learn.microsoft.com/azure/ai-services/agents/how-to/tools/azure-functions?pivots=overview" target="_blank">توابع Azure</a>

سرویس عامل به ما امکان می‌دهد این ابزارها را به صورت یک `toolset`. It also utilizes `threads` which keep track of the history of messages from a particular conversation.

Imagine you are a sales agent at a company called Contoso. You want to develop a conversational agent that can answer questions about your sales data.

The following image illustrates how you could use Azure AI Agent Service to analyze your sales data:

![Agentic Service In Action](../../../translated_images/agent-service-in-action.8c2d8aa8e9d91feeb29549b3fde529f8332b243875154d03907616a69198afbc.fa.jpg)

To use any of these tools with the service we can create a client and define a tool or toolset. To implement this practically we can use the following Python code. The LLM will be able to look at the toolset and decide whether to use the user created function, `fetch_sales_data_using_sqlite_query` یا مفسر کد از پیش ساخته شده بسته به درخواست کاربر استفاده کنیم.

```python 
import os
from azure.ai.projects import AIProjectClient
from azure.identity import DefaultAzureCredential
from fecth_sales_data_functions import fetch_sales_data_using_sqlite_query # fetch_sales_data_using_sqlite_query function which can be found in a fetch_sales_data_functions.py file.
from azure.ai.projects.models import ToolSet, FunctionTool, CodeInterpreterTool

project_client = AIProjectClient.from_connection_string(
    credential=DefaultAzureCredential(),
    conn_str=os.environ["PROJECT_CONNECTION_STRING"],
)

# Initialize function calling agent with the fetch_sales_data_using_sqlite_query function and adding it to the toolset
fetch_data_function = FunctionTool(fetch_sales_data_using_sqlite_query)
toolset = ToolSet()
toolset.add(fetch_data_function)

# Initialize Code Interpreter tool and adding it to the toolset. 
code_interpreter = code_interpreter = CodeInterpreterTool()
toolset = ToolSet()
toolset.add(code_interpreter)

agent = project_client.agents.create_agent(
    model="gpt-4o-mini", name="my-agent", instructions="You are helpful agent", 
    toolset=toolset
)
```

## ملاحظات ویژه برای استفاده از الگوی طراحی استفاده از ابزار جهت ساخت عامل‌های هوش مصنوعی قابل اعتماد چیست؟

یکی از نگرانی‌های رایج درباره SQLی که به صورت پویا توسط LLMها تولید می‌شود، امنیت است، به خصوص خطر تزریق SQL یا اقدامات مخرب مانند حذف یا دستکاری پایگاه داده. در حالی که این نگرانی‌ها معتبر هستند، می‌توان با پیکربندی مناسب مجوزهای دسترسی به پایگاه داده به طور موثری آنها را کاهش داد. برای اکثر پایگاه‌های داده این شامل تنظیم پایگاه داده به صورت فقط خواندنی است. برای سرویس‌های پایگاه داده مانند PostgreSQL یا Azure SQL، باید به اپلیکیشن نقش فقط خواندنی (SELECT) داده شود.

اجرای اپلیکیشن در محیط امن نیز حفاظت را افزایش می‌دهد. در سناریوهای سازمانی، داده‌ها معمولاً از سیستم‌های عملیاتی استخراج و تبدیل شده و به پایگاه داده یا انبار داده فقط خواندنی با اسکیمای کاربرپسند منتقل می‌شوند. این رویکرد اطمینان می‌دهد که داده‌ها امن، بهینه برای عملکرد و دسترسی‌پذیری هستند و اپلیکیشن دسترسی محدود و فقط خواندنی دارد.

## منابع بیشتر

- <a href="https://microsoft.github.io/build-your-first-agent-with-azure-ai-agent-service-workshop/" target="_blank">کارگاه سرویس عامل هوش مصنوعی Azure</a>
- <a href="https://github.com/Azure-Samples/contoso-creative-writer/tree/main/docs/workshop" target="_blank">کارگاه چندعاملی نویسنده خلاق Contoso</a>
- <a href="https://learn.microsoft.com/semantic-kernel/concepts/ai-services/chat-completion/function-calling/?pivots=programming-language-python#1-serializing-the-functions" target="_blank">آموزش فراخوانی تابع Semantic Kernel</a>
- <a href="https://github.com/microsoft/semantic-kernel/blob/main/python/samples/getting_started_with_agents/openai_assistant/step3_assistant_tool_code_interpreter.py" target="_blank">مفسر کد Semantic Kernel</a>
- <a href="https://microsoft.github.io/autogen/dev/user-guide/core-user-guide/components/tools.html" target="_blank">ابزارهای Autogen</a>

## درس قبلی

[درک الگوهای طراحی عاملی](../03-agentic-design-patterns/README.md)

## درس بعدی

[Agentic RAG](../05-agentic-rag/README.md)

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان بومی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده شود. ما مسئول هیچ گونه سوءتفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه نیستیم.