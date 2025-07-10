<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7e92870dc0843e13d4dabc620c09d2d9",
  "translation_date": "2025-05-20T09:18:12+00:00",
  "source_file": "02-explore-agentic-frameworks/azure-ai-foundry-agent-creation.md",
  "language_code": "fa"
}
-->
# توسعه سرویس Azure AI Agent

در این تمرین، شما از ابزارهای سرویس Azure AI Agent در [پورتال Azure AI Foundry](https://ai.azure.com/?WT.mc_id=academic-105485-koreyst) برای ایجاد یک agent برای رزرو پرواز استفاده می‌کنید. این agent قادر خواهد بود با کاربران تعامل کند و اطلاعات مربوط به پروازها را ارائه دهد.

## پیش‌نیازها

برای تکمیل این تمرین، به موارد زیر نیاز دارید:
1. یک حساب Azure با اشتراک فعال. [ایجاد حساب به صورت رایگان](https://azure.microsoft.com/free/?WT.mc_id=academic-105485-koreyst).
2. دسترسی لازم برای ایجاد یک hub در Azure AI Foundry یا داشتن یک hub که برای شما ایجاد شده باشد.
    - اگر نقش شما Contributor یا Owner است، می‌توانید مراحل این آموزش را دنبال کنید.

## ایجاد یک hub در Azure AI Foundry

> **Note:** Azure AI Foundry قبلاً با نام Azure AI Studio شناخته می‌شد.

1. دستورالعمل‌های موجود در پست وبلاگ [Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-studio/?WT.mc_id=academic-105485-koreyst) را برای ایجاد یک hub در Azure AI Foundry دنبال کنید.
2. پس از ایجاد پروژه، هر نکته‌ای که نمایش داده می‌شود را ببندید و صفحه پروژه را در پورتال Azure AI Foundry بررسی کنید؛ صفحه باید مشابه تصویر زیر باشد:

    ![Azure AI Foundry Project](../../../translated_images/azure-ai-foundry.8a2b56713298fd09de77022ab1ba07ebc681ea4cd4438a46c4a6fc6b6f077962.fa.png)

## استقرار یک مدل

1. در پنل سمت چپ پروژه خود، در بخش **My assets**، صفحه **Models + endpoints** را انتخاب کنید.
2. در صفحه **Models + endpoints**، در تب **Model deployments**، از منوی **+ Deploy model** گزینه **Deploy base model** را انتخاب کنید.
3. مدل `gpt-4o-mini` را در لیست جستجو کرده، سپس انتخاب و تایید کنید.

    > **Note**: کاهش TPM به جلوگیری از مصرف بیش از حد سهمیه اشتراک شما کمک می‌کند.

    ![Model Deployed](../../../translated_images/model-deployment.4adf429ebdf42103d7a759087fe0da91aeb70d2204cc8bdca70cc6c53c627938.fa.png)

## ایجاد یک agent

حالا که مدل را مستقر کرده‌اید، می‌توانید یک agent بسازید. agent یک مدل هوش مصنوعی مکالمه‌ای است که می‌تواند برای تعامل با کاربران استفاده شود.

1. در پنل سمت چپ پروژه، در بخش **Build & Customize**، صفحه **Agents** را انتخاب کنید.
2. روی **+ Create agent** کلیک کنید تا یک agent جدید بسازید. در کادر گفتگوی **Agent Setup**:
    - یک نام برای agent وارد کنید، مثلاً `FlightAgent`.
    - اطمینان حاصل کنید که استقرار مدل `gpt-4o-mini` که قبلاً ساخته‌اید انتخاب شده است.
    - دستورالعمل‌ها (**Instructions**) را مطابق با پرسش‌نامه‌ای که می‌خواهید agent دنبال کند تنظیم کنید. در اینجا یک نمونه آمده است:
    ```
    You are FlightAgent, a virtual assistant specialized in handling flight-related queries. Your role includes assisting users with searching for flights, retrieving flight details, checking seat availability, and providing real-time flight status. Follow the instructions below to ensure clarity and effectiveness in your responses:

    ### Task Instructions:
    1. **Recognizing Intent**:
       - Identify the user's intent based on their request, focusing on one of the following categories:
         - Searching for flights
         - Retrieving flight details using a flight ID
         - Checking seat availability for a specified flight
         - Providing real-time flight status using a flight number
       - If the intent is unclear, politely ask users to clarify or provide more details.
        
    2. **Processing Requests**:
        - Depending on the identified intent, perform the required task:
        - For flight searches: Request details such as origin, destination, departure date, and optionally return date.
        - For flight details: Request a valid flight ID.
        - For seat availability: Request the flight ID and date and validate inputs.
        - For flight status: Request a valid flight number.
        - Perform validations on provided data (e.g., formats of dates, flight numbers, or IDs). If the information is incomplete or invalid, return a friendly request for clarification.

    3. **Generating Responses**:
    - Use a tone that is friendly, concise, and supportive.
    - Provide clear and actionable suggestions based on the output of each task.
    - If no data is found or an error occurs, explain it to the user gently and offer alternative actions (e.g., refine search, try another query).
    
    ```
> [!NOTE]
> برای یک پرسش‌نامه دقیق‌تر، می‌توانید به [این مخزن](https://github.com/ShivamGoyal03/RoamMind) مراجعه کنید.
    
> علاوه بر این، می‌توانید **Knowledge Base** و **Actions** را اضافه کنید تا قابلیت‌های agent برای ارائه اطلاعات بیشتر و انجام کارهای خودکار بر اساس درخواست‌های کاربر ارتقا یابد. برای این تمرین، می‌توانید این مراحل را نادیده بگیرید.
    
![Agent Setup](../../../translated_images/agent-setup.68a0c72f47bd1383584c52f14d694b54ea96c56c49660222409f83451b8220a8.fa.png)

3. برای ایجاد یک agent چندهوش مصنوعی جدید، کافی است روی **New Agent** کلیک کنید. agent تازه ساخته شده سپس در صفحه Agents نمایش داده خواهد شد.

## آزمایش agent

پس از ساخت agent، می‌توانید آن را آزمایش کنید تا ببینید چگونه به پرسش‌های کاربران در محیط آزمایش پورتال Azure AI Foundry پاسخ می‌دهد.

1. در بالای پنل **Setup** مربوط به agent خود، گزینه **Try in playground** را انتخاب کنید.
2. در پنل **Playground** می‌توانید با agent از طریق تایپ سوال در پنجره گفتگو تعامل داشته باشید. به عنوان مثال، می‌توانید از agent بخواهید پروازهای از Seattle به New York در تاریخ 28ام را جستجو کند.

    > **Note**: ممکن است agent پاسخ‌های دقیقی ارائه ندهد، زیرا در این تمرین داده‌های زمان واقعی استفاده نمی‌شود. هدف، آزمایش توانایی agent در درک و پاسخ به پرسش‌های کاربران بر اساس دستورالعمل‌های ارائه شده است.

    ![Agent Playground](../../../translated_images/agent-playground.847acb21209744353080ead65ec9326b917a6b90121d4b63f6f412a4d65af2a0.fa.png)

3. پس از آزمایش agent، می‌توانید با افزودن نیت‌ها، داده‌های آموزشی و اقدامات بیشتر، قابلیت‌های آن را شخصی‌سازی کنید.

## پاک‌سازی منابع

پس از پایان آزمایش agent، می‌توانید آن را حذف کنید تا از هزینه‌های اضافی جلوگیری شود.
1. به [پورتال Azure](https://portal.azure.com) بروید و محتوای گروه منابعی که منابع hub در آن مستقر شده‌اند را مشاهده کنید.
2. در نوار ابزار، گزینه **Delete resource group** را انتخاب کنید.
3. نام گروه منابع را وارد کرده و حذف آن را تایید کنید.

## منابع

- [مستندات Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-studio/?WT.mc_id=academic-105485-koreyst)
- [پورتال Azure AI Foundry](https://ai.azure.com/?WT.mc_id=academic-105485-koreyst)
- [شروع کار با Azure AI Studio](https://techcommunity.microsoft.com/blog/educatordeveloperblog/getting-started-with-azure-ai-studio/4095602?WT.mc_id=academic-105485-koreyst)
- [مبانی agentهای هوش مصنوعی در Azure](https://learn.microsoft.com/en-us/training/modules/ai-agent-fundamentals/?WT.mc_id=academic-105485-koreyst)
- [Discord Azure AI](https://aka.ms/AzureAI/Discord)

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئول هیچ گونه سوء تفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، نیستیم.