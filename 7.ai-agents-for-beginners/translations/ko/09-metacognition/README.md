<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T08:39:54+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "ko"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.ko.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(위 이미지를 클릭하면 이 강의의 동영상을 볼 수 있습니다)_
# AI 에이전트의 메타인지  
## 소개  
AI 에이전트의 메타인지에 관한 강의에 오신 것을 환영합니다! 이 장은 AI 에이전트가 자신의 사고 과정을 어떻게 인지하고 평가하는지 궁금해하는 초보자를 위해 설계되었습니다. 이 강의를 마치면 주요 개념을 이해하고, AI 에이전트 설계에 메타인지를 적용할 수 있는 실용적인 예제를 익히게 될 것입니다.  

## 학습 목표  
이 강의를 완료하면 다음을 할 수 있습니다:  
1. 에이전트 정의에서 추론 루프가 가지는 의미를 이해한다.  
2. 자기 수정이 가능한 에이전트를 돕기 위한 계획 및 평가 기법을 활용한다.  
3. 작업 수행을 위해 코드를 조작할 수 있는 자신만의 에이전트를 만든다.  

## 메타인지 소개  
메타인지는 자신의 사고에 대해 생각하는 고차원 인지 과정을 의미합니다. AI 에이전트에게는 자기 인식과 과거 경험을 바탕으로 자신의 행동을 평가하고 조정하는 능력을 뜻합니다. ‘사고에 대한 사고’인 메타인지는 에이전트 AI 시스템 개발에서 매우 중요한 개념입니다. AI 시스템이 자신의 내부 과정을 인지하고, 이를 모니터링하며, 조절하고, 그에 따라 행동을 적응시키는 것을 포함합니다. 이는 마치 우리가 상황을 파악하거나 문제를 바라볼 때 하는 것과 같습니다.  

이러한 자기 인식은 AI 시스템이 더 나은 결정을 내리고, 오류를 식별하며, 시간이 지남에 따라 성능을 향상시키는 데 도움을 줍니다. 이는 튜링 테스트와 AI가 인간을 대체할 것인가에 대한 논쟁과도 연결됩니다.  

에이전트 AI 시스템 맥락에서 메타인지는 다음과 같은 여러 과제를 해결하는 데 도움을 줄 수 있습니다:  
- 투명성: AI 시스템이 자신의 추론과 결정을 설명할 수 있도록 보장  
- 추론: 정보를 종합하고 합리적인 결정을 내리는 능력 강화  
- 적응성: 새로운 환경과 변화하는 조건에 맞춰 AI 시스템이 조정할 수 있도록 함  
- 인지: 환경에서 데이터를 인식하고 해석하는 정확성 향상  

### 메타인지란 무엇인가?  
메타인지, 즉 ‘사고에 대한 사고’는 자기 인식과 인지 과정의 자기 조절을 포함하는 고차원 인지 과정입니다. AI 영역에서는 메타인지가 에이전트가 자신의 전략과 행동을 평가하고 조정할 수 있게 하여 문제 해결과 의사결정 능력을 향상시킵니다. 메타인지를 이해하면 더 지능적일 뿐 아니라 더 적응력 있고 효율적인 AI 에이전트를 설계할 수 있습니다.  

진정한 메타인지에서는 AI가 자신의 추론 과정을 명시적으로 평가하는 모습을 볼 수 있습니다.  
예: “저렴한 항공편을 우선시했는데… 직항편을 놓치고 있을 수도 있으니 다시 확인해볼게.”  
선택한 경로를 어떻게, 왜 선택했는지 추적하는 것.  
- 이전 사용자 선호에 과도하게 의존해 실수를 했음을 인지하고, 최종 추천뿐 아니라 의사결정 전략 자체를 수정함.  
- “사용자가 ‘너무 붐빈다’고 말할 때마다 인기순으로 ‘주요 관광지’를 선정하는 방식이 문제일 수 있으니, 특정 명소를 제외하는 것뿐 아니라 내 방법 자체를 재고해야 한다”는 패턴 진단.  

### AI 에이전트에서 메타인지의 중요성  
메타인지는 AI 에이전트 설계에서 다음과 같은 중요한 역할을 합니다:  
![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.ko.png)  
- 자기 성찰: 에이전트가 자신의 성과를 평가하고 개선할 부분을 식별할 수 있음  
- 적응성: 과거 경험과 변화하는 환경에 따라 전략을 수정할 수 있음  
- 오류 수정: 에이전트가 오류를 감지하고 자율적으로 수정하여 더 정확한 결과 도출  
- 자원 관리: 시간과 계산 자원 등 자원을 최적화하며 행동을 계획하고 평가  

## AI 에이전트의 구성 요소  
메타인지 과정을 이해하기 전에 AI 에이전트의 기본 구성 요소를 아는 것이 중요합니다. AI 에이전트는 일반적으로 다음으로 구성됩니다:  
- 페르소나: 사용자와 상호작용하는 방식을 정의하는 성격과 특성  
- 도구: 에이전트가 수행할 수 있는 기능과 역량  
- 스킬: 에이전트가 가진 지식과 전문성  

이 구성 요소들이 함께 작동하여 특정 작업을 수행할 수 있는 ‘전문성 단위’를 만듭니다.  

**예시**: 휴가 계획을 세울 뿐 아니라 실시간 데이터와 과거 고객 경험을 바탕으로 경로를 조정하는 여행 에이전트를 생각해보세요.  

### 예시: 여행 에이전트 서비스에서의 메타인지  
AI 기반 여행 에이전트 서비스를 설계한다고 가정해봅시다. 이 에이전트, ‘Travel Agent’는 사용자가 휴가를 계획하는 데 도움을 줍니다. 메타인지를 도입하려면 Travel Agent가 자기 인식과 과거 경험을 바탕으로 행동을 평가하고 조정할 수 있어야 합니다.  

#### 현재 과제  
사용자가 파리 여행을 계획하도록 돕는 것  

#### 과제 수행 단계  
1. **사용자 선호 수집**: 여행 날짜, 예산, 관심사(예: 박물관, 음식, 쇼핑), 특별 요구 사항을 묻기  
2. **정보 검색**: 사용자의 선호에 맞는 항공편, 숙소, 관광지, 식당 검색  
3. **추천 생성**: 항공편 세부사항, 호텔 예약, 제안 활동이 포함된 맞춤형 일정 제공  
4. **피드백에 따른 조정**: 추천에 대한 사용자의 피드백을 받고 필요한 조정 수행  

#### 필요한 자원  
- 항공 및 호텔 예약 데이터베이스 접근  
- 파리 관광지 및 식당 정보  
- 이전 상호작용에서 수집된 사용자 피드백 데이터  

#### 경험과 자기 성찰  
Travel Agent는 메타인지를 활용해 자신의 성과를 평가하고 과거 경험에서 학습합니다. 예를 들어:  
1. **사용자 피드백 분석**: 어떤 추천이 호응을 얻었고 어떤 것이 그렇지 않았는지 검토하고, 미래 추천에 반영  
2. **적응성**: 사용자가 붐비는 장소를 싫어한다고 언급했다면, 다음에는 혼잡 시간대의 인기 관광지를 피함  
3. **오류 수정**: 과거에 만실인 호텔을 추천하는 실수를 했다면, 앞으로 예약 가능 여부를 더 철저히 확인하도록 학습  

#### 실용적인 개발자 예시  
메타인지를 포함하는 Travel Agent 코드의 단순화된 예는 다음과 같습니다: ```python
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

#### 메타인지가 중요한 이유  
- **자기 성찰**: 에이전트가 자신의 성과를 분석하고 개선할 부분을 식별  
- **적응성**: 피드백과 변화하는 상황에 따라 전략 수정  
- **오류 수정**: 자율적으로 실수를 감지하고 바로잡음  
- **자원 관리**: 시간과 계산 자원 사용을 최적화  

메타인지를 도입함으로써 Travel Agent는 더 개인화되고 정확한 여행 추천을 제공하여 전반적인 사용자 경험을 향상시킬 수 있습니다.  

---  
## 2. 에이전트에서의 계획 수립  
계획 수립은 AI 에이전트 행동의 핵심 요소입니다. 목표 달성을 위해 현재 상태, 자원, 예상 장애물을 고려하여 필요한 단계를 구체화하는 과정입니다.  

### 계획 수립 요소  
- **현재 과제**: 과제를 명확히 정의  
- **과제 수행 단계**: 과제를 관리 가능한 단계로 분해  
- **필요 자원**: 필요한 자원 파악  
- **경험 활용**: 과거 경험을 계획에 반영  

**예시**: Travel Agent가 사용자의 여행 계획을 효과적으로 지원하기 위해 수행해야 할 단계는 다음과 같습니다.  

### Travel Agent의 단계  
1. **사용자 선호 수집**  
- 여행 날짜, 예산, 관심사, 특별 요구 사항을 묻기  
- 예시: "여행 계획은 언제인가요?" "예산 범위는 어떻게 되나요?" "휴가 중 어떤 활동을 즐기시나요?"  

2. **정보 검색**  
- 사용자 선호에 맞는 여행 옵션 검색  
- **항공편**: 예산과 여행 날짜에 맞는 항공편 찾기  
- **숙소**: 위치, 가격, 편의시설에 맞는 호텔이나 렌탈 숙소 찾기  
- **관광지 및 식당**: 사용자의 관심사에 부합하는 인기 명소와 식당 파악  

3. **추천 생성**  
- 수집한 정보를 바탕으로 맞춤형 일정 작성  
- 항공편, 호텔 예약, 제안 활동 등 사용자의 선호에 맞게 세부사항 제공  

4. **사용자에게 일정 제시**  
- 제안 일정을 사용자에게 공유하여 검토 받기  
- 예시: "파리 여행 일정입니다. 항공편, 호텔 예약, 추천 활동과 식당 목록을 포함했습니다. 의견을 알려주세요!"  

5. **피드백 수집**  
- 일정에 대한 사용자의 의견을 묻기  
- 예시: "항공편 옵션은 마음에 드시나요?" "호텔이 필요에 맞나요?" "추가하거나 제외하고 싶은 활동이 있나요?"  

6. **피드백 반영 조정**  
- 사용자의 의견에 따라 일정 수정  
- 항공편, 숙소, 활동 추천을 사용자 선호에 맞게 변경  

7. **최종 확인**  
- 수정된 일정을 사용자에게 최종 확인 요청  
- 예시: "피드백 반영해 일정을 수정했습니다. 모두 괜찮으신가요?"  

8. **예약 및 확정**  
- 사용자가 일정을 승인하면 항공편, 숙소, 사전 예약 활동 등을 예약  
- 예약 확인 정보를 사용자에게 전달  

9. **지속 지원 제공**  
- 여행 전후 및 중간에 변경 사항이나 추가 요청에 대응  
- 예시: "여행 중 추가 도움이 필요하면 언제든 연락주세요!"  

### 예시 상호작용  
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

## 3. 교정형 RAG 시스템  
먼저 RAG Tool과 선제적 컨텍스트 로드의 차이를 이해해봅시다.  
![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.ko.png)  

### Retrieval-Augmented Generation (RAG)  
RAG는 검색 시스템과 생성 모델을 결합한 방식입니다. 쿼리가 들어오면 검색 시스템이 외부 소스에서 관련 문서나 데이터를 찾아내고, 이 검색된 정보를 생성 모델의 입력에 추가하여 더 정확하고 맥락에 맞는 응답을 생성하도록 돕습니다.  

RAG 시스템에서 에이전트는 지식 기반에서 관련 정보를 검색하고 이를 활용해 적절한 응답이나 행동을 생성합니다.  

### 교정형 RAG 접근법  
교정형 RAG 접근법은 RAG 기법을 활용해 AI 에이전트의 오류를 수정하고 정확도를 높이는 데 초점을 맞춥니다. 이에는 다음이 포함됩니다:  
1. **프롬프트 기법**: 에이전트가 관련 정보를 검색하도록 특정 프롬프트를 사용  
2. **도구**: 에이전트가 검색된 정보의 관련성을 평가하고 정확한 응답을 생성할 수 있도록 하는 알고리즘 및 메커니즘 구현  
3. **평가**: 에이전트 성능을 지속적으로 평가하고 정확도와 효율성을 개선하기 위한 조정 수행  
예시: 검색 에이전트에서의 수정적 RAG  
웹에서 정보를 검색하여 사용자 질문에 답하는 검색 에이전트를 고려해보자. 수정적 RAG 접근법은 다음을 포함할 수 있다:  
1. **프롬프트 기법**: 사용자의 입력을 기반으로 검색 쿼리를 작성한다.  
2. **도구**: 자연어 처리와 머신러닝 알고리즘을 사용하여 검색 결과를 순위 매기고 필터링한다.  
3. **평가**: 검색된 정보의 부정확성을 식별하고 수정하기 위해 사용자 피드백을 분석한다.  

### 여행 에이전트에서의 수정적 RAG  
수정적 RAG(Retrieval-Augmented Generation)는 AI가 정보를 검색하고 생성하는 능력을 향상시키면서 부정확한 부분을 수정한다. 여행 에이전트가 더 정확하고 관련성 높은 여행 추천을 제공하기 위해 수정적 RAG 접근법을 어떻게 사용할 수 있는지 살펴보자.  
이것은 다음을 포함한다:  
- **프롬프트 기법:** 에이전트가 관련 정보를 검색하도록 특정 프롬프트를 사용한다.  
- **도구:** 검색된 정보의 관련성을 평가하고 정확한 응답을 생성할 수 있도록 알고리즘과 메커니즘을 구현한다.  
- **평가:** 에이전트의 성능을 지속적으로 평가하고 정확성과 효율성을 향상시키기 위해 조정한다.  

#### 여행 에이전트에서 수정적 RAG 구현 단계  
1. **초기 사용자 상호작용**  
- 여행 에이전트가 목적지, 여행 날짜, 예산, 관심사 등 사용자의 초기 선호도를 수집한다.  
- 예시: ```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  

2. **정보 검색**  
- 여행 에이전트가 사용자 선호도에 따라 항공편, 숙박, 관광지, 식당에 관한 정보를 검색한다.  
- 예시: ```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  

3. **초기 추천 생성**  
- 여행 에이전트가 검색된 정보를 사용해 개인화된 일정표를 생성한다.  
- 예시: ```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  

4. **사용자 피드백 수집**  
- 여행 에이전트가 초기 추천에 대한 사용자의 피드백을 요청한다.  
- 예시: ```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  

5. **수정적 RAG 프로세스**  
- **프롬프트 기법**: 여행 에이전트가 사용자 피드백을 기반으로 새로운 검색 쿼리를 작성한다.  
- 예시: ```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **도구**: 여행 에이전트가 알고리즘을 사용해 새로운 검색 결과를 순위 매기고 필터링하며, 사용자 피드백에 따른 관련성을 강조한다.  
- 예시: ```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **평가**: 여행 에이전트가 사용자 피드백을 분석하여 추천의 관련성과 정확성을 지속적으로 평가하고 필요한 조정을 한다.  
- 예시: ```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### 실용 예제  
다음은 여행 에이전트에서 수정적 RAG 접근법을 통합한 간단한 파이썬 코드 예제이다:  
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

### 사전 컨텍스트 로드  
사전 컨텍스트 로드는 쿼리를 처리하기 전에 관련된 컨텍스트 또는 배경 정보를 모델에 로드하는 것을 의미한다. 이는 모델이 처음부터 이 정보를 활용할 수 있게 하여 추가 데이터를 검색하지 않고도 더 정보에 기반한 응답을 생성할 수 있도록 돕는다.  
다음은 여행 에이전트 애플리케이션에서 사전 컨텍스트 로드를 구현한 간단한 파이썬 예제이다:  
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

#### 설명  
1. **초기화(`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info` 메서드)**  
사전 로드된 컨텍스트 딕셔너리에서 관련 정보를 가져온다. 사전 컨텍스트를 로드함으로써 여행 에이전트 애플리케이션은 외부 소스에서 실시간으로 정보를 검색하지 않고도 빠르게 사용자 질문에 응답할 수 있어 효율성과 반응성이 향상된다.  

### 목표를 설정한 후 계획 부트스트래핑  
목표를 설정한 후 계획을 부트스트래핑하는 것은 명확한 목표나 결과를 먼저 정의하고 시작하는 것을 의미한다. 이 목표를 초기부터 정의함으로써 모델은 반복 과정 전반에 걸쳐 이 목표를 안내 원칙으로 사용할 수 있다. 이는 각 반복이 원하는 결과에 점점 가까워지도록 하여 과정이 더 효율적이고 집중적이 되도록 돕는다.  
다음은 여행 에이전트를 위한 파이썬 예제로, 반복하기 전에 목표를 설정하여 여행 계획을 부트스트래핑하는 방법이다:  

### 시나리오  
여행 에이전트가 고객을 위한 맞춤형 휴가를 계획하려 한다. 목표는 고객의 선호도와 예산에 따라 만족도를 극대화하는 여행 일정을 만드는 것이다.  

### 단계  
1. 고객의 선호도와 예산을 정의한다.  
2. 이 선호도를 기반으로 초기 계획을 부트스트래핑한다.  
3. 고객 만족도를 최적화하기 위해 계획을 반복적으로 개선한다.  

#### 파이썬 코드  
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

#### 코드 설명  
1. **초기화(`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost` 메서드)**  
현재 계획에 잠재적 신규 목적지를 포함한 총 비용을 계산한다.  

#### 사용 예  
- **초기 계획**: 여행 에이전트가 고객의 관광 선호도와 2000달러 예산을 기반으로 초기 계획을 수립한다.  
- **개선된 계획**: 여행 에이전트가 고객 선호도와 예산에 맞게 계획을 반복적으로 최적화한다.  
명확한 목표(예: 고객 만족도 극대화)를 설정하고 반복하여 계획을 개선함으로써, 여행 에이전트는 고객 맞춤형이고 최적화된 여행 일정을 만들 수 있다. 이 접근법은 여행 계획이 처음부터 고객의 선호도와 예산에 부합하도록 보장하며 반복마다 개선된다.  

### 재순위화 및 점수를 위한 LLM 활용  
대형 언어 모델(LLM)은 검색된 문서나 생성된 응답의 관련성과 품질을 평가하여 재순위화 및 점수 부여에 사용할 수 있다. 작동 방식은 다음과 같다:  
**검색:** 초기 검색 단계에서 쿼리를 기반으로 후보 문서나 응답 세트를 가져온다.  
**재순위화:** LLM이 후보들을 평가하고 관련성과 품질에 따라 재순위화한다. 이 단계는 가장 관련성 높고 품질 좋은 정보가 먼저 제시되도록 보장한다.  
**점수 부여:** LLM이 각 후보에 관련성과 품질을 반영하는 점수를 할당한다. 이를 통해 사용자에게 최적의 응답이나 문서를 선택할 수 있다.  
LLM을 재순위화 및 점수 부여에 활용함으로써 시스템은 더 정확하고 문맥적으로 적절한 정보를 제공하여 전반적인 사용자 경험을 향상시킨다.  
다음은 여행 에이전트가 사용자 선호도를 기반으로 여행지를 재순위화하고 점수 부여하는 데 LLM을 사용하는 파이썬 예제이다:  

#### 시나리오 - 선호도 기반 여행  
여행 에이전트가 고객의 선호도를 바탕으로 최고의 여행지를 추천하려 한다. LLM은 가장 관련성 높은 옵션을 제시하기 위해 여행지를 재순위화하고 점수를 매긴다.  

#### 단계:  
1. 사용자 선호도 수집  
2. 잠재적 여행지 목록 검색  
3. 사용자 선호도를 기반으로 LLM을 사용해 여행지를 재순위화하고 점수 부여  

이전 예제를 Azure OpenAI 서비스를 사용하도록 업데이트하는 방법은 다음과 같다:  

#### 요구사항  
1. Azure 구독이 필요하다.  
2. Azure OpenAI 리소스를 생성하고 API 키를 얻는다.  

#### 예제 파이썬 코드  
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

#### 코드 설명  
- 선호도 예약자  
1. **초기화**: `TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...`를 실제 Azure OpenAI 배포의 엔드포인트 URL로 교체한다.  
LLM을 재순위화 및 점수 부여에 활용함으로써 여행 에이전트는 고객에게 보다 개인화되고 관련성 높은 여행 추천을 제공하여 전반적인 경험을 향상시킬 수 있다.  

### RAG: 프롬프트 기법 vs 도구  
검색 증강 생성(RAG)은 AI 에이전트 개발에서 프롬프트 기법과 도구 두 가지로 모두 활용될 수 있다. 이 둘의 차이를 이해하면 프로젝트에서 RAG를 더 효과적으로 활용할 수 있다.  

#### 프롬프트 기법으로서의 RAG  
**무엇인가?**  
- 프롬프트 기법으로서 RAG는 특정 쿼리나 프롬프트를 작성하여 대규모 코퍼스나 데이터베이스에서 관련 정보를 검색하도록 안내한다. 이 정보를 사용해 응답이나 행동을 생성한다.  

**작동 방식:**  
1. **프롬프트 작성**: 작업이나 사용자 입력에 기반해 잘 구조화된 프롬프트나 쿼리를 만든다.  
2. **정보 검색**: 프롬프트를 사용해 기존 지식 기반이나 데이터셋에서 관련 데이터를 검색한다.  
3. **응답 생성**: 검색된 정보를 생성 AI 모델과 결합해 포괄적이고 일관된 응답을 만든다.  

**여행 에이전트 예시:**  
- 사용자 입력: "파리에서 박물관을 방문하고 싶어요."  
- 프롬프트: "파리의 주요 박물관을 찾아줘."  
- 검색된 정보: 루브르 박물관, 오르세 미술관 등  
- 생성된 응답: "파리의 주요 박물관은 루브르 박물관, 오르세 미술관, 퐁피두 센터입니다."  

#### 도구로서의 RAG  
**무엇인가?**  
- 도구로서 RAG는 검색과 생성 과정을 자동화하는 통합 시스템으로, 개발자가 각 쿼리에 대해 수동으로 프롬프트를 작성하지 않고도 복잡한 AI 기능을 구현할 수 있게 한다.  

**작동 방식:**  
1. **통합**: AI 에이전트 아키텍처에 RAG를 내장하여 검색과 생성 작업을 자동으로 처리한다.  
2. **자동화**: 사용자 입력을 받고 최종 응답을 생성하는 전체 과정을 명시적 프롬프트 없이 관리한다.  
3. **효율성**: 검색과 생성 과정을 간소화하여 더 빠르고 정확한 응답을 제공한다.  

**여행 에이전트 예시:**  
- 사용자 입력: "파리에서 박물관을 방문하고 싶어요."  
- RAG 도구: 자동으로 박물관 정보를 검색하고 응답을 생성한다.  
- 생성된 응답: "파리의 주요 박물관은 루브르 박물관, 오르세 미술관, 퐁피두 센터입니다."  

### 비교  

| 측면               | 프롬프트 기법                              | 도구                                      |  
|--------------------|-------------------------------------------|-------------------------------------------|  
| **수동 vs 자동**    | 각 쿼리에 대해 수동으로 프롬프트 작성       | 검색과 생성 과정이 자동화됨                |  
| **제어**            | 검색 과정에 대한 더 많은 제어 제공           | 검색과 생성 과정을 간소화하고 자동화       |  
| **유연성**          | 특정 필요에 맞춘 맞춤형 프롬프트 작성 가능   | 대규모 구현에 더 효율적                    |  
| **복잡성**          | 프롬프트 작성 및 조정이 필요                 | AI 에이전트 아키텍처에 통합하기 쉬움       |  

### 실용 예제  
**프롬프트 기법 예제:** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**도구 예제:** ```python
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

### 관련성 평가  
관련성 평가는 AI 에이전트 성능의 핵심 요소이다. 이는 에이전트가 검색하고 생성한 정보가 적절하고 정확하며 사용자에게 유용한지 확인한다. AI 에이전트에서 관련성을 평가하는 방법과 실용적인 예제 및 기법을 살펴보자.  

#### 관련성 평가의 핵심 개념  
1. **컨텍스트 인식**:  
- 에이전트는 사용자의 쿼리 맥락을 이해하여 관련 정보를 검색하고 생성해야 한다.  
- 예시: 사용자가 "파리에서 최고의 레스토랑"을 요청하면, 에이전트는 음식 종류나 예산 등 사용자의 선호도를 고려해야 한다.  

2. **정확성**:  
- 에이전트가 제공하는 정보는 사실에 기반하고 최신이어야 한다.  
- 예시: 현재 영업 중이고 리뷰가 좋은 레스토랑을 추천해야 하며, 폐업했거나 오래된 정보는 피해야 한다.  

3. **사용자 의도**:  
-
에이전트는 사용자의 의도를 추론하여 가장 관련성 높은 정보를 제공해야 합니다.  
- 예시: 사용자가 "예산에 맞는 호텔"을 요청하면, 에이전트는 저렴한 옵션을 우선시해야 합니다.  

4. **피드백 루프**:  
- 사용자 피드백을 지속적으로 수집하고 분석하여 에이전트가 관련성 평가 과정을 개선할 수 있도록 합니다.  
- 예시: 이전 추천에 대한 사용자 평가와 피드백을 반영하여 향후 응답을 개선합니다.  

#### 관련성 평가를 위한 실용적 기법  
1. **관련성 점수 부여**:  
- 검색된 각 항목에 대해 사용자의 쿼리 및 선호도와 얼마나 잘 일치하는지에 따라 관련성 점수를 할당합니다.  
- 예시: ```python
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

2. **필터링 및 순위 매기기**:  
- 관련 없는 항목을 필터링하고, 남은 항목들을 관련성 점수에 따라 순위 매깁니다.  
- 예시: ```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

3. **자연어 처리 (NLP)**:  
- NLP 기법을 사용해 사용자의 쿼리를 이해하고 관련 정보를 검색합니다.  
- 예시: ```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

4. **사용자 피드백 통합**:  
- 제공된 추천에 대한 사용자 피드백을 수집하고 이를 기반으로 향후 관련성 평가를 조정합니다.  
- 예시: ```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### 예시: 여행 에이전트에서의 관련성 평가  
여행 에이전트가 여행 추천의 관련성을 평가하는 실제 예시입니다: ```python
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

### 의도 기반 검색  
의도 기반 검색은 사용자의 쿼리 뒤에 숨겨진 목적이나 목표를 이해하고 해석하여 가장 관련성 높고 유용한 정보를 검색 및 생성하는 것을 의미합니다. 이 접근법은 단순히 키워드 매칭을 넘어서 사용자의 실제 필요와 맥락을 파악하는 데 중점을 둡니다.  

#### 의도 기반 검색의 핵심 개념  
1. **사용자 의도 이해**:  
- 사용자 의도는 정보성, 탐색성, 거래성의 세 가지 주요 유형으로 분류할 수 있습니다.  
- **정보성 의도**: 사용자가 특정 주제에 대한 정보를 찾는 경우 (예: "파리에서 최고의 박물관은 어디인가요?").  
- **탐색성 의도**: 사용자가 특정 웹사이트나 페이지로 이동하려는 경우 (예: "루브르 박물관 공식 웹사이트").  
- **거래성 의도**: 사용자가 거래를 수행하려는 경우, 예를 들어 비행기 예약이나 구매 (예: "파리행 항공편 예약").  

2. **맥락 인식**:  
- 사용자의 쿼리 맥락을 분석하여 정확한 의도를 파악합니다. 여기에는 이전 상호작용, 사용자 선호도, 현재 쿼리의 구체적 세부사항이 포함됩니다.  

3. **자연어 처리 (NLP)**:  
- NLP 기법을 사용해 사용자가 제공한 자연어 쿼리를 이해하고 해석합니다. 여기에는 개체 인식, 감정 분석, 쿼리 파싱 등이 포함됩니다.  

4. **개인화**:  
- 사용자의 이력, 선호도, 피드백을 기반으로 검색 결과를 개인화하여 정보의 관련성을 높입니다.  

#### 실용 예시: 여행 에이전트에서 의도 기반 검색  
여행 에이전트를 예로 들어 의도 기반 검색이 어떻게 구현될 수 있는지 살펴봅니다.  
1. **사용자 선호도 수집** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **사용자 의도 이해** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **맥락 인식** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
4. **검색 및 결과 개인화** ```python
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
5. **사용 예시** ```python
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

## 4. 도구로서의 코드 생성  
코드 생성 에이전트는 AI 모델을 사용해 코드를 작성하고 실행하여 복잡한 문제를 해결하고 작업을 자동화합니다.  

### 코드 생성 에이전트  
코드 생성 에이전트는 생성 AI 모델을 사용해 코드를 작성하고 실행합니다. 이들은 다양한 프로그래밍 언어로 코드를 생성 및 실행하여 복잡한 문제를 해결하고, 작업을 자동화하며, 유용한 인사이트를 제공합니다.  

#### 실용적 응용  
1. **자동 코드 생성**: 데이터 분석, 웹 스크래핑, 머신러닝 등 특정 작업을 위한 코드 스니펫을 생성합니다.  
2. **SQL을 RAG로 활용**: 데이터베이스에서 데이터를 검색 및 조작하는 SQL 쿼리를 사용합니다.  
3. **문제 해결**: 알고리즘 최적화나 데이터 분석 같은 특정 문제를 해결하기 위해 코드를 생성하고 실행합니다.  

#### 예시: 데이터 분석을 위한 코드 생성 에이전트  
코드 생성 에이전트를 설계한다고 가정할 때, 작동 방식은 다음과 같습니다:  
1. **과제**: 데이터셋을 분석해 추세와 패턴을 식별합니다.  
2. **단계**:  
- 데이터셋을 데이터 분석 도구에 로드합니다.  
- 데이터를 필터링하고 집계하는 SQL 쿼리를 생성합니다.  
- 쿼리를 실행하고 결과를 가져옵니다.  
- 결과를 사용해 시각화 및 인사이트를 생성합니다.  
3. **필요 자원**: 데이터셋 접근, 데이터 분석 도구, SQL 기능.  
4. **경험 활용**: 과거 분석 결과를 사용해 미래 분석의 정확도와 관련성을 향상시킵니다.  

### 예시: 여행 에이전트를 위한 코드 생성 에이전트  
이번 예시에서는 여행 계획 지원을 위해 코드를 생성하고 실행하는 여행 에이전트 코드를 설계합니다. 이 에이전트는 여행 옵션 검색, 결과 필터링, 일정 작성 등의 작업을 생성 AI로 수행할 수 있습니다.  

#### 코드 생성 에이전트 개요  
1. **사용자 선호도 수집**: 목적지, 여행 날짜, 예산, 관심사 등의 사용자 입력을 수집합니다.  
2. **데이터 검색 코드 생성**: 항공편, 호텔, 명소에 관한 데이터를 검색하는 코드 스니펫을 생성합니다.  
3. **생성된 코드 실행**: 실시간 정보를 가져오기 위해 코드를 실행합니다.  
4. **일정 생성**: 수집된 데이터를 개인화된 여행 일정으로 편집합니다.  
5. **피드백 기반 조정**: 사용자 피드백을 받아 필요 시 코드를 재생성하여 결과를 개선합니다.  

#### 단계별 구현  
1. **사용자 선호도 수집** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **데이터 검색 코드 생성** ```python
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
3. **생성된 코드 실행** ```python
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
4. **일정 생성** ```python
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
5. **피드백 기반 조정** ```python
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

### 환경 인식 및 추론 활용  
테이블 스키마를 기반으로 환경 인식과 추론을 활용하면 쿼리 생성 과정을 향상시킬 수 있습니다. 다음은 그 예시입니다:  
1. **스키마 이해**: 시스템은 테이블 스키마를 이해하고 이를 쿼리 생성에 활용합니다.  
2. **피드백 기반 조정**: 시스템은 피드백을 바탕으로 사용자 선호도를 조정하고, 스키마 내 어떤 필드를 업데이트할지 추론합니다.  
3. **쿼리 생성 및 실행**: 조정된 선호도에 따라 업데이트된 항공편 및 호텔 데이터를 가져오는 쿼리를 생성하고 실행합니다.  

다음은 이를 반영한 업데이트된 Python 코드 예시입니다: ```python
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

#### 설명 - 피드백 기반 예약  
1. **스키마 인식**: `schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` 메서드): 이 메서드는 스키마와 피드백을 바탕으로 조정을 맞춤화합니다.  
4. **쿼리 생성 및 실행**: 시스템은 조정된 선호도에 따라 업데이트된 항공편과 호텔 데이터를 가져오는 코드를 생성하고, 이 쿼리 실행을 시뮬레이션합니다.  
5. **일정 생성**: 시스템은 새로운 항공편, 호텔, 명소 데이터를 바탕으로 업데이트된 일정을 작성합니다.  

시스템을 환경 인식 및 스키마 기반 추론이 가능하도록 만들어 보다 정확하고 관련성 높은 쿼리를 생성함으로써, 더 나은 여행 추천과 개인화된 사용자 경험을 제공합니다.  

### SQL을 Retrieval-Augmented Generation (RAG) 기법으로 활용  
SQL(구조화 질의 언어)은 데이터베이스와 상호작용하는 강력한 도구입니다. RAG 접근법의 일부로 SQL을 사용하면 데이터베이스에서 관련 데이터를 검색하여 AI 에이전트의 응답이나 행동 생성에 활용할 수 있습니다. 여행 에이전트 맥락에서 SQL을 RAG 기법으로 활용하는 방법을 살펴보겠습니다.  

#### 핵심 개념  
1. **데이터베이스 상호작용**:  
- SQL을 사용해 데이터베이스를 쿼리하고, 관련 정보를 검색하며, 데이터를 조작합니다.  
- 예시: 여행 데이터베이스에서 항공편 정보, 호텔 정보, 명소 정보를 가져오는 경우.  

2. **RAG와의 통합**:  
- 사용자 입력과 선호도에 따라 SQL 쿼리를 생성합니다.  
- 검색된 데이터를 사용해 개인화된 추천이나 행동을 생성합니다.  

3. **동적 쿼리 생성**:  
- AI 에이전트가 맥락과 사용자 요구에 맞춰 동적으로 SQL 쿼리를 생성합니다.  
- 예시: 예산, 날짜, 관심사에 따라 결과를 필터링하는 맞춤형 SQL 쿼리 생성.  

#### 응용 분야  
- **자동 코드 생성**: 특정 작업을 위한 코드 스니펫 생성.  
- **SQL을 RAG로 활용**: 데이터 조작을 위한 SQL 쿼리 사용.  
- **문제 해결**: 문제 해결을 위한 코드 생성 및 실행.  

**예시**: 데이터 분석 에이전트  
1. **과제**: 데이터셋에서 추세를 분석합니다.  
2. **단계**:  
- 데이터셋을 로드합니다.  
- 데이터를 필터링하는 SQL 쿼리를 생성합니다.  
- 쿼리를 실행하고 결과를 검색합니다.  
- 시각화 및 인사이트를 생성합니다.  
3. **자원**: 데이터셋 접근, SQL 기능.  
4. **경험 활용**: 과거 결과를 사용해 미래 분석을 개선합니다.  

#### 실용 예시: 여행 에이전트에서 SQL 활용  
1. **사용자 선호도 수집** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **SQL 쿼리 생성** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
3. **SQL 쿼리 실행** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
4. **추천 생성** ```python
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

#### SQL 쿼리 예시  
1. **항공편 쿼리** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
2. **호텔 쿼리** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **명소 쿼리** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

SQL을 RAG 기법의 일부로 활용함으로써, 여행 에이전트와 같은 AI 에이전트는 동적으로 관련 데이터를 검색하고 활용하여 정확하고 개인화된 추천을 제공할 수 있습니다.  

### 메타인지 예시  
메타인지 구현을 보여주기 위해, 문제 해결 과정에서 *자신의 의사결정 과정을 반성*하는 간단한 에이전트를 만들어 보겠습니다. 이 예시에서는 에이전트가 호텔 선택을 최적화하려고 시도하지만, 자신의 추론을 평가하고 오류나 최적 이하의 선택이 있을 때 전략을 조정합니다.  

기본 예시로, 에이전트는 가격과 품질의 조합을 기반으로 호텔을 선택하지만, 결정에 대해 "반성"하고 이에 따라 조정합니다.  

#### 메타인지가 어떻게 구현되는지 설명  
1. **초기 결정**: 에이전트는 품질 영향을 이해하지 못한 채 가장 저렴한 호텔을 선택합니다.  
2. **반성 및 평가**: 초기 선택 후, 사용자 피드백을 사용해 호텔이 "나쁜" 선택인지 확인합니다. 품질이 너무 낮으면 자신의 추론을 반성합니다.  
3. **전략 조정**: 반성을 바탕으로 전략을 조정해 "가장 저렴한" 선택에서 "최고 품질" 선택으로 전환하여 향후 의사결정 과정을 개선합니다.  

예시는 다음과 같습니다: ```python
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

#### 에이전트의 메타인지 능력  
핵심은 에이전트가:  
- 이전 선택과 의사결정 과정을 평가할 수 있다는 점  
- 그 반성을 바탕으로 전략을 조정할 수 있다는 점 (즉, 메타인지의 실제 적용)  

이는 시스템이 내부 피드백을 기반으로 자신의 추론 과정을 조정할 수 있는 간단한 메타인지 형태입니다.  

### 결론  
메타인지는 AI 에이전트의 역량을 크게 향상시킬 수 있는 강력한 도구입니다. 메타인지 기능을 통합함으로써
프로세스를 통해 더 지능적이고 적응력이 뛰어나며 효율적인 에이전트를 설계할 수 있습니다. 추가 리소스를 사용하여 AI 에이전트의 메타인지라는 매혹적인 세계를 더 탐구해 보세요. ## 이전 강의 [멀티 에이전트 디자인 패턴](../08-multi-agent/README.md) ## 다음 강의 [생산 환경의 AI 에이전트](../10-ai-agents-production/README.md)

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문은 해당 언어의 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.