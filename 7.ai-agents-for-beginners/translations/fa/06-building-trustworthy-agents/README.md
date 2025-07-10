<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f57852cac3a86c4a5ef47f793cc12178",
  "translation_date": "2025-05-20T09:21:40+00:00",
  "source_file": "06-building-trustworthy-agents/README.md",
  "language_code": "fa"
}
-->
[![Trustworthy AI Agents](../../../translated_images/lesson-6-thumbnail.74ea485dbd9a9c3fb4c749f30f2b8130d025072b4d7d911c6f540eac5a78e6b8.fa.png)](https://youtu.be/iZKkMEGBCUQ?si=Q-kEbcyHUMPoHp8L)

> _(برای مشاهده ویدیوی این درس روی تصویر بالا کلیک کنید)_

# ساخت عامل‌های هوش مصنوعی قابل اعتماد

## مقدمه

در این درس به موارد زیر پرداخته می‌شود:

- چگونگی ساخت و استقرار عامل‌های هوش مصنوعی ایمن و مؤثر  
- ملاحظات مهم امنیتی هنگام توسعه عامل‌های هوش مصنوعی  
- نحوه حفظ حریم خصوصی داده‌ها و کاربران در هنگام توسعه عامل‌های هوش مصنوعی  

## اهداف یادگیری

پس از اتمام این درس، شما قادر خواهید بود:

- ریسک‌ها را هنگام ایجاد عامل‌های هوش مصنوعی شناسایی و کاهش دهید  
- تدابیر امنیتی را به کار ببرید تا اطمینان حاصل شود داده‌ها و دسترسی‌ها به درستی مدیریت می‌شوند  
- عامل‌های هوش مصنوعی بسازید که حریم خصوصی داده‌ها را حفظ کرده و تجربه کاربری با کیفیتی ارائه دهند  

## ایمنی

ابتدا به ساخت برنامه‌های عاملی ایمن می‌پردازیم. ایمنی یعنی عامل هوش مصنوعی طبق طراحی عمل کند. به عنوان سازندگان برنامه‌های عاملی، روش‌ها و ابزارهایی برای افزایش ایمنی در اختیار داریم:

### ساخت چارچوب پیام سیستمی

اگر تاکنون برنامه‌ای با استفاده از مدل‌های زبان بزرگ (LLMs) ساخته‌اید، اهمیت طراحی یک سیستم پرامپت یا پیام سیستمی قوی را می‌دانید. این پرامپت‌ها قوانین کلی، دستورالعمل‌ها و راهنمایی‌هایی را برای تعامل مدل با کاربر و داده‌ها تعیین می‌کنند.

برای عامل‌های هوش مصنوعی، پرامپت سیستم اهمیت بیشتری دارد چون عامل‌ها به دستورالعمل‌های بسیار دقیق نیاز دارند تا وظایف طراحی‌شده را انجام دهند.

برای ایجاد پرامپت‌های سیستم قابل توسعه، می‌توانیم از چارچوب پیام سیستمی برای ساخت یک یا چند عامل در برنامه‌مان استفاده کنیم:

![Building a System Message Framework](../../../translated_images/system-message-framework.9df67f3d863520cd48878f71a1289740d8cb46e9d63ee065090ccf3b9b6b82a1.fa.png)

#### مرحله ۱: ایجاد پیام متا سیستم

پرامپت متا توسط یک LLM برای تولید پرامپت‌های سیستم عامل‌هایی که می‌سازیم استفاده می‌شود. آن را به صورت قالب طراحی می‌کنیم تا در صورت نیاز بتوانیم به شکل مؤثری چندین عامل بسازیم.

نمونه‌ای از پیام متا سیستم که به LLM می‌دهیم:

```plaintext
You are an expert at creating AI agent assistants. 
You will be provided a company name, role, responsibilities and other
information that you will use to provide a system prompt for.
To create the system prompt, be descriptive as possible and provide a structure that a system using an LLM can better understand the role and responsibilities of the AI assistant. 
```

#### مرحله ۲: ایجاد پرامپت پایه

گام بعدی ایجاد یک پرامپت پایه برای توصیف عامل هوش مصنوعی است. باید نقش عامل، وظایفی که انجام می‌دهد و هر مسئولیت دیگری را در بر گیرد.

نمونه‌ای از آن:

```plaintext
You are a travel agent for Contoso Travel that is great at booking flights for customers. To help customers you can perform the following tasks: lookup available flights, book flights, ask for preferences in seating and times for flights, cancel any previously booked flights and alert customers on any delays or cancellations of flights.  
```

#### مرحله ۳: ارائه پیام پایه سیستم به LLM

اکنون می‌توانیم این پیام سیستم را با ارائه پیام متا سیستم به عنوان پیام سیستم و پیام پایه سیستم بهینه کنیم.

این کار پیام سیستمی بهتر و مناسب‌تری برای هدایت عامل‌های هوش مصنوعی ما تولید می‌کند:

```markdown
**Company Name:** Contoso Travel  
**Role:** Travel Agent Assistant

**Objective:**  
You are an AI-powered travel agent assistant for Contoso Travel, specializing in booking flights and providing exceptional customer service. Your main goal is to assist customers in finding, booking, and managing their flights, all while ensuring that their preferences and needs are met efficiently.

**Key Responsibilities:**

1. **Flight Lookup:**
    
    - Assist customers in searching for available flights based on their specified destination, dates, and any other relevant preferences.
    - Provide a list of options, including flight times, airlines, layovers, and pricing.
2. **Flight Booking:**
    
    - Facilitate the booking of flights for customers, ensuring that all details are correctly entered into the system.
    - Confirm bookings and provide customers with their itinerary, including confirmation numbers and any other pertinent information.
3. **Customer Preference Inquiry:**
    
    - Actively ask customers for their preferences regarding seating (e.g., aisle, window, extra legroom) and preferred times for flights (e.g., morning, afternoon, evening).
    - Record these preferences for future reference and tailor suggestions accordingly.
4. **Flight Cancellation:**
    
    - Assist customers in canceling previously booked flights if needed, following company policies and procedures.
    - Notify customers of any necessary refunds or additional steps that may be required for cancellations.
5. **Flight Monitoring:**
    
    - Monitor the status of booked flights and alert customers in real-time about any delays, cancellations, or changes to their flight schedule.
    - Provide updates through preferred communication channels (e.g., email, SMS) as needed.

**Tone and Style:**

- Maintain a friendly, professional, and approachable demeanor in all interactions with customers.
- Ensure that all communication is clear, informative, and tailored to the customer's specific needs and inquiries.

**User Interaction Instructions:**

- Respond to customer queries promptly and accurately.
- Use a conversational style while ensuring professionalism.
- Prioritize customer satisfaction by being attentive, empathetic, and proactive in all assistance provided.

**Additional Notes:**

- Stay updated on any changes to airline policies, travel restrictions, and other relevant information that could impact flight bookings and customer experience.
- Use clear and concise language to explain options and processes, avoiding jargon where possible for better customer understanding.

This AI assistant is designed to streamline the flight booking process for customers of Contoso Travel, ensuring that all their travel needs are met efficiently and effectively.

```

#### مرحله ۴: تکرار و بهبود

ارزش این چارچوب پیام سیستمی در این است که بتوانیم ساخت پیام‌های سیستم از چندین عامل را راحت‌تر توسعه داده و همچنین پیام‌های سیستم را به مرور زمان بهبود دهیم. به ندرت پیش می‌آید که پیام سیستمی شما از اولین بار به طور کامل پاسخگوی نیازهای شما باشد. توانایی ایجاد تغییرات کوچک و بهبودها با اصلاح پیام پایه سیستم و اجرای مجدد آن، به شما امکان مقایسه و ارزیابی نتایج را می‌دهد.

## شناخت تهدیدات

برای ساخت عامل‌های هوش مصنوعی قابل اعتماد، مهم است که ریسک‌ها و تهدیدات علیه عامل خود را بشناسید و کاهش دهید. در ادامه فقط به برخی از تهدیدات مختلف علیه عامل‌های هوش مصنوعی و راه‌های برنامه‌ریزی و آمادگی بهتر برای آن‌ها می‌پردازیم.

![Understanding Threats](../../../translated_images/understanding-threats.f8fbe6fe11e025b3085fc91e82d975937ad1d672260a2aeed40458aa41798d0e.fa.png)

### وظیفه و دستورالعمل

**توضیح:** مهاجمان تلاش می‌کنند با پرامپت‌دهی یا دستکاری ورودی‌ها، دستورالعمل‌ها یا اهداف عامل هوش مصنوعی را تغییر دهند.

**کاهش خطر:** بررسی صحت ورودی‌ها و فیلترهای ورودی را اجرا کنید تا پرامپت‌های بالقوه خطرناک قبل از پردازش توسط عامل شناسایی شوند. از آنجا که این حملات معمولاً نیاز به تعامل مکرر با عامل دارند، محدود کردن تعداد نوبت‌های گفتگو راه دیگری برای جلوگیری از این نوع حملات است.

### دسترسی به سیستم‌های حساس

**توضیح:** اگر عامل هوش مصنوعی به سیستم‌ها و سرویس‌هایی که داده‌های حساس ذخیره می‌کنند دسترسی داشته باشد، مهاجمان می‌توانند ارتباط بین عامل و این سرویس‌ها را به خطر بیندازند. این حملات می‌توانند مستقیم یا تلاش‌های غیرمستقیم برای کسب اطلاعات از طریق عامل باشند.

**کاهش خطر:** عامل‌های هوش مصنوعی باید فقط در صورت نیاز به سیستم‌ها دسترسی داشته باشند تا از این نوع حملات جلوگیری شود. همچنین ارتباط بین عامل و سیستم باید ایمن باشد. اجرای احراز هویت و کنترل دسترسی روش دیگری برای حفاظت از این اطلاعات است.

### بارگذاری بیش از حد منابع و سرویس‌ها

**توضیح:** عامل‌های هوش مصنوعی می‌توانند به ابزارها و سرویس‌های مختلفی برای انجام وظایف دسترسی داشته باشند. مهاجمان ممکن است با ارسال حجم بالایی از درخواست‌ها از طریق عامل، این سرویس‌ها را هدف حمله قرار دهند که ممکن است باعث خرابی سیستم یا هزینه‌های بالا شود.

**کاهش خطر:** سیاست‌هایی برای محدود کردن تعداد درخواست‌هایی که عامل می‌تواند به یک سرویس ارسال کند، اجرا کنید. محدود کردن تعداد نوبت‌های گفتگو و درخواست‌ها به عامل راه دیگری برای جلوگیری از این نوع حملات است.

### مسمومیت پایگاه دانش

**توضیح:** این نوع حمله مستقیماً عامل هوش مصنوعی را هدف نمی‌گیرد بلکه پایگاه دانش و سایر سرویس‌هایی را هدف قرار می‌دهد که عامل برای انجام وظایف از آن‌ها استفاده می‌کند. این می‌تواند شامل خراب کردن داده‌ها یا اطلاعاتی باشد که عامل برای انجام وظایف استفاده می‌کند و منجر به پاسخ‌های جانبدارانه یا ناخواسته به کاربر شود.

**کاهش خطر:** به طور منظم داده‌هایی را که عامل در جریان کاری خود استفاده می‌کند بررسی کنید. اطمینان حاصل کنید که دسترسی به این داده‌ها ایمن است و فقط افراد مورد اعتماد می‌توانند آن‌ها را تغییر دهند تا از این نوع حمله جلوگیری شود.

### خطاهای زنجیره‌ای

**توضیح:** عامل‌های هوش مصنوعی برای انجام وظایف به ابزارها و سرویس‌های مختلفی دسترسی دارند. خطاهایی که توسط مهاجمان ایجاد می‌شوند می‌توانند باعث خرابی سایر سیستم‌هایی شوند که عامل به آن‌ها متصل است و این باعث گسترده‌تر شدن حمله و سخت‌تر شدن عیب‌یابی می‌شود.

**کاهش خطر:** یکی از روش‌ها این است که عامل هوش مصنوعی در محیط محدودی مانند اجرای وظایف در یک کانتینر Docker فعالیت کند تا از حملات مستقیم به سیستم جلوگیری شود. ایجاد مکانیزم‌های پشتیبان و منطق تلاش مجدد هنگام دریافت خطا از برخی سیستم‌ها روش دیگری برای جلوگیری از خرابی‌های گسترده‌تر است.

## انسان در حلقه

یکی دیگر از روش‌های مؤثر برای ساخت سیستم‌های عامل هوش مصنوعی قابل اعتماد، استفاده از روش انسان در حلقه است. این روش جریانی ایجاد می‌کند که کاربران می‌توانند در حین اجرا به عامل‌ها بازخورد دهند. کاربران عملاً به عنوان عامل در یک سیستم چندعاملی عمل می‌کنند و با تأیید یا توقف فرآیند در حال اجرا، در کنترل آن نقش دارند.

![Human in The Loop](../../../translated_images/human-in-the-loop.e9edbe8f6d42041b4213421410823250aa750fe8bdba5601d69ed46f3ff6489d.fa.png)

در اینجا نمونه کدی با استفاده از AutoGen آورده شده است که نشان می‌دهد این مفهوم چگونه پیاده‌سازی می‌شود:

```python

# Create the agents.
model_client = OpenAIChatCompletionClient(model="gpt-4o-mini")
assistant = AssistantAgent("assistant", model_client=model_client)
user_proxy = UserProxyAgent("user_proxy", input_func=input)  # Use input() to get user input from console.

# Create the termination condition which will end the conversation when the user says "APPROVE".
termination = TextMentionTermination("APPROVE")

# Create the team.
team = RoundRobinGroupChat([assistant, user_proxy], termination_condition=termination)

# Run the conversation and stream to the console.
stream = team.run_stream(task="Write a 4-line poem about the ocean.")
# Use asyncio.run(...) when running in a script.
await Console(stream)

```

## نتیجه‌گیری

ساخت عامل‌های هوش مصنوعی قابل اعتماد نیازمند طراحی دقیق، تدابیر امنیتی قوی و تکرار مداوم است. با پیاده‌سازی سیستم‌های پرامپت متا ساختاریافته، شناخت تهدیدات احتمالی و به‌کارگیری راهکارهای کاهش ریسک، توسعه‌دهندگان می‌توانند عامل‌هایی بسازند که هم ایمن و هم مؤثر باشند. علاوه بر این، به‌کارگیری رویکرد انسان در حلقه تضمین می‌کند که عامل‌ها با نیازهای کاربران هماهنگ باقی بمانند و در عین حال ریسک‌ها به حداقل برسند. با پیشرفت هوش مصنوعی، حفظ رویکردی پیشگیرانه در امنیت، حریم خصوصی و ملاحظات اخلاقی کلید ایجاد اعتماد و قابلیت اطمینان در سیستم‌های مبتنی بر هوش مصنوعی خواهد بود.

## منابع اضافی

- <a href="https://learn.microsoft.com/azure/ai-studio/responsible-use-of-ai-overview" target="_blank">مروری بر هوش مصنوعی مسئولانه</a>  
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">ارزیابی مدل‌ها و برنامه‌های هوش مصنوعی مولد</a>  
- <a href="https://learn.microsoft.com/azure/ai-services/openai/concepts/system-message?context=%2Fazure%2Fai-studio%2Fcontext%2Fcontext&tabs=top-techniques" target="_blank">پیام‌های سیستم ایمنی</a>  
- <a href="https://blogs.microsoft.com/wp-content/uploads/prod/sites/5/2022/06/Microsoft-RAI-Impact-Assessment-Template.pdf?culture=en-us&country=us" target="_blank">قالب ارزیابی ریسک</a>  

## درس قبلی

[Agentic RAG](../05-agentic-rag/README.md)

## درس بعدی

[Planning Design Pattern](../07-planning-design/README.md)

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان بومی خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئول هیچ گونه سوء تفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، نیستیم.