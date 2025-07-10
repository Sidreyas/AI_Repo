<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e4e06d3b5d6207459a019c05fee5eb4b",
  "translation_date": "2025-05-20T08:37:07+00:00",
  "source_file": "07-planning-design/README.md",
  "language_code": "ko"
}
-->
간단한 개요를 위해 참고하세요.

다음 파이썬 예제는 목표를 하위 작업으로 분해하고 구조화된 계획을 생성하는 간단한 계획 에이전트를 보여줍니다:

```python
from pydantic import BaseModel
from enum import Enum
from typing import List, Optional, Union
import json
import os
from typing import Optional
from pprint import pprint
from autogen_core.models import UserMessage, SystemMessage, AssistantMessage
from autogen_ext.models.azure import AzureAIChatCompletionClient
from azure.core.credentials import AzureKeyCredential

class AgentEnum(str, Enum):
    FlightBooking = "flight_booking"
    HotelBooking = "hotel_booking"
    CarRental = "car_rental"
    ActivitiesBooking = "activities_booking"
    DestinationInfo = "destination_info"
    DefaultAgent = "default_agent"
    GroupChatManager = "group_chat_manager"

# Travel SubTask Model
class TravelSubTask(BaseModel):
    task_details: str
    assigned_agent: AgentEnum  # we want to assign the task to the agent

class TravelPlan(BaseModel):
    main_task: str
    subtasks: List[TravelSubTask]
    is_greeting: bool

client = AzureAIChatCompletionClient(
    model="gpt-4o-mini",
    endpoint="https://models.inference.ai.azure.com",
    # To authenticate with the model you will need to generate a personal access token (PAT) in your GitHub settings.
    # Create your PAT token by following instructions here: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
    credential=AzureKeyCredential(os.environ["GITHUB_TOKEN"]),
    model_info={
        "json_output": False,
        "function_calling": True,
        "vision": True,
        "family": "unknown",
    },
)

# Define the user message
messages = [
    SystemMessage(content="""You are an planner agent.
    Your job is to decide which agents to run based on the user's request.
                      Provide your response in JSON format with the following structure:
{'main_task': 'Plan a family trip from Singapore to Melbourne.',
 'subtasks': [{'assigned_agent': 'flight_booking',
               'task_details': 'Book round-trip flights from Singapore to '
                               'Melbourne.'}
    Below are the available agents specialised in different tasks:
    - FlightBooking: For booking flights and providing flight information
    - HotelBooking: For booking hotels and providing hotel information
    - CarRental: For booking cars and providing car rental information
    - ActivitiesBooking: For booking activities and providing activity information
    - DestinationInfo: For providing information about destinations
    - DefaultAgent: For handling general requests""", source="system"),
    UserMessage(
        content="Create a travel plan for a family of 2 kids from Singapore to Melboune", source="user"),
]

response = await client.create(messages=messages, extra_create_args={"response_format": 'json_object'})

response_content: Optional[str] = response.content if isinstance(
    response.content, str) else None
if response_content is None:
    raise ValueError("Response content is not a valid JSON string" )

pprint(json.loads(response_content))

# # Ensure the response content is a valid JSON string before loading it
# response_content: Optional[str] = response.content if isinstance(
#     response.content, str) else None
# if response_content is None:
#     raise ValueError("Response content is not a valid JSON string")

# # Print the response content after loading it as JSON
# pprint(json.loads(response_content))

# Validate the response content with the MathReasoning model
# TravelPlan.model_validate(json.loads(response_content))
```

### 다중 에이전트 조율이 포함된 계획 에이전트

이 예제에서는 Semantic Router Agent가 사용자 요청(예: "여행을 위한 호텔 계획이 필요해요.")을 받습니다.

계획자는 다음과 같이 진행합니다:

* 호텔 계획 수신: 계획자는 사용자 메시지를 받고, 시스템 프롬프트(사용 가능한 에이전트 정보 포함)를 기반으로 구조화된 여행 계획을 생성합니다.
* 에이전트 및 도구 목록 작성: 에이전트 레지스트리는 항공편, 호텔, 렌터카, 활동 등과 같은 에이전트 목록과 그들이 제공하는 기능이나 도구를 보유합니다.
* 계획을 해당 에이전트에 라우팅: 하위 작업 수에 따라, 계획자는 단일 작업인 경우 전용 에이전트에 직접 메시지를 보내거나, 다중 에이전트 협업을 위해 그룹 채팅 관리자를 통해 조율합니다.
* 결과 요약: 마지막으로 계획자는 생성된 계획을 명확하게 요약합니다.
다음 파이썬 코드 예제는 이 과정을 보여줍니다:

```python

from pydantic import BaseModel

from enum import Enum
from typing import List, Optional, Union

class AgentEnum(str, Enum):
    FlightBooking = "flight_booking"
    HotelBooking = "hotel_booking"
    CarRental = "car_rental"
    ActivitiesBooking = "activities_booking"
    DestinationInfo = "destination_info"
    DefaultAgent = "default_agent"
    GroupChatManager = "group_chat_manager"

# Travel SubTask Model

class TravelSubTask(BaseModel):
    task_details: str
    assigned_agent: AgentEnum # we want to assign the task to the agent

class TravelPlan(BaseModel):
    main_task: str
    subtasks: List[TravelSubTask]
    is_greeting: bool
import json
import os
from typing import Optional

from autogen_core.models import UserMessage, SystemMessage, AssistantMessage
from autogen_ext.models.openai import AzureOpenAIChatCompletionClient

# Create the client with type-checked environment variables

client = AzureOpenAIChatCompletionClient(
    azure_deployment=os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME"),
    model=os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME"),
    api_version=os.getenv("AZURE_OPENAI_API_VERSION"),
    azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT"),
    api_key=os.getenv("AZURE_OPENAI_API_KEY"),
)

from pprint import pprint

# Define the user message

messages = [
    SystemMessage(content="""You are an planner agent.
    Your job is to decide which agents to run based on the user's request.
    Below are the available agents specialized in different tasks:
    - FlightBooking: For booking flights and providing flight information
    - HotelBooking: For booking hotels and providing hotel information
    - CarRental: For booking cars and providing car rental information
    - ActivitiesBooking: For booking activities and providing activity information
    - DestinationInfo: For providing information about destinations
    - DefaultAgent: For handling general requests""", source="system"),
    UserMessage(content="Create a travel plan for a family of 2 kids from Singapore to Melbourne", source="user"),
]

response = await client.create(messages=messages, extra_create_args={"response_format": TravelPlan})

# Ensure the response content is a valid JSON string before loading it

response_content: Optional[str] = response.content if isinstance(response.content, str) else None
if response_content is None:
    raise ValueError("Response content is not a valid JSON string")

# Print the response content after loading it as JSON

pprint(json.loads(response_content))
```

아래는 이전 코드의 출력 예시이며, 이 구조화된 출력을 사용해 `assigned_agent`에 라우팅하고 여행 계획을 최종 사용자에게 요약할 수 있습니다.

```json
{
    "is_greeting": "False",
    "main_task": "Plan a family trip from Singapore to Melbourne.",
    "subtasks": [
        {
            "assigned_agent": "flight_booking",
            "task_details": "Book round-trip flights from Singapore to Melbourne."
        },
        {
            "assigned_agent": "hotel_booking",
            "task_details": "Find family-friendly hotels in Melbourne."
        },
        {
            "assigned_agent": "car_rental",
            "task_details": "Arrange a car rental suitable for a family of four in Melbourne."
        },
        {
            "assigned_agent": "activities_booking",
            "task_details": "List family-friendly activities in Melbourne."
        },
        {
            "assigned_agent": "destination_info",
            "task_details": "Provide information about Melbourne as a travel destination."
        }
    ]
}
```

이전 코드 예제가 포함된 노트북은 [여기](../../../07-planning-design/07-autogen.ipynb)에서 확인할 수 있습니다.

### 반복적 계획

일부 작업은 하위 작업의 결과가 다음 작업에 영향을 주는 상호작용이나 재계획이 필요합니다. 예를 들어, 에이전트가 항공편 예약 중 예상치 못한 데이터 형식을 발견하면 호텔 예약으로 넘어가기 전에 전략을 수정해야 할 수 있습니다.

또한, 사용자 피드백(예: 사용자가 더 이른 항공편을 선호한다고 결정하는 경우)은 부분적인 재계획을 유발할 수 있습니다. 이러한 동적이고 반복적인 접근 방식은 최종 결과가 실제 제약과 변화하는 사용자 선호에 부합하도록 보장합니다.

예: 샘플 코드

```python
from autogen_core.models import UserMessage, SystemMessage, AssistantMessage
#.. same as previous code and pass on the user history, current plan
messages = [
    SystemMessage(content="""You are a planner agent to optimize the
    Your job is to decide which agents to run based on the user's request.
    Below are the available agents specialized in different tasks:
    - FlightBooking: For booking flights and providing flight information
    - HotelBooking: For booking hotels and providing hotel information
    - CarRental: For booking cars and providing car rental information
    - ActivitiesBooking: For booking activities and providing activity information
    - DestinationInfo: For providing information about destinations
    - DefaultAgent: For handling general requests""", source="system"),
    UserMessage(content="Create a travel plan for a family of 2 kids from Singapore to Melbourne", source="user"),
    AssistantMessage(content=f"Previous travel plan - {TravelPlan}", source="assistant")
]
# .. re-plan and send the tasks to respective agents
```

더 포괄적인 계획을 위해 Magnetic One을 확인해 보세요.

복잡한 작업 해결을 위한.

## 요약

이번 글에서는 정의된 사용 가능한 에이전트를 동적으로 선택할 수 있는 계획자를 만드는 방법의 예를 살펴보았습니다. 계획자의 출력은 작업을 분해하고 에이전트에 할당하여 실행할 수 있도록 합니다. 에이전트가 작업 수행에 필요한 기능/도구에 접근할 수 있다고 가정합니다. 에이전트 외에도 반영(reflection), 요약기(summarizer), 라운드 로빈 채팅과 같은 다른 패턴을 포함해 더욱 맞춤화할 수 있습니다.

## 추가 자료

* AutoGen Magnetic One - 복잡한 작업 해결을 위한 범용 다중 에이전트 시스템으로, 여러 도전적인 에이전트 벤치마크에서 인상적인 결과를 달성했습니다. 참고:

이 구현에서는 조율자가 작업별 계획을 만들고 이를 사용 가능한 에이전트에 위임합니다. 계획뿐 아니라 조율자는 작업 진행 상황을 추적하는 메커니즘도 사용하며 필요에 따라 재계획을 수행합니다.

## 이전 강의

[신뢰할 수 있는 AI 에이전트 구축](../06-building-trustworthy-agents/README.md)

## 다음 강의

[다중 에이전트 설계 패턴](../08-multi-agent/README.md)

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원본 문서의 원어 버전을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인한 오해나 잘못된 해석에 대해서는 책임을 지지 않습니다.