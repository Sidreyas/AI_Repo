<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e4e06d3b5d6207459a019c05fee5eb4b",
  "translation_date": "2025-05-20T07:27:51+00:00",
  "source_file": "07-planning-design/README.md",
  "language_code": "tw"
}
-->
[![Planning Design Pattern](../../../translated_images/lesson-7-thumbnail.9769baaa68d1d81ee422d8aa15bd66461ac9f3e38cfaf0ee966cfe4ff20f75ee.tw.png)](https://youtu.be/kPfJ2BrBCMY?si=9pYpPXp0sSbK91Dr)

> _(點擊上方圖片觀看本課影片)_

# 規劃設計

## 介紹

本課將涵蓋

* 定義明確的整體目標，並將複雜任務拆解成可管理的子任務。
* 利用結構化輸出，提升回應的可靠性及機器可讀性。
* 採用事件驅動方式處理動態任務與意外輸入。

## 學習目標

完成本課後，你將了解：

* 如何為 AI 代理設定整體目標，確保其清楚知道需達成的任務。
* 將複雜任務拆解成可管理的子任務，並組織成合邏輯的順序。
* 配備代理合適工具（如搜尋工具或資料分析工具），決定何時及如何使用，並處理突發狀況。
* 評估子任務結果，衡量表現，並持續調整行動以優化最終成果。

## 定義整體目標與拆解任務

![定義目標與任務](../../../translated_images/defining-goals-tasks.dcc1181bbdb194704ae0fb3363371562949e8b03fd2fadc256218aaadf84a9f4.tw.png)

大多數真實世界的任務過於複雜，無法一步完成。AI 代理需要一個簡潔的目標來指引規劃與行動。例如，目標為：

    「產生三天旅遊行程。」

雖然說法簡單，仍需細化。目標越清楚，代理及合作人員越能專注達成正確結果，例如製作包含航班選項、飯店推薦及活動建議的完整行程。

### 任務拆解

大型或複雜任務拆分成較小且目標明確的子任務後，更易管理。
以旅遊行程為例，可以拆解為：

* 航班預訂
* 飯店預訂
* 租車
* 個人化

每個子任務可由專門代理或流程處理。某代理專攻搜尋最佳航班，另一個負責飯店預訂，如此類推。協調或「下游」代理則將結果整合成完整行程給最終用戶。

此模組化方法也便於漸進式改進。例如，可加入專門的美食推薦或在地活動建議代理，並隨時間優化行程。

### 結構化輸出

大型語言模型（LLM）可產生結構化輸出（如 JSON），方便下游代理或服務解析與處理。此功能在多代理環境中特別有用，因為我們可在收到規劃結果後執行後續任務。詳見快速概覽。

以下 Python 範例展示簡單規劃代理如何拆解目標成子任務並生成結構化計畫：

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

### 具多代理協調的規劃代理

此範例中，語意路由代理接收用戶請求（例如：「我需要一個旅遊飯店計畫。」）。

規劃者會：

* 接收飯店計畫：根據系統提示（含可用代理資訊），從用戶訊息產生結構化旅遊計畫。
* 列出代理及其工具：代理註冊表包含多個代理（如航班、飯店、租車、活動）及其功能或工具。
* 將計畫分派給相應代理：視子任務數量，規劃者會直接發訊息給專門代理（單一任務情況）或透過群組聊天管理協調多代理合作。
* 彙整結果摘要：最後，規劃者整理產生的計畫以便清晰呈現。
以下 Python 程式碼示範這些步驟：

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

以下為前述程式輸出，你可利用此結構化結果將任務路由至 `assigned_agent`，並將旅遊計畫摘要呈現給最終用戶。

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

包含上述程式碼範例的示範筆記本可參考[這裡](../../../07-planning-design/07-autogen.ipynb)。

### 迭代式規劃

部分任務需來回調整或重新規劃，因為一個子任務的結果會影響下一步。例如，代理在訂航班時發現意外的資料格式，可能需先調整策略再進行飯店預訂。

此外，用戶回饋（如使用者決定想搭較早航班）也會觸發部分重新規劃。此動態且迭代的方式，確保最終方案符合現實限制及用戶偏好變化。

範例程式碼

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

更完整的規劃請參考 Magnetic One

## 總結

本文示範如何建立能動態選擇定義代理的規劃者。規劃者輸出將任務拆解並指派代理執行，假設代理可使用執行任務所需的功能與工具。除代理外，也可加入反思、摘要、輪詢聊天等模式進一步自訂。

## 其他資源

* AutoGen Magnetic One - 一個通用多代理系統，能解決複雜任務，在多項挑戰性代理基準測試中表現優異。參考資料：

. 在此實作中，協調者會建立任務專屬計畫，並將任務委派給可用代理。此外，協調者還會使用追蹤機制監控任務進度，並在需要時重新規劃。

## 上一課

[打造可信賴的 AI 代理](../06-building-trustworthy-agents/README.md)

## 下一課

[多代理設計模式](../08-multi-agent/README.md)

**免責聲明**：  
本文件係使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 所翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不精確之處。原始文件之母語版本應視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯所產生之任何誤解或誤釋負責。