<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T09:24:55+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "fa"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.fa.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(برای مشاهده ویدئوی این درس روی تصویر بالا کلیک کنید)_
# فراشناخت در عامل‌های هوش مصنوعی  
## مقدمه  
به درس فراشناخت در عامل‌های هوش مصنوعی خوش آمدید! این فصل برای مبتدیانی طراحی شده که کنجکاوند بدانند چگونه عامل‌های هوش مصنوعی می‌توانند درباره فرایندهای فکری خود بیندیشند. تا پایان این درس، مفاهیم کلیدی را درک خواهید کرد و با مثال‌های عملی برای به‌کارگیری فراشناخت در طراحی عامل‌های هوش مصنوعی آشنا خواهید شد.  
## اهداف یادگیری  
پس از اتمام این درس، قادر خواهید بود:  
1. پیامدهای حلقه‌های استدلالی در تعریف عامل‌ها را درک کنید.  
2. از تکنیک‌های برنامه‌ریزی و ارزیابی برای کمک به عامل‌های خوداصلاح‌گر استفاده کنید.  
3. عامل‌های خود را بسازید که قادر به دستکاری کد برای انجام وظایف باشند.  
## مقدمه‌ای بر فراشناخت  
فراشناخت به فرایندهای شناختی مرتبه‌بالا اشاره دارد که شامل تفکر درباره تفکر خود فرد است. برای عامل‌های هوش مصنوعی، این یعنی توانایی ارزیابی و تنظیم اقدامات خود بر اساس خودآگاهی و تجربیات گذشته. فراشناخت، یا «تفکر درباره تفکر»، مفهومی مهم در توسعه سیستم‌های هوش مصنوعی عامل‌محور است. این مفهوم شامل آگاهی سیستم‌های هوش مصنوعی از فرایندهای داخلی خود و توانایی نظارت، تنظیم و تطبیق رفتارشان به تناسب است. درست مانند زمانی که ما فضای اطراف را می‌خوانیم یا به مسئله‌ای نگاه می‌کنیم. این خودآگاهی می‌تواند به سیستم‌های هوش مصنوعی کمک کند تصمیمات بهتری بگیرند، خطاها را شناسایی کنند و عملکرد خود را به مرور زمان بهبود بخشند - که دوباره به آزمون تورینگ و بحث بر سر اینکه آیا هوش مصنوعی قرار است تسلط یابد، مرتبط می‌شود.  
در زمینه سیستم‌های هوش مصنوعی عامل‌محور، فراشناخت می‌تواند به رفع چندین چالش کمک کند، مانند:  
- شفافیت: اطمینان از اینکه سیستم‌های هوش مصنوعی می‌توانند استدلال و تصمیمات خود را توضیح دهند.  
- استدلال: افزایش توانایی سیستم‌های هوش مصنوعی در ترکیب اطلاعات و اتخاذ تصمیمات منطقی.  
- سازگاری: امکان تطبیق سیستم‌های هوش مصنوعی با محیط‌های جدید و شرایط متغیر.  
- ادراک: بهبود دقت سیستم‌های هوش مصنوعی در شناسایی و تفسیر داده‌ها از محیطشان.  

### فراشناخت چیست؟  
فراشناخت، یا «تفکر درباره تفکر»، فرایند شناختی مرتبه‌بالایی است که شامل خودآگاهی و خودتنظیمی فرایندهای شناختی فرد می‌شود. در حوزه هوش مصنوعی، فراشناخت به عامل‌ها قدرت می‌دهد تا استراتژی‌ها و اقدامات خود را ارزیابی و تنظیم کنند که منجر به بهبود توانایی حل مسئله و تصمیم‌گیری می‌شود. با درک فراشناخت، می‌توانید عامل‌های هوش مصنوعی طراحی کنید که نه تنها هوشمندتر بلکه سازگارتر و کارآمدتر باشند.  
در فراشناخت واقعی، هوش مصنوعی به طور صریح درباره استدلال خود استدلال می‌کند.  
مثال: «من پروازهای ارزان‌تر را اولویت دادم چون... ممکن است پروازهای مستقیم را از دست بدهم، پس اجازه بده دوباره بررسی کنم.»  
ردیابی اینکه چگونه یا چرا مسیر خاصی را انتخاب کرده است.  
- توجه به اینکه اشتباه کرده چون بیش از حد به ترجیحات کاربر از دفعه قبل اعتماد کرده، پس استراتژی تصمیم‌گیری خود را نه فقط در توصیه نهایی، بلکه در کل تغییر می‌دهد.  
- تشخیص الگوها مانند: «هر وقت کاربر «خیلی شلوغ» را ذکر می‌کند، باید نه تنها برخی جاذبه‌ها را حذف کنم بلکه بازتاب دهم که روش انتخاب «جاذبه‌های برتر» من اشتباه است اگر همیشه بر اساس محبوبیت رتبه‌بندی کنم.»  

### اهمیت فراشناخت در عامل‌های هوش مصنوعی  
فراشناخت نقش حیاتی در طراحی عامل‌های هوش مصنوعی دارد به دلایل زیر:  
![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.fa.png)  
- خودبازتابی: عامل‌ها می‌توانند عملکرد خود را ارزیابی کرده و نقاط قابل بهبود را شناسایی کنند.  
- سازگاری: عامل‌ها می‌توانند استراتژی‌های خود را بر اساس تجربیات گذشته و محیط‌های در حال تغییر تنظیم کنند.  
- اصلاح خطا: عامل‌ها می‌توانند به صورت خودکار خطاها را شناسایی و اصلاح کنند که منجر به نتایج دقیق‌تر می‌شود.  
- مدیریت منابع: عامل‌ها می‌توانند استفاده از منابع مانند زمان و توان محاسباتی را با برنامه‌ریزی و ارزیابی اقدامات بهینه کنند.  

## اجزای یک عامل هوش مصنوعی  
قبل از ورود به فرایندهای فراشناختی، باید اجزای پایه یک عامل هوش مصنوعی را بشناسید. یک عامل هوش مصنوعی معمولاً شامل موارد زیر است:  
- شخصیت: ویژگی‌ها و خصوصیات عامل که نحوه تعامل آن با کاربران را تعریف می‌کند.  
- ابزارها: قابلیت‌ها و عملکردهایی که عامل می‌تواند انجام دهد.  
- مهارت‌ها: دانش و تخصصی که عامل دارد.  
این اجزا با هم یک «واحد تخصص» ایجاد می‌کنند که قادر به انجام وظایف مشخص است.  
**مثال**: یک آژانس مسافرتی را در نظر بگیرید، خدمات عاملی که نه تنها تعطیلات شما را برنامه‌ریزی می‌کند بلکه مسیر خود را بر اساس داده‌های لحظه‌ای و تجربیات سفرهای گذشته مشتری تنظیم می‌کند.  

### مثال: فراشناخت در سرویس آژانس مسافرتی  
تصور کنید در حال طراحی یک سرویس آژانس مسافرتی مبتنی بر هوش مصنوعی هستید. این عامل، «Travel Agent»، به کاربران در برنامه‌ریزی تعطیلاتشان کمک می‌کند. برای گنجاندن فراشناخت، Travel Agent باید اقدامات خود را بر اساس خودآگاهی و تجربیات گذشته ارزیابی و تنظیم کند. در اینجا نقش فراشناخت چگونه است:  

#### وظیفه فعلی  
وظیفه فعلی کمک به کاربر برای برنامه‌ریزی سفر به پاریس است.  

#### مراحل انجام وظیفه  
1. **جمع‌آوری ترجیحات کاربر**: از کاربر درباره تاریخ سفر، بودجه، علاقه‌مندی‌ها (مثلاً موزه‌ها، غذا، خرید) و هر نیاز خاصی سوال کنید.  
2. **بازیابی اطلاعات**: جستجوی گزینه‌های پرواز، اقامت، جاذبه‌ها و رستوران‌هایی که با ترجیحات کاربر مطابقت دارند.  
3. **تولید پیشنهادات**: ارائه یک برنامه سفر شخصی‌سازی شده شامل جزئیات پرواز، رزرو هتل و فعالیت‌های پیشنهادی.  
4. **تنظیم بر اساس بازخورد**: از کاربر بازخورد درباره پیشنهادات بگیرید و تغییرات لازم را اعمال کنید.  

#### منابع مورد نیاز  
- دسترسی به پایگاه‌های داده رزرو پرواز و هتل.  
- اطلاعات درباره جاذبه‌ها و رستوران‌های پاریس.  
- داده‌های بازخورد کاربران از تعاملات قبلی.  

#### تجربه و خودبازتابی  
Travel Agent از فراشناخت برای ارزیابی عملکرد خود و یادگیری از تجربیات گذشته استفاده می‌کند. به عنوان مثال:  
1. **تحلیل بازخورد کاربر**: Travel Agent بازخورد کاربران را بررسی می‌کند تا تعیین کند کدام پیشنهادات مورد استقبال قرار گرفته و کدام نه. سپس پیشنهادات آینده خود را مطابق با آن تنظیم می‌کند.  
2. **سازگاری**: اگر کاربر قبلاً از مکان‌های شلوغ خوشش نیامده باشد، Travel Agent در آینده از پیشنهاد مکان‌های توریستی محبوب در ساعات اوج خودداری می‌کند.  
3. **اصلاح خطا**: اگر Travel Agent در رزرو قبلی اشتباهی مانند پیشنهاد هتلی که کامل بوده مرتکب شده باشد، یاد می‌گیرد قبل از ارائه پیشنهاد، موجودی را دقیق‌تر بررسی کند.  

#### مثال عملی برای توسعه‌دهنده  
در اینجا نمونه ساده‌شده‌ای از کد Travel Agent با گنجاندن فراشناخت آمده است:  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        # Search for flights, hotels, and attractions based on preferences
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        itinerary = create_itinerary(flights, hotels, attractions)
        return itinerary

    def adjust_based_on_feedback(self, feedback):
        self.experience_data.append(feedback)
        # Analyze feedback and adjust future recommendations
        self.user_preferences = adjust_preferences(self.user_preferences, feedback)

# Example usage
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
travel_agent.adjust_based_on_feedback(feedback)
```  

#### چرا فراشناخت اهمیت دارد  
- **خودبازتابی**: عامل‌ها می‌توانند عملکرد خود را تحلیل و نقاط قابل بهبود را شناسایی کنند.  
- **سازگاری**: عامل‌ها می‌توانند استراتژی‌ها را بر اساس بازخورد و شرایط متغیر تغییر دهند.  
- **اصلاح خطا**: عامل‌ها می‌توانند به صورت خودکار خطاها را شناسایی و اصلاح کنند.  
- **مدیریت منابع**: عامل‌ها می‌توانند استفاده از منابع مانند زمان و توان محاسباتی را بهینه کنند.  
با گنجاندن فراشناخت، Travel Agent می‌تواند پیشنهادات سفر شخصی‌تر و دقیق‌تری ارائه دهد و تجربه کلی کاربر را بهبود بخشد.  

---  
## ۲. برنامه‌ریزی در عامل‌ها  
برنامه‌ریزی بخش مهمی از رفتار عامل‌های هوش مصنوعی است. این شامل ترسیم مراحل لازم برای رسیدن به هدف، با در نظر گرفتن وضعیت فعلی، منابع و موانع احتمالی است.  

### عناصر برنامه‌ریزی  
- **وظیفه فعلی**: تعریف واضح وظیفه.  
- **مراحل انجام وظیفه**: تقسیم وظیفه به مراحل قابل مدیریت.  
- **منابع مورد نیاز**: شناسایی منابع لازم.  
- **تجربه**: استفاده از تجربیات گذشته برای اطلاع‌رسانی به برنامه‌ریزی.  
**مثال**: مراحل لازم برای کمک به کاربر در برنامه‌ریزی مؤثر سفر توسط Travel Agent:  

### مراحل برای Travel Agent  
1. **جمع‌آوری ترجیحات کاربر**  
- از کاربر درباره تاریخ سفر، بودجه، علاقه‌مندی‌ها و هر نیاز خاص سوال کنید.  
- مثال‌ها: «چه زمانی قصد سفر دارید؟» «بودجه شما چقدر است؟» «در تعطیلات چه فعالیت‌هایی را دوست دارید؟»  
2. **بازیابی اطلاعات**  
- جستجوی گزینه‌های سفر مرتبط با ترجیحات کاربر.  
- **پروازها**: جستجوی پروازهای موجود در بازه بودجه و تاریخ‌های سفر ترجیحی.  
- **اقامت‌ها**: یافتن هتل‌ها یا اقامتگاه‌هایی که با ترجیحات کاربر از نظر مکان، قیمت و امکانات مطابقت دارند.  
- **جاذبه‌ها و رستوران‌ها**: شناسایی جاذبه‌ها، فعالیت‌ها و گزینه‌های غذاخوری محبوب که با علاقه‌مندی‌های کاربر هماهنگ باشند.  
3. **تولید پیشنهادات**  
- جمع‌آوری اطلاعات بازیابی شده در یک برنامه سفر شخصی‌سازی شده.  
- ارائه جزئیاتی مانند گزینه‌های پرواز، رزرو هتل و فعالیت‌های پیشنهادی، با توجه به ترجیحات کاربر.  
4. **ارائه برنامه سفر به کاربر**  
- برنامه سفر پیشنهادی را برای بازبینی به کاربر ارائه دهید.  
- مثال: «اینجا برنامه پیشنهادی سفر شما به پاریس است. شامل جزئیات پرواز، رزرو هتل و فهرست فعالیت‌ها و رستوران‌های پیشنهادی است. نظرتان را بگویید!»  
5. **جمع‌آوری بازخورد**  
- از کاربر درباره برنامه سفر پیشنهادی بازخورد بگیرید.  
- مثال‌ها: «آیا گزینه‌های پرواز را دوست دارید؟» «آیا هتل برای نیازهای شما مناسب است؟» «آیا فعالیتی هست که بخواهید اضافه یا حذف کنید؟»  
6. **تنظیم بر اساس بازخورد**  
- برنامه سفر را بر اساس بازخورد کاربر اصلاح کنید.  
- تغییرات لازم در پرواز، اقامت و فعالیت‌ها را برای تطبیق بهتر با ترجیحات کاربر اعمال کنید.  
7. **تأیید نهایی**  
- برنامه سفر به‌روزشده را برای تأیید نهایی به کاربر ارائه دهید.  
- مثال: «بر اساس بازخورد شما تغییرات را اعمال کردم. این برنامه به‌روزشده است. همه چیز خوب به نظر می‌رسد؟»  
8. **رزرو و تأیید نهایی**  
- پس از تأیید کاربر، پروازها، اقامت‌ها و فعالیت‌های پیش‌برنامه‌ریزی شده را رزرو کنید.  
- جزئیات تأیید را به کاربر ارسال کنید.  
9. **پشتیبانی مستمر**  
- در طول سفر و قبل از آن، برای کمک به کاربر در تغییرات یا درخواست‌های اضافی در دسترس باشید.  
- مثال: «اگر در طول سفر به کمک بیشتری نیاز داشتید، هر زمان می‌توانید با من تماس بگیرید!»  

### مثال تعامل  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        itinerary = create_itinerary(flights, hotels, attractions)
        return itinerary

    def adjust_based_on_feedback(self, feedback):
        self.experience_data.append(feedback)
        self.user_preferences = adjust_preferences(self.user_preferences, feedback)

# Example usage within a booing request
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
travel_agent.adjust_based_on_feedback(feedback)
```  

## ۳. سیستم اصلاحی RAG  
ابتدا تفاوت بین RAG Tool و Pre-emptive Context Load را بررسی کنیم  
![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.fa.png)  

### تولید افزوده شده با بازیابی (RAG)  
RAG ترکیبی از یک سیستم بازیابی با یک مدل تولیدی است. وقتی پرسشی مطرح می‌شود، سیستم بازیابی اسناد یا داده‌های مرتبط را از منبع خارجی می‌گیرد و این اطلاعات بازیابی شده برای تقویت ورودی مدل تولیدی استفاده می‌شود. این به مدل کمک می‌کند پاسخ‌های دقیق‌تر و مرتبط‌تر با زمینه تولید کند.  
در سیستم RAG، عامل اطلاعات مرتبط را از یک پایگاه دانش بازیابی کرده و از آن برای تولید پاسخ‌ها یا اقدامات مناسب استفاده می‌کند.  

### رویکرد اصلاحی RAG  
رویکرد اصلاحی RAG بر استفاده از تکنیک‌های RAG برای اصلاح خطاها و بهبود دقت عامل‌های هوش مصنوعی تمرکز دارد. این شامل:  
1. **تکنیک پرامپتینگ**: استفاده از پرامپت‌های خاص برای هدایت عامل در بازیابی اطلاعات مرتبط.  
2. **ابزار**: پیاده‌سازی الگوریتم‌ها و مکانیزم‌هایی که به عامل امکان می‌دهد ارتباط اطلاعات بازیابی شده را ارزیابی کرده و پاسخ‌های دقیقی تولید کند.  
3. **ارزیابی**: ارزیابی مداوم عملکرد عامل و انجام تنظیمات برای بهبود دقت و کارایی آن.  
####
مثال: RAG اصلاحی در یک عامل جستجو  
یک عامل جستجو را در نظر بگیرید که اطلاعات را از وب برای پاسخ به پرسش‌های کاربر بازیابی می‌کند. رویکرد RAG اصلاحی ممکن است شامل موارد زیر باشد:  
1. **تکنیک درخواست‌دهی**: فرموله کردن پرس‌وجوهای جستجو بر اساس ورودی کاربر.  
2. **ابزار**: استفاده از پردازش زبان طبیعی و الگوریتم‌های یادگیری ماشین برای رتبه‌بندی و فیلتر نتایج جستجو.  
3. **ارزیابی**: تحلیل بازخورد کاربر برای شناسایی و اصلاح نادرستی‌ها در اطلاعات بازیابی شده.  

### RAG اصلاحی در عامل مسافرت  
RAG اصلاحی (تولید تقویت‌شده با بازیابی) توانایی هوش مصنوعی را در بازیابی و تولید اطلاعات افزایش می‌دهد و در عین حال هر گونه نادرستی را اصلاح می‌کند. بیایید ببینیم چگونه عامل مسافرت می‌تواند از رویکرد RAG اصلاحی برای ارائه توصیه‌های سفر دقیق‌تر و مرتبط‌تر استفاده کند. این شامل موارد زیر است:  
- **تکنیک درخواست‌دهی:** استفاده از درخواست‌های خاص برای راهنمایی عامل در بازیابی اطلاعات مرتبط.  
- **ابزار:** پیاده‌سازی الگوریتم‌ها و مکانیزم‌هایی که به عامل امکان می‌دهد مرتبط بودن اطلاعات بازیابی شده را ارزیابی کرده و پاسخ‌های دقیق تولید کند.  
- **ارزیابی:** ارزیابی مداوم عملکرد عامل و ایجاد تنظیمات برای بهبود دقت و کارایی آن.  

#### مراحل اجرای RAG اصلاحی در عامل مسافرت  
1. **تعامل اولیه با کاربر**  
- عامل مسافرت ترجیحات اولیه کاربر مانند مقصد، تاریخ‌های سفر، بودجه و علایق را جمع‌آوری می‌کند.  
- مثال: ```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  
2. **بازیابی اطلاعات**  
- عامل مسافرت اطلاعات مربوط به پروازها، اقامتگاه‌ها، جاذبه‌ها و رستوران‌ها را بر اساس ترجیحات کاربر بازیابی می‌کند.  
- مثال: ```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  
3. **تولید توصیه‌های اولیه**  
- عامل مسافرت از اطلاعات بازیابی شده برای تولید یک برنامه سفر شخصی‌سازی شده استفاده می‌کند.  
- مثال: ```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  
4. **جمع‌آوری بازخورد کاربر**  
- عامل مسافرت از کاربر بازخورد درباره توصیه‌های اولیه می‌گیرد.  
- مثال: ```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  
5. **فرآیند RAG اصلاحی**  
- **تکنیک درخواست‌دهی**: عامل مسافرت پرس‌وجوهای جستجوی جدید را بر اساس بازخورد کاربر فرموله می‌کند.  
- مثال: ```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **ابزار**: عامل مسافرت از الگوریتم‌ها برای رتبه‌بندی و فیلتر نتایج جستجوی جدید استفاده می‌کند، با تأکید بر مرتبط بودن بر اساس بازخورد کاربر.  
- مثال: ```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **ارزیابی**: عامل مسافرت به طور مداوم مرتبط بودن و دقت توصیه‌های خود را با تحلیل بازخورد کاربر ارزیابی کرده و تنظیمات لازم را انجام می‌دهد.  
- مثال: ```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### مثال عملی  
در اینجا یک نمونه کد ساده پایتون است که رویکرد RAG اصلاحی را در عامل مسافرت به کار می‌برد:  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        itinerary = create_itinerary(flights, hotels, attractions)
        return itinerary

    def adjust_based_on_feedback(self, feedback):
        self.experience_data.append(feedback)
        self.user_preferences = adjust_preferences(self.user_preferences, feedback)
        new_itinerary = self.generate_recommendations()
        return new_itinerary

# Example usage
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
new_itinerary = travel_agent.adjust_based_on_feedback(feedback)
print("Updated Itinerary:", new_itinerary)
```  

### بارگذاری پیش‌گیرانه زمینه  
بارگذاری پیش‌گیرانه زمینه شامل بارگذاری زمینه یا اطلاعات پس‌زمینه مرتبط در مدل قبل از پردازش پرس‌وجو است. این بدان معناست که مدل از ابتدا به این اطلاعات دسترسی دارد که می‌تواند به تولید پاسخ‌های آگاهانه‌تر بدون نیاز به بازیابی داده‌های اضافی در طول فرایند کمک کند.  
در اینجا یک مثال ساده از چگونگی بارگذاری پیش‌گیرانه زمینه برای برنامه عامل مسافرت در پایتون آمده است:  
```python
class TravelAgent:
    def __init__(self):
        # Pre-load popular destinations and their information
        self.context = {
            "Paris": {"country": "France", "currency": "Euro", "language": "French", "attractions": ["Eiffel Tower", "Louvre Museum"]},
            "Tokyo": {"country": "Japan", "currency": "Yen", "language": "Japanese", "attractions": ["Tokyo Tower", "Shibuya Crossing"]},
            "New York": {"country": "USA", "currency": "Dollar", "language": "English", "attractions": ["Statue of Liberty", "Times Square"]},
            "Sydney": {"country": "Australia", "currency": "Dollar", "language": "English", "attractions": ["Sydney Opera House", "Bondi Beach"]}
        }

    def get_destination_info(self, destination):
        # Fetch destination information from pre-loaded context
        info = self.context.get(destination)
        if info:
            return f"{destination}:\nCountry: {info['country']}\nCurrency: {info['currency']}\nLanguage: {info['language']}\nAttractions: {', '.join(info['attractions'])}"
        else:
            return f"Sorry, we don't have information on {destination}."

# Example usage
travel_agent = TravelAgent()
print(travel_agent.get_destination_info("Paris"))
print(travel_agent.get_destination_info("Tokyo"))
```  

#### توضیح  
1. **مقدمه‌سازی (`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info`)** متد اطلاعات مرتبط را از دیکشنری زمینه بارگذاری شده می‌گیرد. با بارگذاری پیش‌گیرانه زمینه، برنامه عامل مسافرت می‌تواند به سرعت به پرسش‌های کاربر پاسخ دهد بدون اینکه نیاز به بازیابی این اطلاعات از منبع خارجی به صورت لحظه‌ای باشد. این باعث افزایش کارایی و پاسخگویی برنامه می‌شود.  

### شروع برنامه با هدف قبل از تکرار  
شروع برنامه با هدف به معنای شروع با یک هدف واضح یا نتیجه مورد نظر است. با تعریف این هدف از ابتدا، مدل می‌تواند از آن به عنوان یک اصل راهنما در طول فرآیند تکراری استفاده کند. این کمک می‌کند تا هر تکرار به سمت رسیدن به نتیجه مطلوب حرکت کند و فرآیند کارآمدتر و متمرکزتر شود.  
در اینجا مثالی از نحوه شروع یک برنامه سفر با هدف قبل از تکرار برای عامل مسافرت در پایتون آورده شده است:  

### سناریو  
یک عامل مسافرت می‌خواهد یک تعطیلات سفارشی برای یک مشتری برنامه‌ریزی کند. هدف ایجاد یک برنامه سفر است که رضایت مشتری را بر اساس ترجیحات و بودجه او به حداکثر برساند.  

### مراحل  
1. تعریف ترجیحات و بودجه مشتری.  
2. شروع برنامه اولیه بر اساس این ترجیحات.  
3. تکرار برای اصلاح برنامه و بهینه‌سازی رضایت مشتری.  

#### کد پایتون  
```python
class TravelAgent:
    def __init__(self, destinations):
        self.destinations = destinations

    def bootstrap_plan(self, preferences, budget):
        plan = []
        total_cost = 0

        for destination in self.destinations:
            if total_cost + destination['cost'] <= budget and self.match_preferences(destination, preferences):
                plan.append(destination)
                total_cost += destination['cost']

        return plan

    def match_preferences(self, destination, preferences):
        for key, value in preferences.items():
            if destination.get(key) != value:
                return False
        return True

    def iterate_plan(self, plan, preferences, budget):
        for i in range(len(plan)):
            for destination in self.destinations:
                if destination not in plan and self.match_preferences(destination, preferences) and self.calculate_cost(plan, destination) <= budget:
                    plan[i] = destination
                    break
        return plan

    def calculate_cost(self, plan, new_destination):
        return sum(destination['cost'] for destination in plan) + new_destination['cost']

# Example usage
destinations = [
    {"name": "Paris", "cost": 1000, "activity": "sightseeing"},
    {"name": "Tokyo", "cost": 1200, "activity": "shopping"},
    {"name": "New York", "cost": 900, "activity": "sightseeing"},
    {"name": "Sydney", "cost": 1100, "activity": "beach"},
]

preferences = {"activity": "sightseeing"}
budget = 2000

travel_agent = TravelAgent(destinations)
initial_plan = travel_agent.bootstrap_plan(preferences, budget)
print("Initial Plan:", initial_plan)

refined_plan = travel_agent.iterate_plan(initial_plan, preferences, budget)
print("Refined Plan:", refined_plan)
```  

#### توضیح کد  
1. **مقدمه‌سازی (`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost`)**: این متد هزینه کل برنامه فعلی را محاسبه می‌کند، از جمله یک مقصد احتمالی جدید.  

#### مثال استفاده  
- **برنامه اولیه**: عامل مسافرت برنامه اولیه را بر اساس ترجیحات مشتری برای بازدید و بودجه ۲۰۰۰ دلار ایجاد می‌کند.  
- **برنامه اصلاح شده**: عامل مسافرت برنامه را تکرار می‌کند و آن را برای ترجیحات و بودجه مشتری بهینه می‌سازد.  
با شروع برنامه با هدفی واضح (مثلاً حداکثر کردن رضایت مشتری) و تکرار برای اصلاح برنامه، عامل مسافرت می‌تواند یک برنامه سفر سفارشی و بهینه شده برای مشتری ایجاد کند. این رویکرد تضمین می‌کند که برنامه سفر از ابتدا با ترجیحات و بودجه مشتری همسو باشد و با هر تکرار بهبود یابد.  

### استفاده از مدل‌های زبانی بزرگ برای رتبه‌بندی مجدد و امتیازدهی  
مدل‌های زبانی بزرگ (LLMها) می‌توانند برای رتبه‌بندی مجدد و امتیازدهی با ارزیابی مرتبط بودن و کیفیت اسناد بازیابی شده یا پاسخ‌های تولید شده استفاده شوند. نحوه کار به شرح زیر است:  
**بازیابی:** مرحله بازیابی اولیه مجموعه‌ای از اسناد یا پاسخ‌های کاندید بر اساس پرس‌وجو را دریافت می‌کند.  
**رتبه‌بندی مجدد:** LLM این کاندیدها را ارزیابی کرده و بر اساس مرتبط بودن و کیفیت آن‌ها را رتبه‌بندی مجدد می‌کند. این مرحله تضمین می‌کند که مرتبط‌ترین و با کیفیت‌ترین اطلاعات ابتدا ارائه شود.  
**امتیازدهی:** LLM به هر کاندید امتیاز می‌دهد که نشان‌دهنده مرتبط بودن و کیفیت آن است. این به انتخاب بهترین پاسخ یا سند برای کاربر کمک می‌کند.  
با استفاده از LLM برای رتبه‌بندی مجدد و امتیازدهی، سیستم می‌تواند اطلاعات دقیق‌تر و مرتبط‌تری ارائه دهد و تجربه کلی کاربر را بهبود بخشد.  
در اینجا مثالی از چگونگی استفاده عامل مسافرت از یک مدل زبانی بزرگ برای رتبه‌بندی مجدد و امتیازدهی مقاصد سفر بر اساس ترجیحات کاربر در پایتون آمده است:  

#### سناریو - سفر بر اساس ترجیحات  
یک عامل مسافرت می‌خواهد بهترین مقاصد سفر را به مشتری بر اساس ترجیحات او پیشنهاد دهد. LLM به رتبه‌بندی مجدد و امتیازدهی مقاصد کمک می‌کند تا مرتبط‌ترین گزینه‌ها ارائه شود.  

#### مراحل:  
1. جمع‌آوری ترجیحات کاربر.  
2. بازیابی فهرستی از مقاصد سفر احتمالی.  
3. استفاده از LLM برای رتبه‌بندی مجدد و امتیازدهی مقاصد بر اساس ترجیحات کاربر.  
در اینجا نحوه به‌روزرسانی مثال قبلی برای استفاده از خدمات Azure OpenAI آمده است:  

#### الزامات  
1. داشتن اشتراک Azure.  
2. ایجاد منبع Azure OpenAI و دریافت کلید API.  

#### مثال کد پایتون  
```python
import requests
import json

class TravelAgent:
    def __init__(self, destinations):
        self.destinations = destinations

    def get_recommendations(self, preferences, api_key, endpoint):
        # Generate a prompt for the Azure OpenAI
        prompt = self.generate_prompt(preferences)
        
        # Define headers and payload for the request
        headers = {
            'Content-Type': 'application/json',
            'Authorization': f'Bearer {api_key}'
        }
        payload = {
            "prompt": prompt,
            "max_tokens": 150,
            "temperature": 0.7
        }
        
        # Call the Azure OpenAI API to get the re-ranked and scored destinations
        response = requests.post(endpoint, headers=headers, json=payload)
        response_data = response.json()
        
        # Extract and return the recommendations
        recommendations = response_data['choices'][0]['text'].strip().split('\n')
        return recommendations

    def generate_prompt(self, preferences):
        prompt = "Here are the travel destinations ranked and scored based on the following user preferences:\n"
        for key, value in preferences.items():
            prompt += f"{key}: {value}\n"
        prompt += "\nDestinations:\n"
        for destination in self.destinations:
            prompt += f"- {destination['name']}: {destination['description']}\n"
        return prompt

# Example usage
destinations = [
    {"name": "Paris", "description": "City of lights, known for its art, fashion, and culture."},
    {"name": "Tokyo", "description": "Vibrant city, famous for its modernity and traditional temples."},
    {"name": "New York", "description": "The city that never sleeps, with iconic landmarks and diverse culture."},
    {"name": "Sydney", "description": "Beautiful harbour city, known for its opera house and stunning beaches."},
]

preferences = {"activity": "sightseeing", "culture": "diverse"}
api_key = 'your_azure_openai_api_key'
endpoint = 'https://your-endpoint.com/openai/deployments/your-deployment-name/completions?api-version=2022-12-01'

travel_agent = TravelAgent(destinations)
recommendations = travel_agent.get_recommendations(preferences, api_key, endpoint)
print("Recommended Destinations:")
for rec in recommendations:
    print(rec)
```  

#### توضیح کد - بوکِر ترجیحات  
1. **مقدمه‌سازی**: `TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` با URL واقعی نقطه پایانی استقرار Azure OpenAI شما جایگزین می‌شود.  
با استفاده از LLM برای رتبه‌بندی مجدد و امتیازدهی، عامل مسافرت می‌تواند توصیه‌های سفر شخصی‌تر و مرتبط‌تری به مشتریان ارائه دهد و تجربه کلی آن‌ها را بهبود بخشد.  

### RAG: تکنیک درخواست‌دهی در مقابل ابزار  
تولید تقویت‌شده با بازیابی (RAG) می‌تواند هم به عنوان یک تکنیک درخواست‌دهی و هم به عنوان یک ابزار در توسعه عوامل هوش مصنوعی باشد. درک تفاوت بین این دو می‌تواند به شما کمک کند تا RAG را مؤثرتر در پروژه‌های خود به کار ببرید.  

#### RAG به عنوان تکنیک درخواست‌دهی  
**چیست؟**  
- به عنوان یک تکنیک درخواست‌دهی، RAG شامل فرموله کردن پرس‌وجوها یا درخواست‌های خاص برای هدایت بازیابی اطلاعات مرتبط از یک مجموعه بزرگ یا پایگاه داده است. این اطلاعات سپس برای تولید پاسخ‌ها یا اقدامات استفاده می‌شود.  
**نحوه کار:**  
1. **فرموله کردن درخواست‌ها**: ایجاد درخواست‌ها یا پرس‌وجوهای ساختارمند بر اساس کار مورد نظر یا ورودی کاربر.  
2. **بازیابی اطلاعات**: استفاده از درخواست‌ها برای جستجوی داده‌های مرتبط از یک پایگاه دانش یا مجموعه داده موجود.  
3. **تولید پاسخ**: ترکیب اطلاعات بازیابی شده با مدل‌های تولیدی هوش مصنوعی برای تولید پاسخ جامع و منسجم.  
**مثال در عامل مسافرت:**  
- ورودی کاربر: «می‌خواهم از موزه‌های پاریس بازدید کنم.»  
- درخواست: «موزه‌های برتر پاریس را پیدا کن.»  
- اطلاعات بازیابی شده: جزئیات موزه لوور، موزه اورسی و غیره.  
- پاسخ تولید شده: «در اینجا چند موزه برتر در پاریس هستند: موزه لوور، موزه اورسی و مرکز پمپیدو.»  

#### RAG به عنوان ابزار  
**چیست؟**  
- به عنوان یک ابزار، RAG یک سیستم یکپارچه است که فرآیند بازیابی و تولید را خودکار می‌کند و پیاده‌سازی قابلیت‌های پیچیده هوش مصنوعی را برای توسعه‌دهندگان آسان‌تر می‌سازد بدون نیاز به ساخت دستی درخواست‌ها برای هر پرس‌وجو.  
**نحوه کار:**  
1. **یکپارچه‌سازی**: جاسازی RAG در معماری عامل هوش مصنوعی، به گونه‌ای که به طور خودکار وظایف بازیابی و تولید را مدیریت کند.  
2. **خودکارسازی**: ابزار کل فرآیند را از دریافت ورودی کاربر تا تولید پاسخ نهایی مدیریت می‌کند، بدون نیاز به درخواست‌های صریح برای هر مرحله.  
3. **کارایی**: با ساده‌سازی فرآیند بازیابی و تولید، عملکرد عامل را بهبود می‌بخشد و پاسخ‌ها را سریع‌تر و دقیق‌تر می‌کند.  
**مثال در عامل مسافرت:**  
- ورودی کاربر: «می‌خواهم از موزه‌های پاریس بازدید کنم.»  
- ابزار RAG: به طور خودکار اطلاعات مربوط به موزه‌ها را بازیابی کرده و پاسخ تولید می‌کند.  
- پاسخ تولید شده: «در اینجا چند موزه برتر در پاریس هستند: موزه لوور، موزه اورسی و مرکز پمپیدو.»  

### مقایسه  
| جنبه | تکنیک درخواست‌دهی | ابزار |  
|------------------------|-------------------------------------------------------------|-------------------------------------------------------|  
| **دستی در مقابل خودکار** | فرموله کردن دستی درخواست‌ها برای هر پرس‌وجو. | فرآیند خودکار برای بازیابی و تولید. |  
| **کنترل** | کنترل بیشتر بر فرآیند بازیابی. | ساده‌سازی و خودکارسازی بازیابی و تولید. |  
| **انعطاف‌پذیری** | امکان ایجاد درخواست‌های سفارشی بر اساس نیازهای خاص. | کارآمدتر برای پیاده‌سازی‌های بزرگ‌مقیاس. |  
| **پیچیدگی** | نیاز به ساخت و تنظیم درخواست‌ها. | آسان‌تر برای یکپارچه‌سازی در معماری عامل هوش مصنوعی. |  

### مثال‌های عملی  
**مثال تکنیک درخواست‌دهی:** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**مثال ابزار:** ```python
class Travel_Agent:
    def __init__(self):
        self.rag_tool = RAGTool()

    def get_museums_in_paris(self):
        user_input = "I want to visit museums in Paris."
        response = self.rag_tool.retrieve_and_generate(user_input)
        return response

travel_agent = Travel_Agent()
museums = travel_agent.get_museums_in_paris()
print("Top Museums in Paris:", museums)
```  

### ارزیابی مرتبط بودن  
ارزیابی مرتبط بودن یک جنبه حیاتی در عملکرد عامل هوش مصنوعی است. این اطمینان حاصل می‌کند که اطلاعات بازیابی شده و تولید شده توسط عامل مناسب، دقیق و مفید برای کاربر باشد. بیایید بررسی کنیم چگونه می‌توان مرتبط بودن را در عوامل هوش مصنوعی ارزیابی کرد، شامل مثال‌ها و تکنیک‌های عملی.  

#### مفاهیم کلیدی در ارزیابی مرتبط بودن  
1. **آگاهی از زمینه:**  
- عامل باید زمینه پرسش کاربر را درک کند تا اطلاعات مرتبط را بازیابی و تولید کند.  
- مثال: اگر کاربر بپرسد «بهترین رستوران‌ها در پاریس»، عامل باید ترجیحات کاربر مانند نوع غذا و بودجه را در نظر بگیرد.  
2. **دقت:**  
- اطلاعات ارائه شده توسط عامل باید از نظر واقعی صحیح و به‌روز باشد.  
- مثال: توصیه رستوران‌های باز و با نظرات خوب در حال حاضر به جای گزینه‌های قدیمی یا بسته شده.  
3. **نیت کاربر:**
عامل باید نیت کاربر پشت پرس‌وجو را استنباط کند تا مرتبط‌ترین اطلاعات را ارائه دهد.  
- مثال: اگر کاربری درخواست "هتل‌های مقرون‌به‌صرفه" کند، عامل باید گزینه‌های ارزان‌تر را در اولویت قرار دهد.  

۴. **چرخه بازخورد**:  
- جمع‌آوری و تحلیل مداوم بازخورد کاربران به عامل کمک می‌کند فرآیند ارزیابی مرتبط بودن را بهبود بخشد.  
- مثال: استفاده از امتیازها و بازخورد کاربران درباره پیشنهادات قبلی برای بهبود پاسخ‌های آینده.  

#### تکنیک‌های عملی برای ارزیابی مرتبط بودن  
۱. **امتیازدهی مرتبط بودن**:  
- به هر آیتم بازیابی‌شده بر اساس میزان تطابق با پرس‌وجوی کاربر و ترجیحاتش امتیاز مرتبط بودن اختصاص دهید.  
- مثال: ```python
     def relevance_score(item, query):
         score = 0
         if item['category'] in query['interests']:
             score += 1
         if item['price'] <= query['budget']:
             score += 1
         if item['location'] == query['destination']:
             score += 1
         return score
     ```  

۲. **فیلتر کردن و رتبه‌بندی**:  
- موارد نامرتبط را حذف کرده و موارد باقی‌مانده را بر اساس امتیاز مرتبط بودن رتبه‌بندی کنید.  
- مثال: ```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

۳. **پردازش زبان طبیعی (NLP)**:  
- از تکنیک‌های NLP برای درک پرس‌وجوی کاربر و بازیابی اطلاعات مرتبط استفاده کنید.  
- مثال: ```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

۴. **ادغام بازخورد کاربر**:  
- بازخورد کاربران درباره پیشنهادات ارائه‌شده را جمع‌آوری کرده و برای تنظیم ارزیابی‌های مرتبط بودن آینده به کار ببرید.  
- مثال: ```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### مثال: ارزیابی مرتبط بودن در عامل سفر  
در اینجا یک مثال عملی از نحوه ارزیابی مرتبط بودن توصیه‌های سفر توسط عامل سفر آورده شده است:  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        ranked_hotels = self.filter_and_rank(hotels, self.user_preferences)
        itinerary = create_itinerary(flights, ranked_hotels, attractions)
        return itinerary

    def filter_and_rank(self, items, query):
        ranked_items = sorted(items, key=lambda item: self.relevance_score(item, query), reverse=True)
        return ranked_items[:10]  # Return top 10 relevant items

    def relevance_score(self, item, query):
        score = 0
        if item['category'] in query['interests']:
            score += 1
        if item['price'] <= query['budget']:
            score += 1
        if item['location'] == query['destination']:
            score += 1
        return score

    def adjust_based_on_feedback(self, feedback, items):
        for item in items:
            if item['name'] in feedback['liked']:
                item['relevance'] += 1
            if item['name'] in feedback['disliked']:
                item['relevance'] -= 1
        return items

# Example usage
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
updated_items = travel_agent.adjust_based_on_feedback(feedback, itinerary['hotels'])
print("Updated Itinerary with Feedback:", updated_items)
```  

### جستجو با نیت  
جستجو با نیت شامل درک و تفسیر هدف یا منظور اصلی پشت پرس‌وجوی کاربر برای بازیابی و تولید مرتبط‌ترین و مفیدترین اطلاعات است. این رویکرد فراتر از تطابق صرف کلمات کلیدی است و بر درک نیازها و زمینه واقعی کاربر تمرکز دارد.  

#### مفاهیم کلیدی در جستجو با نیت  
۱. **درک نیت کاربر**:  
- نیت کاربر را می‌توان به سه نوع اصلی تقسیم کرد: اطلاعاتی، ناوبری و تراکنشی.  
- **نیت اطلاعاتی**: کاربر به دنبال اطلاعات درباره یک موضوع است (مثلاً "بهترین موزه‌های پاریس کدامند؟").  
- **نیت ناوبری**: کاربر می‌خواهد به یک وب‌سایت یا صفحه مشخص دسترسی پیدا کند (مثلاً "وب‌سایت رسمی موزه لوور").  
- **نیت تراکنشی**: کاربر قصد انجام تراکنش دارد، مانند رزرو پرواز یا خرید (مثلاً "رزرو پرواز به پاریس").  

۲. **آگاهی از زمینه**:  
- تحلیل زمینه پرس‌وجوی کاربر به شناسایی دقیق نیت او کمک می‌کند. این شامل در نظر گرفتن تعاملات قبلی، ترجیحات کاربر و جزئیات خاص پرس‌وجوی فعلی است.  

۳. **پردازش زبان طبیعی (NLP)**:  
- از تکنیک‌های NLP برای درک و تفسیر پرس‌وجوهای زبان طبیعی ارائه شده توسط کاربران استفاده می‌شود. این شامل وظایفی مانند شناسایی موجودیت‌ها، تحلیل احساسات و تجزیه پرس‌وجو است.  

۴. **شخصی‌سازی**:  
- شخصی‌سازی نتایج جستجو بر اساس تاریخچه، ترجیحات و بازخورد کاربر، مرتبط بودن اطلاعات بازیابی شده را افزایش می‌دهد.  

#### مثال عملی: جستجو با نیت در عامل سفر  
بیایید عامل سفر را به عنوان مثال ببینیم که چگونه جستجو با نیت را پیاده‌سازی می‌کند.  
۱. **جمع‌آوری ترجیحات کاربر**  
```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
۲. **درک نیت کاربر**  
```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
۳. **آگاهی از زمینه**  
```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
۴. **جستجو و شخصی‌سازی نتایج**  
```python
   def search_with_intent(query, preferences, user_history):
       intent = identify_intent(query)
       context = analyze_context(query, user_history)
       if intent == "informational":
           search_results = search_information(query, preferences)
       elif intent == "navigational":
           search_results = search_navigation(query)
       elif intent == "transactional":
           search_results = search_transaction(query, preferences)
       personalized_results = personalize_results(search_results, user_history)
       return personalized_results

   def search_information(query, preferences):
       # Example search logic for informational intent
       results = search_web(f"best {preferences['interests']} in {preferences['destination']}")
       return results

   def search_navigation(query):
       # Example search logic for navigational intent
       results = search_web(query)
       return results

   def search_transaction(query, preferences):
       # Example search logic for transactional intent
       results = search_web(f"book {query} to {preferences['destination']}")
       return results

   def personalize_results(results, user_history):
       # Example personalization logic
       personalized = [result for result in results if result not in user_history]
       return personalized[:10]  # Return top 10 personalized results
   ```  
۵. **نمونه استفاده**  
```python
   travel_agent = Travel_Agent()
   preferences = {
       "destination": "Paris",
       "interests": ["museums", "cuisine"]
   }
   travel_agent.gather_preferences(preferences)
   user_history = ["Louvre Museum website", "Book flight to Paris"]
   query = "best museums in Paris"
   results = search_with_intent(query, preferences, user_history)
   print("Search Results:", results)
   ```  

---  

## ۴. تولید کد به عنوان ابزار  
عامل‌های تولید کد از مدل‌های هوش مصنوعی برای نوشتن و اجرای کد استفاده می‌کنند و به این وسیله مسائل پیچیده را حل و وظایف را خودکار می‌کنند.  

### عامل‌های تولید کد  
عامل‌های تولید کد از مدل‌های تولیدی هوش مصنوعی برای نوشتن و اجرای کد بهره می‌برند. این عامل‌ها می‌توانند مسائل پیچیده را حل، وظایف را خودکار کرده و با تولید و اجرای کد در زبان‌های برنامه‌نویسی مختلف، بینش‌های ارزشمندی ارائه دهند.  

#### کاربردهای عملی  
۱. **تولید خودکار کد**: تولید قطعه کد برای وظایف خاص مانند تحلیل داده، وب‌اسکرپینگ یا یادگیری ماشین.  
۲. **SQL به عنوان RAG**: استفاده از کوئری‌های SQL برای بازیابی و دستکاری داده‌ها از پایگاه‌های داده.  
۳. **حل مسئله**: ایجاد و اجرای کد برای حل مسائل خاص مانند بهینه‌سازی الگوریتم‌ها یا تحلیل داده‌ها.  

#### مثال: عامل تولید کد برای تحلیل داده  
فرض کنید در حال طراحی یک عامل تولید کد هستید. این‌گونه عمل می‌کند:  
۱. **وظیفه**: تحلیل یک مجموعه داده برای شناسایی روندها و الگوها.  
۲. **مراحل**:  
- بارگذاری مجموعه داده در ابزار تحلیل داده.  
- تولید کوئری‌های SQL برای فیلتر و تجمیع داده‌ها.  
- اجرای کوئری‌ها و بازیابی نتایج.  
- استفاده از نتایج برای تولید مصورسازی‌ها و بینش‌ها.  
۳. **منابع مورد نیاز**: دسترسی به مجموعه داده، ابزارهای تحلیل داده و قابلیت‌های SQL.  
۴. **تجربه**: استفاده از نتایج تحلیل‌های گذشته برای بهبود دقت و مرتبط بودن تحلیل‌های آینده.  

### مثال: عامل تولید کد برای عامل سفر  
در این مثال، عامل تولید کد به نام عامل سفر طراحی می‌کنیم که به کاربران در برنامه‌ریزی سفر کمک می‌کند با تولید و اجرای کد. این عامل می‌تواند وظایفی مانند بازیابی گزینه‌های سفر، فیلتر نتایج و تهیه برنامه سفر را با استفاده از هوش مصنوعی تولیدی انجام دهد.  

#### مرور کلی عامل تولید کد  
۱. **جمع‌آوری ترجیحات کاربر**: دریافت ورودی کاربر مانند مقصد، تاریخ‌های سفر، بودجه و علاقه‌مندی‌ها.  
۲. **تولید کد برای بازیابی داده**: تولید قطعه کد برای بازیابی اطلاعات پروازها، هتل‌ها و جاذبه‌ها.  
۳. **اجرای کد تولید شده**: اجرای کد برای دریافت اطلاعات به‌روز.  
۴. **تولید برنامه سفر**: ترکیب داده‌های بازیابی شده در یک برنامه سفر شخصی‌سازی شده.  
۵. **تنظیم بر اساس بازخورد**: دریافت بازخورد کاربر و در صورت نیاز بازتولید کد برای بهبود نتایج.  

#### پیاده‌سازی گام به گام  
۱. **جمع‌آوری ترجیحات کاربر**  
```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
۲. **تولید کد برای بازیابی داده**  
```python
   def generate_code_to_fetch_data(preferences):
       # Example: Generate code to search for flights based on user preferences
       code = f"""
       def search_flights():
           import requests
           response = requests.get('https://api.example.com/flights', params={preferences})
           return response.json()
       """
       return code

   def generate_code_to_fetch_hotels(preferences):
       # Example: Generate code to search for hotels
       code = f"""
       def search_hotels():
           import requests
           response = requests.get('https://api.example.com/hotels', params={preferences})
           return response.json()
       """
       return code
   ```  
۳. **اجرای کد تولید شده**  
```python
   def execute_code(code):
       # Execute the generated code using exec
       exec(code)
       result = locals()
       return result

   travel_agent = Travel_Agent()
   preferences = {
       "destination": "Paris",
       "dates": "2025-04-01 to 2025-04-10",
       "budget": "moderate",
       "interests": ["museums", "cuisine"]
   }
   travel_agent.gather_preferences(preferences)
   
   flight_code = generate_code_to_fetch_data(preferences)
   hotel_code = generate_code_to_fetch_hotels(preferences)
   
   flights = execute_code(flight_code)
   hotels = execute_code(hotel_code)

   print("Flight Options:", flights)
   print("Hotel Options:", hotels)
   ```  
۴. **تولید برنامه سفر**  
```python
   def generate_itinerary(flights, hotels, attractions):
       itinerary = {
           "flights": flights,
           "hotels": hotels,
           "attractions": attractions
       }
       return itinerary

   attractions = search_attractions(preferences)
   itinerary = generate_itinerary(flights, hotels, attractions)
   print("Suggested Itinerary:", itinerary)
   ```  
۵. **تنظیم بر اساس بازخورد**  
```python
   def adjust_based_on_feedback(feedback, preferences):
       # Adjust preferences based on user feedback
       if "liked" in feedback:
           preferences["favorites"] = feedback["liked"]
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       return preferences

   feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
   updated_preferences = adjust_based_on_feedback(feedback, preferences)
   
   # Regenerate and execute code with updated preferences
   updated_flight_code = generate_code_to_fetch_data(updated_preferences)
   updated_hotel_code = generate_code_to_fetch_hotels(updated_preferences)
   
   updated_flights = execute_code(updated_flight_code)
   updated_hotels = execute_code(updated_hotel_code)
   
   updated_itinerary = generate_itinerary(updated_flights, updated_hotels, attractions)
   print("Updated Itinerary:", updated_itinerary)
   ```  

### بهره‌گیری از آگاهی محیطی و استدلال  
استفاده از طرح‌واره جدول می‌تواند فرآیند تولید پرس‌وجو را با بهره‌گیری از آگاهی محیطی و استدلال بهبود بخشد. در اینجا مثالی از چگونگی انجام این کار آورده شده است:  
۱. **درک طرح‌واره**: سیستم طرح‌واره جدول را درک کرده و از این اطلاعات برای پایه‌گذاری تولید پرس‌وجو استفاده می‌کند.  
۲. **تنظیم بر اساس بازخورد**: سیستم ترجیحات کاربر را بر اساس بازخورد تنظیم کرده و درباره اینکه کدام فیلدها در طرح‌واره باید به‌روزرسانی شوند استدلال می‌کند.  
۳. **تولید و اجرای پرس‌وجوها**: سیستم پرس‌وجوهایی تولید و اجرا می‌کند تا داده‌های به‌روزشده پرواز و هتل را بر اساس ترجیحات جدید دریافت کند.  

مثال کد پایتون به‌روزشده که این مفاهیم را دربرمی‌گیرد:  
```python
def adjust_based_on_feedback(feedback, preferences, schema):
    # Adjust preferences based on user feedback
    if "liked" in feedback:
        preferences["favorites"] = feedback["liked"]
    if "disliked" in feedback:
        preferences["avoid"] = feedback["disliked"]
    # Reasoning based on schema to adjust other related preferences
    for field in schema:
        if field in preferences:
            preferences[field] = adjust_based_on_environment(feedback, field, schema)
    return preferences

def adjust_based_on_environment(feedback, field, schema):
    # Custom logic to adjust preferences based on schema and feedback
    if field in feedback["liked"]:
        return schema[field]["positive_adjustment"]
    elif field in feedback["disliked"]:
        return schema[field]["negative_adjustment"]
    return schema[field]["default"]

def generate_code_to_fetch_data(preferences):
    # Generate code to fetch flight data based on updated preferences
    return f"fetch_flights(preferences={preferences})"

def generate_code_to_fetch_hotels(preferences):
    # Generate code to fetch hotel data based on updated preferences
    return f"fetch_hotels(preferences={preferences})"

def execute_code(code):
    # Simulate execution of code and return mock data
    return {"data": f"Executed: {code}"}

def generate_itinerary(flights, hotels, attractions):
    # Generate itinerary based on flights, hotels, and attractions
    return {"flights": flights, "hotels": hotels, "attractions": attractions}

# Example schema
schema = {
    "favorites": {"positive_adjustment": "increase", "negative_adjustment": "decrease", "default": "neutral"},
    "avoid": {"positive_adjustment": "decrease", "negative_adjustment": "increase", "default": "neutral"}
}

# Example usage
preferences = {"favorites": "sightseeing", "avoid": "crowded places"}
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
updated_preferences = adjust_based_on_feedback(feedback, preferences, schema)

# Regenerate and execute code with updated preferences
updated_flight_code = generate_code_to_fetch_data(updated_preferences)
updated_hotel_code = generate_code_to_fetch_hotels(updated_preferences)

updated_flights = execute_code(updated_flight_code)
updated_hotels = execute_code(updated_hotel_code)

updated_itinerary = generate_itinerary(updated_flights, updated_hotels, feedback["liked"])
print("Updated Itinerary:", updated_itinerary)
```  

#### توضیح  
- رزرو بر اساس بازخورد  
۱. **آگاهی از طرح‌واره**: متد `schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` این تنظیمات را بر اساس طرح‌واره و بازخورد سفارشی می‌کند.  
۴. **تولید و اجرای پرس‌وجوها**: سیستم کد تولید می‌کند تا داده‌های پرواز و هتل به‌روزشده را بر اساس ترجیحات تنظیم‌شده دریافت کند و اجرای این پرس‌وجوها را شبیه‌سازی می‌کند.  
۵. **تولید برنامه سفر**: سیستم برنامه سفر به‌روزشده‌ای بر اساس داده‌های جدید پرواز، هتل و جاذبه‌ها ایجاد می‌کند.  

با مجهز کردن سیستم به آگاهی محیطی و استدلال بر اساس طرح‌واره، می‌توان پرس‌وجوهای دقیق‌تر و مرتبط‌تری تولید کرد که منجر به توصیه‌های سفر بهتر و تجربه کاربری شخصی‌تر می‌شود.  

### استفاده از SQL به عنوان تکنیک تولید-تقویت شده بازیابی (RAG)  
SQL (زبان ساخت‌یافته پرس‌وجو) ابزاری قدرتمند برای تعامل با پایگاه‌های داده است. هنگامی که به عنوان بخشی از رویکرد تولید-تقویت شده بازیابی (RAG) استفاده شود، SQL می‌تواند داده‌های مرتبط را از پایگاه‌های داده بازیابی کند تا پاسخ‌ها یا اقدامات را در عامل‌های هوش مصنوعی اطلاع‌رسانی و تولید نماید. بیایید بررسی کنیم چگونه SQL می‌تواند به عنوان تکنیک RAG در زمینه عامل سفر استفاده شود.  

#### مفاهیم کلیدی  
۱. **تعامل با پایگاه داده**:  
- SQL برای پرس‌وجو از پایگاه‌های داده، بازیابی اطلاعات مرتبط و دستکاری داده‌ها استفاده می‌شود.  
- مثال: بازیابی جزئیات پرواز، اطلاعات هتل و جاذبه‌ها از پایگاه داده سفر.  

۲. **ادغام با RAG**:  
- کوئری‌های SQL بر اساس ورودی و ترجیحات کاربر تولید می‌شوند.  
- داده‌های بازیابی شده برای تولید توصیه‌ها یا اقدامات شخصی‌سازی شده استفاده می‌شوند.  

۳. **تولید پویا پرس‌وجو**:  
- عامل هوش مصنوعی کوئری‌های SQL پویا بر اساس زمینه و نیازهای کاربر تولید می‌کند.  
- مثال: سفارشی‌سازی کوئری‌های SQL برای فیلتر نتایج بر اساس بودجه، تاریخ‌ها و علاقه‌مندی‌ها.  

#### کاربردها  
- **تولید خودکار کد**: تولید قطعه کد برای وظایف خاص.  
- **SQL به عنوان RAG**: استفاده از کوئری‌های SQL برای دستکاری داده‌ها.  
- **حل مسئله**: ایجاد و اجرای کد برای حل مسائل.  

**مثال**: عامل تحلیل داده:  
۱. **وظیفه**: تحلیل یک مجموعه داده برای یافتن روندها.  
۲. **مراحل**:  
- بارگذاری مجموعه داده.  
- تولید کوئری‌های SQL برای فیلتر داده.  
- اجرای کوئری‌ها و بازیابی نتایج.  
- تولید مصورسازی‌ها و بینش‌ها.  
۳. **منابع**: دسترسی به مجموعه داده، قابلیت‌های SQL.  
۴. **تجربه**: استفاده از نتایج گذشته برای بهبود تحلیل‌های آینده.  

#### مثال عملی: استفاده از SQL در عامل سفر  
۱. **جمع‌آوری ترجیحات کاربر**  
```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
۲. **تولید کوئری‌های SQL**  
```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
۳. **اجرای کوئری‌های SQL**  
```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
۴. **تولید توصیه‌ها**  
```python
   def generate_recommendations(preferences):
       flight_query = generate_sql_query("flights", preferences)
       hotel_query = generate_sql_query("hotels", preferences)
       attraction_query = generate_sql_query("attractions", preferences)
       
       flights = execute_sql_query(flight_query)
       hotels = execute_sql_query(hotel_query)
       attractions = execute_sql_query(attraction_query)
       
       itinerary = {
           "flights": flights,
           "hotels": hotels,
           "attractions": attractions
       }
       return itinerary

   travel_agent = Travel_Agent()
   preferences = {
       "destination": "Paris",
       "dates": "2025-04-01 to 2025-04-10",
       "budget": "moderate",
       "interests": ["museums", "cuisine"]
   }
   travel_agent.gather_preferences(preferences)
   itinerary = generate_recommendations(preferences)
   print("Suggested Itinerary:", itinerary)
   ```  

#### مثال کوئری‌های SQL  
۱. **کوئری پرواز**  
```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
۲. **کوئری هتل**  
```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
۳. **کوئری جاذبه‌ها**  
```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

با بهره‌گیری از SQL به عنوان بخشی از تکنیک تولید-تقویت شده بازیابی (RAG)، عامل‌های هوش مصنوعی مانند عامل سفر می‌توانند به صورت پویا داده‌های مرتبط را بازیابی و استفاده کنند تا توصیه‌های دقیق و شخصی‌سازی شده ارائه دهند.  

### مثال متاکاگنیشن  
برای نشان دادن پیاده‌سازی متاکاگنیشن، بیایید یک عامل ساده ایجاد کنیم که *بر فرآیند تصمیم‌گیری خود تأمل می‌کند* هنگام حل یک مسئله. در این مثال، سیستمی می‌سازیم که عامل تلاش می‌کند انتخاب هتل را بهینه کند، اما سپس استدلال خود را ارزیابی کرده و استراتژی خود را وقتی اشتباه یا انتخاب بهینه انجام نمی‌دهد، تنظیم می‌کند. این را با یک مثال ساده شبیه‌سازی می‌کنیم که عامل هتل‌ها را بر اساس ترکیبی از قیمت و کیفیت انتخاب می‌کند، اما روی تصمیماتش "تأمل" می‌کند و مطابق آن تنظیم می‌کند.  

#### این چگونه متاکاگنیشن را نشان می‌دهد:  
۱. **تصمیم اولیه**: عامل ارزان‌ترین هتل را انتخاب می‌کند، بدون درک تأثیر کیفیت.  
۲. **تأمل و ارزیابی**: پس از انتخاب اولیه، عامل بررسی می‌کند آیا هتل انتخاب شده "بد" است با استفاده از بازخورد کاربر. اگر کیفیت هتل خیلی پایین باشد، روی استدلال خود تأمل می‌کند.  
۳. **تنظیم استراتژی**: عامل استراتژی خود را بر اساس تأمل تنظیم می‌کند و از "ارزان‌ترین" به "بالاترین کیفیت" تغییر می‌دهد و بدین ترتیب فرآیند تصمیم‌گیری خود را در تکرارهای آینده بهبود می‌بخشد.  

در اینجا یک مثال آورده شده است:  
```python
class HotelRecommendationAgent:
    def __init__(self):
        self.previous_choices = []  # Stores the hotels chosen previously
        self.corrected_choices = []  # Stores the corrected choices
        self.recommendation_strategies = ['cheapest', 'highest_quality']  # Available strategies

    def recommend_hotel(self, hotels, strategy):
        """
        Recommend a hotel based on the chosen strategy.
        The strategy can either be 'cheapest' or 'highest_quality'.
        """
        if strategy == 'cheapest':
            recommended = min(hotels, key=lambda x: x['price'])
        elif strategy == 'highest_quality':
            recommended = max(hotels, key=lambda x: x['quality'])
        else:
            recommended = None
        self.previous_choices.append((strategy, recommended))
        return recommended

    def reflect_on_choice(self):
        """
        Reflect on the last choice made and decide if the agent should adjust its strategy.
        The agent considers if the previous choice led to a poor outcome.
        """
        if not self.previous_choices:
            return "No choices made yet."

        last_choice_strategy, last_choice = self.previous_choices[-1]
        # Let's assume we have some user feedback that tells us whether the last choice was good or not
        user_feedback = self.get_user_feedback(last_choice)

        if user_feedback == "bad":
            # Adjust strategy if the previous choice was unsatisfactory
            new_strategy = 'highest_quality' if last_choice_strategy == 'cheapest' else 'cheapest'
            self.corrected_choices.append((new_strategy, last_choice))
            return f"Reflecting on choice. Adjusting strategy to {new_strategy}."
        else:
            return "The choice was good. No need to adjust."

    def get_user_feedback(self, hotel):
        """
        Simulate user feedback based on hotel attributes.
        For simplicity, assume if the hotel is too cheap, the feedback is "bad".
        If the hotel has quality less than 7, feedback is "bad".
        """
        if hotel['price'] < 100 or hotel['quality'] < 7:
            return "bad"
        return "good"

# Simulate a list of hotels (price and quality)
hotels = [
    {'name': 'Budget Inn', 'price': 80, 'quality': 6},
    {'name': 'Comfort Suites', 'price': 120, 'quality': 8},
    {'name': 'Luxury Stay', 'price': 200, 'quality': 9}
]

# Create an agent
agent = HotelRecommendationAgent()

# Step 1: The agent recommends a hotel using the "cheapest" strategy
recommended_hotel = agent.recommend_hotel(hotels, 'cheapest')
print(f"Recommended hotel (cheapest): {recommended_hotel['name']}")

# Step 2: The agent reflects on the choice and adjusts strategy if necessary
reflection_result = agent.reflect_on_choice()
print(reflection_result)

# Step 3: The agent recommends again, this time using the adjusted strategy
adjusted_recommendation = agent.recommend_hotel(hotels, 'highest_quality')
print(f"Adjusted hotel recommendation (highest_quality): {adjusted_recommendation['name']}")
```  

#### توانایی‌های متاکاگنیشن عامل‌ها  
نکته کلیدی توانایی عامل در:  
- ارزیابی انتخاب‌ها و فرآیند تصمیم‌گیری قبلی خود.  
- تنظیم استراتژی بر اساس آن تأمل، یعنی متاکاگنیشن در عمل.  

این شکلی ساده از متاکاگنیشن است که سیستم قادر است فرآیند استدلال خود را بر اساس بازخورد داخلی تنظیم کند.  

### نتیجه‌گیری  
متاکاگنیشن ابزاری قدرتمند است که می‌تواند توانایی‌های عامل‌های هوش مصنوعی را به طور قابل توجهی افزایش دهد. با ادغام متاکاگنیشن...
فرآیندها، شما می‌توانید عامل‌هایی طراحی کنید که هوشمندتر، سازگارتر و کارآمدتر باشند. از منابع اضافی برای کاوش بیشتر در دنیای جذاب فراشناخت در عامل‌های هوش مصنوعی استفاده کنید.  
## درس قبلی  
[الگوی طراحی چندعاملی](../08-multi-agent/README.md)  
## درس بعدی  
[عامل‌های هوش مصنوعی در تولید](../10-ai-agents-production/README.md)

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نواقصی باشند. سند اصلی به زبان بومی خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئول هیچ گونه سوءتفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، نیستیم.