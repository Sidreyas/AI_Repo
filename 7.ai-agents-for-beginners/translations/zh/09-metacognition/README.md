<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T07:18:23+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "zh"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.zh.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(点击上方图片观看本课视频)_
# AI 代理中的元认知

## 介绍
欢迎来到关于 AI 代理中元认知的课程！本章面向对 AI 代理如何思考自身思维过程感兴趣的初学者。通过本课，你将理解关键概念，并掌握将元认知应用于 AI 代理设计的实用示例。

## 学习目标
完成本课后，你将能够：
1. 理解代理定义中推理循环的影响。
2. 使用规划和评估技术帮助代理进行自我纠正。
3. 创建能够操作代码以完成任务的代理。

## 元认知简介
元认知指的是涉及对自身思维进行思考的高级认知过程。对于 AI 代理来说，这意味着能够基于自我意识和过去经验评估并调整自身行为。元认知，即“对思考的思考”，是构建代理式 AI 系统中的一个重要概念。它涉及 AI 系统对自身内部过程的意识，能够监控、调节并适应自身行为。

这就像我们在人际交往中“察言观色”或面对问题时的思考一样。这种自我意识帮助 AI 系统做出更好的决策，识别错误，并随着时间提升表现——这也与图灵测试以及 AI 是否会取代人类的争论有关。

在代理式 AI 系统中，元认知有助于解决多个挑战，比如：
- 透明性：确保 AI 系统能够解释其推理和决策过程。
- 推理能力：增强 AI 系统综合信息并做出合理决策的能力。
- 适应性：使 AI 系统能适应新环境和变化条件。
- 感知能力：提升 AI 系统识别和解读环境数据的准确性。

### 什么是元认知？
元认知，或称“对思考的思考”，是一种涉及自我意识和自我调节认知过程的高级认知活动。在 AI 领域，元认知赋予代理评估并调整策略和行动的能力，从而提升问题解决和决策能力。理解元认知后，你可以设计出不仅更智能，还更具适应性和高效性的 AI 代理。

真正的元认知表现为 AI 明确地对自己的推理过程进行推理。例如：“我优先选择了价格更低的航班，因为……但我可能错过了直飞航班，得重新检查一下。”保持对选择某条路线原因的追踪。
- 发现错误，比如过度依赖上次用户偏好，因而不仅修改最终建议，还调整决策策略。
- 诊断模式，例如：“每当用户提到‘太拥挤’，我不仅要剔除某些景点，还要反思如果总以人气排序‘热门景点’的方法本身存在缺陷。”

### 元认知在 AI 代理中的重要性
元认知在 AI 代理设计中扮演关键角色，原因包括：

![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.zh.png)

- 自我反思：代理能够评估自身表现，找出改进空间。
- 适应性：代理能基于过去经验和环境变化调整策略。
- 错误纠正：代理能自主发现并纠正错误，从而获得更准确的结果。
- 资源管理：代理能通过规划和评估行动，优化时间和计算资源的使用。

## AI 代理的组成部分
在深入元认知过程前，先了解 AI 代理的基本组成部分非常重要。一个 AI 代理通常包括：
- Persona（个性）：代理的个性和特征，定义其与用户的交互方式。
- Tools（工具）：代理可执行的功能和能力。
- Skills（技能）：代理拥有的知识和专业能力。

这些组成部分协同工作，形成一个能完成特定任务的“专业单元”。

**示例**：想象一个旅行代理，它不仅帮你规划假期，还能基于实时数据和过往客户旅程经验调整行程。

### 示例：旅行代理服务中的元认知
假设你设计了一个由 AI 驱动的旅行代理服务。这个“Travel Agent”帮助用户规划假期。为了引入元认知，Travel Agent 需要基于自我意识和过往经验评估并调整其行为。元认知在其中的作用如下：

#### 当前任务
帮助用户规划一次巴黎之旅。

#### 完成任务的步骤
1. **收集用户偏好**：询问用户的旅行日期、预算、兴趣（如博物馆、美食、购物）及特殊需求。
2. **检索信息**：搜索符合用户偏好的航班、住宿、景点和餐厅。
3. **生成推荐**：提供包含航班信息、酒店预订和建议活动的个性化行程。
4. **根据反馈调整**：征求用户对推荐的反馈并做相应调整。

#### 所需资源
- 访问航班和酒店预订数据库。
- 巴黎景点和餐厅的信息。
- 以往用户交互的反馈数据。

#### 经验与自我反思
Travel Agent 利用元认知评估自身表现并从过去经验中学习。例如：
1. **分析用户反馈**：Review 用户反馈，判断哪些推荐受欢迎，哪些不受欢迎，并调整未来建议。
2. **适应性**：如果用户曾表达不喜欢拥挤场所，Travel Agent 会避免在高峰时段推荐热门景点。
3. **错误纠正**：如果之前推荐过已满员的酒店，代理会学会在推荐前更严格地检查可用性。

#### 实际开发示例
以下是包含元认知的 Travel Agent 代码简化示例：```python
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

#### 元认知的重要性
- **自我反思**：代理能分析自身表现，发现改进点。
- **适应性**：代理能根据反馈和环境变化调整策略。
- **错误纠正**：代理能自主检测并纠正错误。
- **资源管理**：代理能优化时间和计算资源的使用。

通过引入元认知，Travel Agent 能提供更个性化、更准确的旅行建议，提升整体用户体验。

---

## 2. 代理中的规划
规划是 AI 代理行为中的关键组成部分。它涉及制定实现目标所需的步骤，考虑当前状态、资源和可能的障碍。

### 规划要素
- **当前任务**：明确任务目标。
- **完成任务的步骤**：将任务拆解为可管理的步骤。
- **所需资源**：确定必要资源。
- **经验**：利用过往经验指导规划。

**示例**：以下是 Travel Agent 协助用户有效规划旅行的步骤：

### Travel Agent 的步骤
1. **收集用户偏好**
   - 询问用户旅行日期、预算、兴趣及特殊需求。
   - 示例：“你计划什么时候旅行？”“你的预算范围是多少？”“假期喜欢什么活动？”
2. **检索信息**
   - 根据用户偏好搜索相关旅行选项。
   - **航班**：查找符合预算和日期的航班。
   - **住宿**：寻找符合位置、价格和设施偏好的酒店或租赁房。
   - **景点和餐厅**：识别符合兴趣的热门景点、活动和餐饮选择。
3. **生成推荐**
   - 将检索信息整理成个性化行程。
   - 提供航班、酒店预订和建议活动等详细信息，确保推荐符合用户偏好。
4. **向用户展示行程**
   - 将行程方案分享给用户审阅。
   - 示例：“这是为您规划的巴黎行程，包括航班详情、酒店预订以及推荐的活动和餐厅。请告诉我您的意见！”
5. **收集反馈**
   - 询问用户对行程的反馈。
   - 示例：“您觉得航班选择如何？”“酒店合适吗？”“有想添加或删除的活动吗？”
6. **根据反馈调整**
   - 根据用户反馈修改行程。
   - 对航班、住宿和活动推荐做出相应调整以更好匹配用户需求。
7. **最终确认**
   - 向用户展示更新后的行程以供最终确认。
   - 示例：“根据您的反馈我做了调整，这是更新后的行程，您看是否满意？”
8. **预订并确认**
   - 用户确认后，进行航班、住宿及预订活动的操作。
   - 向用户发送确认信息。
9. **提供持续支持**
   - 旅行前及旅行期间，随时协助用户处理变更或额外需求。
   - 示例：“如果旅行中需要任何帮助，随时联系我！”

### 示例交互
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

## 3. 纠正型 RAG 系统
首先，让我们了解 RAG 工具与预加载上下文的区别。

![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.zh.png)

### 检索增强生成（RAG）
RAG 结合了检索系统和生成模型。当发出查询时，检索系统从外部来源获取相关文档或数据，这些检索到的信息被用来增强生成模型的输入，帮助模型生成更准确、上下文相关的回答。

在 RAG 系统中，代理从知识库中检索相关信息，并利用这些信息生成合适的回答或行动。

### 纠正型 RAG 方法
纠正型 RAG 方法着重利用 RAG 技术纠正错误，提高 AI 代理的准确性。具体包括：
1. **提示技术**：使用特定提示引导代理检索相关信息。
2. **工具**：实现算法和机制，使代理能评估检索信息的相关性并生成准确回答。
3. **评估**：持续评估代理表现，并进行调整以提升准确性和效率。
示例：搜索代理中的纠正型RAG  
考虑一个从网络检索信息以回答用户查询的搜索代理。纠正型RAG方法可能包括：  
1. **提示技术**：根据用户输入制定搜索查询。  
2. **工具**：使用自然语言处理和机器学习算法对搜索结果进行排名和过滤。  
3. **评估**：分析用户反馈以识别并纠正检索信息中的错误。  

### 旅行代理中的纠正型RAG  
纠正型RAG（检索增强生成）提升了AI检索和生成信息的能力，同时纠正任何不准确之处。让我们看看旅行代理如何使用纠正型RAG方法来提供更准确和相关的旅行推荐。  
这包括：  
- **提示技术**：使用特定提示引导代理检索相关信息。  
- **工具**：实现算法和机制，使代理能够评估检索信息的相关性并生成准确的回复。  
- **评估**：持续评估代理的表现并做出调整，以提高其准确性和效率。  

#### 在旅行代理中实现纠正型RAG的步骤  
1. **初始用户交互**  
- 旅行代理收集用户的初始偏好，如目的地、旅行日期、预算和兴趣。  
- 示例：```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  
2. **信息检索**  
- 旅行代理根据用户偏好检索航班、住宿、景点和餐厅的信息。  
- 示例：```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  
3. **生成初始推荐**  
- 旅行代理使用检索到的信息生成个性化行程。  
- 示例：```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  
4. **收集用户反馈**  
- 旅行代理向用户询问对初始推荐的反馈。  
- 示例：```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  
5. **纠正型RAG过程**  
- **提示技术**：旅行代理根据用户反馈制定新的搜索查询。  
- 示例：```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **工具**：旅行代理使用算法对新的搜索结果进行排名和过滤，强调基于用户反馈的相关性。  
- 示例：```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **评估**：旅行代理通过分析用户反馈，持续评估推荐的相关性和准确性，并进行必要的调整。  
- 示例：```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### 实际示例  
以下是一个简化的Python代码示例，演示如何在旅行代理中结合纠正型RAG方法：  
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

### 预先加载上下文  
预先加载上下文是指在处理查询之前，将相关的上下文或背景信息加载到模型中。这样模型从一开始就能访问这些信息，有助于生成更有依据的回答，而无需在处理过程中检索额外数据。  
以下是一个简化的示例，展示了旅行代理应用中如何进行预先加载上下文（Python）：  
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

#### 说明  
1. **初始化（`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info`方法）**：该方法从预加载的上下文字典中获取相关信息。通过预加载上下文，旅行代理应用可以快速响应用户查询，无需实时从外部来源检索信息，从而提升效率和响应速度。  

### 迭代前以目标启动计划  
以目标启动计划是指从明确的目标或期望结果出发。通过事先定义该目标，模型可以在迭代过程中以此为指导原则，确保每次迭代都更接近预期结果，使过程更高效且聚焦。  
以下是一个示例，展示如何在旅行代理中以目标启动旅行计划并进行迭代（Python）：  

### 场景  
旅行代理想为客户规划定制假期。目标是根据客户的偏好和预算，制定最大化客户满意度的旅行行程。  

### 步骤  
1. 定义客户的偏好和预算。  
2. 基于这些偏好启动初始计划。  
3. 迭代优化计划，以提升客户满意度。  

#### Python代码  
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

#### 代码说明  
1. **初始化（`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost`方法）**：该方法计算当前计划的总成本，包括潜在的新目的地。  

#### 示例用法  
- **初始计划**：旅行代理根据客户对观光的偏好和2000美元预算制定初始计划。  
- **优化计划**：旅行代理迭代计划，优化以满足客户偏好和预算。  
通过以明确目标（如最大化客户满意度）启动计划并迭代优化，旅行代理可以为客户创建定制且优化的旅行行程。该方法确保旅行计划从一开始就符合客户的偏好和预算，并随着每次迭代不断改进。  

### 利用大型语言模型（LLM）进行重排和评分  
大型语言模型（LLM）可用于重排和评分，通过评估检索文档或生成回复的相关性和质量。其工作原理如下：  
**检索**：初步检索步骤根据查询获取一组候选文档或回复。  
**重排**：LLM评估这些候选项并根据相关性和质量进行重新排序。此步骤确保最相关和高质量的信息优先呈现。  
**评分**：LLM为每个候选项赋予分数，反映其相关性和质量，有助于选择最佳回复或文档。  
通过利用LLM进行重排和评分，系统能够提供更准确且上下文相关的信息，提升整体用户体验。  
以下示例展示旅行代理如何使用LLM基于用户偏好对旅行目的地进行重排和评分（Python）：  

#### 场景 - 基于偏好的旅行  
旅行代理希望根据客户偏好推荐最佳旅行目的地。LLM将帮助对目的地进行重排和评分，确保呈现最相关的选项。  

#### 步骤：  
1. 收集用户偏好。  
2. 检索潜在旅行目的地列表。  
3. 使用LLM根据用户偏好对目的地进行重排和评分。  

以下是如何更新之前示例以使用Azure OpenAI服务：  

#### 要求  
1. 需要拥有Azure订阅。  
2. 创建Azure OpenAI资源并获取API密钥。  

#### 示例Python代码  
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

#### 代码说明  
- 偏好预订器  
1. **初始化**：`TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` 替换为您的Azure OpenAI部署的实际端点URL。  
通过利用LLM进行重排和评分，旅行代理能够为客户提供更个性化且相关的旅行推荐，提升整体体验。  

### RAG：提示技术与工具  
检索增强生成（RAG）既可以是一种提示技术，也可以是开发AI代理的工具。理解两者的区别有助于更有效地利用RAG。  

#### 作为提示技术的RAG  
**定义**  
- 作为提示技术，RAG涉及制定特定查询或提示，引导从大型语料库或数据库检索相关信息。然后利用这些信息生成回复或执行操作。  

**工作流程**  
1. **制定提示**：根据任务或用户输入创建结构良好的提示或查询。  
2. **检索信息**：利用提示从预先存在的知识库或数据集中搜索相关数据。  
3. **生成回复**：结合检索到的信息和生成式AI模型，产生全面连贯的回复。  

**旅行代理示例**：  
- 用户输入：“我想参观巴黎的博物馆。”  
- 提示：“查找巴黎的顶级博物馆。”  
- 检索信息：卢浮宫、奥赛博物馆等详情。  
- 生成回复：“这里有一些巴黎的顶级博物馆：卢浮宫、奥赛博物馆和蓬皮杜中心。”  

#### 作为工具的RAG  
**定义**  
- 作为工具，RAG是一个集成系统，自动执行检索和生成过程，方便开发者实现复杂AI功能，无需为每个查询手动设计提示。  

**工作流程**  
1. **集成**：将RAG嵌入AI代理架构，使其自动处理检索和生成任务。  
2. **自动化**：工具管理整个流程，从接收用户输入到生成最终回复，无需为每步显式提示。  
3. **效率**：通过简化检索和生成过程，提高代理性能，实现更快更准确的回复。  

**旅行代理示例**：  
- 用户输入：“我想参观巴黎的博物馆。”  
- RAG工具：自动检索博物馆信息并生成回复。  
- 生成回复：“这里有一些巴黎的顶级博物馆：卢浮宫、奥赛博物馆和蓬皮杜中心。”  

### 对比  

| 方面             | 提示技术                         | 工具                          |  
|------------------|--------------------------------|------------------------------|  
| **手动 vs 自动**  | 为每个查询手动制定提示           | 自动执行检索和生成过程         |  
| **控制**         | 对检索过程有更多控制             | 简化并自动化检索和生成         |  
| **灵活性**       | 允许根据具体需求定制提示         | 适合大规模应用更高效           |  
| **复杂性**       | 需要设计和调整提示               | 更易集成到AI代理架构中         |  

### 实践示例  
**提示技术示例：** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**工具示例：** ```python
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

### 评估相关性  
评估相关性是AI代理性能的关键方面。它确保代理检索和生成的信息适当、准确且对用户有用。让我们探讨如何评估AI代理中的相关性，包括实用示例和技术。  

#### 评估相关性的关键概念  
1. **上下文感知**：  
- 代理必须理解用户查询的上下文，才能检索和生成相关信息。  
- 示例：用户询问“巴黎的最佳餐厅”，代理应考虑用户偏好，如菜系和预算。  

2. **准确性**：  
- 代理提供的信息应事实正确且最新。  
- 示例：推荐当前营业且评价良好的餐厅，而非过时或已关闭的选项。  

3. **用户意图**：  
-
代理应当推断用户查询背后的意图，以提供最相关的信息。  
- 示例：如果用户询问“经济型酒店”，代理应优先考虑价格实惠的选项。  

4. **反馈循环**：  
- 持续收集和分析用户反馈有助于代理优化其相关性评估过程。  
- 示例：结合用户对先前推荐的评分和反馈，以改进未来的响应。  

#### 评估相关性的实用技术  
1. **相关性评分**：  
- 根据检索项与用户查询及偏好的匹配程度，为每个检索项分配相关性分数。  
- 示例：```python
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

2. **过滤与排序**：  
- 过滤掉无关项，并根据相关性分数对剩余项进行排序。  
- 示例：```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

3. **自然语言处理（NLP）**：  
- 使用NLP技术理解用户查询并检索相关信息。  
- 示例：```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

4. **用户反馈整合**：  
- 收集用户对推荐结果的反馈，并利用这些反馈调整未来的相关性评估。  
- 示例：```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### 示例：旅游代理中的相关性评估  
以下是旅游代理如何评估旅游推荐相关性的实际示例：  
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

### 带意图的搜索  
带意图的搜索涉及理解和解释用户查询背后的目的或目标，以检索并生成最相关且有用的信息。此方法超越了简单的关键词匹配，侧重于把握用户的真实需求和上下文。  

#### 带意图搜索的关键概念  
1. **理解用户意图**：  
- 用户意图可分为三大类：信息型、导航型和交易型。  
- **信息型意图**：用户寻求某个主题的信息（例如，“巴黎最好的博物馆有哪些？”）。  
- **导航型意图**：用户希望访问特定网站或页面（例如，“卢浮宫博物馆官网”）。  
- **交易型意图**：用户希望完成某项交易，如预订机票或购物（例如，“预订飞往巴黎的机票”）。  

2. **上下文感知**：  
- 分析用户查询的上下文，有助于准确识别其意图，包括考虑之前的交互、用户偏好和当前查询的具体细节。  

3. **自然语言处理（NLP）**：  
- 利用NLP技术理解和解析用户的自然语言查询，包括实体识别、情感分析和查询解析等任务。  

4. **个性化**：  
- 根据用户的历史、偏好和反馈个性化搜索结果，提升检索信息的相关性。  

#### 实用示例：旅游代理中的带意图搜索  
以旅游代理为例，展示如何实现带意图的搜索。  
1. **收集用户偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **理解用户意图** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **上下文感知** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
4. **搜索并个性化结果** ```python
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
5. **示例使用** ```python
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

## 4. 作为工具的代码生成  
代码生成代理利用AI模型编写和执行代码，解决复杂问题并实现任务自动化。  

### 代码生成代理  
代码生成代理使用生成式AI模型编写和执行代码。这些代理能够解决复杂问题、自动化任务，并通过生成和运行多种编程语言的代码提供有价值的见解。  

#### 实用应用  
1. **自动代码生成**：生成特定任务的代码片段，如数据分析、网页爬取或机器学习。  
2. **将SQL作为RAG**：使用SQL查询从数据库中检索和操作数据。  
3. **问题解决**：创建并执行代码以解决特定问题，如算法优化或数据分析。  

#### 示例：用于数据分析的代码生成代理  
假设你正在设计一个代码生成代理，工作流程如下：  
1. **任务**：分析数据集以识别趋势和模式。  
2. **步骤**：  
- 将数据集加载到数据分析工具中。  
- 生成SQL查询以筛选和汇总数据。  
- 执行查询并获取结果。  
- 利用结果生成可视化和洞察。  
3. **所需资源**：访问数据集、数据分析工具和SQL能力。  
4. **经验**：利用过去的分析结果提升未来分析的准确性和相关性。  

### 示例：旅游代理的代码生成代理  
在此示例中，我们设计一个代码生成代理——旅游代理，帮助用户规划旅行，通过生成和执行代码完成任务。该代理可处理获取旅行选项、筛选结果和编制行程等任务，利用生成式AI实现。  

#### 代码生成代理概述  
1. **收集用户偏好**：收集目的地、旅行日期、预算和兴趣等用户输入。  
2. **生成获取数据的代码**：生成代码片段以检索航班、酒店和景点信息。  
3. **执行生成的代码**：运行生成的代码以获取实时信息。  
4. **生成行程**：将获取的数据编制成个性化旅行计划。  
5. **基于反馈调整**：接收用户反馈，必要时重新生成代码以优化结果。  

#### 逐步实现  
1. **收集用户偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **生成获取数据的代码** ```python
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
3. **执行生成的代码** ```python
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
5. **基于反馈调整** ```python
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

### 利用环境感知与推理  
基于表结构的模式确实可以通过利用环境感知和推理来增强查询生成过程。示例如下：  
1. **理解模式**：系统理解表结构模式，并利用该信息为查询生成提供基础。  
2. **基于反馈调整**：系统根据反馈调整用户偏好，并推理哪些字段需要更新。  
3. **生成并执行查询**：系统生成并执行查询，以基于新偏好获取更新的航班和酒店数据。  

以下是结合这些概念的Python代码示例：```python
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

#### 说明 - 基于反馈的预订  
1. **模式感知**：`schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment`方法：此方法根据模式和反馈定制调整。  
4. **生成并执行查询**：系统生成代码以获取基于调整后偏好的更新航班和酒店数据，并模拟执行这些查询。  
5. **生成行程**：系统根据新的航班、酒店和景点数据创建更新的行程。  

通过使系统具备环境感知能力并基于模式进行推理，能够生成更准确、更相关的查询，从而提供更优质的旅行推荐和更个性化的用户体验。  

### 将SQL用作检索增强生成（RAG）技术  
SQL（结构化查询语言）是与数据库交互的强大工具。作为检索增强生成（RAG）方法的一部分，SQL可用于从数据库检索相关数据，辅助AI代理生成响应或执行操作。下面探讨SQL在旅游代理中的RAG应用。  

#### 关键概念  
1. **数据库交互**：  
- 使用SQL查询数据库，检索相关信息并操作数据。  
- 示例：获取航班详情、酒店信息和旅游景点数据。  

2. **与RAG的集成**：  
- 根据用户输入和偏好生成SQL查询。  
- 检索到的数据用于生成个性化推荐或执行操作。  

3. **动态查询生成**：  
- AI代理根据上下文和用户需求动态生成SQL查询。  
- 示例：根据预算、日期和兴趣定制SQL查询以筛选结果。  

#### 应用  
- **自动代码生成**：生成特定任务的代码片段。  
- **将SQL作为RAG**：使用SQL查询操作数据。  
- **问题解决**：创建并执行代码以解决问题。  

**示例**：数据分析代理：  
1. **任务**：分析数据集以发现趋势。  
2. **步骤**：  
- 加载数据集。  
- 生成SQL查询筛选数据。  
- 执行查询并获取结果。  
- 生成可视化和洞察。  
3. **资源**：数据集访问权限、SQL能力。  
4. **经验**：利用过去结果提升未来分析。  

#### 实用示例：旅游代理中使用SQL  
1. **收集用户偏好** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **生成SQL查询** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
3. **执行SQL查询** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
4. **生成推荐** ```python
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

#### 示例SQL查询  
1. **航班查询** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
2. **酒店查询** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **景点查询** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

通过将SQL作为检索增强生成（RAG）技术的一部分，像旅游代理这样的AI代理可以动态检索并利用相关数据，提供准确且个性化的推荐。  

### 元认知示例  
为演示元认知的实现，我们创建一个简单代理，在解决问题时*反思其决策过程*。在此示例中，代理尝试优化酒店选择，但在出现错误或次优选择时，会评估自身推理并调整策略。我们将模拟一个简单示例，代理基于价格和质量组合选择酒店，但会“反思”其决策并做出相应调整。  

#### 此示例如何体现元认知：  
1. **初始决策**：代理选择最便宜的酒店，但未考虑质量影响。  
2. **反思与评估**：初次选择后，代理通过用户反馈检查酒店是否为“不佳”选择。若发现酒店质量过低，代理将反思其推理。  
3. **调整策略**：代理基于反思调整策略，从“最便宜”切换至“最高质量”，从而提升未来的决策过程。  

示例如下：```python
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

#### 代理的元认知能力  
关键在于代理能够：  
- 评估其先前的选择和决策过程。  
- 基于反思调整策略，即元认知的实际应用。  

这是一种简单的元认知形式，系统能根据内部反馈调整其推理过程。  

### 结论  
元认知是一种强大的工具，能显著增强AI代理的能力。通过融入元认知...
通过这些过程，您可以设计出更智能、更适应性强且更高效的代理。利用附加资源进一步探索AI代理中元认知的迷人世界。  
## 上一课  
[多代理设计模式](../08-multi-agent/README.md)  
## 下一课  
[生产中的AI代理](../10-ai-agents-production/README.md)

**免责声明**：  
本文件使用 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。虽然我们力求准确，但请注意自动翻译可能存在错误或不准确之处。原始文件的母语版本应被视为权威来源。对于重要信息，建议使用专业人工翻译。对于因使用本翻译而产生的任何误解或误释，我们不承担任何责任。