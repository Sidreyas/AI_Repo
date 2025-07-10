<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T09:13:05+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "de"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.de.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(Klicken Sie auf das Bild oben, um das Video zu dieser Lektion anzusehen)_
# Metakognition bei KI-Agenten

## Einführung

Willkommen zur Lektion über Metakognition bei KI-Agenten! Dieses Kapitel richtet sich an Anfänger, die neugierig sind, wie KI-Agenten über ihre eigenen Denkprozesse nachdenken können. Am Ende dieser Lektion werden Sie die wichtigsten Konzepte verstehen und praktische Beispiele kennen, um Metakognition im Design von KI-Agenten anzuwenden.

## Lernziele

Nach Abschluss dieser Lektion werden Sie in der Lage sein:

1. Die Auswirkungen von Denkzyklen in Agentendefinitionen zu verstehen.
2. Planungs- und Bewertungstechniken einzusetzen, um selbstkorrigierende Agenten zu unterstützen.
3. Eigene Agenten zu erstellen, die Code manipulieren können, um Aufgaben zu erfüllen.

## Einführung in die Metakognition

Metakognition bezeichnet höhere kognitive Prozesse, bei denen man über das eigene Denken nachdenkt. Für KI-Agenten bedeutet das, ihre Handlungen auf Basis von Selbstbewusstsein und vergangenen Erfahrungen bewerten und anpassen zu können. Metakognition, also „über das Denken nachdenken“, ist ein wichtiger Begriff bei der Entwicklung agentischer KI-Systeme. Dabei sind KI-Systeme sich ihrer eigenen internen Prozesse bewusst und können ihr Verhalten überwachen, regulieren und entsprechend anpassen – ähnlich wie wir, wenn wir eine Situation einschätzen oder ein Problem betrachten.

Dieses Selbstbewusstsein hilft KI-Systemen, bessere Entscheidungen zu treffen, Fehler zu erkennen und ihre Leistung im Laufe der Zeit zu verbessern – was wiederum an den Turing-Test und die Debatte erinnert, ob KI die Kontrolle übernehmen wird.

Im Kontext agentischer KI-Systeme kann Metakognition verschiedene Herausforderungen adressieren, wie zum Beispiel:

- Transparenz: Sicherstellen, dass KI-Systeme ihre Denkprozesse und Entscheidungen erklären können.
- Schlussfolgerung: Die Fähigkeit verbessern, Informationen zu verknüpfen und fundierte Entscheidungen zu treffen.
- Anpassung: KI-Systeme befähigen, sich an neue Umgebungen und veränderte Bedingungen anzupassen.
- Wahrnehmung: Die Genauigkeit bei der Erkennung und Interpretation von Umgebungsdaten erhöhen.

### Was ist Metakognition?

Metakognition, also „über das Denken nachdenken“, ist ein höherstufiger kognitiver Prozess, der Selbstbewusstsein und Selbstregulierung der eigenen Denkprozesse beinhaltet. Im Bereich der KI befähigt Metakognition Agenten dazu, ihre Strategien und Handlungen zu bewerten und anzupassen, was zu besserer Problemlösung und Entscheidungsfindung führt.

Wenn Sie Metakognition verstehen, können Sie KI-Agenten entwerfen, die nicht nur intelligenter, sondern auch anpassungsfähiger und effizienter sind. Bei echter Metakognition würde die KI explizit über ihr eigenes Denken reflektieren. Beispiel: „Ich habe günstigere Flüge priorisiert, aber vielleicht verpasse ich direkte Verbindungen, also überprüfe ich das nochmal.“ Dabei wird nachverfolgt, wie oder warum sie eine bestimmte Route gewählt hat.

- Erkennt, dass Fehler entstanden sind, weil sie sich zu sehr auf die Nutzerpräferenzen vom letzten Mal verlassen hat, und passt ihre Entscheidungsstrategie an, nicht nur die endgültige Empfehlung.
- Diagnostiziert Muster wie: „Immer wenn der Nutzer ‚zu voll‘ erwähnt, sollte ich nicht nur bestimmte Attraktionen entfernen, sondern auch reflektieren, dass meine Methode, ‚Top-Attraktionen‘ nach Beliebtheit zu sortieren, fehlerhaft ist.“

### Bedeutung der Metakognition bei KI-Agenten

Metakognition spielt eine entscheidende Rolle beim Design von KI-Agenten aus mehreren Gründen:

![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.de.png)

- Selbstreflexion: Agenten können ihre eigene Leistung bewerten und Verbesserungsmöglichkeiten erkennen.
- Anpassungsfähigkeit: Agenten können ihre Strategien basierend auf Erfahrungen und veränderten Bedingungen anpassen.
- Fehlerkorrektur: Agenten können Fehler eigenständig erkennen und korrigieren, was zu genaueren Ergebnissen führt.
- Ressourcenmanagement: Agenten können den Einsatz von Ressourcen wie Zeit und Rechenleistung durch Planung und Bewertung optimieren.

## Komponenten eines KI-Agenten

Bevor wir in metakognitive Prozesse eintauchen, ist es wichtig, die grundlegenden Komponenten eines KI-Agenten zu verstehen. Ein KI-Agent besteht typischerweise aus:

- Persona: Die Persönlichkeit und Eigenschaften des Agenten, die bestimmen, wie er mit Nutzern interagiert.
- Werkzeuge: Die Fähigkeiten und Funktionen, die der Agent ausführen kann.
- Fähigkeiten: Das Wissen und die Expertise, die der Agent besitzt.

Diese Komponenten arbeiten zusammen, um eine „Expertise-Einheit“ zu bilden, die bestimmte Aufgaben ausführen kann.

**Beispiel**: Denken Sie an einen Reisebüro-Agenten, der nicht nur Ihre Reise plant, sondern seinen Weg auch anhand von Echtzeitdaten und vergangenen Kundenerfahrungen anpasst.

### Beispiel: Metakognition in einem Reisebüro-Agenten

Stellen Sie sich vor, Sie entwerfen einen von KI betriebenen Reisebüro-Agenten. Dieser Agent, „Travel Agent“, unterstützt Nutzer bei der Urlaubsplanung. Um Metakognition einzubauen, muss Travel Agent seine Handlungen anhand von Selbstbewusstsein und vergangenen Erfahrungen bewerten und anpassen. So könnte Metakognition eine Rolle spielen:

#### Aktuelle Aufgabe

Die aktuelle Aufgabe ist, einem Nutzer bei der Planung einer Reise nach Paris zu helfen.

#### Schritte zur Erfüllung der Aufgabe

1. **Nutzerpräferenzen erfassen**: Fragen Sie den Nutzer nach Reisedaten, Budget, Interessen (z.B. Museen, Kulinarik, Shopping) und speziellen Anforderungen.
2. **Informationen abrufen**: Suchen Sie nach Flügen, Unterkünften, Sehenswürdigkeiten und Restaurants, die zu den Präferenzen des Nutzers passen.
3. **Empfehlungen erstellen**: Erstellen Sie eine personalisierte Reiseroute mit Flugdaten, Hotelreservierungen und vorgeschlagenen Aktivitäten.
4. **Anpassung basierend auf Feedback**: Fragen Sie den Nutzer nach Feedback zu den Empfehlungen und nehmen Sie notwendige Anpassungen vor.

#### Benötigte Ressourcen

- Zugriff auf Flug- und Hotelbuchungsdatenbanken.
- Informationen zu Pariser Sehenswürdigkeiten und Restaurants.
- Nutzerrückmeldungen aus vorherigen Interaktionen.

#### Erfahrung und Selbstreflexion

Travel Agent nutzt Metakognition, um seine Leistung zu bewerten und aus Erfahrungen zu lernen. Zum Beispiel:

1. **Analyse von Nutzerfeedback**: Travel Agent wertet Feedback aus, um zu erkennen, welche Empfehlungen gut ankamen und welche nicht, und passt zukünftige Vorschläge entsprechend an.
2. **Anpassungsfähigkeit**: Wenn ein Nutzer zuvor über überfüllte Orte klagte, wird Travel Agent in Zukunft vermeiden, beliebte Touristenattraktionen zu Stoßzeiten zu empfehlen.
3. **Fehlerkorrektur**: Wenn Travel Agent bei einer früheren Buchung einen Fehler gemacht hat, etwa ein Hotel vorgeschlagen hat, das ausgebucht war, lernt er, Verfügbarkeiten künftig genauer zu prüfen.

#### Praktisches Entwicklerbeispiel

Hier ein vereinfachtes Beispiel, wie der Code von Travel Agent mit Metakognition aussehen könnte: ```python
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

#### Warum Metakognition wichtig ist

- **Selbstreflexion**: Agenten können ihre Leistung analysieren und Verbesserungsmöglichkeiten erkennen.
- **Anpassungsfähigkeit**: Agenten können Strategien basierend auf Feedback und sich ändernden Bedingungen anpassen.
- **Fehlerkorrektur**: Agenten können Fehler eigenständig erkennen und beheben.
- **Ressourcenmanagement**: Agenten können den Ressourceneinsatz wie Zeit und Rechenleistung optimieren.

Durch die Integration von Metakognition kann Travel Agent persönlichere und genauere Reiseempfehlungen geben und so das Nutzererlebnis verbessern.

---

## 2. Planung bei Agenten

Planung ist ein zentraler Bestandteil des Verhaltens von KI-Agenten. Dabei werden die Schritte definiert, die nötig sind, um ein Ziel zu erreichen, wobei der aktuelle Zustand, Ressourcen und mögliche Hindernisse berücksichtigt werden.

### Elemente der Planung

- **Aktuelle Aufgabe**: Die Aufgabe klar definieren.
- **Schritte zur Erfüllung der Aufgabe**: Die Aufgabe in überschaubare Schritte aufteilen.
- **Benötigte Ressourcen**: Notwendige Ressourcen identifizieren.
- **Erfahrung**: Vergangene Erfahrungen zur Planung nutzen.

**Beispiel**: Hier sind die Schritte, die Travel Agent unternehmen muss, um einem Nutzer effektiv bei der Reiseplanung zu helfen:

### Schritte für Travel Agent

1. **Nutzerpräferenzen erfassen**

- Fragen Sie den Nutzer nach Details zu Reisedaten, Budget, Interessen und speziellen Anforderungen.
- Beispiele: „Wann möchten Sie reisen?“ „Wie hoch ist Ihr Budget?“ „Welche Aktivitäten mögen Sie im Urlaub?“

2. **Informationen abrufen**

- Suchen Sie nach passenden Reiseoptionen basierend auf den Präferenzen des Nutzers.
- **Flüge**: Finden Sie verfügbare Flüge innerhalb des Budgets und der gewünschten Reisedaten.
- **Unterkünfte**: Finden Sie Hotels oder Ferienwohnungen, die den Präferenzen hinsichtlich Lage, Preis und Ausstattung entsprechen.
- **Sehenswürdigkeiten und Restaurants**: Identifizieren Sie beliebte Attraktionen, Aktivitäten und Restaurants, die zu den Interessen des Nutzers passen.

3. **Empfehlungen erstellen**

- Fassen Sie die gesammelten Informationen zu einer personalisierten Reiseroute zusammen.
- Geben Sie Details wie Flugoptionen, Hotelbuchungen und vorgeschlagene Aktivitäten an und passen Sie die Empfehlungen an die Nutzerpräferenzen an.

4. **Reiseroute dem Nutzer präsentieren**

- Teilen Sie die vorgeschlagene Reiseroute mit dem Nutzer zur Durchsicht.
- Beispiel: „Hier ist ein Vorschlag für Ihre Reise nach Paris. Er enthält Flugdaten, Hotelbuchungen und eine Liste empfohlener Aktivitäten und Restaurants. Was denken Sie?“

5. **Feedback einholen**

- Fragen Sie den Nutzer nach Rückmeldung zur vorgeschlagenen Reiseroute.
- Beispiele: „Gefallen Ihnen die Flugoptionen?“ „Ist das Hotel passend für Ihre Bedürfnisse?“ „Möchten Sie Aktivitäten hinzufügen oder entfernen?“

6. **Anpassung basierend auf Feedback**

- Passen Sie die Reiseroute entsprechend dem Feedback an.
- Nehmen Sie notwendige Änderungen bei Flügen, Unterkünften und Aktivitäten vor, um besser auf die Präferenzen des Nutzers einzugehen.

7. **Endgültige Bestätigung**

- Präsentieren Sie die aktualisierte Reiseroute dem Nutzer zur finalen Bestätigung.
- Beispiel: „Ich habe die Anpassungen basierend auf Ihrem Feedback vorgenommen. Hier ist die aktualisierte Reiseroute. Passt alles für Sie?“

8. **Buchung und Bestätigung**

- Nach Zustimmung des Nutzers buchen Sie Flüge, Unterkünfte und vorab geplante Aktivitäten.
- Senden Sie dem Nutzer die Bestätigungsdetails.

9. **Fortlaufende Unterstützung**

- Bleiben Sie verfügbar, um den Nutzer bei Änderungen oder zusätzlichen Anfragen vor und während der Reise zu unterstützen.
- Beispiel: „Wenn Sie während Ihrer Reise weitere Hilfe benötigen, können Sie sich jederzeit an mich wenden!“

### Beispielinteraktion

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

## 3. Korrektives RAG-System

Zunächst wollen wir den Unterschied zwischen RAG-Tool und präventivem Kontextladen verstehen.

![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.de.png)

### Retrieval-Augmented Generation (RAG)

RAG kombiniert ein Retrieval-System mit einem generativen Modell. Bei einer Anfrage holt das Retrieval-System relevante Dokumente oder Daten aus einer externen Quelle, und diese abgerufenen Informationen werden genutzt, um das generative Modell zu unterstützen. So kann das Modell genauere und kontextbezogenere Antworten generieren.

In einem RAG-System ruft der Agent relevante Informationen aus einer Wissensdatenbank ab und nutzt diese, um passende Antworten oder Aktionen zu erzeugen.

### Korrektiver RAG-Ansatz

Der korrektive RAG-Ansatz konzentriert sich darauf, RAG-Techniken einzusetzen, um Fehler zu korrigieren und die Genauigkeit von KI-Agenten zu verbessern. Dies umfasst:

1. **Prompting-Technik**: Verwendung spezifischer Eingabeaufforderungen, um den Agenten bei der Suche nach relevanten Informationen zu leiten.
2. **Werkzeug**: Implementierung von Algorithmen und Mechanismen, die es dem Agenten ermöglichen, die Relevanz der abgerufenen Informationen zu bewerten und genaue Antworten zu generieren.
3. **Bewertung**: Kontinuierliche Überprüfung der Agentenleistung und Anpassungen zur Verbesserung von Genauigkeit und Effizienz.
Beispiel: Korrigierendes RAG in einem Suchagenten  
Betrachten Sie einen Suchagenten, der Informationen aus dem Web abruft, um Benutzeranfragen zu beantworten. Der Ansatz des korrigierenden RAG könnte Folgendes umfassen:  
1. **Prompting-Technik**: Formulierung von Suchanfragen basierend auf der Eingabe des Benutzers.  
2. **Werkzeug**: Einsatz von natürlicher Sprachverarbeitung und maschinellen Lernalgorithmen, um Suchergebnisse zu bewerten und zu filtern.  
3. **Bewertung**: Analyse des Benutzerfeedbacks zur Identifizierung und Korrektur von Ungenauigkeiten in den abgerufenen Informationen.  

### Korrigierendes RAG im Reisebüro  
Korrigierendes RAG (Retrieval-Augmented Generation) verbessert die Fähigkeit einer KI, Informationen abzurufen und zu generieren, während gleichzeitig Ungenauigkeiten korrigiert werden. Sehen wir uns an, wie ein Reisebüro den Ansatz des korrigierenden RAG nutzen kann, um genauere und relevantere Reiseempfehlungen zu geben.  
Dies beinhaltet:  
- **Prompting-Technik:** Verwendung spezifischer Eingabeaufforderungen, um den Agenten bei der Beschaffung relevanter Informationen zu leiten.  
- **Werkzeug:** Implementierung von Algorithmen und Mechanismen, die es dem Agenten ermöglichen, die Relevanz der abgerufenen Informationen zu bewerten und genaue Antworten zu generieren.  
- **Bewertung:** Kontinuierliche Überprüfung der Leistung des Agenten und Anpassungen zur Verbesserung seiner Genauigkeit und Effizienz.  

#### Schritte zur Implementierung von korrigierendem RAG im Reisebüro  
1. **Erste Benutzerinteraktion**  
- Das Reisebüro sammelt erste Präferenzen des Benutzers, wie Reiseziel, Reisedaten, Budget und Interessen.  
- Beispiel: ```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  
2. **Informationsabruf**  
- Das Reisebüro ruft Informationen zu Flügen, Unterkünften, Sehenswürdigkeiten und Restaurants basierend auf den Benutzerpräferenzen ab.  
- Beispiel: ```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  
3. **Erstellung erster Empfehlungen**  
- Das Reisebüro verwendet die abgerufenen Informationen, um eine personalisierte Reiseroute zu erstellen.  
- Beispiel: ```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  
4. **Einholung von Benutzerfeedback**  
- Das Reisebüro bittet den Benutzer um Rückmeldung zu den ersten Empfehlungen.  
- Beispiel: ```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  
5. **Korrigierender RAG-Prozess**  
- **Prompting-Technik**: Das Reisebüro formuliert neue Suchanfragen basierend auf dem Benutzerfeedback.  
- Beispiel: ```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **Werkzeug**: Das Reisebüro verwendet Algorithmen, um neue Suchergebnisse zu bewerten und zu filtern, wobei die Relevanz basierend auf dem Benutzerfeedback betont wird.  
- Beispiel: ```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **Bewertung**: Das Reisebüro bewertet kontinuierlich die Relevanz und Genauigkeit seiner Empfehlungen durch Analyse des Benutzerfeedbacks und nimmt notwendige Anpassungen vor.  
- Beispiel: ```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### Praktisches Beispiel  
Hier ist ein vereinfachtes Python-Codebeispiel, das den Ansatz des korrigierenden RAG im Reisebüro integriert:  
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

### Vorab-Kontextladen  
Vorab-Kontextladen bedeutet, relevanten Kontext oder Hintergrundinformationen in das Modell zu laden, bevor eine Anfrage verarbeitet wird. Das Modell hat so von Anfang an Zugriff auf diese Informationen, was ihm hilft, fundiertere Antworten zu generieren, ohne während des Prozesses zusätzliche Daten abrufen zu müssen.  
Hier ist ein vereinfachtes Beispiel, wie ein vorab-Kontextladen für eine Reisebüro-Anwendung in Python aussehen könnte:  
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

#### Erklärung  
1. **Initialisierung (`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info` Methode)** holt die relevanten Informationen aus dem vorab geladenen Kontextwörterbuch ab. Durch das Vorabladen des Kontexts kann die Reisebüro-Anwendung schnell auf Benutzeranfragen reagieren, ohne diese Informationen in Echtzeit aus einer externen Quelle abrufen zu müssen. Dies macht die Anwendung effizienter und reaktionsschneller.  

### Plan mit einem Ziel vor Iteration aufbauen  
Einen Plan mit einem Ziel aufzubauen bedeutet, mit einem klaren Ziel oder Ergebnis im Kopf zu starten. Indem dieses Ziel von Anfang an definiert wird, kann das Modell es als Leitprinzip im gesamten iterativen Prozess verwenden. Dies stellt sicher, dass jede Iteration dem gewünschten Ergebnis näherkommt, was den Prozess effizienter und fokussierter macht.  
Hier ist ein Beispiel, wie man einen Reiseplan mit einem Ziel vor der Iteration für ein Reisebüro in Python aufbauen könnte:  

### Szenario  
Ein Reisebüro möchte einen maßgeschneiderten Urlaub für einen Kunden planen. Das Ziel ist es, eine Reiseroute zu erstellen, die die Zufriedenheit des Kunden basierend auf seinen Präferenzen und seinem Budget maximiert.  

### Schritte  
1. Definieren Sie die Präferenzen und das Budget des Kunden.  
2. Erstellen Sie den Anfangsplan basierend auf diesen Präferenzen.  
3. Iterieren Sie, um den Plan zu verfeinern und die Kundenzufriedenheit zu optimieren.  

#### Python-Code  
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

#### Code-Erklärung  
1. **Initialisierung (`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost` Methode)**: Diese Methode berechnet die Gesamtkosten des aktuellen Plans, einschließlich eines potenziellen neuen Reiseziels.  

#### Beispielverwendung  
- **Anfangsplan**: Das Reisebüro erstellt einen Anfangsplan basierend auf den Präferenzen des Kunden für Sightseeing und einem Budget von 2000 $.  
- **Verfeinerter Plan**: Das Reisebüro iteriert den Plan und optimiert ihn basierend auf den Präferenzen und dem Budget des Kunden.  
Indem der Plan mit einem klaren Ziel (z. B. Maximierung der Kundenzufriedenheit) aufgebaut und durch Iteration verfeinert wird, kann das Reisebüro eine maßgeschneiderte und optimierte Reiseroute für den Kunden erstellen. Dieser Ansatz stellt sicher, dass der Reiseplan von Anfang an mit den Präferenzen und dem Budget des Kunden übereinstimmt und sich mit jeder Iteration verbessert.  

### Nutzung von LLM für Re-Ranking und Scoring  
Große Sprachmodelle (LLMs) können für Re-Ranking und Scoring verwendet werden, indem sie die Relevanz und Qualität abgerufener Dokumente oder generierter Antworten bewerten. So funktioniert es:  
**Abruf:** Der erste Abrufschritt holt eine Menge Kandidatendokumente oder Antworten basierend auf der Anfrage.  
**Re-Ranking:** Das LLM bewertet diese Kandidaten und ordnet sie neu nach ihrer Relevanz und Qualität. Dieser Schritt stellt sicher, dass die relevantesten und qualitativ hochwertigsten Informationen zuerst präsentiert werden.  
**Scoring:** Das LLM vergibt Punktzahlen an jeden Kandidaten, die deren Relevanz und Qualität widerspiegeln. Dies hilft, die beste Antwort oder das beste Dokument für den Benutzer auszuwählen.  
Durch den Einsatz von LLMs für Re-Ranking und Scoring kann das System genauere und kontextuell relevantere Informationen bereitstellen und so die Benutzererfahrung insgesamt verbessern.  
Hier ist ein Beispiel, wie ein Reisebüro ein großes Sprachmodell (LLM) für Re-Ranking und Scoring von Reisezielen basierend auf Benutzerpräferenzen in Python verwenden könnte:  

#### Szenario - Reisen basierend auf Präferenzen  
Ein Reisebüro möchte dem Kunden die besten Reiseziele basierend auf seinen Präferenzen empfehlen. Das LLM hilft dabei, die Reiseziele neu zu bewerten und zu bewerten, um sicherzustellen, dass die relevantesten Optionen präsentiert werden.  

#### Schritte:  
1. Sammeln Sie Benutzerpräferenzen.  
2. Rufen Sie eine Liste potenzieller Reiseziele ab.  
3. Verwenden Sie das LLM, um die Reiseziele basierend auf den Benutzerpräferenzen neu zu bewerten und zu bewerten.  
So können Sie das vorherige Beispiel aktualisieren, um Azure OpenAI Services zu verwenden:  

#### Voraussetzungen  
1. Sie benötigen ein Azure-Abonnement.  
2. Erstellen Sie eine Azure OpenAI-Ressource und erhalten Sie Ihren API-Schlüssel.  

#### Beispiel Python-Code  
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

#### Code-Erklärung - Präferenzbucher  
1. **Initialisierung**: Ersetzen Sie `TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` durch die tatsächliche Endpunkt-URL Ihrer Azure OpenAI-Bereitstellung.  
Durch die Nutzung des LLM für Re-Ranking und Scoring kann das Reisebüro personalisierte und relevantere Reiseempfehlungen für Kunden bereitstellen und so deren Gesamterlebnis verbessern.  

### RAG: Prompting-Technik vs Werkzeug  
Retrieval-Augmented Generation (RAG) kann sowohl eine Prompting-Technik als auch ein Werkzeug bei der Entwicklung von KI-Agenten sein. Das Verständnis des Unterschieds zwischen beiden kann Ihnen helfen, RAG in Ihren Projekten effektiver zu nutzen.  

#### RAG als Prompting-Technik  
**Was ist das?**  
- Als Prompting-Technik beinhaltet RAG die Formulierung spezifischer Anfragen oder Prompts, um die Beschaffung relevanter Informationen aus einem großen Korpus oder einer Datenbank zu steuern. Diese Informationen werden dann verwendet, um Antworten oder Aktionen zu generieren.  
**Wie funktioniert es:**  
1. **Prompts formulieren**: Erstellen Sie gut strukturierte Prompts oder Anfragen basierend auf der Aufgabe oder der Benutzereingabe.  
2. **Informationen abrufen**: Verwenden Sie die Prompts, um relevante Daten aus einer vorhandenen Wissensbasis oder einem Datensatz zu suchen.  
3. **Antwort generieren**: Kombinieren Sie die abgerufenen Informationen mit generativen KI-Modellen, um eine umfassende und kohärente Antwort zu erzeugen.  
**Beispiel im Reisebüro:**  
- Benutzereingabe: "Ich möchte Museen in Paris besuchen."  
- Prompt: "Finde die besten Museen in Paris."  
- Abgerufene Informationen: Details über das Louvre-Museum, Musée d'Orsay usw.  
- Generierte Antwort: "Hier sind einige der besten Museen in Paris: Louvre-Museum, Musée d'Orsay und Centre Pompidou."  

#### RAG als Werkzeug  
**Was ist das?**  
- Als Werkzeug ist RAG ein integriertes System, das den Abruf- und Generierungsprozess automatisiert und es Entwicklern erleichtert, komplexe KI-Funktionalitäten zu implementieren, ohne für jede Anfrage manuell Prompts zu erstellen.  
**Wie funktioniert es:**  
1. **Integration**: Betten Sie RAG in die Architektur des KI-Agenten ein, sodass es automatisch die Abruf- und Generierungsaufgaben übernimmt.  
2. **Automatisierung**: Das Werkzeug verwaltet den gesamten Prozess vom Empfang der Benutzereingabe bis zur Generierung der endgültigen Antwort, ohne explizite Prompts für jeden Schritt zu benötigen.  
3. **Effizienz**: Verbessert die Leistung des Agenten, indem der Abruf- und Generierungsprozess optimiert wird und schnellere sowie genauere Antworten ermöglicht.  
**Beispiel im Reisebüro:**  
- Benutzereingabe: "Ich möchte Museen in Paris besuchen."  
- RAG-Werkzeug: Ruft automatisch Informationen über Museen ab und generiert eine Antwort.  
- Generierte Antwort: "Hier sind einige der besten Museen in Paris: Louvre-Museum, Musée d'Orsay und Centre Pompidou."  

### Vergleich  

| Aspekt                  | Prompting-Technik                                    | Werkzeug                                          |  
|-------------------------|-----------------------------------------------------|--------------------------------------------------|  
| **Manuell vs Automatisch** | Manuelle Formulierung von Prompts für jede Anfrage | Automatisierter Prozess für Abruf und Generierung |  
| **Kontrolle**            | Bietet mehr Kontrolle über den Abrufprozess         | Optimiert und automatisiert Abruf und Generierung |  
| **Flexibilität**         | Ermöglicht individuelle Prompts basierend auf Bedarf | Effizienter für groß angelegte Implementierungen |  
| **Komplexität**          | Erfordert das Erstellen und Anpassen von Prompts     | Einfacher in die KI-Agenten-Architektur integrierbar |  

### Praktische Beispiele  
**Beispiel für Prompting-Technik:** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**Beispiel für Werkzeug:** ```python
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

### Bewertung der Relevanz  
Die Bewertung der Relevanz ist ein entscheidender Aspekt der Leistung von KI-Agenten. Sie stellt sicher, dass die vom Agenten abgerufenen und generierten Informationen angemessen, korrekt und für den Benutzer nützlich sind.  
Lassen Sie uns erkunden, wie man die Relevanz in KI-Agenten bewertet, einschließlich praktischer Beispiele und Techniken.  

#### Schlüsselkonzepte bei der Bewertung der Relevanz  
1. **Kontextbewusstsein**:  
- Der Agent muss den Kontext der Benutzeranfrage verstehen, um relevante Informationen abzurufen und zu generieren.  
- Beispiel: Wenn ein Benutzer nach "besten Restaurants in Paris" fragt, sollte der Agent die Präferenzen des Benutzers berücksichtigen, wie z. B. die Art der Küche und das Budget.  
2. **Genauigkeit**:  
- Die vom Agenten bereitgestellten Informationen sollten sachlich korrekt und aktuell sein.  
- Beispiel: Empfehlung von derzeit geöffneten Restaurants mit guten Bewertungen anstelle von veralteten oder geschlossenen Optionen.  
3. **Benutzerabsicht**:
Der Agent sollte die Absicht des Benutzers hinter der Anfrage ableiten, um die relevantesten Informationen bereitzustellen. - Beispiel: Wenn ein Benutzer nach „preisgünstigen Hotels“ fragt, sollte der Agent erschwingliche Optionen priorisieren. 4. **Feedback-Schleife**: - Das kontinuierliche Sammeln und Analysieren von Benutzerfeedback hilft dem Agenten, seinen Prozess zur Bewertung der Relevanz zu verfeinern. - Beispiel: Einbeziehung von Benutzerbewertungen und Feedback zu vorherigen Empfehlungen, um zukünftige Antworten zu verbessern. #### Praktische Techniken zur Bewertung der Relevanz 1. **Relevanzbewertung**: - Weisen Sie jedem abgerufenen Element eine Relevanzbewertung zu, basierend darauf, wie gut es zur Anfrage und den Präferenzen des Benutzers passt. - Beispiel: ```python
     def relevance_score(item, query):
         score = 0
         if item['category'] in query['interests']:
             score += 1
         if item['price'] <= query['budget']:
             score += 1
         if item['location'] == query['destination']:
             score += 1
         return score
     ``` 2. **Filterung und Ranking**: - Filtern Sie irrelevante Elemente heraus und ordnen Sie die verbleibenden nach ihren Relevanzbewertungen. - Beispiel: ```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ``` 3. **Verarbeitung natürlicher Sprache (NLP)**: - Verwenden Sie NLP-Techniken, um die Anfrage des Benutzers zu verstehen und relevante Informationen abzurufen. - Beispiel: ```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ``` 4. **Integration von Benutzerfeedback**: - Sammeln Sie Benutzerfeedback zu den bereitgestellten Empfehlungen und verwenden Sie es, um zukünftige Relevanzbewertungen anzupassen. - Beispiel: ```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ``` #### Beispiel: Bewertung der Relevanz im Travel Agent Hier ist ein praktisches Beispiel, wie Travel Agent die Relevanz von Reiseempfehlungen bewerten kann: ```python
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
``` ### Suche mit Absicht Suche mit Absicht bedeutet, den zugrundeliegenden Zweck oder das Ziel hinter der Anfrage eines Benutzers zu verstehen und zu interpretieren, um die relevantesten und nützlichsten Informationen abzurufen und zu generieren. Dieser Ansatz geht über das einfache Abgleichen von Schlüsselwörtern hinaus und konzentriert sich darauf, die tatsächlichen Bedürfnisse und den Kontext des Benutzers zu erfassen. #### Schlüsselkonzepte der Suche mit Absicht 1. **Verstehen der Benutzerabsicht**: - Die Benutzerabsicht kann in drei Haupttypen eingeteilt werden: informativ, navigational und transaktional. - **Informative Absicht**: Der Benutzer sucht Informationen zu einem Thema (z. B. „Was sind die besten Museen in Paris?“). - **Navigationale Absicht**: Der Benutzer möchte zu einer bestimmten Website oder Seite navigieren (z. B. „Offizielle Webseite des Louvre Museums“). - **Transaktionale Absicht**: Der Benutzer möchte eine Transaktion durchführen, z. B. einen Flug buchen oder einen Kauf tätigen (z. B. „Flug nach Paris buchen“). 2. **Kontextbewusstsein**: - Die Analyse des Kontexts der Benutzeranfrage hilft, die Absicht genau zu identifizieren. Dies umfasst die Berücksichtigung vorheriger Interaktionen, Benutzerpräferenzen und der spezifischen Details der aktuellen Anfrage. 3. **Verarbeitung natürlicher Sprache (NLP)**: - NLP-Techniken werden eingesetzt, um die natürlichsprachlichen Anfragen der Benutzer zu verstehen und zu interpretieren. Dazu gehören Aufgaben wie Entitätserkennung, Sentiment-Analyse und Abfrageparsing. 4. **Personalisierung**: - Die Personalisierung der Suchergebnisse basierend auf der Historie, den Präferenzen und dem Feedback des Benutzers erhöht die Relevanz der abgerufenen Informationen. #### Praktisches Beispiel: Suche mit Absicht im Travel Agent Schauen wir uns Travel Agent als Beispiel an, um zu sehen, wie Suche mit Absicht implementiert werden kann. 1. **Erfassung der Benutzerpräferenzen** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ``` 2. **Verstehen der Benutzerabsicht** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ``` 3. **Kontextbewusstsein** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ``` 4. **Suche und Personalisierung der Ergebnisse** ```python
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
   ``` 5. **Beispielanwendung** ```python
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
   ``` --- ## 4. Codegenerierung als Werkzeug Codegenerierende Agenten verwenden KI-Modelle, um Code zu schreiben und auszuführen, komplexe Probleme zu lösen und Aufgaben zu automatisieren. ### Codegenerierende Agenten Codegenerierende Agenten nutzen generative KI-Modelle, um Code zu schreiben und auszuführen. Diese Agenten können komplexe Probleme lösen, Aufgaben automatisieren und wertvolle Erkenntnisse liefern, indem sie Code in verschiedenen Programmiersprachen generieren und ausführen. #### Praktische Anwendungen 1. **Automatisierte Codegenerierung**: Erzeugen von Code-Snippets für spezifische Aufgaben wie Datenanalyse, Web-Scraping oder maschinelles Lernen. 2. **SQL als RAG**: Verwenden von SQL-Abfragen, um Daten aus Datenbanken abzurufen und zu manipulieren. 3. **Problemlösung**: Erstellen und Ausführen von Code zur Lösung spezifischer Probleme, z. B. Optimierung von Algorithmen oder Datenanalyse. #### Beispiel: Codegenerierender Agent für Datenanalyse Stellen Sie sich vor, Sie entwerfen einen codegenerierenden Agenten. So könnte er funktionieren: 1. **Aufgabe**: Analysieren eines Datensatzes, um Trends und Muster zu identifizieren. 2. **Schritte**: - Laden des Datensatzes in ein Datenanalysetool. - Generieren von SQL-Abfragen zum Filtern und Aggregieren der Daten. - Ausführen der Abfragen und Abrufen der Ergebnisse. - Verwenden der Ergebnisse zur Erstellung von Visualisierungen und Erkenntnissen. 3. **Erforderliche Ressourcen**: Zugriff auf den Datensatz, Datenanalysetools und SQL-Fähigkeiten. 4. **Erfahrung**: Nutzung vergangener Analyseergebnisse zur Verbesserung der Genauigkeit und Relevanz zukünftiger Analysen. ### Beispiel: Codegenerierender Agent für Travel Agent In diesem Beispiel entwerfen wir einen codegenerierenden Agenten, Travel Agent, der Benutzer bei der Reiseplanung unterstützt, indem er Code generiert und ausführt. Dieser Agent kann Aufgaben wie das Abrufen von Reiseoptionen, das Filtern von Ergebnissen und das Zusammenstellen einer Reiseroute mithilfe generativer KI übernehmen. #### Überblick über den codegenerierenden Agenten 1. **Erfassung der Benutzerpräferenzen**: Erfasst Benutzereingaben wie Zielort, Reisedaten, Budget und Interessen. 2. **Generierung von Code zum Abrufen von Daten**: Erzeugt Code-Snippets zum Abrufen von Daten zu Flügen, Hotels und Attraktionen. 3. **Ausführung des generierten Codes**: Führt den generierten Code aus, um Echtzeitinformationen abzurufen. 4. **Erstellung der Reiseroute**: Fasst die abgerufenen Daten zu einem personalisierten Reiseplan zusammen. 5. **Anpassung basierend auf Feedback**: Nimmt Benutzerfeedback entgegen und generiert bei Bedarf den Code neu, um die Ergebnisse zu verfeinern. #### Schritt-für-Schritt-Implementierung 1. **Erfassung der Benutzerpräferenzen** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ``` 2. **Generierung von Code zum Abrufen von Daten** ```python
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
   ``` 3. **Ausführung des generierten Codes** ```python
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
   ``` 4. **Erstellung der Reiseroute** ```python
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
   ``` 5. **Anpassung basierend auf Feedback** ```python
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
   ``` ### Nutzung von Umweltbewusstsein und Reasoning Die Nutzung des Schemas der Tabelle kann den Abfragegenerierungsprozess durch Umweltbewusstsein und Reasoning tatsächlich verbessern. Hier ein Beispiel, wie das umgesetzt werden kann: 1. **Verstehen des Schemas**: Das System versteht das Schema der Tabelle und nutzt diese Information, um die Abfrageerstellung zu fundieren. 2. **Anpassung basierend auf Feedback**: Das System passt Benutzerpräferenzen basierend auf Feedback an und überlegt, welche Felder im Schema aktualisiert werden müssen. 3. **Generierung und Ausführung von Abfragen**: Das System generiert und führt Abfragen aus, um aktualisierte Flug- und Hoteldaten basierend auf den neuen Präferenzen abzurufen. Hier ein aktualisiertes Python-Codebeispiel, das diese Konzepte integriert: ```python
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
``` #### Erklärung - Buchung basierend auf Feedback 1. **Schema-Bewusstsein**: Die Methode `schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` passt die Anpassungen basierend auf Schema und Feedback an. 4. **Generierung und Ausführung von Abfragen**: Das System generiert Code zum Abrufen aktualisierter Flug- und Hoteldaten basierend auf den angepassten Präferenzen und simuliert die Ausführung dieser Abfragen. 5. **Erstellung der Reiseroute**: Das System erstellt eine aktualisierte Reiseroute basierend auf den neuen Flug-, Hotel- und Attraktionsdaten. Durch Umweltbewusstsein und Schema-basiertes Reasoning kann das System genauere und relevantere Abfragen generieren, was zu besseren Reiseempfehlungen und einer personalisierteren Benutzererfahrung führt. ### Verwendung von SQL als Retrieval-Augmented Generation (RAG)-Technik SQL (Structured Query Language) ist ein leistungsfähiges Werkzeug zur Interaktion mit Datenbanken. Wenn SQL als Teil eines Retrieval-Augmented Generation (RAG)-Ansatzes verwendet wird, kann es relevante Daten aus Datenbanken abrufen, um Antworten oder Aktionen in KI-Agenten zu informieren und zu generieren. Schauen wir uns an, wie SQL als RAG-Technik im Kontext von Travel Agent verwendet werden kann. #### Schlüsselkonzepte 1. **Datenbankinteraktion**: - SQL wird verwendet, um Datenbanken abzufragen, relevante Informationen abzurufen und Daten zu manipulieren. - Beispiel: Abrufen von Flugdaten, Hotelinformationen und Attraktionen aus einer Reisedatenbank. 2. **Integration mit RAG**: - SQL-Abfragen werden basierend auf Benutzereingaben und Präferenzen generiert. - Die abgerufenen Daten werden dann verwendet, um personalisierte Empfehlungen oder Aktionen zu generieren. 3. **Dynamische Abfragegenerierung**: - Der KI-Agent generiert dynamische SQL-Abfragen basierend auf Kontext und Benutzerbedürfnissen. - Beispiel: Anpassen von SQL-Abfragen, um Ergebnisse basierend auf Budget, Daten und Interessen zu filtern. #### Anwendungen - **Automatisierte Codegenerierung**: Erzeugen von Code-Snippets für spezifische Aufgaben. - **SQL als RAG**: Verwenden von SQL-Abfragen zur Datenmanipulation. - **Problemlösung**: Erstellen und Ausführen von Code zur Problemlösung. **Beispiel**: Ein Datenanalyse-Agent: 1. **Aufgabe**: Analysieren eines Datensatzes, um Trends zu finden. 2. **Schritte**: - Laden des Datensatzes. - Generieren von SQL-Abfragen zum Filtern der Daten. - Ausführen der Abfragen und Abrufen der Ergebnisse. - Erzeugen von Visualisierungen und Erkenntnissen. 3. **Ressourcen**: Zugriff auf den Datensatz, SQL-Fähigkeiten. 4. **Erfahrung**: Nutzung vergangener Ergebnisse zur Verbesserung zukünftiger Analysen. #### Praktisches Beispiel: Verwendung von SQL im Travel Agent 1. **Erfassung der Benutzerpräferenzen** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ``` 2. **Generierung von SQL-Abfragen** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ``` 3. **Ausführung von SQL-Abfragen** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ``` 4. **Generierung von Empfehlungen** ```python
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
   ``` #### Beispiel-SQL-Abfragen 1. **Flug-Abfrage** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ``` 2. **Hotel-Abfrage** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ``` 3. **Attraktions-Abfrage** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ``` Durch die Nutzung von SQL als Teil der Retrieval-Augmented Generation (RAG)-Technik können KI-Agenten wie Travel Agent dynamisch relevante Daten abrufen und nutzen, um genaue und personalisierte Empfehlungen zu geben. ### Beispiel für Metakognition Um eine Implementierung von Metakognition zu demonstrieren, erstellen wir einen einfachen Agenten, der *über seinen Entscheidungsprozess reflektiert*, während er ein Problem löst. In diesem Beispiel bauen wir ein System, bei dem ein Agent versucht, die Wahl eines Hotels zu optimieren, aber anschließend sein eigenes Reasoning bewertet und seine Strategie anpasst, wenn er Fehler oder suboptimale Entscheidungen trifft. Wir simulieren dies anhand eines einfachen Beispiels, bei dem der Agent Hotels basierend auf einer Kombination aus Preis und Qualität auswählt, aber seine Entscheidungen „reflektiert“ und entsprechend anpasst. #### Wie dies Metakognition illustriert: 1. **Erstentscheidung**: Der Agent wählt das günstigste Hotel, ohne die Qualitätsauswirkung zu verstehen. 2. **Reflexion und Bewertung**: Nach der Erstwahl prüft der Agent anhand von Benutzerfeedback, ob das Hotel eine „schlechte“ Wahl war. Wenn die Qualität zu niedrig war, reflektiert er sein Reasoning. 3. **Strategieanpassung**: Der Agent passt seine Strategie basierend auf der Reflexion an und wechselt von „günstigstes“ zu „höchste_Qualität“, wodurch er seinen Entscheidungsprozess in zukünftigen Durchläufen verbessert. Hier ein Beispiel: ```python
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
``` #### Metakognitive Fähigkeiten des Agenten Der Schlüssel ist die Fähigkeit des Agenten: - Seine vorherigen Entscheidungen und den Entscheidungsprozess zu bewerten. - Seine Strategie basierend auf dieser Reflexion anzupassen, also Metakognition in Aktion. Dies ist eine einfache Form von Metakognition, bei der das System seinen Reasoning-Prozess basierend auf internem Feedback anpassen kann. ### Fazit Metakognition ist ein mächtiges Werkzeug, das die Fähigkeiten von KI-Agenten erheblich verbessern kann. Durch die Integration von metakognitiven
Prozesse, können Sie Agenten entwerfen, die intelligenter, anpassungsfähiger und effizienter sind. Nutzen Sie die zusätzlichen Ressourcen, um die faszinierende Welt der Metakognition bei KI-Agenten weiter zu erkunden. ## Vorherige Lektion [Multi-Agent Design Pattern](../08-multi-agent/README.md) ## Nächste Lektion [KI-Agenten in der Produktion](../10-ai-agents-production/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.