<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e4e06d3b5d6207459a019c05fee5eb4b",
  "translation_date": "2025-05-20T09:34:40+00:00",
  "source_file": "07-planning-design/README.md",
  "language_code": "pl"
}
-->
for szybkiego przeglądu.

Poniższy fragment kodu w Pythonie demonstruje prostego agenta planującego, który rozkłada cel na podzadania i generuje ustrukturyzowany plan:

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

### Agent planujący z orkiestracją wieloagentową

W tym przykładzie agent Semantic Router otrzymuje prośbę od użytkownika (np. „Potrzebuję planu hotelowego na moją podróż.”).

Planista następnie:

* Otrzymuje Plan Hotelowy: Planista przyjmuje wiadomość użytkownika i, na podstawie systemowego promptu (w tym dostępnych informacji o agentach), generuje ustrukturyzowany plan podróży.
* Wymienia Agentów i Ich Narzędzia: Rejestr agentów zawiera listę agentów (np. do lotów, hoteli, wynajmu samochodów i aktywności) wraz z funkcjami lub narzędziami, które oferują.
* Kieruje Plan do Odpowiednich Agentów: W zależności od liczby podzadań planista albo wysyła wiadomość bezpośrednio do dedykowanego agenta (w scenariuszach jednowątkowych), albo koordynuje to za pomocą menedżera czatu grupowego w przypadku współpracy wieloagentowej.
* Podsumowuje Wynik: Na koniec planista podsumowuje wygenerowany plan dla jasności.
Poniższy przykład kodu w Pythonie ilustruje te kroki:

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

Poniżej znajduje się wynik z poprzedniego kodu, który można następnie wykorzystać, aby skierować do `assigned_agent` i podsumować plan podróży dla użytkownika końcowego.

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

Przykładowy notatnik z powyższym kodem jest dostępny [tutaj](../../../07-planning-design/07-autogen.ipynb).

### Planowanie iteracyjne

Niektóre zadania wymagają wymiany informacji lub ponownego planowania, gdzie wynik jednego podzadania wpływa na kolejne. Na przykład, jeśli agent napotka nieoczekiwany format danych podczas rezerwacji lotów, może być zmuszony dostosować swoją strategię przed przejściem do rezerwacji hotelu.

Dodatkowo, opinia użytkownika (np. gdy człowiek zdecyduje, że woli wcześniejszy lot) może wywołać częściowe przeplanowanie. To dynamiczne, iteracyjne podejście zapewnia, że ostateczne rozwiązanie jest zgodne z rzeczywistymi ograniczeniami i zmieniającymi się preferencjami użytkownika.

np. przykładowy kod

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

Dla bardziej zaawansowanego planowania warto sprawdzić Magnetic One

dla rozwiązywania złożonych zadań.

## Podsumowanie

W tym artykule przyjrzeliśmy się przykładzie tworzenia planisty, który dynamicznie wybiera dostępnych agentów. Wynik pracy Planisty rozkłada zadania i przypisuje agentów, aby mogły one zostać wykonane. Zakłada się, że agenci mają dostęp do funkcji/narzędzi niezbędnych do realizacji zadania. Oprócz agentów można wprowadzić inne wzorce, takie jak refleksja, podsumowywanie czy chat round robin, aby jeszcze bardziej dostosować system.

## Dodatkowe zasoby

* AutoGen Magnetic One - system wieloagentowy typu generalist, służący do rozwiązywania złożonych zadań i osiągający imponujące wyniki na wielu wymagających benchmarkach agentów. Odniesienie:

. W tej implementacji orkiestrator tworzy plan specyficzny dla zadania i deleguje te zadania do dostępnych agentów. Oprócz planowania orkiestrator stosuje mechanizm śledzenia postępów zadania i w razie potrzeby ponownie planuje.

## Poprzednia lekcja

[Budowanie wiarygodnych agentów AI](../06-building-trustworthy-agents/README.md)

## Następna lekcja

[Wzorzec projektowy wieloagentowy](../08-multi-agent/README.md)

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najbardziej precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.