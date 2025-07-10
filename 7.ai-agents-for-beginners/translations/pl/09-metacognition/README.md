<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T09:37:25+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "pl"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.pl.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(Kliknij powyższy obraz, aby obejrzeć wideo z tej lekcji)_
# Metapoznanie w agentach AI

## Wprowadzenie

Witamy na lekcji o metapoznaniu w agentach AI! Ten rozdział jest przeznaczony dla początkujących, którzy są ciekawi, jak agenci AI mogą rozważać własne procesy myślowe. Po zakończeniu tej lekcji zrozumiesz kluczowe pojęcia i będziesz wyposażony w praktyczne przykłady, które pozwolą zastosować metapoznanie w projektowaniu agentów AI.

## Cele nauki

Po ukończeniu tej lekcji będziesz potrafił:
1. Zrozumieć konsekwencje pętli rozumowania w definicjach agentów.
2. Wykorzystać techniki planowania i ewaluacji, aby wspierać agentów samokorygujących się.
3. Stworzyć własnych agentów zdolnych do manipulacji kodem w celu realizacji zadań.

## Wprowadzenie do metapoznania

Metapoznanie odnosi się do wyższych procesów poznawczych, które obejmują myślenie o własnym myśleniu. Dla agentów AI oznacza to zdolność do oceny i dostosowywania swoich działań na podstawie samoświadomości i wcześniejszych doświadczeń.

Metapoznanie, czyli „myślenie o myśleniu”, to ważna koncepcja w rozwoju agentowych systemów AI. Polega na tym, że systemy AI są świadome własnych wewnętrznych procesów i potrafią monitorować, regulować oraz dostosowywać swoje zachowanie. Podobnie jak my, gdy „czytamy sytuację” lub analizujemy problem.

Ta samoświadomość pomaga systemom AI podejmować lepsze decyzje, identyfikować błędy i z czasem poprawiać swoją wydajność — co nawiązuje do testu Turinga i debaty, czy AI przejmie kontrolę.

W kontekście agentowych systemów AI metapoznanie pomaga rozwiązywać kilka wyzwań, takich jak:
- Transparentność: Zapewnienie, że systemy AI potrafią wyjaśnić swoje rozumowanie i decyzje.
- Rozumowanie: Zwiększenie zdolności systemów AI do syntezowania informacji i podejmowania trafnych decyzji.
- Adaptacja: Umożliwienie systemom AI dostosowywania się do nowych środowisk i zmieniających się warunków.
- Percepcja: Poprawa dokładności systemów AI w rozpoznawaniu i interpretacji danych ze środowiska.

### Czym jest metapoznanie?

Metapoznanie, czyli „myślenie o myśleniu”, to wyższy proces poznawczy obejmujący samoświadomość i samoregulację własnych procesów poznawczych. W dziedzinie AI metapoznanie pozwala agentom oceniać i dostosowywać swoje strategie i działania, co prowadzi do lepszego rozwiązywania problemów i podejmowania decyzji.

Zrozumienie metapoznania pozwala projektować agentów AI, którzy są nie tylko bardziej inteligentni, ale też bardziej elastyczni i efektywni.

W prawdziwym metapoznaniu AI wyraźnie rozważa własne rozumowanie.  
Przykład: „Wybrałem tańsze loty, ponieważ... mogę jednak tracić bezpośrednie połączenia, więc sprawdzę to jeszcze raz.”  
Śledzenie, jak i dlaczego wybrał konkretną trasę.  
- Zauważenie, że popełnił błąd, bo zbytnio polegał na preferencjach użytkownika z poprzedniego razu, więc modyfikuje swoją strategię podejmowania decyzji, a nie tylko końcowe rekomendacje.  
- Diagnozowanie wzorców, np. „Za każdym razem, gdy użytkownik mówi 'za tłoczno', powinienem nie tylko usuwać niektóre atrakcje, ale także przemyśleć, że moja metoda wyboru 'najlepszych atrakcji' jest błędna, jeśli zawsze oceniam je według popularności.”

### Znaczenie metapoznania w agentach AI

Metapoznanie odgrywa kluczową rolę w projektowaniu agentów AI z kilku powodów:

![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.pl.png)

- Samorefleksja: Agenci mogą oceniać własną wydajność i identyfikować obszary do poprawy.
- Adaptacyjność: Agenci mogą modyfikować swoje strategie na podstawie wcześniejszych doświadczeń i zmieniających się warunków.
- Korekta błędów: Agenci potrafią samodzielnie wykrywać i poprawiać błędy, co prowadzi do dokładniejszych wyników.
- Zarządzanie zasobami: Agenci mogą optymalizować wykorzystanie zasobów, takich jak czas i moc obliczeniowa, poprzez planowanie i ocenę swoich działań.

## Składniki agenta AI

Zanim przejdziemy do procesów metapoznawczych, warto zrozumieć podstawowe elementy agenta AI. Typowy agent AI składa się z:
- Persona: Osobowość i cechy agenta, które definiują sposób jego interakcji z użytkownikami.
- Narzędzia: Możliwości i funkcje, które agent może wykonywać.
- Umiejętności: Wiedza i doświadczenie, które posiada agent.

Te składniki współpracują, tworząc „jednostkę ekspertyzy” zdolną do realizacji określonych zadań.

**Przykład**: Wyobraź sobie agenta podróży, który nie tylko planuje wakacje, ale także dostosowuje trasę na podstawie danych w czasie rzeczywistym i doświadczeń z poprzednich podróży klientów.

### Przykład: Metapoznanie w usłudze agenta podróży

Wyobraź sobie, że projektujesz usługę agenta podróży zasilaną AI. Ten agent, „Travel Agent”, pomaga użytkownikom planować wakacje. Aby wprowadzić metapoznanie, Travel Agent musi oceniać i dostosowywać swoje działania na podstawie samoświadomości i wcześniejszych doświadczeń.

Oto, jak metapoznanie może odegrać rolę:

#### Aktualne zadanie

Aktualnym zadaniem jest pomoc użytkownikowi w zaplanowaniu wycieczki do Paryża.

#### Kroki do wykonania zadania

1. **Zbieranie preferencji użytkownika**: Zapytaj użytkownika o daty podróży, budżet, zainteresowania (np. muzea, kuchnia, zakupy) oraz wszelkie specjalne wymagania.
2. **Pozyskanie informacji**: Wyszukaj opcje lotów, noclegów, atrakcji i restauracji odpowiadające preferencjom użytkownika.
3. **Generowanie rekomendacji**: Przedstaw spersonalizowany plan podróży z informacjami o lotach, rezerwacjach hoteli i proponowanych aktywnościach.
4. **Dostosowanie na podstawie opinii**: Poproś użytkownika o opinię na temat rekomendacji i wprowadź niezbędne zmiany.

#### Wymagane zasoby

- Dostęp do baz danych lotów i hoteli.
- Informacje o paryskich atrakcjach i restauracjach.
- Dane zwrotne od użytkowników z poprzednich interakcji.

#### Doświadczenie i samorefleksja

Travel Agent wykorzystuje metapoznanie, aby ocenić swoją skuteczność i uczyć się na podstawie wcześniejszych doświadczeń. Na przykład:
1. **Analiza opinii użytkowników**: Travel Agent przegląda opinie, aby określić, które rekomendacje były dobrze przyjęte, a które nie. Na tej podstawie dostosowuje przyszłe sugestie.
2. **Adaptacyjność**: Jeśli użytkownik wcześniej wspomniał, że nie lubi tłocznych miejsc, Travel Agent unika polecania popularnych atrakcji w godzinach szczytu.
3. **Korekta błędów**: Jeśli Travel Agent popełnił błąd, np. zasugerował hotel, który był już pełny, uczy się dokładniej sprawdzać dostępność przed rekomendacją.

#### Praktyczny przykład dla programisty

Oto uproszczony przykład, jak może wyglądać kod Travel Agent z uwzględnieniem metapoznania:  
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

#### Dlaczego metapoznanie ma znaczenie

- **Samorefleksja**: Agenci mogą analizować swoją wydajność i identyfikować obszary do poprawy.  
- **Adaptacyjność**: Agenci mogą modyfikować strategie na podstawie opinii i zmieniających się warunków.  
- **Korekta błędów**: Agenci mogą samodzielnie wykrywać i naprawiać błędy.  
- **Zarządzanie zasobami**: Agenci mogą optymalizować wykorzystanie zasobów, takich jak czas i moc obliczeniowa.

Dzięki metapoznaniu Travel Agent może oferować bardziej spersonalizowane i precyzyjne rekomendacje podróży, co podnosi ogólne doświadczenie użytkownika.

---

## 2. Planowanie w agentach

Planowanie to kluczowy element zachowania agenta AI. Polega na wyznaczeniu kroków potrzebnych do osiągnięcia celu, uwzględniając aktualny stan, zasoby i możliwe przeszkody.

### Elementy planowania

- **Aktualne zadanie**: Jasno określ zadanie.  
- **Kroki do wykonania zadania**: Podziel zadanie na łatwe do zarządzania etapy.  
- **Wymagane zasoby**: Zidentyfikuj potrzebne zasoby.  
- **Doświadczenie**: Wykorzystaj wcześniejsze doświadczenia do planowania.

**Przykład**: Oto kroki, które Travel Agent musi podjąć, aby skutecznie pomóc użytkownikowi w planowaniu podróży:

### Kroki dla Travel Agent

1. **Zbieranie preferencji użytkownika**  
- Zapytaj o szczegóły dotyczące dat podróży, budżetu, zainteresowań i specjalnych wymagań.  
- Przykłady: „Kiedy planujesz podróż?” „Jaki masz budżet?” „Jakie aktywności lubisz podczas wakacji?”

2. **Pozyskanie informacji**  
- Wyszukaj odpowiednie opcje podróży zgodne z preferencjami użytkownika.  
- **Loty**: Znajdź dostępne loty mieszczące się w budżecie i terminach użytkownika.  
- **Noclegi**: Znajdź hotele lub wynajmy odpowiadające preferencjom lokalizacji, ceny i udogodnień.  
- **Atrakcje i restauracje**: Zidentyfikuj popularne atrakcje, aktywności i miejsca do jedzenia zgodne z zainteresowaniami użytkownika.

3. **Generowanie rekomendacji**  
- Stwórz spersonalizowany plan podróży.  
- Podaj szczegóły takie jak opcje lotów, rezerwacje hotelowe i proponowane aktywności, dostosowując je do preferencji użytkownika.

4. **Przedstawienie planu użytkownikowi**  
- Udostępnij plan podróży użytkownikowi do oceny.  
- Przykład: „Oto proponowany plan Twojej wycieczki do Paryża. Zawiera szczegóły lotów, rezerwacje hoteli oraz listę rekomendowanych atrakcji i restauracji. Daj znać, co myślisz!”

5. **Zbieranie opinii**  
- Zapytaj użytkownika o opinię na temat planu.  
- Przykłady: „Czy podobają Ci się opcje lotów?” „Czy hotel spełnia Twoje oczekiwania?” „Czy chcesz dodać lub usunąć jakieś aktywności?”

6. **Dostosowanie na podstawie opinii**  
- Zmodyfikuj plan zgodnie z uwagami użytkownika.  
- Wprowadź potrzebne zmiany w rekomendacjach lotów, noclegów i atrakcji, aby lepiej dopasować się do preferencji.

7. **Ostateczne potwierdzenie**  
- Przedstaw zaktualizowany plan użytkownikowi do ostatecznej akceptacji.  
- Przykład: „Wprowadziłem zmiany zgodnie z Twoimi uwagami. Oto zaktualizowany plan. Czy wszystko wygląda dobrze?”

8. **Rezerwacja i potwierdzenie**  
- Po zatwierdzeniu planu przez użytkownika dokonaj rezerwacji lotów, noclegów i zaplanowanych aktywności.  
- Prześlij użytkownikowi potwierdzenia.

9. **Zapewnienie wsparcia**  
- Bądź dostępny, aby pomóc użytkownikowi w przypadku zmian lub dodatkowych próśb przed i w trakcie podróży.  
- Przykład: „Jeśli będziesz potrzebować pomocy podczas podróży, śmiało kontaktuj się ze mną w każdej chwili!”

### Przykładowa interakcja  
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

## 3. Korekcyjny system RAG

Na początek zrozummy różnicę między narzędziem RAG a prewencyjnym ładowaniem kontekstu.

![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.pl.png)

### Retrieval-Augmented Generation (RAG)

RAG łączy system wyszukiwania z modelem generatywnym. Gdy pojawia się zapytanie, system wyszukiwania pobiera odpowiednie dokumenty lub dane z zewnętrznego źródła, a te informacje są wykorzystywane do wzbogacenia wejścia dla modelu generatywnego. Dzięki temu model generuje dokładniejsze i bardziej kontekstowo trafne odpowiedzi.

W systemie RAG agent pobiera relewantne informacje z bazy wiedzy i wykorzystuje je do generowania odpowiednich odpowiedzi lub działań.

### Podejście korekcyjne RAG

Podejście korekcyjne RAG skupia się na wykorzystaniu technik RAG do korygowania błędów i poprawy dokładności agentów AI. Obejmuje to:
1. **Technikę promptowania**: Używanie konkretnych promptów, które pomagają agentowi w wyszukiwaniu relewantnych informacji.
2. **Narzędzie**: Wdrożenie algorytmów i mechanizmów umożliwiających agentowi ocenę trafności pozyskanych informacji i generowanie precyzyjnych odpowiedzi.
3. **Ewaluację**: Ciągłe ocenianie wydajności agenta i wprowadzanie korekt w celu zwiększenia jego dokładności i efektywności.
Przykład: Korekcyjny RAG w Agencie Wyszukiwania Rozważ agenta wyszukiwania, który pobiera informacje z sieci, aby odpowiadać na zapytania użytkowników. Podejście Korekcyjnego RAG może obejmować: 1. **Technika Promptowania**: Formułowanie zapytań wyszukiwania na podstawie danych wejściowych użytkownika. 2. **Narzędzie**: Wykorzystanie przetwarzania języka naturalnego i algorytmów uczenia maszynowego do klasyfikacji i filtrowania wyników wyszukiwania. 3. **Ewaluacja**: Analizę opinii użytkowników w celu identyfikacji i korekty nieścisłości w pobranych informacjach. ### Korekcyjny RAG w Agencie Podróży Korekcyjny RAG (Retrieval-Augmented Generation) zwiększa zdolność AI do pobierania i generowania informacji przy jednoczesnej korekcie wszelkich nieścisłości. Zobaczmy, jak Agent Podróży może wykorzystać podejście Korekcyjnego RAG, aby dostarczać dokładniejsze i bardziej trafne rekomendacje podróżnicze. Obejmuje to: - **Technikę Promptowania:** Używanie konkretnych promptów do kierowania agentem w pobieraniu odpowiednich informacji. - **Narzędzie:** Implementację algorytmów i mechanizmów, które pozwalają agentowi oceniać trafność pobranych informacji i generować precyzyjne odpowiedzi. - **Ewaluację:** Ciągłe ocenianie wydajności agenta i wprowadzanie korekt w celu poprawy jego dokładności i efektywności. #### Kroki wdrażania Korekcyjnego RAG w Agencie Podróży 1. **Początkowa Interakcja z Użytkownikiem** - Agent Podróży zbiera początkowe preferencje użytkownika, takie jak cel podróży, daty wyjazdu, budżet i zainteresowania. - Przykład: ```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ``` 2. **Pobieranie Informacji** - Agent Podróży pobiera informacje o lotach, zakwaterowaniu, atrakcjach i restauracjach na podstawie preferencji użytkownika. - Przykład: ```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ``` 3. **Generowanie Początkowych Rekomendacji** - Agent Podróży wykorzystuje pobrane informacje do stworzenia spersonalizowanego planu podróży. - Przykład: ```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ``` 4. **Zbieranie Opinii Użytkownika** - Agent Podróży prosi użytkownika o opinię na temat początkowych rekomendacji. - Przykład: ```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ``` 5. **Proces Korekcyjnego RAG** - **Technika Promptowania**: Agent Podróży formułuje nowe zapytania wyszukiwania na podstawie opinii użytkownika. - Przykład: ```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ``` - **Narzędzie**: Agent Podróży używa algorytmów do klasyfikacji i filtrowania nowych wyników wyszukiwania, kładąc nacisk na trafność na podstawie opinii użytkownika. - Przykład: ```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ``` - **Ewaluacja**: Agent Podróży nieustannie ocenia trafność i dokładność swoich rekomendacji, analizując opinie użytkowników i wprowadzając niezbędne poprawki. - Przykład: ```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ``` #### Praktyczny Przykład Oto uproszczony przykład kodu w Pythonie, który integruje podejście Korekcyjnego RAG w Agencie Podróży: ```python
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
``` ### Wstępne Ładowanie Kontekstu Wstępne Ładowanie Kontekstu polega na załadowaniu odpowiedniego kontekstu lub informacji tła do modelu przed przetworzeniem zapytania. Oznacza to, że model ma dostęp do tych informacji od samego początku, co pomaga mu generować bardziej świadome odpowiedzi bez konieczności pobierania dodatkowych danych podczas procesu. Oto uproszczony przykład, jak może wyglądać wstępne ładowanie kontekstu dla aplikacji Agenta Podróży w Pythonie: ```python
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
``` #### Wyjaśnienie 1. **Inicjalizacja (`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info` metoda pobiera odpowiednie informacje ze wstępnie załadowanego słownika kontekstu. Dzięki wstępnemu załadowaniu kontekstu aplikacja Agenta Podróży może szybko odpowiadać na zapytania użytkowników bez konieczności pobierania tych informacji z zewnętrznego źródła w czasie rzeczywistym. To sprawia, że aplikacja jest bardziej wydajna i responsywna. ### Rozpoczynanie Planu z Celem Przed Iteracją Rozpoczynanie planu z celem polega na rozpoczęciu z jasnym celem lub zamierzonym wynikiem. Definiując ten cel z góry, model może używać go jako zasady przewodniej przez cały proces iteracyjny. Pomaga to zapewnić, że każda iteracja przybliża do osiągnięcia pożądanego wyniku, czyniąc proces bardziej efektywnym i ukierunkowanym. Oto przykład, jak można rozpocząć plan podróży z celem przed iteracją dla agenta podróży w Pythonie: ### Scenariusz Agent podróży chce zaplanować spersonalizowane wakacje dla klienta. Celem jest stworzenie planu podróży maksymalizującego satysfakcję klienta na podstawie jego preferencji i budżetu. ### Kroki 1. Zdefiniuj preferencje i budżet klienta. 2. Rozpocznij początkowy plan na podstawie tych preferencji. 3. Iteruj, aby udoskonalić plan, optymalizując satysfakcję klienta. #### Kod w Pythonie ```python
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
``` #### Wyjaśnienie Kodu 1. **Inicjalizacja (`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost` metoda)**: Ta metoda oblicza całkowity koszt aktualnego planu, wliczając potencjalny nowy cel podróży. #### Przykładowe Użycie - **Plan Początkowy**: Agent podróży tworzy plan na podstawie preferencji klienta dotyczących zwiedzania i budżetu 2000 dolarów. - **Plan Udoskonalony**: Agent podróży iteruje plan, optymalizując go pod kątem preferencji i budżetu klienta. Rozpoczynając plan z jasnym celem (np. maksymalizacja satysfakcji klienta) i iterując w celu udoskonalenia planu, agent podróży może stworzyć spersonalizowany i zoptymalizowany plan podróży dla klienta. Takie podejście zapewnia, że plan podróży jest zgodny z preferencjami i budżetem klienta od samego początku i poprawia się z każdą iteracją. ### Wykorzystanie LLM do Przeklasyfikowania i Oceny Duże Modele Językowe (LLM) mogą być wykorzystywane do przeklasyfikowania i oceniania poprzez ocenę trafności i jakości pobranych dokumentów lub wygenerowanych odpowiedzi. Oto jak to działa: **Pobieranie:** Początkowy krok pobierania zwraca zestaw kandydatów dokumentów lub odpowiedzi na podstawie zapytania. **Przeklasyfikowanie:** LLM ocenia tych kandydatów i przeklasyfikuje ich na podstawie trafności i jakości. Ten krok zapewnia, że najtrafniejsze i najwyższej jakości informacje są prezentowane jako pierwsze. **Ocena:** LLM przypisuje oceny każdemu kandydatowi, odzwierciedlając ich trafność i jakość. Pomaga to w wyborze najlepszej odpowiedzi lub dokumentu dla użytkownika. Wykorzystując LLM do przeklasyfikowania i oceniania, system może dostarczać dokładniejsze i kontekstowo bardziej trafne informacje, poprawiając ogólne doświadczenie użytkownika. Oto przykład, jak agent podróży może wykorzystać Duży Model Językowy (LLM) do przeklasyfikowania i oceniania miejsc podróży na podstawie preferencji użytkownika w Pythonie: #### Scenariusz - Podróż na podstawie preferencji Agent podróży chce polecić klientowi najlepsze miejsca podróży na podstawie jego preferencji. LLM pomoże przeklasyfikować i ocenić miejsca, aby zapewnić prezentację najbardziej trafnych opcji. #### Kroki: 1. Zbierz preferencje użytkownika. 2. Pobierz listę potencjalnych miejsc podróży. 3. Użyj LLM do przeklasyfikowania i ocenienia miejsc na podstawie preferencji użytkownika. Oto, jak można zaktualizować poprzedni przykład, aby korzystać z usług Azure OpenAI: #### Wymagania 1. Musisz mieć subskrypcję Azure. 2. Utwórz zasób Azure OpenAI i uzyskaj swój klucz API. #### Przykładowy kod w Pythonie ```python
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
``` #### Wyjaśnienie Kodu - Preference Booker 1. **Inicjalizacja**: `TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` z faktycznym URL punktu końcowego twojego wdrożenia Azure OpenAI. Wykorzystując LLM do przeklasyfikowania i oceniania, agent podróży może dostarczać bardziej spersonalizowane i trafne rekomendacje podróży klientom, poprawiając ich ogólne doświadczenie. ### RAG: Technika Promptowania vs Narzędzie Retrieval-Augmented Generation (RAG) może być zarówno techniką promptowania, jak i narzędziem w rozwoju agentów AI. Zrozumienie różnicy między nimi pomoże skuteczniej wykorzystać RAG w twoich projektach. #### RAG jako Technika Promptowania **Czym jest?** - Jako technika promptowania, RAG polega na formułowaniu konkretnych zapytań lub promptów, które kierują pobieraniem odpowiednich informacji z dużego korpusu lub bazy danych. Informacje te są następnie wykorzystywane do generowania odpowiedzi lub działań. **Jak to działa:** 1. **Formułowanie Promptów**: Tworzenie dobrze skonstruowanych promptów lub zapytań na podstawie zadania lub danych wejściowych użytkownika. 2. **Pobieranie Informacji**: Używanie promptów do wyszukiwania odpowiednich danych z istniejącej bazy wiedzy lub zbioru danych. 3. **Generowanie Odpowiedzi**: Łączenie pobranych informacji z modelami generatywnymi AI w celu stworzenia kompleksowej i spójnej odpowiedzi. **Przykład w Agencie Podróży**: - Dane wejściowe użytkownika: "Chcę odwiedzić muzea w Paryżu." - Prompt: "Znajdź najlepsze muzea w Paryżu." - Pobranie informacji: Szczegóły o Luwrze, Musée d'Orsay itd. - Wygenerowana odpowiedź: "Oto najlepsze muzea w Paryżu: Luwr, Musée d'Orsay i Centre Pompidou." #### RAG jako Narzędzie **Czym jest?** - Jako narzędzie, RAG to zintegrowany system, który automatyzuje proces pobierania i generowania, ułatwiając deweloperom implementację złożonych funkcji AI bez konieczności ręcznego tworzenia promptów dla każdego zapytania. **Jak to działa:** 1. **Integracja**: Wbudowanie RAG w architekturę agenta AI, pozwalając mu automatycznie obsługiwać zadania pobierania i generowania. 2. **Automatyzacja**: Narzędzie zarządza całym procesem, od otrzymania danych wejściowych użytkownika po wygenerowanie ostatecznej odpowiedzi, bez potrzeby jawnych promptów na każdym etapie. 3. **Wydajność**: Poprawia wydajność agenta, usprawniając proces pobierania i generowania, umożliwiając szybsze i dokładniejsze odpowiedzi. **Przykład w Agencie Podróży**: - Dane wejściowe użytkownika: "Chcę odwiedzić muzea w Paryżu." - Narzędzie RAG: Automatycznie pobiera informacje o muzeach i generuje odpowiedź. - Wygenerowana odpowiedź: "Oto najlepsze muzea w Paryżu: Luwr, Musée d'Orsay i Centre Pompidou." ### Porównanie | Aspekt | Technika Promptowania | Narzędzie | |------------------------|-------------------------------------------------------------|-------------------------------------------------------| | **Ręczne vs Automatyczne**| Ręczne formułowanie promptów dla każdego zapytania. | Zautomatyzowany proces pobierania i generowania. | | **Kontrola** | Większa kontrola nad procesem pobierania. | Usprawnienie i automatyzacja pobierania i generowania. | | **Elastyczność** | Pozwala na dostosowane prompty według specyficznych potrzeb. | Bardziej efektywne dla dużych implementacji. | | **Złożoność** | Wymaga tworzenia i dostrajania promptów. | Łatwiejsze do integracji w architekturze agenta AI. | ### Praktyczne Przykłady **Przykład Techniki Promptowania:** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
``` **Przykład Narzędzia:** ```python
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
``` ### Ocena Trafności Ocena trafności jest kluczowym aspektem wydajności agenta AI. Zapewnia, że informacje pobrane i wygenerowane przez agenta są odpowiednie, dokładne i użyteczne dla użytkownika. Zbadajmy, jak oceniać trafność w agentach AI, włączając praktyczne przykłady i techniki. #### Kluczowe Koncepcje w Oceny Trafności 1. **Świadomość Kontekstu**: - Agent musi rozumieć kontekst zapytania użytkownika, aby pobierać i generować odpowiednie informacje. - Przykład: Jeśli użytkownik pyta o "najlepsze restauracje w Paryżu", agent powinien uwzględnić preferencje użytkownika, takie jak typ kuchni i budżet. 2. **Dokładność**: - Informacje dostarczane przez agenta powinny być faktograficznie poprawne i aktualne. - Przykład: Polecanie aktualnie otwartych restauracji z dobrymi recenzjami, a nie przestarzałych lub zamkniętych miejsc. 3. **Intencja Użytkownika**: -
Agent powinien wywnioskować intencję użytkownika stojącą za zapytaniem, aby dostarczyć najbardziej istotne informacje.  
- Przykład: Jeśli użytkownik pyta o „hotele budżetowe”, agent powinien priorytetowo traktować przystępne cenowo opcje.  

4. **Pętla informacji zwrotnej**:  
- Ciągłe zbieranie i analizowanie opinii użytkowników pomaga agentowi udoskonalić proces oceny trafności.  
- Przykład: Uwzględnianie ocen i opinii użytkowników na temat wcześniejszych rekomendacji w celu poprawy przyszłych odpowiedzi.  

#### Praktyczne techniki oceny trafności  
1. **Ocena trafności**:  
- Przypisz każdemu wyszukanemu elementowi ocenę trafności na podstawie tego, jak dobrze odpowiada zapytaniu i preferencjom użytkownika.  
- Przykład: ```python
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

2. **Filtrowanie i ranking**:  
- Odfiltruj elementy nieistotne i uszereguj pozostałe według ocen trafności.  
- Przykład: ```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

3. **Przetwarzanie języka naturalnego (NLP)**:  
- Wykorzystaj techniki NLP do zrozumienia zapytania użytkownika i wyszukania odpowiednich informacji.  
- Przykład: ```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

4. **Integracja informacji zwrotnej od użytkownika**:  
- Zbieraj opinie użytkowników na temat udzielonych rekomendacji i wykorzystuj je do dostosowywania przyszłych ocen trafności.  
- Przykład: ```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### Przykład: Ocena trafności w Travel Agent  
Oto praktyczny przykład, jak Travel Agent może ocenić trafność rekomendacji podróżniczych: ```python
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

### Wyszukiwanie z intencją  
Wyszukiwanie z intencją polega na zrozumieniu i interpretacji podstawowego celu lub zamiaru stojącego za zapytaniem użytkownika, aby wyszukać i wygenerować najbardziej trafne i użyteczne informacje. Podejście to wykracza poza proste dopasowanie słów kluczowych i koncentruje się na zrozumieniu rzeczywistych potrzeb i kontekstu użytkownika.  

#### Kluczowe pojęcia w wyszukiwaniu z intencją  
1. **Zrozumienie intencji użytkownika**:  
- Intencję użytkownika można podzielić na trzy główne typy: informacyjną, nawigacyjną i transakcyjną.  
- **Intencja informacyjna**: Użytkownik szuka informacji na dany temat (np. „Jakie są najlepsze muzea w Paryżu?”).  
- **Intencja nawigacyjna**: Użytkownik chce przejść do konkretnej strony internetowej lub witryny (np. „Oficjalna strona Muzeum Luwru”).  
- **Intencja transakcyjna**: Użytkownik chce dokonać transakcji, np. zarezerwować lot lub dokonać zakupu (np. „Zarezerwuj lot do Paryża”).  

2. **Świadomość kontekstu**:  
- Analiza kontekstu zapytania użytkownika pomaga dokładnie określić jego intencję. Obejmuje to uwzględnienie wcześniejszych interakcji, preferencji użytkownika oraz szczegółów bieżącego zapytania.  

3. **Przetwarzanie języka naturalnego (NLP)**:  
- Techniki NLP są stosowane do rozumienia i interpretacji zapytań w języku naturalnym podawanych przez użytkowników. Obejmuje to zadania takie jak rozpoznawanie bytów, analiza sentymentu oraz parsowanie zapytań.  

4. **Personalizacja**:  
- Personalizacja wyników wyszukiwania na podstawie historii, preferencji i opinii użytkownika zwiększa trafność wyszukiwanych informacji.  

#### Praktyczny przykład: Wyszukiwanie z intencją w Travel Agent  
Weźmy na przykład Travel Agent, aby zobaczyć, jak można zaimplementować wyszukiwanie z intencją.  
1. **Zbieranie preferencji użytkownika** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **Zrozumienie intencji użytkownika** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **Świadomość kontekstu** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
4. **Wyszukiwanie i personalizacja wyników** ```python
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
5. **Przykładowe użycie** ```python
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

## 4. Generowanie kodu jako narzędzie  
Agenci generujący kod wykorzystują modele AI do pisania i wykonywania kodu, rozwiązując złożone problemy i automatyzując zadania.  

### Agenci generujący kod  
Agenci generujący kod korzystają z generatywnych modeli AI do pisania i wykonywania kodu. Mogą rozwiązywać złożone problemy, automatyzować zadania oraz dostarczać cenne informacje, generując i uruchamiając kod w różnych językach programowania.  

#### Praktyczne zastosowania  
1. **Automatyczne generowanie kodu**: Tworzenie fragmentów kodu do konkretnych zadań, takich jak analiza danych, web scraping czy uczenie maszynowe.  
2. **SQL jako RAG**: Wykorzystanie zapytań SQL do pobierania i manipulowania danymi z baz danych.  
3. **Rozwiązywanie problemów**: Tworzenie i wykonywanie kodu do rozwiązania określonych problemów, np. optymalizacji algorytmów lub analizy danych.  

#### Przykład: Agent generujący kod do analizy danych  
Wyobraź sobie, że projektujesz agenta generującego kod. Oto jak może działać:  
1. **Zadanie**: Analiza zbioru danych w celu identyfikacji trendów i wzorców.  
2. **Kroki**:  
- Załaduj zbiór danych do narzędzia analizy danych.  
- Wygeneruj zapytania SQL do filtrowania i agregowania danych.  
- Wykonaj zapytania i pobierz wyniki.  
- Wykorzystaj wyniki do tworzenia wizualizacji i wniosków.  
3. **Wymagane zasoby**: Dostęp do zbioru danych, narzędzia analizy danych oraz możliwości SQL.  
4. **Doświadczenie**: Wykorzystaj wcześniejsze wyniki analiz do poprawy dokładności i trafności przyszłych analiz.  

### Przykład: Agent generujący kod dla Travel Agent  
W tym przykładzie zaprojektujemy agenta generującego kod, Travel Agent, który pomoże użytkownikom planować podróże poprzez generowanie i wykonywanie kodu. Agent ten może obsługiwać zadania takie jak pobieranie opcji podróży, filtrowanie wyników i tworzenie planu podróży z użyciem AI generatywnego.  

#### Przegląd agenta generującego kod  
1. **Zbieranie preferencji użytkownika**: Zbiera dane wejściowe użytkownika, takie jak cel podróży, daty, budżet i zainteresowania.  
2. **Generowanie kodu do pobierania danych**: Generuje fragmenty kodu do pobrania informacji o lotach, hotelach i atrakcjach.  
3. **Wykonywanie wygenerowanego kodu**: Uruchamia wygenerowany kod, aby uzyskać aktualne informacje.  
4. **Generowanie planu podróży**: Kompiluje pobrane dane w spersonalizowany plan podróży.  
5. **Dostosowywanie na podstawie opinii**: Otrzymuje opinie użytkownika i w razie potrzeby regeneruje kod, aby udoskonalić wyniki.  

#### Implementacja krok po kroku  
1. **Zbieranie preferencji użytkownika** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **Generowanie kodu do pobierania danych** ```python
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
3. **Wykonywanie wygenerowanego kodu** ```python
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
4. **Generowanie planu podróży** ```python
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
5. **Dostosowywanie na podstawie opinii** ```python
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

### Wykorzystanie świadomości środowiskowej i rozumowania  
Wykorzystanie schematu tabeli może rzeczywiście usprawnić proces generowania zapytań poprzez świadomość środowiskową i rozumowanie. Oto przykład, jak można to zrobić:  
1. **Zrozumienie schematu**: System rozumie schemat tabeli i wykorzystuje tę informację do ugruntowania generowania zapytań.  
2. **Dostosowywanie na podstawie opinii**: System dostosowuje preferencje użytkownika na podstawie opinii i rozważa, które pola w schemacie należy zaktualizować.  
3. **Generowanie i wykonywanie zapytań**: System generuje i wykonuje zapytania, aby pobrać zaktualizowane dane o lotach i hotelach na podstawie nowych preferencji.  

Oto zaktualizowany przykład kodu w Pythonie, który uwzględnia te koncepcje: ```python
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

#### Wyjaśnienie - Rezerwacja na podstawie opinii  
1. **Świadomość schematu**: Metoda `schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` dostosowuje zmiany na podstawie schematu i opinii.  
4. **Generowanie i wykonywanie zapytań**: System generuje kod do pobrania zaktualizowanych danych o lotach i hotelach na podstawie dostosowanych preferencji i symuluje wykonanie tych zapytań.  
5. **Generowanie planu podróży**: System tworzy zaktualizowany plan podróży na podstawie nowych danych o lotach, hotelach i atrakcjach.  

Dzięki świadomości środowiskowej i rozumowaniu opartemu na schemacie system może generować dokładniejsze i bardziej trafne zapytania, co prowadzi do lepszych rekomendacji podróżniczych i bardziej spersonalizowanego doświadczenia użytkownika.  

### Wykorzystanie SQL jako techniki Retrieval-Augmented Generation (RAG)  
SQL (Structured Query Language) jest potężnym narzędziem do interakcji z bazami danych. Wykorzystywany jako część podejścia Retrieval-Augmented Generation (RAG), SQL może pobierać odpowiednie dane z baz, aby informować i generować odpowiedzi lub działania w agentach AI.  

Zobaczmy, jak SQL może być używany jako technika RAG w kontekście Travel Agent.  

#### Kluczowe pojęcia  
1. **Interakcja z bazą danych**:  
- SQL służy do zapytań do baz danych, pobierania odpowiednich informacji i manipulowania danymi.  
- Przykład: Pobieranie informacji o lotach, hotelach i atrakcjach z bazy danych podróży.  

2. **Integracja z RAG**:  
- Zapytania SQL są generowane na podstawie danych wejściowych i preferencji użytkownika.  
- Pobierane dane są następnie wykorzystywane do tworzenia spersonalizowanych rekomendacji lub działań.  

3. **Dynamiczne generowanie zapytań**:  
- Agent AI generuje dynamiczne zapytania SQL na podstawie kontekstu i potrzeb użytkownika.  
- Przykład: Dostosowywanie zapytań SQL do filtrowania wyników według budżetu, dat i zainteresowań.  

#### Zastosowania  
- **Automatyczne generowanie kodu**: Tworzenie fragmentów kodu do konkretnych zadań.  
- **SQL jako RAG**: Wykorzystanie zapytań SQL do manipulacji danymi.  
- **Rozwiązywanie problemów**: Tworzenie i wykonywanie kodu do rozwiązywania problemów.  

**Przykład**: Agent analizy danych:  
1. **Zadanie**: Analiza zbioru danych w celu znalezienia trendów.  
2. **Kroki**:  
- Załaduj zbiór danych.  
- Wygeneruj zapytania SQL do filtrowania danych.  
- Wykonaj zapytania i pobierz wyniki.  
- Wygeneruj wizualizacje i wnioski.  
3. **Zasoby**: Dostęp do zbioru danych, możliwości SQL.  
4. **Doświadczenie**: Wykorzystaj wcześniejsze wyniki do poprawy przyszłych analiz.  

#### Praktyczny przykład: Wykorzystanie SQL w Travel Agent  
1. **Zbieranie preferencji użytkownika** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **Generowanie zapytań SQL** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
3. **Wykonywanie zapytań SQL** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
4. **Generowanie rekomendacji** ```python
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

#### Przykładowe zapytania SQL  
1. **Zapytanie o loty** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
2. **Zapytanie o hotele** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **Zapytanie o atrakcje** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

Wykorzystując SQL jako część techniki Retrieval-Augmented Generation (RAG), agenci AI tacy jak Travel Agent mogą dynamicznie pobierać i wykorzystywać odpowiednie dane, aby dostarczać dokładne i spersonalizowane rekomendacje.  

### Przykład metapoznania  
Aby zilustrować implementację metapoznania, stwórzmy prostego agenta, który *reflektuje nad swoim procesem podejmowania decyzji* podczas rozwiązywania problemu.  

W tym przykładzie zbudujemy system, w którym agent stara się zoptymalizować wybór hotelu, a następnie ocenia własne rozumowanie i dostosowuje strategię, gdy popełnia błędy lub dokonuje suboptymalnych wyborów.  

Symulujemy to na prostym przykładzie, gdzie agent wybiera hotele na podstawie kombinacji ceny i jakości, ale będzie „reflektował” nad swoimi decyzjami i odpowiednio się dostosowywał.  

#### Jak to ilustruje metapoznanie:  
1. **Początkowa decyzja**: Agent wybiera najtańszy hotel, nie rozumiejąc wpływu jakości.  
2. **Refleksja i ocena**: Po początkowym wyborze agent sprawdza, czy hotel był „złym” wyborem, korzystając z opinii użytkownika. Jeśli jakość hotelu była zbyt niska, agent reflektuje nad swoim rozumowaniem.  
3. **Dostosowanie strategii**: Agent zmienia strategię na podstawie refleksji, przechodząc z „najtańszego” na „najwyższą jakość”, poprawiając tym samym proces podejmowania decyzji w kolejnych iteracjach.  

Oto przykład: ```python
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

#### Zdolności metapoznawcze agenta  
Kluczowa jest tutaj zdolność agenta do:  
- Oceny swoich wcześniejszych wyborów i procesu podejmowania decyzji.  
- Dostosowania strategii na podstawie tej refleksji, czyli metapoznania w praktyce.  

To prosty przykład metapoznania, gdzie system jest w stanie dostosować swój proces rozumowania na podstawie wewnętrznej informacji zwrotnej.  

### Podsumowanie  
Metapoznanie jest potężnym narzędziem, które może znacząco zwiększyć możliwości agentów AI. Poprzez włączenie metapoznawczych
procesy, możesz projektować agentów, którzy są bardziej inteligentni, elastyczni i wydajni. Wykorzystaj dodatkowe zasoby, aby dalej zgłębiać fascynujący świat metapoznania w agentach AI. ## Poprzednia lekcja [Wzorzec projektowy multi-agenta](../08-multi-agent/README.md) ## Następna lekcja [Agenci AI w produkcji](../10-ai-agents-production/README.md)

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uważać za wiarygodne źródło informacji. W przypadku istotnych informacji zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.