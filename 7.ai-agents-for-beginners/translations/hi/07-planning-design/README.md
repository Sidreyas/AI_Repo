<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e4e06d3b5d6207459a019c05fee5eb4b",
  "translation_date": "2025-05-20T09:45:42+00:00",
  "source_file": "07-planning-design/README.md",
  "language_code": "hi"
}
-->
[![Planning Design Pattern](../../../translated_images/lesson-7-thumbnail.9769baaa68d1d81ee422d8aa15bd66461ac9f3e38cfaf0ee966cfe4ff20f75ee.hi.png)](https://youtu.be/kPfJ2BrBCMY?si=9pYpPXp0sSbK91Dr)

> _(इस पाठ का वीडियो देखने के लिए ऊपर दी गई छवि पर क्लिक करें)_

# योजना डिजाइन

## परिचय

इस पाठ में निम्नलिखित विषय कवर किए जाएंगे:

* एक स्पष्ट समग्र लक्ष्य निर्धारित करना और जटिल कार्य को प्रबंधनीय कार्यों में विभाजित करना।
* अधिक विश्वसनीय और मशीन-पठनीय प्रतिक्रियाओं के लिए संरचित आउटपुट का उपयोग करना।
* गतिशील कार्यों और अप्रत्याशित इनपुट को संभालने के लिए ईवेंट-चालित दृष्टिकोण लागू करना।

## सीखने के लक्ष्य

इस पाठ को पूरा करने के बाद, आप निम्न बातों को समझ पाएंगे:

* एक AI एजेंट के लिए समग्र लक्ष्य की पहचान करना और सेट करना, जिससे उसे स्पष्ट रूप से पता हो कि क्या प्राप्त करना है।
* जटिल कार्य को छोटे, प्रबंधनीय उप-कार्य में विभाजित करना और उन्हें तार्किक अनुक्रम में व्यवस्थित करना।
* एजेंट्स को सही टूल्स (जैसे, खोज उपकरण या डेटा एनालिटिक्स टूल्स) से लैस करना, यह तय करना कि कब और कैसे उनका उपयोग किया जाए, और अप्रत्याशित परिस्थितियों को संभालना।
* उप-कार्य के परिणामों का मूल्यांकन करना, प्रदर्शन को मापना, और अंतिम आउटपुट को बेहतर बनाने के लिए क्रियाओं में सुधार करना।

## समग्र लक्ष्य निर्धारित करना और कार्य को विभाजित करना

![लक्ष्य और कार्य निर्धारित करना](../../../translated_images/defining-goals-tasks.dcc1181bbdb194704ae0fb3363371562949e8b03fd2fadc256218aaadf84a9f4.hi.png)

अधिकांश वास्तविक दुनिया के कार्य इतने जटिल होते हैं कि उन्हें एक ही चरण में पूरा करना मुश्किल होता है। एक AI एजेंट को अपनी योजना और क्रियाओं का मार्गदर्शन करने के लिए एक संक्षिप्त उद्देश्य की आवश्यकता होती है। उदाहरण के लिए, लक्ष्य लें:

    "3-दिन की यात्रा कार्यक्रम तैयार करें।"

हालांकि यह लक्ष्य सरल लगता है, फिर भी इसे परिष्कृत करने की जरूरत है। जितना स्पष्ट लक्ष्य होगा, एजेंट (और कोई भी मानव सहयोगी) उतना ही बेहतर सही परिणाम प्राप्त करने पर ध्यान केंद्रित कर पाएगा, जैसे कि उड़ान विकल्प, होटल सुझाव, और गतिविधि सिफारिशों के साथ एक व्यापक यात्रा कार्यक्रम बनाना।

### कार्य विभाजन

बड़े या जटिल कार्य छोटे, लक्ष्य-उन्मुख उप-कार्य में विभाजित होने पर अधिक प्रबंधनीय हो जाते हैं।
यात्रा कार्यक्रम के उदाहरण के लिए, आप लक्ष्य को निम्नलिखित उप-कार्य में विभाजित कर सकते हैं:

* फ्लाइट बुकिंग
* होटल बुकिंग
* कार रेंटल
* व्यक्तिगत अनुकूलन

प्रत्येक उप-कार्य को समर्पित एजेंट्स या प्रक्रियाओं द्वारा संभाला जा सकता है। एक एजेंट सबसे अच्छी फ्लाइट डील खोजने में विशेषज्ञ हो सकता है, दूसरा होटल बुकिंग पर केंद्रित हो सकता है, और इसी तरह। एक समन्वयक या "डाउनस्ट्रीम" एजेंट इन परिणामों को एक समग्र यात्रा कार्यक्रम में संकलित कर अंतिम उपयोगकर्ता को प्रदान कर सकता है।

यह मॉड्यूलर दृष्टिकोण क्रमिक सुधारों की भी अनुमति देता है। उदाहरण के लिए, आप भोजन सिफारिशों या स्थानीय गतिविधि सुझावों के लिए विशेषज्ञ एजेंट जोड़ सकते हैं और समय के साथ यात्रा कार्यक्रम को बेहतर बना सकते हैं।

### संरचित आउटपुट

बड़े भाषा मॉडल (LLMs) संरचित आउटपुट (जैसे JSON) उत्पन्न कर सकते हैं, जिसे डाउनस्ट्रीम एजेंट या सेवाओं द्वारा पार्स और प्रोसेस करना आसान होता है। यह विशेष रूप से बहु-एजेंट संदर्भ में उपयोगी है, जहां हम योजना आउटपुट प्राप्त होने के बाद इन कार्यों को क्रियान्वित कर सकते हैं। अधिक जानकारी के लिए देखें।

निम्न Python स्निपेट एक सरल योजना एजेंट को दिखाता है जो लक्ष्य को उप-कार्य में विभाजित करता है और एक संरचित योजना उत्पन्न करता है:

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

### मल्टी-एजेंट समन्वयन के साथ योजना एजेंट

इस उदाहरण में, एक सेमांटिक राउटर एजेंट उपयोगकर्ता के अनुरोध (जैसे, "मुझे मेरी यात्रा के लिए होटल योजना चाहिए।") प्राप्त करता है।

योजनाकार फिर:

* होटल योजना प्राप्त करता है: उपयोगकर्ता के संदेश को लेकर, सिस्टम प्रॉम्प्ट (जिसमें उपलब्ध एजेंट विवरण शामिल हैं) के आधार पर, एक संरचित यात्रा योजना तैयार करता है।
* एजेंट्स और उनके टूल्स की सूची बनाता है: एजेंट रजिस्ट्री में एजेंट्स की सूची होती है (जैसे फ्लाइट, होटल, कार रेंटल, और गतिविधियों के लिए) साथ ही उनके द्वारा प्रदान किए जाने वाले फंक्शन या टूल्स।
* योजना को संबंधित एजेंट्स को भेजता है: उप-कार्य की संख्या के आधार पर, योजनाकार या तो संदेश को सीधे समर्पित एजेंट को भेजता है (एकल कार्य के लिए) या मल्टी-एजेंट सहयोग के लिए समूह चैट प्रबंधक के माध्यम से समन्वय करता है।
* परिणाम का सारांश प्रस्तुत करता है: अंत में, योजनाकार उत्पन्न योजना का सारांश प्रस्तुत करता है।

निम्न Python कोड इस प्रक्रिया को दर्शाता है:

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

निम्नलिखित आउटपुट पिछले कोड से प्राप्त है और आप इस संरचित आउटपुट का उपयोग `assigned_agent` को मार्गित करने और अंतिम उपयोगकर्ता के लिए यात्रा योजना का सारांश प्रस्तुत करने के लिए कर सकते हैं।

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

पिछले कोड नमूने के साथ एक उदाहरण नोटबुक [यहाँ](../../../07-planning-design/07-autogen.ipynb) उपलब्ध है।

### पुनरावृत्त योजना

कुछ कार्यों के लिए बार-बार बातचीत या पुनः योजना बनाना आवश्यक होता है, जहां एक उप-कार्य का परिणाम अगले को प्रभावित करता है। उदाहरण के लिए, यदि एजेंट फ्लाइट बुकिंग करते समय अप्रत्याशित डेटा फॉर्मेट पाता है, तो उसे होटल बुकिंग शुरू करने से पहले अपनी रणनीति बदलनी पड़ सकती है।

इसके अलावा, उपयोगकर्ता प्रतिक्रिया (जैसे, कोई व्यक्ति यह तय करता है कि वह पहले की फ्लाइट पसंद करता है) आंशिक पुनः योजना को ट्रिगर कर सकती है। यह गतिशील, पुनरावृत्त दृष्टिकोण सुनिश्चित करता है कि अंतिम समाधान वास्तविक दुनिया की सीमाओं और बदलती उपयोगकर्ता प्राथमिकताओं के अनुरूप हो।

उदाहरण कोड:

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

अधिक व्यापक योजना के लिए Magnetic One देखें।

## सारांश

इस लेख में हमने देखा कि कैसे हम एक ऐसा योजनाकार बना सकते हैं जो उपलब्ध एजेंट्स को गतिशील रूप से चुन सकता है। योजनाकार का आउटपुट कार्यों को विभाजित करता है और एजेंट्स को असाइन करता है ताकि वे उन्हें निष्पादित कर सकें। यह मान लिया जाता है कि एजेंट्स के पास उन कार्यों को करने के लिए आवश्यक फंक्शन/टूल्स तक पहुंच है। एजेंट्स के अलावा, आप प्रतिबिंब, सारांशक, और राउंड रॉबिन चैट जैसे अन्य पैटर्न भी शामिल कर सकते हैं ताकि और अधिक अनुकूलन किया जा सके।

## अतिरिक्त संसाधन

* AutoGen Magnetic One - एक सामान्य मल्टी-एजेंट सिस्टम जो जटिल कार्यों को हल करने के लिए बनाया गया है और कई चुनौतीपूर्ण एजेंटिक बेंचमार्क्स पर प्रभावशाली परिणाम प्राप्त कर चुका है। संदर्भ:

. इस कार्यान्वयन में, ऑर्केस्ट्रेटर कार्य-विशिष्ट योजना बनाता है और इन कार्यों को उपलब्ध एजेंट्स को सौंपता है। योजना बनाने के अलावा, ऑर्केस्ट्रेटर एक ट्रैकिंग तंत्र भी उपयोग करता है जो कार्य की प्रगति की निगरानी करता है और आवश्यकतानुसार पुनः योजना बनाता है।

## पिछला पाठ

[विश्वसनीय AI एजेंट बनाना](../06-building-trustworthy-agents/README.md)

## अगला पाठ

[मल्टी-एजेंट डिजाइन पैटर्न](../08-multi-agent/README.md)

**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवाद में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।