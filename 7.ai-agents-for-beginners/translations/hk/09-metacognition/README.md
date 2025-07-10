<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T07:41:24+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "hk"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.hk.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(撳上面張相睇本課堂嘅影片)_
# AI Agents 嘅元認知
## 簡介
歡迎嚟到 AI agents 嘅元認知課堂！呢章專為初學者而設，解釋點樣 AI agents 可以思考自己嘅思考過程。完成呢課，你會了解啲重要概念，仲會有實際例子教你點樣喺 AI agent 設計中應用元認知。

## 學習目標
完成呢課後，你可以做到：
1. 明白 agent 定義入面推理循環嘅影響。
2. 用計劃同評估技巧幫助 agent 自我修正。
3. 自己建立能夠操控代碼完成任務嘅 agents。

## 元認知簡介
元認知指嘅係一種高階認知過程，係關於思考自己嘅思考。對 AI agents 嚟講，即係能夠根據自我覺察同過往經驗去評估同調整行動。元認知，或者叫「諗自己諗緊乜」，係 agent AI 系統發展嘅重要概念。佢涉及 AI 系統對自己內部過程有覺察，並能夠監控、調節同適應自己嘅行為。就好似我哋讀氣氛或者分析問題一樣。呢種自我覺察可以幫助 AI 系統做出更好嘅決策，識別錯誤，並隨時間提升表現——同時亦同圖靈測試同 AI 會否接管世界嘅討論有關。

喺 agent AI 系統嘅範疇，元認知可以幫助處理幾個挑戰，例如：
- 透明度：確保 AI 系統可以解釋佢嘅推理同決策。
- 推理能力：提升 AI 系統整合資訊同作出合理決定嘅能力。
- 適應性：令 AI 系統可以適應新環境同變化條件。
- 感知力：改善 AI 系統喺識別同解讀環境數據嘅準確度。

### 乜嘢係元認知？
元認知，或者叫「諗自己諗緊乜」，係一種高階認知過程，包含自我覺察同自我調節認知過程。喺 AI 領域，元認知令 agents 能夠評估同調整佢哋嘅策略同行動，從而提升解難同決策能力。理解元認知後，你可以設計出唔單止更智能，仲更靈活同高效嘅 AI agents。

真正嘅元認知會見到 AI 明確咁推理自己嘅推理過程。例如：「我優先揀咗平啲嘅機票，因為……但可能會錯過直航，所以我再檢查多次。」追蹤點解佢揀咗某條路線。
- 注意到因為過份依賴上次用戶喜好而犯錯，所以佢唔只改最終建議，仲改決策策略。
- 分析模式，例如：「每次用戶講‘太多人’，我唔只要移除某啲景點，仲要反思我揀‘熱門景點’嘅方法有問題，因為我成日用人氣排序。」

### 元認知喺 AI Agents 嘅重要性
元認知喺 AI agent 設計中好重要，原因包括：
![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.hk.png)
- 自我反思：agents 可以評估自己表現，識別改進位。
- 適應性：agents 可以根據過往經驗同環境變化調整策略。
- 錯誤修正：agents 可以自主檢測同修正錯誤，令結果更準確。
- 資源管理：agents 可以透過計劃同評估優化資源使用，例如時間同計算能力。

## AI Agent 嘅組成部分
喺深入元認知之前，要先了解 AI agent 嘅基本組成。AI agent 通常包括：
- Persona：agent 嘅性格同特質，決定佢點同用戶互動。
- Tools：agent 可以執行嘅功能同能力。
- Skills：agent 擁有嘅知識同專長。

呢啲組成部分合作，打造一個能完成特定任務嘅「專業單位」。

**例子**：諗下旅行代理，呢啲 agent 唔單止幫你計劃假期，仲會根據實時數據同過往旅客經驗調整行程。

### 例子：旅行代理服務入面嘅元認知
假設你設計咗一個由 AI 支援嘅旅行代理服務。呢個 agent「Travel Agent」幫用戶計劃假期。要加入元認知，Travel Agent 需要根據自我覺察同過往經驗評估同調整行動。元認知可以點幫手呢？

#### 目前任務
協助用戶計劃去巴黎嘅旅程。

#### 完成任務嘅步驟
1. **收集用戶喜好**：問用戶旅行日期、預算、興趣（如博物館、美食、購物）同特別要求。
2. **搜尋資料**：搵符合用戶喜好嘅機票、住宿、景點同餐廳。
3. **產生建議**：提供個人化行程，包括機票詳情、酒店預訂同建議活動。
4. **根據反饋調整**：問用戶對建議嘅意見，再做必要調整。

#### 所需資源
- 機票同酒店預訂數據庫嘅存取權。
- 巴黎景點同餐廳資料。
- 過往用戶互動嘅反饋數據。

#### 經驗同自我反思
Travel Agent 用元認知去評估表現同學習過去經驗。例如：
1. **分析用戶反饋**：檢視邊啲建議受歡迎，邊啲唔係，並相應調整未來建議。
2. **適應性**：如果用戶之前講過唔鍾意人多，Travel Agent 未來會避開繁忙旅遊熱點。
3. **錯誤修正**：如果以前訂錯酒店（例如訂到爆滿），就學識喺建議前更仔細檢查房間供應。

#### 實用開發者例子
以下係簡化版 Travel Agent 代碼，展示點樣加入元認知：  
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

#### 點解元認知重要
- **自我反思**：agents 可以分析自己表現，找出改進空間。
- **適應性**：agents 可以根據反饋同環境變化調整策略。
- **錯誤修正**：agents 可以自主偵測同修正錯誤。
- **資源管理**：agents 可以優化時間同計算資源嘅使用。

透過元認知，Travel Agent 可以提供更個人化同準確嘅旅遊建議，提升整體用戶體驗。

---

## 2. Agents 嘅計劃制定
計劃係 AI agent 行為嘅關鍵組成部分。佢涉及列出達成目標嘅步驟，考慮現時狀態、資源同可能嘅障礙。

### 計劃嘅元素
- **目前任務**：清楚定義任務。
- **完成任務嘅步驟**：將任務拆分成易管理嘅步驟。
- **所需資源**：識別必要資源。
- **經驗**：利用過往經驗輔助計劃。

**例子**：Travel Agent 協助用戶計劃旅程需要做嘅步驟：

### Travel Agent 嘅步驟
1. **收集用戶喜好**  
   - 問用戶旅行日期、預算、興趣同特別要求。  
   - 例子：「你幾時想出發？」、「你預算係幾多？」、「假期鍾意做啲乜？」  
2. **搜尋資料**  
   - 根據用戶喜好搵合適嘅旅行選項。  
   - **機票**：搵符合預算同日期嘅航班。  
   - **住宿**：搵符合地點、價格同設施嘅酒店或出租物業。  
   - **景點同餐廳**：揀符合用戶興趣嘅熱門景點、活動同餐廳。  
3. **產生建議**  
   - 將搵到嘅資料整理成個人化行程。  
   - 提供航班詳情、酒店預訂同建議活動，確保符合用戶喜好。  
4. **向用戶展示行程**  
   - 同用戶分享建議行程，等佢哋檢視。  
   - 例子：「呢個係你去巴黎嘅建議行程，包括航班、酒店預訂同推薦活動同餐廳，你覺得點？」  
5. **收集反饋**  
   - 問用戶對建議嘅意見。  
   - 例子：「你鍾意呢啲航班選擇嗎？」、「酒店合適嗎？」、「想加或者減啲乜活動？」  
6. **根據反饋調整**  
   - 根據用戶意見修改行程。  
   - 調整航班、住宿同活動建議，更貼合用戶需要。  
7. **最終確認**  
   - 將更新後嘅行程交用戶確認。  
   - 例子：「我根據你嘅意見做咗修改，呢個係最新行程，你睇下有冇問題？」  
8. **預訂同確認**  
   - 用戶確認後，進行機票、住宿同預先安排活動嘅預訂。  
   - 將確認資料發畀用戶。  
9. **持續支援**  
   - 旅程前後繼續提供協助，應付任何變更或額外要求。  
   - 例子：「如果旅程中有咩需要，隨時搵我！」  

### 互動例子  
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

## 3. 修正型 RAG 系統
首先我哋要理解 RAG 工具同預先加載上下文嘅分別  
![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.hk.png)

### 檢索增強生成（RAG）
RAG 將檢索系統同生成模型結合。當有查詢時，檢索系統會從外部來源搵相關文件或數據，再用呢啲資訊加強生成模型嘅輸入。咁樣可以令模型產生更準確、貼合上下文嘅回應。

喺 RAG 系統入面，agent 會從知識庫檢索相關資訊，用嚟生成合適嘅回應或行動。

### 修正型 RAG 方法
修正型 RAG 着重用 RAG 技術去修正錯誤，提升 AI agents 嘅準確度。呢個方法包括：
1. **提示技術**：用特定提示引導 agent 檢索相關資訊。
2. **工具**：實施算法同機制，令 agent 能評估檢索到資訊嘅相關性，並產生準確回應。
3. **評估**：持續評估 agent 表現，並作出調整，提升準確性同效率。
例如：搜尋代理中的糾正型RAG  
設想一個搜尋代理，從網絡檢索資訊以回答用戶查詢。糾正型RAG方法可能包括：  
1. **提示技術**：根據用戶輸入制定搜尋查詢。  
2. **工具**：使用自然語言處理和機器學習算法對搜尋結果進行排名和篩選。  
3. **評估**：分析用戶反饋，識別並糾正檢索資訊中的錯誤。  

### 旅遊代理中的糾正型RAG  
糾正型RAG（Retrieval-Augmented Generation，檢索增強生成）提升AI檢索及生成資訊的能力，同時糾正任何錯誤。讓我們看看旅遊代理如何利用糾正型RAG方法，提供更準確及相關的旅遊建議。這包括：  
- **提示技術**：使用特定提示引導代理檢索相關資訊。  
- **工具**：實施算法及機制，使代理能評估檢索資訊的相關性並生成準確回應。  
- **評估**：持續評估代理表現，並作出調整以提升準確度及效率。  

#### 在旅遊代理中實施糾正型RAG的步驟  
1. **初步用戶互動**  
- 旅遊代理收集用戶的初步偏好，如目的地、旅行日期、預算及興趣。  
- 範例：```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  
2. **資訊檢索**  
- 旅遊代理根據用戶偏好檢索航班、住宿、景點及餐廳資訊。  
- 範例：```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  
3. **生成初步建議**  
- 旅遊代理使用檢索到的資訊生成個人化行程。  
- 範例：```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  
4. **收集用戶反饋**  
- 旅遊代理向用戶收集對初步建議的反饋。  
- 範例：```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  
5. **糾正型RAG流程**  
- **提示技術**：旅遊代理根據用戶反饋制定新的搜尋查詢。  
- 範例：```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **工具**：旅遊代理使用算法對新的搜尋結果進行排名和篩選，重點強調基於用戶反饋的相關性。  
- 範例：```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **評估**：旅遊代理持續分析用戶反饋，評估建議的相關性和準確性，並作出必要調整。  
- 範例：```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### 實際範例  
以下是一個簡化的Python代碼範例，展示如何在旅遊代理中整合糾正型RAG方法：  
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

### 預先載入上下文  
預先載入上下文指在處理查詢前，先將相關背景資訊載入模型。這讓模型從一開始便能訪問這些資訊，有助於生成更具資訊性的回應，無需在過程中再檢索額外資料。以下是一個旅遊代理應用中，預先載入上下文的簡化Python範例：  
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

#### 解釋  
1. **初始化（`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info` 方法）**：該方法從預先載入的上下文字典中獲取相關資訊。透過預先載入上下文，旅遊代理應用能快速回應用戶查詢，無需實時從外部來源檢索資訊，提升應用效率與響應速度。  

### 在迭代前以目標引導計劃啟動  
以目標引導計劃啟動指從一開始就設定清晰的目標或期望結果。透過預先定義該目標，模型可在整個迭代過程中以此作為指導原則。這有助確保每次迭代均朝著實現目標前進，使過程更有效率及聚焦。以下為在旅遊代理中，於迭代前以目標引導旅遊計劃的範例：  

### 情境  
旅遊代理想為客戶規劃一個客製化假期。目標是根據客戶的偏好及預算，創造一個最大化客戶滿意度的旅遊行程。  

### 步驟  
1. 定義客戶偏好及預算。  
2. 根據這些偏好啟動初步計劃。  
3. 透過迭代優化計劃，提升客戶滿意度。  

#### Python代碼  
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

#### 代碼解釋  
1. **初始化（`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost` 方法）**：此方法計算當前計劃的總成本，包括潛在的新目的地。  

#### 範例使用  
- **初步計劃**：旅遊代理根據客戶對觀光的偏好及2000美元預算制定初步計劃。  
- **優化計劃**：旅遊代理透過迭代優化計劃，兼顧客戶偏好與預算。  
透過以明確目標（例如最大化客戶滿意度）啟動計劃，並迭代優化，旅遊代理能為客戶創造客製化且優化的旅遊行程。此方法確保旅遊計劃從一開始就符合客戶偏好及預算，並隨著每次迭代不斷改進。  

### 利用大型語言模型（LLM）進行重排序與評分  
大型語言模型（LLM）可用於重排序及評分，透過評估檢索到的文件或生成回應的相關性及質量來實現。流程如下：  
**檢索**：初步檢索階段根據查詢獲取候選文件或回應。  
**重排序**：LLM評估這些候選項，根據相關性及質量重新排序。此步驟確保最相關及高質量的資訊優先呈現。  
**評分**：LLM為每個候選項賦予分數，反映其相關性及質量，有助於選擇最佳回應或文件給用戶。  
透過利用LLM進行重排序及評分，系統能提供更準確且語境相關的資訊，提升整體用戶體驗。以下為旅遊代理如何利用LLM根據用戶偏好重排序及評分旅遊目的地的Python範例：  

#### 情境 - 根據偏好旅遊  
旅遊代理想根據客戶偏好推薦最佳旅遊目的地。LLM將協助重排序及評分，確保呈現最相關選項。  

#### 步驟：  
1. 收集用戶偏好。  
2. 檢索潛在旅遊目的地列表。  
3. 使用LLM根據用戶偏好重排序及評分目的地。  

以下示範如何更新前述範例以使用Azure OpenAI服務：  

#### 要求  
1. 需擁有Azure訂閱。  
2. 建立Azure OpenAI資源並取得API金鑰。  

#### Python範例代碼  
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

#### 代碼解釋 - 偏好預訂器  
1. **初始化**：`TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` 替換為您Azure OpenAI部署的實際端點URL。  
透過利用LLM進行重排序及評分，旅遊代理能為客戶提供更個人化及相關的旅遊建議，提升整體體驗。  

### RAG：提示技術 vs 工具  
檢索增強生成（RAG）既可作為提示技術，也可作為工具，用於AI代理開發。理解兩者區別有助於更有效利用RAG於項目中。  

#### 作為提示技術的RAG  
**是什麼？**  
- 作為提示技術，RAG涉及制定具體查詢或提示，引導從大型語料庫或資料庫中檢索相關資訊。這些資訊隨後用於生成回應或行動。  
**如何運作：**  
1. **制定提示**：根據任務或用戶輸入創建結構良好的提示或查詢。  
2. **檢索資訊**：使用提示從預先存在的知識庫或數據集中搜尋相關資料。  
3. **生成回應**：結合檢索資訊與生成式AI模型，產出全面且連貫的回應。  
**旅遊代理範例**：  
- 用戶輸入：「我想參觀巴黎的博物館。」  
- 提示：「尋找巴黎的頂級博物館。」  
- 檢索資訊：羅浮宮、奧賽博物館等詳情。  
- 生成回應：「這裡有一些巴黎的頂級博物館：羅浮宮、奧賽博物館及龐畢度中心。」  

#### 作為工具的RAG  
**是什麼？**  
- 作為工具，RAG是一個整合系統，自動化檢索與生成流程，使開發者無需為每個查詢手動製作提示，即可實現複雜AI功能。  
**如何運作：**  
1. **整合**：將RAG嵌入AI代理架構，自動處理檢索及生成任務。  
2. **自動化**：工具管理整個流程，從接收用戶輸入到生成最終回應，無需每步明確提示。  
3. **效率**：通過精簡檢索與生成流程，提升代理性能，實現更快且更準確的回應。  
**旅遊代理範例**：  
- 用戶輸入：「我想參觀巴黎的博物館。」  
- RAG工具：自動檢索博物館資訊並生成回應。  
- 生成回應：「這裡有一些巴黎的頂級博物館：羅浮宮、奧賽博物館及龐畢度中心。」  

### 比較  
| 方面             | 提示技術                          | 工具                               |  
|------------------|---------------------------------|----------------------------------|  
| **手動 vs 自動**  | 每個查詢手動製作提示             | 檢索與生成過程自動化               |  
| **控制**         | 提供更多檢索過程控制             | 精簡並自動化檢索與生成             |  
| **彈性**         | 可根據特定需求自定義提示         | 更適合大規模實施                   |  
| **複雜度**       | 需製作及調整提示                 | 更易整合於AI代理架構               |  

### 實際範例  
**提示技術範例：** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**工具範例：** ```python
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

### 評估相關性  
評估相關性是AI代理表現的關鍵，確保代理檢索及生成的資訊對用戶而言適當、準確且有用。讓我們探討如何評估AI代理的相關性，包括實用範例及技術。  

#### 評估相關性的關鍵概念  
1. **語境意識**：  
- 代理必須理解用戶查詢的語境，以檢索及生成相關資訊。  
- 範例：用戶查詢「巴黎最佳餐廳」，代理應考慮用戶的偏好，如菜系類型及預算。  
2. **準確性**：  
- 代理提供的資訊應該是事實正確及最新的。  
- 範例：推薦目前營業且評價良好的餐廳，而非過時或已關閉的選項。  
3. **用戶意圖**：
代理應該推斷用戶在查詢背後的意圖，以提供最相關的資訊。  
- 例子：如果用戶查詢「平價酒店」，代理應優先考慮經濟實惠的選項。  

4. **反饋循環**：  
- 持續收集和分析用戶反饋有助於代理優化其相關性評估過程。  
- 例子：將用戶對之前推薦的評分和反饋納入，以改進未來的回應。  

#### 評估相關性的實用技巧  
1. **相關性評分**：  
- 根據每個檢索項目與用戶查詢及偏好的匹配程度，分配相關性分數。  
- 例子：```python
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

2. **篩選和排序**：  
- 篩除不相關項目，並根據相關性分數對剩餘項目進行排序。  
- 例子：```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

3. **自然語言處理 (NLP)**：  
- 利用NLP技術理解用戶查詢並檢索相關資訊。  
- 例子：```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

4. **用戶反饋整合**：  
- 收集用戶對提供推薦的反饋，並用以調整未來的相關性評估。  
- 例子：```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### 例子：在旅遊代理中評估相關性  
以下是一個旅遊代理如何評估旅遊推薦相關性的實用例子：  
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

### 帶著意圖的搜尋  
帶著意圖搜尋意味著理解和詮釋用戶查詢背後的根本目的或目標，以檢索和生成最相關及有用的資訊。此方法超越了單純關鍵字匹配，重點在於掌握用戶的實際需求和上下文。  

#### 帶著意圖搜尋的關鍵概念  
1. **理解用戶意圖**：  
- 用戶意圖可分為三大類：資訊型、導航型和交易型。  
- **資訊型意圖**：用戶尋求某主題的資訊（例如：「巴黎最佳博物館有哪些？」）。  
- **導航型意圖**：用戶想要導航到特定網站或頁面（例如：「羅浮宮官方網站」）。  
- **交易型意圖**：用戶目標是完成交易，如訂機票或購物（例如：「訂飛巴黎的機票」）。  

2. **上下文意識**：  
- 分析用戶查詢的上下文有助於準確識別其意圖，包括考慮先前互動、用戶偏好及當前查詢的具體細節。  

3. **自然語言處理 (NLP)**：  
- 利用NLP技術理解和詮釋用戶的自然語言查詢，包含實體識別、情感分析及查詢解析等任務。  

4. **個人化**：  
- 根據用戶歷史、偏好及反饋個人化搜尋結果，提高資訊的相關性。  

#### 實用範例：在旅遊代理中帶著意圖搜尋  
以旅遊代理為例，看看如何實現帶著意圖的搜尋。  
1. **收集用戶偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **理解用戶意圖** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **上下文意識** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
4. **搜尋並個人化結果** ```python
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
5. **使用範例** ```python
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

## 4. 以工具形式生成代碼  
代碼生成代理使用AI模型撰寫及執行代碼，解決複雜問題並自動化任務。  

### 代碼生成代理  
代碼生成代理利用生成式AI模型撰寫並執行代碼，能解決複雜問題、自動化任務，並通過生成及運行各種程式語言的代碼，提供有價值的見解。  

#### 實用應用  
1. **自動化代碼生成**：為特定任務生成代碼片段，如數據分析、網頁爬蟲或機器學習。  
2. **將SQL用作RAG**：使用SQL查詢從數據庫檢索及操作數據。  
3. **問題解決**：創建並執行代碼以解決特定問題，如優化算法或分析數據。  

#### 例子：數據分析的代碼生成代理  
假設你設計一個代碼生成代理，運作流程如下：  
1. **任務**：分析數據集以識別趨勢和模式。  
2. **步驟**：  
- 將數據集載入數據分析工具。  
- 生成SQL查詢以篩選和匯總數據。  
- 執行查詢並獲取結果。  
- 利用結果生成視覺化和見解。  
3. **所需資源**：數據集存取權限、數據分析工具及SQL能力。  
4. **經驗**：利用過往分析結果提升未來分析的準確性和相關性。  

### 旅遊代理的代碼生成代理範例  
本例設計一個代碼生成代理「旅遊代理」，協助用戶規劃旅行，通過生成和執行代碼完成任務。此代理可處理如獲取旅遊選項、篩選結果及編輯行程等工作，利用生成式AI。  

#### 代碼生成代理概覽  
1. **收集用戶偏好**：收集目的地、旅行日期、預算及興趣等輸入。  
2. **生成獲取數據的代碼**：生成代碼片段以檢索航班、酒店和景點資訊。  
3. **執行生成的代碼**：運行生成代碼以獲取即時資訊。  
4. **生成行程**：將獲取的數據編輯成個人化旅行計劃。  
5. **根據反饋調整**：接收用戶反饋，必要時重新生成代碼以優化結果。  

#### 逐步實現  
1. **收集用戶偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **生成獲取數據的代碼** ```python
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
3. **執行生成的代碼** ```python
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
4. **生成行程** ```python
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
5. **根據反饋調整** ```python
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

### 利用環境意識與推理  
基於表格的結構確實可以通過利用環境意識與推理來增強查詢生成過程。實例如下：  
1. **理解結構**：系統理解表格結構，並用此資訊作為查詢生成的基礎。  
2. **根據反饋調整**：系統根據反饋調整用戶偏好，並推理哪些結構欄位需要更新。  
3. **生成及執行查詢**：系統生成並執行查詢，根據新偏好獲取更新的航班及酒店數據。  

以下是結合上述概念的更新Python代碼範例：  
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

#### 解說 - 根據反饋訂票  
1. **結構意識**：`schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` 方法）  
此方法根據結構和反饋定制調整。  
4. **生成及執行查詢**：系統生成代碼以根據調整後的偏好獲取更新的航班和酒店數據，並模擬執行這些查詢。  
5. **生成行程**：系統根據新航班、酒店和景點數據生成更新的行程。  

通過使系統具備環境意識並基於結構進行推理，能生成更準確且相關的查詢，帶來更佳的旅遊推薦及更個人化的用戶體驗。  

### 使用SQL作為檢索增強生成（RAG）技術  
SQL（結構化查詢語言）是與數據庫互動的強大工具。作為檢索增強生成（RAG）方法的一部分，SQL可用於從數據庫檢索相關數據，為AI代理提供資訊支持並生成回應或行動。  

讓我們探討SQL在旅遊代理中的RAG技術應用。  

#### 關鍵概念  
1. **數據庫互動**：  
- 使用SQL查詢數據庫，檢索相關資訊及操作數據。  
- 例子：從旅遊數據庫抓取航班詳情、酒店資訊及景點資料。  

2. **與RAG整合**：  
- 根據用戶輸入和偏好生成SQL查詢。  
- 檢索到的數據用於生成個人化推薦或行動。  

3. **動態查詢生成**：  
- AI代理根據上下文和用戶需求生成動態SQL查詢。  
- 例子：根據預算、日期及興趣自訂SQL查詢以篩選結果。  

#### 應用  
- **自動化代碼生成**：生成特定任務的代碼片段。  
- **SQL作為RAG**：使用SQL查詢操作數據。  
- **問題解決**：創建並執行代碼解決問題。  

**例子**：數據分析代理  
1. **任務**：分析數據集以尋找趨勢。  
2. **步驟**：  
- 載入數據集。  
- 生成SQL查詢篩選數據。  
- 執行查詢並檢索結果。  
- 生成視覺化及見解。  
3. **資源**：數據集存取、SQL能力。  
4. **經驗**：利用過往結果改進未來分析。  

#### 實用範例：旅遊代理中使用SQL  
1. **收集用戶偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **生成SQL查詢** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
3. **執行SQL查詢** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
4. **生成推薦** ```python
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

#### SQL查詢範例  
1. **航班查詢** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
2. **酒店查詢** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **景點查詢** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

透過將SQL作為檢索增強生成（RAG）技術的一部分，像旅遊代理這樣的AI代理能動態檢索並利用相關數據，提供準確且個人化的推薦。  

### 元認知範例  
為展示元認知的實現，我們創建一個簡單代理，在解決問題時*反思其決策過程*。本例中，代理嘗試優化酒店選擇，並在犯錯或選擇不佳時評估自身推理並調整策略。我們模擬一個簡單例子，代理根據價格和品質組合選擇酒店，但會「反思」決策並相應調整。  

#### 元認知示例說明：  
1. **初始決策**：代理選擇最便宜酒店，未考慮品質影響。  
2. **反思與評估**：初次選擇後，代理利用用戶反饋檢查酒店是否為「差」選擇，若品質過低，則反思其推理。  
3. **調整策略**：代理根據反思調整策略，從「最便宜」切換至「最高品質」，提升未來決策過程。  

範例如下：  
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

#### 代理的元認知能力  
關鍵在於代理能：  
- 評估先前的選擇及決策過程。  
- 根據反思調整策略，即元認知的實踐。  

這是一種簡單的元認知形式，系統能根據內部反饋調整推理過程。  

### 結論  
元認知是一種強大工具，能顯著提升AI代理的能力。透過結合元認知...
processes，你可以設計更智能、更具適應性及更高效的代理。利用額外資源進一步探索AI代理中元認知的迷人世界。  
## 上一課  
[多代理設計模式](../08-multi-agent/README.md)  
## 下一課  
[生產環境中的AI代理](../10-ai-agents-production/README.md)

**免責聲明**：  
本文件係用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我哋努力確保準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原文文件嘅母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我哋對因使用此翻譯而引致嘅任何誤解或誤釋概不負責。