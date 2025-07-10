<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T07:30:19+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "tw"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.tw.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(點擊上方圖片觀看本課程影片)_
# AI 代理人的元認知
## 介紹
歡迎來到 AI 代理人元認知的課程！本章節專為對 AI 代理人如何反思自身思考過程感興趣的初學者設計。課程結束後，你將理解關鍵概念，並掌握實務範例，能夠將元認知應用於 AI 代理人設計。

## 學習目標
完成本課程後，你將能夠：
1. 了解代理人定義中推理迴圈的影響。
2. 運用規劃與評估技巧協助具自我修正能力的代理人。
3. 創建能操作程式碼以完成任務的代理人。

## 元認知簡介
元認知指的是對自己思考過程的高階認知活動。對 AI 代理人來說，這代表能根據自我覺察與過往經驗評估並調整行動。元認知，也就是「思考自己的思考」，是發展具代理性 AI 系統的重要概念。它讓 AI 系統能察覺自身內部流程，並監控、調節與適應行為。

就像我們在觀察現場氣氛或分析問題時一樣，這種自我覺察能幫助 AI 系統做出更好的決策、識別錯誤，並隨著時間提升效能——這也與圖靈測試及 AI 是否會取代人類的討論有關。

在具代理性的 AI 系統中，元認知能協助解決多項挑戰，例如：
- 透明度：確保 AI 系統能說明其推理與決策過程。
- 推理能力：強化 AI 系統整合資訊並做出合理決策的能力。
- 適應性：讓 AI 系統能調整以因應新環境與變化條件。
- 感知力：提升 AI 系統辨識與解讀環境資料的準確性。

### 什麼是元認知？
元認知，或稱「思考自己的思考」，是一種包含自我覺察與自我調節的高階認知過程。在 AI 領域，元認知使代理人能評估並調整策略與行動，從而提升問題解決與決策能力。理解元認知後，你能設計出更聰明、更具適應力且更有效率的 AI 代理人。

真正的元認知會讓 AI 明確地反思自己的推理過程。範例：「我優先選擇較便宜的航班，因為…但可能錯過直飛航班，讓我再確認一次。」持續追蹤選擇某路線的原因或方式。
- 注意到因過度依賴上次使用者偏好而犯錯，進而不僅修改最終建議，也調整決策策略。
- 辨識出模式，例如：「每次看到使用者提到‘太擁擠’，我不只移除某些景點，也反思若我總是以人氣排序‘熱門景點’的方式有問題。」

### 元認知在 AI 代理人的重要性
元認知在 AI 代理人設計中扮演關鍵角色，原因如下：

![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.tw.png)

- 自我反思：代理人能評估自身表現並找出改進空間。
- 適應性：代理人能根據過去經驗與環境變化調整策略。
- 錯誤修正：代理人能自主偵測並修正錯誤，提高結果準確度。
- 資源管理：代理人能透過規劃與評估，優化時間與計算資源使用。

## AI 代理人的組成部分
在深入元認知流程前，先了解 AI 代理人的基本組成。AI 代理人通常包含：
- Persona：代理人的個性與特質，定義其與使用者互動方式。
- Tools：代理人能執行的功能與能力。
- Skills：代理人擁有的知識與專業技能。

這些組件協同運作，形成能執行特定任務的「專業單元」。

**範例**：想像一個旅行代理人，不僅規劃假期，還能根據即時資料與過往旅客經驗調整行程。

### 範例：旅行代理人服務中的元認知
假設你正在設計一個由 AI 支援的旅行代理人服務。這個代理人「Travel Agent」協助使用者規劃假期。為了加入元認知，Travel Agent 需要根據自我覺察與過往經驗評估並調整行動。以下是元認知可能的運作方式：

#### 當前任務
協助使用者規劃巴黎之旅。

#### 完成任務的步驟
1. **收集使用者偏好**：詢問使用者旅遊日期、預算、興趣（如博物館、美食、購物）及其他需求。
2. **搜尋資訊**：尋找符合使用者偏好的航班、住宿、景點與餐廳。
3. **產生建議**：提供個人化行程，包括航班細節、飯店預訂及推薦活動。
4. **根據回饋調整**：蒐集使用者對建議的意見並做出調整。

#### 所需資源
- 航班與飯店訂房資料庫存取。
- 巴黎景點與餐廳資訊。
- 過往使用者回饋資料。

#### 經驗與自我反思
Travel Agent 利用元認知評估表現並從過去經驗中學習，例如：
1. **分析使用者回饋**：檢視回饋，了解哪些建議受歡迎、哪些不受歡迎，並調整未來建議。
2. **適應性**：若使用者曾表示不喜歡擁擠場所，Travel Agent 未來會避免在熱門時段推薦熱門景點。
3. **錯誤修正**：若過去曾建議已客滿的飯店，Travel Agent 將學會在推薦前更嚴格確認可用性。

#### 實務開發範例
以下為 Travel Agent 在加入元認知時可能的簡化程式碼示例： ```python
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

#### 為什麼元認知重要
- **自我反思**：代理人能分析表現並找出改進點。
- **適應性**：代理人能根據回饋與環境變化調整策略。
- **錯誤修正**：代理人能自主偵測並修正錯誤。
- **資源管理**：代理人能優化時間與計算資源使用。

透過元認知，Travel Agent 能提供更個人化且精準的旅遊建議，提升整體使用者體驗。

---

## 2. 代理人的規劃
規劃是 AI 代理人行為中的關鍵環節。它涵蓋為達成目標所需步驟的規劃，考量當前狀態、資源及可能障礙。

### 規劃要素
- **當前任務**：明確定義任務。
- **完成任務的步驟**：將任務拆解為可執行步驟。
- **所需資源**：確認必要資源。
- **經驗**：利用過去經驗輔助規劃。

**範例**：以下為 Travel Agent 協助使用者有效規劃旅程的步驟：

### Travel Agent 的步驟
1. **收集使用者偏好**
   - 詢問使用者旅遊日期、預算、興趣及特別需求。
   - 範例：「你打算什麼時候出發？」「你的預算範圍是多少？」「假期喜歡做哪些活動？」

2. **搜尋資訊**
   - 根據使用者偏好尋找相關旅遊選項。
   - **航班**：尋找符合預算與日期的航班。
   - **住宿**：尋找符合地點、價格及設施需求的飯店或租屋。
   - **景點與餐廳**：找出符合興趣的熱門景點、活動與餐飲選擇。

3. **產生建議**
   - 將搜尋結果彙整成個人化行程。
   - 提供航班、飯店預訂與建議活動，並依使用者偏好調整。

4. **向使用者呈現行程**
   - 分享建議行程供使用者檢視。
   - 範例：「這是為你規劃的巴黎行程，包含航班細節、飯店訂房及推薦活動與餐廳，請告訴我你的想法！」

5. **收集回饋**
   - 詢問使用者對行程的意見。
   - 範例：「你喜歡這些航班嗎？」「飯店符合需求嗎？」「有沒有想加或刪除的活動？」

6. **根據回饋調整**
   - 根據使用者意見修改行程。
   - 調整航班、住宿與活動建議以更符合使用者需求。

7. **最終確認**
   - 將更新後的行程呈交使用者確認。
   - 範例：「我已依你的回饋做出調整，這是最新行程，一切都符合你的期待嗎？」

8. **預訂與確認**
   - 使用者確認後，進行航班、住宿及預訂活動。
   - 傳送確認資訊給使用者。

9. **持續支援**
   - 旅途中持續提供協助，回應變更或額外需求。
   - 範例：「旅途中若需要協助，隨時找我！」

### 互動範例
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

## 3. 矯正型 RAG 系統
首先，讓我們了解 RAG 工具與預先載入上下文的差異

![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.tw.png)

### Retrieval-Augmented Generation (RAG)
RAG 結合檢索系統與生成模型。當有查詢時，檢索系統會從外部來源擷取相關文件或資料，並將這些擷取的資訊用於輔助生成模型的輸入，幫助模型產生更準確且符合上下文的回應。

在 RAG 系統中，代理人會從知識庫檢索相關資訊，並用以生成適當的回應或行動。

### 矯正型 RAG 方法
矯正型 RAG 著重利用 RAG 技術修正錯誤並提升 AI 代理人的準確度，包含：
1. **提示技巧**：使用特定提示引導代理人檢索相關資訊。
2. **工具**：實作演算法與機制，讓代理人評估檢索資訊的相關性並生成準確回應。
3. **評估**：持續評估代理人表現，並做出調整以提升準確度與效率。
範例：搜尋代理中的修正型 RAG  
考慮一個從網路擷取資訊以回答使用者查詢的搜尋代理。修正型 RAG 方法可能包含：  
1. **提示技術**：根據使用者輸入制定搜尋查詢。  
2. **工具**：使用自然語言處理和機器學習演算法來排序和篩選搜尋結果。  
3. **評估**：分析使用者回饋以識別並修正擷取資訊中的錯誤。  

### 旅遊代理中的修正型 RAG  
修正型 RAG（Retrieval-Augmented Generation）增強了 AI 擷取與生成資訊的能力，同時修正任何錯誤。讓我們看看旅遊代理如何使用修正型 RAG 方法，提供更準確且相關的旅遊建議。這包含：  
- **提示技術：** 使用特定提示引導代理擷取相關資訊。  
- **工具：** 實作演算法與機制，使代理能評估擷取資訊的相關性並生成精確回應。  
- **評估：** 持續評估代理的表現，並進行調整以提升其準確性與效率。  

#### 旅遊代理實作修正型 RAG 的步驟  
1. **初始使用者互動**  
- 旅遊代理收集使用者的初步偏好，例如目的地、旅遊日期、預算和興趣。  
- 範例：```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  
2. **擷取資訊**  
- 旅遊代理根據使用者偏好擷取航班、住宿、景點和餐廳資訊。  
- 範例：```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  
3. **生成初步建議**  
- 旅遊代理使用擷取的資訊生成個人化行程。  
- 範例：```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  
4. **收集使用者回饋**  
- 旅遊代理詢問使用者對初步建議的意見。  
- 範例：```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  
5. **修正型 RAG 流程**  
- **提示技術**：旅遊代理根據使用者回饋制定新的搜尋查詢。  
- 範例：```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **工具**：旅遊代理使用演算法排序並篩選新的搜尋結果，強調根據使用者回饋的相關性。  
- 範例：```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **評估**：旅遊代理持續分析使用者回饋，評估建議的相關性與準確性，並進行必要調整。  
- 範例：```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### 實務範例  
以下是整合修正型 RAG 方法的簡化 Python 程式碼範例：  
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
預先載入上下文指在處理查詢前，先將相關上下文或背景資訊載入模型。這表示模型從一開始就能存取這些資訊，有助於生成更有根據的回應，而不必在過程中再擷取額外資料。以下是旅遊代理應用中預先載入上下文的簡化 Python 範例：  
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

#### 說明  
1. **初始化（`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info` 方法）**  
此方法從預先載入的上下文字典中擷取相關資訊。透過預先載入上下文，旅遊代理應用能快速回應使用者查詢，無需即時從外部來源擷取資料，提升應用效率與反應速度。  

### 以目標啟動計畫再進行迭代  
以目標啟動計畫意指先明確設定目標或預期成果，模型可將此目標作為整個迭代過程的指導原則。這有助於確保每次迭代都朝向達成目標邁進，使過程更有效率且聚焦。以下是如何在旅遊代理中以目標啟動旅遊計畫再迭代的範例（Python）：  

### 情境  
旅遊代理想為客戶規劃客製化假期。目標是根據客戶偏好與預算，制定能最大化客戶滿意度的旅遊行程。  

### 步驟  
1. 定義客戶的偏好與預算。  
2. 根據這些偏好啟動初始計畫。  
3. 迭代優化計畫，以提升客戶滿意度。  

#### Python 程式碼  
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

#### 程式碼說明  
1. **初始化（`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost` 方法）**  
此方法計算當前計畫的總成本，包含潛在的新目的地。  

#### 使用範例  
- **初始計畫**：旅遊代理根據客戶對觀光的偏好及 2000 美元預算，制定初始計畫。  
- **優化計畫**：旅遊代理透過迭代，根據客戶偏好與預算優化計畫。  
透過以明確目標（如最大化客戶滿意度）啟動計畫，並不斷迭代優化，旅遊代理能為客戶打造客製化且優化的旅遊行程。此方法確保旅遊計畫從一開始即符合客戶偏好與預算，且隨著迭代不斷改進。  

### 利用大型語言模型（LLM）進行重新排序與評分  
大型語言模型（LLM）可用於重新排序與評分，透過評估擷取文件或生成回應的相關性與品質來實現。其運作方式如下：  
**擷取：** 初步擷取根據查詢取得一組候選文件或回應。  
**重新排序：** LLM 評估這些候選項，依據其相關性與品質重新排序。此步驟確保最相關且高品質的資訊優先呈現。  
**評分：** LLM 為每個候選項分配分數，反映其相關性與品質，有助於選出最佳回應或文件。  
透過利用 LLM 進行重新排序與評分，系統能提供更準確且具上下文相關性的資訊，提升整體使用者體驗。以下為旅遊代理如何利用大型語言模型根據使用者偏好重新排序與評分旅遊目的地的 Python 範例：  

#### 情境 - 根據偏好旅遊  
旅遊代理想根據客戶偏好推薦最佳旅遊目的地。LLM 將協助重新排序與評分目的地，確保呈現最相關選項。  

#### 步驟  
1. 收集使用者偏好。  
2. 擷取潛在旅遊目的地清單。  
3. 利用 LLM 根據使用者偏好重新排序並評分目的地。  

以下示範如何更新先前範例，使用 Azure OpenAI 服務：  

#### 需求  
1. 擁有 Azure 訂閱。  
2. 建立 Azure OpenAI 資源並取得 API 金鑰。  

#### Python 範例程式碼  
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

#### 程式碼說明  
- 偏好訂房者  
1. **初始化**：`TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` 替換為 Azure OpenAI 部署的實際端點 URL。  
透過利用 LLM 進行重新排序與評分，旅遊代理能為客戶提供更個人化且相關的旅遊建議，提升整體體驗。  

### RAG：提示技術與工具的比較  
Retrieval-Augmented Generation（RAG）既可作為提示技術，也可作為工具用於 AI 代理的開發。理解兩者差異，有助於更有效運用 RAG。  

#### 作為提示技術的 RAG  
**是什麼？**  
- 作為提示技術，RAG 涉及制定特定查詢或提示，引導從大型語料庫或資料庫擷取相關資訊，並用以生成回應或執行動作。  
**運作方式：**  
1. **制定提示**：根據任務或使用者輸入，創建結構良好的提示或查詢。  
2. **擷取資訊**：使用提示從預先存在的知識庫或資料集中搜尋相關資料。  
3. **生成回應**：結合擷取資訊與生成式 AI 模型，產生完整且連貫的回應。  
**旅遊代理範例：**  
- 使用者輸入：「我想參觀巴黎的博物館。」  
- 提示：「尋找巴黎的頂尖博物館。」  
- 擷取資訊：關於羅浮宮、奧賽博物館等細節。  
- 生成回應：「這裡有幾個巴黎的頂尖博物館：羅浮宮、奧賽博物館與龐畢度中心。」  

#### 作為工具的 RAG  
**是什麼？**  
- 作為工具，RAG 是一個整合系統，自動化擷取與生成流程，讓開發者無需為每個查詢手動設計提示，即可實作複雜 AI 功能。  
**運作方式：**  
1. **整合**：將 RAG 嵌入 AI 代理架構，讓其自動處理擷取與生成任務。  
2. **自動化**：工具管理整個流程，從接收使用者輸入到生成最終回應，無需明確提示。  
3. **效率**：透過簡化擷取與生成流程，提升代理的反應速度與準確度。  
**旅遊代理範例：**  
- 使用者輸入：「我想參觀巴黎的博物館。」  
- RAG 工具：自動擷取博物館相關資訊並生成回應。  
- 生成回應：「這裡有幾個巴黎的頂尖博物館：羅浮宮、奧賽博物館與龐畢度中心。」  

### 比較表  

| 面向 | 提示技術 | 工具 |  
|------------------------|-------------------------------------------------------------|-------------------------------------------------------|  
| **手動 vs 自動** | 每個查詢手動制定提示。 | 擷取與生成過程自動化。 |  
| **控制力** | 對擷取過程有較多控制。 | 流程簡化且自動化。 |  
| **彈性** | 可根據特定需求客製化提示。 | 適合大規模實作，效率較高。 |  
| **複雜度** | 需設計與調整提示。 | 容易整合入 AI 代理架構。 |  

### 實務範例  
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
評估相關性是 AI 代理效能的重要面向，確保代理擷取與生成的資訊對使用者適當、準確且有用。讓我們探討如何在 AI 代理中評估相關性，包括實務範例與技術。  

#### 評估相關性的關鍵概念  
1. **上下文意識**：  
- 代理必須理解使用者查詢的上下文，才能擷取並生成相關資訊。  
- 範例：使用者詢問「巴黎最佳餐廳」，代理應考慮使用者偏好，如料理類型與預算。  
2. **準確性**：  
- 代理提供的資訊應該是事實正確且最新的。  
- 範例：推薦目前營業且評價良好的餐廳，而非過時或已歇業的選項。  
3. **使用者意圖**：  
-
代理人應該推斷使用者查詢背後的意圖，以提供最相關的資訊。  
- 範例：如果使用者詢問「預算友善的飯店」，代理人應優先考慮價格合理的選項。  

4. **反饋迴圈**：  
- 持續收集並分析使用者反饋，幫助代理人優化其相關性評估流程。  
- 範例：將使用者對先前推薦的評分和反饋納入，以改善未來的回應。  

#### 評估相關性的實務技巧  
1. **相關性評分**：  
- 根據檢索項目與使用者查詢及偏好的匹配程度，為每個項目分配相關性分數。  
- 範例：```python
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

2. **篩選與排序**：  
- 篩除不相關的項目，並根據相關性分數對剩餘項目進行排序。  
- 範例：```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

3. **自然語言處理 (NLP)**：  
- 使用NLP技術理解使用者查詢並檢索相關資訊。  
- 範例：```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

4. **使用者反饋整合**：  
- 收集使用者對所提供推薦的反饋，並用於調整未來的相關性評估。  
- 範例：```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### 範例：旅行代理人中的相關性評估  
以下是一個旅行代理人如何評估旅遊推薦相關性的實務範例：  
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

### 帶有意圖的搜尋  
帶有意圖的搜尋涉及理解並詮釋使用者查詢背後的目的或目標，以檢索並產生最相關且有用的資訊。此方法不僅是單純比對關鍵字，而是著重於掌握使用者的實際需求與情境。  

#### 帶有意圖搜尋的關鍵概念  
1. **理解使用者意圖**：  
- 使用者意圖可分為三大類型：資訊型、導航型與交易型。  
- **資訊型意圖**：使用者尋求關於某主題的資訊（例如：「巴黎有哪些最佳博物館？」）。  
- **導航型意圖**：使用者想前往特定網站或頁面（例如：「羅浮宮博物館官方網站」）。  
- **交易型意圖**：使用者目的是執行交易，如訂機票或購買商品（例如：「訂購飛往巴黎的機票」）。  

2. **情境意識**：  
- 分析使用者查詢的情境，有助於準確辨識其意圖，包括考量先前互動、使用者偏好與當前查詢的具體細節。  

3. **自然語言處理 (NLP)**：  
- 採用NLP技術理解並詮釋使用者所提供的自然語言查詢，包含實體識別、情感分析及查詢解析等任務。  

4. **個人化**：  
- 根據使用者的歷史、偏好與反饋，個人化搜尋結果，以提升所檢索資訊的相關性。  

#### 實務範例：旅行代理人中的帶有意圖搜尋  
以旅行代理人為例，展示如何實作帶有意圖的搜尋。  
1. **收集使用者偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **理解使用者意圖** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **情境意識** ```python
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
5. **範例使用** ```python
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

## 4. 將程式碼生成作為工具  
程式碼生成代理人利用AI模型撰寫並執行程式碼，以解決複雜問題並自動化任務。  

### 程式碼生成代理人  
程式碼生成代理人使用生成式AI模型來撰寫和執行程式碼。這些代理人能解決複雜問題、自動化任務，並透過生成與執行多種程式語言的程式碼提供有價值的見解。  

#### 實務應用  
1. **自動程式碼生成**：生成特定任務的程式碼片段，如資料分析、網頁爬蟲或機器學習。  
2. **以SQL作為RAG**：使用SQL查詢從資料庫擷取與操作資料。  
3. **問題解決**：撰寫並執行程式碼以解決特定問題，如優化演算法或資料分析。  

#### 範例：資料分析的程式碼生成代理人  
假設你設計一個程式碼生成代理人，運作方式如下：  
1. **任務**：分析資料集以識別趨勢與模式。  
2. **步驟**：  
- 將資料集載入資料分析工具。  
- 生成SQL查詢以篩選與彙總資料。  
- 執行查詢並擷取結果。  
- 利用結果生成視覺化與洞察。  
3. **所需資源**：資料集存取權限、資料分析工具及SQL能力。  
4. **經驗**：利用過去分析結果提升未來分析的準確性與相關性。  

### 範例：旅行代理人的程式碼生成代理人  
本範例中，我們設計一個程式碼生成代理人「旅行代理人」，協助使用者規劃旅程，透過生成與執行程式碼完成任務。該代理人能處理取得旅遊選項、篩選結果及利用生成式AI編制行程等工作。  

#### 程式碼生成代理人概述  
1. **收集使用者偏好**：收集使用者輸入，如目的地、旅遊日期、預算及興趣。  
2. **生成取得資料的程式碼**：產生程式碼片段以擷取航班、飯店及景點資料。  
3. **執行生成的程式碼**：執行程式碼以獲取即時資訊。  
4. **生成行程**：將擷取的資料彙整成個人化旅遊計畫。  
5. **根據反饋調整**：接收使用者反饋，必要時重新生成程式碼以優化結果。  

#### 逐步實作  
1. **收集使用者偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **生成取得資料的程式碼** ```python
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
3. **執行生成的程式碼** ```python
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
根據資料表的結構確實能透過環境意識與推理強化查詢生成流程。以下為示範：  
1. **理解結構**：系統將理解資料表結構，並用此資訊作為查詢生成的基礎。  
2. **根據反饋調整**：系統根據反饋調整使用者偏好，並推理哪些欄位需更新。  
3. **生成並執行查詢**：系統生成並執行查詢，以根據新偏好擷取更新的航班與飯店資料。  

以下為整合上述概念的Python程式碼範例：```python
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

#### 說明 - 根據反饋訂位  
1. **結構意識**：`schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` 方法：此方法根據結構與反饋自訂調整。  
4. **生成並執行查詢**：系統生成程式碼以根據調整後的偏好擷取更新的航班與飯店資料，並模擬執行這些查詢。  
5. **生成行程**：系統根據新航班、飯店及景點資料建立更新的行程。  

透過讓系統具備環境感知並基於結構推理，能生成更準確且相關的查詢，進而提供更佳的旅遊推薦與更個人化的使用者體驗。  

### 將SQL作為檢索增強生成（RAG）技術  
SQL（結構化查詢語言）是與資料庫互動的強大工具。當作為檢索增強生成（RAG）方法的一部分使用時，SQL能從資料庫擷取相關資料，以輔助AI代理生成回應或執行動作。以下探討SQL如何在旅行代理人中作為RAG技術使用。  

#### 關鍵概念  
1. **資料庫互動**：  
- 使用SQL查詢資料庫，擷取相關資訊並操作資料。  
- 範例：擷取航班細節、飯店資訊及旅遊景點資料。  

2. **與RAG整合**：  
- 根據使用者輸入與偏好生成SQL查詢。  
- 擷取的資料用於生成個人化推薦或動作。  

3. **動態查詢生成**：  
- AI代理根據情境與使用者需求動態生成SQL查詢。  
- 範例：依預算、日期及興趣自訂SQL查詢以篩選結果。  

#### 應用  
- **自動程式碼生成**：生成特定任務的程式碼片段。  
- **以SQL作為RAG**：使用SQL查詢操作資料。  
- **問題解決**：撰寫並執行程式碼以解決問題。  

**範例**：資料分析代理人：  
1. **任務**：分析資料集找出趨勢。  
2. **步驟**：  
- 載入資料集。  
- 生成SQL查詢以篩選資料。  
- 執行查詢並擷取結果。  
- 生成視覺化與洞察。  
3. **資源**：資料集存取權限、SQL能力。  
4. **經驗**：利用過去結果改進未來分析。  

#### 實務範例：旅行代理人中使用SQL  
1. **收集使用者偏好** ```python
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
2. **飯店查詢** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **景點查詢** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

透過將SQL納入檢索增強生成（RAG）技術，像旅行代理人這類AI代理能動態擷取並運用相關資料，以提供精確且個人化的推薦。  

### 元認知範例  
為了展示元認知的實作，我們建立一個簡單代理人，*反思其決策過程*以解決問題。此範例中，代理人嘗試優化飯店選擇，接著評估自身推理並在犯錯或次優決策時調整策略。  

我們模擬一個基本範例，代理人根據價格與品質的組合選擇飯店，但會「反思」其決策並相應調整。  

#### 此範例如何展現元認知：  
1. **初始決策**：代理人會選擇最便宜的飯店，未考慮品質影響。  
2. **反思與評估**：初始選擇後，代理人會根據使用者反饋檢查該飯店是否為「不佳」選擇；若發現品質過低，則反思其推理。  
3. **調整策略**：代理人根據反思調整策略，從「最便宜」切換到「最高品質」，進而提升未來決策過程。  

範例如下：```python
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

#### 代理人的元認知能力  
關鍵在於代理人能：  
- 評估先前的選擇與決策過程。  
- 根據反思調整策略，即元認知的實際運作。  

這是一種簡單的元認知形式，系統能根據內部反饋調整推理過程。  

### 結論  
元認知是一項強大的工具，能顯著提升AI代理的能力。透過整合元認知
processes, 你可以設計出更聰明、適應性更強且更有效率的代理人。利用額外的資源進一步探索 AI 代理人中元認知的迷人世界。  
## Previous Lesson [多代理設計模式](../08-multi-agent/README.md)  
## Next Lesson [AI 代理人在生產環境](../10-ai-agents-production/README.md)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於確保翻譯準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所產生之任何誤解或誤譯負責。