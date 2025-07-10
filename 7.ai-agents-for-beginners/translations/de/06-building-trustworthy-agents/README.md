<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f57852cac3a86c4a5ef47f793cc12178",
  "translation_date": "2025-05-20T09:10:13+00:00",
  "source_file": "06-building-trustworthy-agents/README.md",
  "language_code": "de"
}
-->
[![Trustworthy AI Agents](../../../translated_images/lesson-6-thumbnail.74ea485dbd9a9c3fb4c749f30f2b8130d025072b4d7d911c6f540eac5a78e6b8.de.png)](https://youtu.be/iZKkMEGBCUQ?si=Q-kEbcyHUMPoHp8L)

> _(Klicken Sie auf das Bild oben, um das Video zu dieser Lektion anzusehen)_

# Vertrauenswürdige AI Agents entwickeln

## Einführung

In dieser Lektion behandeln wir:

- Wie man sichere und effektive AI Agents entwickelt und bereitstellt
- Wichtige Sicherheitsaspekte bei der Entwicklung von AI Agents
- Wie man Datenschutz und Benutzerprivatsphäre bei der Entwicklung von AI Agents gewährleistet

## Lernziele

Nach Abschluss dieser Lektion wissen Sie, wie Sie:

- Risiken bei der Erstellung von AI Agents erkennen und mindern
- Sicherheitsmaßnahmen umsetzen, um Daten und Zugriffe korrekt zu verwalten
- AI Agents erstellen, die Datenschutz gewährleisten und eine gute Benutzererfahrung bieten

## Sicherheit

Schauen wir uns zunächst an, wie man sichere agentenbasierte Anwendungen entwickelt. Sicherheit bedeutet, dass der AI Agent wie vorgesehen funktioniert. Als Entwickler agentenbasierter Anwendungen stehen uns Methoden und Werkzeuge zur Verfügung, um die Sicherheit zu maximieren:

### Aufbau eines System Message Frameworks

Wenn Sie schon einmal eine AI-Anwendung mit Large Language Models (LLMs) entwickelt haben, wissen Sie, wie wichtig ein robustes Systemprompt oder eine Systemnachricht ist. Diese Prompts legen die Meta-Regeln, Anweisungen und Richtlinien fest, wie das LLM mit dem Benutzer und den Daten interagiert.

Für AI Agents ist das Systemprompt noch wichtiger, da die AI Agents sehr spezifische Anweisungen benötigen, um die von uns vorgesehenen Aufgaben zu erfüllen.

Um skalierbare Systemprompts zu erstellen, können wir ein System Message Framework verwenden, um einen oder mehrere Agents in unserer Anwendung zu bauen:

![Building a System Message Framework](../../../translated_images/system-message-framework.9df67f3d863520cd48878f71a1289740d8cb46e9d63ee065090ccf3b9b6b82a1.de.png)

#### Schritt 1: Erstellen einer Meta System Message

Das Meta-Prompt wird von einem LLM genutzt, um die Systemprompts für die von uns erstellten Agents zu generieren. Wir gestalten es als Vorlage, damit wir bei Bedarf effizient mehrere Agents erstellen können.

Hier ein Beispiel für eine Meta System Message, die wir dem LLM geben würden:

```plaintext
You are an expert at creating AI agent assistants. 
You will be provided a company name, role, responsibilities and other
information that you will use to provide a system prompt for.
To create the system prompt, be descriptive as possible and provide a structure that a system using an LLM can better understand the role and responsibilities of the AI assistant. 
```

#### Schritt 2: Erstellen eines Basis-Prompts

Als nächstes erstellen wir ein Basis-Prompt, das den AI Agent beschreibt. Dabei sollten Sie die Rolle des Agents, die Aufgaben, die der Agent erfüllen soll, und weitere Verantwortlichkeiten des Agents angeben.

Hier ein Beispiel:

```plaintext
You are a travel agent for Contoso Travel that is great at booking flights for customers. To help customers you can perform the following tasks: lookup available flights, book flights, ask for preferences in seating and times for flights, cancel any previously booked flights and alert customers on any delays or cancellations of flights.  
```

#### Schritt 3: Basis-Systemnachricht an das LLM übergeben

Nun können wir diese Systemnachricht optimieren, indem wir die Meta System Message als Systemnachricht und unser Basis-Prompt übergeben.

Dadurch entsteht eine Systemnachricht, die besser darauf ausgelegt ist, unsere AI Agents zu steuern:

```markdown
**Company Name:** Contoso Travel  
**Role:** Travel Agent Assistant

**Objective:**  
You are an AI-powered travel agent assistant for Contoso Travel, specializing in booking flights and providing exceptional customer service. Your main goal is to assist customers in finding, booking, and managing their flights, all while ensuring that their preferences and needs are met efficiently.

**Key Responsibilities:**

1. **Flight Lookup:**
    
    - Assist customers in searching for available flights based on their specified destination, dates, and any other relevant preferences.
    - Provide a list of options, including flight times, airlines, layovers, and pricing.
2. **Flight Booking:**
    
    - Facilitate the booking of flights for customers, ensuring that all details are correctly entered into the system.
    - Confirm bookings and provide customers with their itinerary, including confirmation numbers and any other pertinent information.
3. **Customer Preference Inquiry:**
    
    - Actively ask customers for their preferences regarding seating (e.g., aisle, window, extra legroom) and preferred times for flights (e.g., morning, afternoon, evening).
    - Record these preferences for future reference and tailor suggestions accordingly.
4. **Flight Cancellation:**
    
    - Assist customers in canceling previously booked flights if needed, following company policies and procedures.
    - Notify customers of any necessary refunds or additional steps that may be required for cancellations.
5. **Flight Monitoring:**
    
    - Monitor the status of booked flights and alert customers in real-time about any delays, cancellations, or changes to their flight schedule.
    - Provide updates through preferred communication channels (e.g., email, SMS) as needed.

**Tone and Style:**

- Maintain a friendly, professional, and approachable demeanor in all interactions with customers.
- Ensure that all communication is clear, informative, and tailored to the customer's specific needs and inquiries.

**User Interaction Instructions:**

- Respond to customer queries promptly and accurately.
- Use a conversational style while ensuring professionalism.
- Prioritize customer satisfaction by being attentive, empathetic, and proactive in all assistance provided.

**Additional Notes:**

- Stay updated on any changes to airline policies, travel restrictions, and other relevant information that could impact flight bookings and customer experience.
- Use clear and concise language to explain options and processes, avoiding jargon where possible for better customer understanding.

This AI assistant is designed to streamline the flight booking process for customers of Contoso Travel, ensuring that all their travel needs are met efficiently and effectively.

```

#### Schritt 4: Iterieren und Verbessern

Der Vorteil dieses System Message Frameworks besteht darin, die Erstellung von Systemnachrichten für mehrere Agents einfacher zu skalieren und die Systemnachrichten im Laufe der Zeit zu verbessern. Es ist selten, dass eine Systemnachricht beim ersten Versuch perfekt für den gesamten Anwendungsfall funktioniert. Kleine Anpassungen und Verbesserungen am Basis-Prompt und deren erneutes Durchlaufen durch das System ermöglichen es, Ergebnisse zu vergleichen und zu bewerten.

## Bedrohungen verstehen

Um vertrauenswürdige AI Agents zu entwickeln, ist es wichtig, die Risiken und Bedrohungen für Ihren AI Agent zu verstehen und zu mindern. Schauen wir uns einige der verschiedenen Bedrohungen für AI Agents an und wie Sie besser planen und sich darauf vorbereiten können.

![Understanding Threats](../../../translated_images/understanding-threats.f8fbe6fe11e025b3085fc91e82d975937ad1d672260a2aeed40458aa41798d0e.de.png)

### Aufgabe und Anweisung

**Beschreibung:** Angreifer versuchen, die Anweisungen oder Ziele des AI Agents durch Prompting oder Manipulation der Eingaben zu verändern.

**Abwehr:** Führen Sie Validierungsprüfungen und Eingabefilter durch, um potenziell gefährliche Prompts zu erkennen, bevor sie vom AI Agent verarbeitet werden. Da solche Angriffe in der Regel häufige Interaktionen mit dem Agent erfordern, kann das Begrenzen der Anzahl der Gesprächsrunden eine weitere Möglichkeit sein, diese Angriffe zu verhindern.

### Zugriff auf kritische Systeme

**Beschreibung:** Hat ein AI Agent Zugriff auf Systeme und Dienste, die sensible Daten speichern, können Angreifer die Kommunikation zwischen dem Agent und diesen Diensten kompromittieren. Dies können direkte Angriffe oder indirekte Versuche sein, über den Agent Informationen über diese Systeme zu erlangen.

**Abwehr:** AI Agents sollten nur bedarfsorientierten Zugriff auf Systeme haben, um diese Art von Angriffen zu verhindern. Die Kommunikation zwischen Agent und System sollte ebenfalls sicher sein. Die Implementierung von Authentifizierung und Zugriffskontrollen ist eine weitere Möglichkeit, diese Informationen zu schützen.

### Überlastung von Ressourcen und Diensten

**Beschreibung:** AI Agents können verschiedene Werkzeuge und Dienste nutzen, um Aufgaben zu erledigen. Angreifer können diese Fähigkeit ausnutzen, indem sie über den AI Agent eine hohe Anzahl von Anfragen an diese Dienste senden, was zu Systemausfällen oder hohen Kosten führen kann.

**Abwehr:** Setzen Sie Richtlinien ein, um die Anzahl der Anfragen, die ein AI Agent an einen Dienst stellen kann, zu begrenzen. Auch das Begrenzen der Gesprächsrunden und Anfragen an Ihren AI Agent ist eine weitere Möglichkeit, diese Angriffe zu verhindern.

### Vergiftung der Wissensbasis

**Beschreibung:** Diese Art von Angriff zielt nicht direkt auf den AI Agent ab, sondern auf die Wissensbasis und andere Dienste, die der AI Agent zur Erfüllung seiner Aufgaben nutzt. Dabei können Daten oder Informationen manipuliert werden, was zu verzerrten oder unerwünschten Antworten des Agents führt.

**Abwehr:** Führen Sie regelmäßige Überprüfungen der Daten durch, die der AI Agent in seinen Arbeitsabläufen nutzt. Stellen Sie sicher, dass der Zugriff auf diese Daten sicher ist und nur von vertrauenswürdigen Personen geändert werden kann, um diese Art von Angriffen zu vermeiden.

### Kaskadierende Fehler

**Beschreibung:** AI Agents greifen auf verschiedene Werkzeuge und Dienste zu, um Aufgaben zu erledigen. Fehler, die durch Angreifer verursacht werden, können zu Ausfällen anderer Systeme führen, mit denen der AI Agent verbunden ist, wodurch sich der Angriff ausbreitet und schwerer zu beheben ist.

**Abwehr:** Eine Möglichkeit, dies zu vermeiden, ist, den AI Agent in einer eingeschränkten Umgebung arbeiten zu lassen, z. B. indem Aufgaben in einem Docker-Container ausgeführt werden, um direkte Systemangriffe zu verhindern. Fallback-Mechanismen und Wiederholungslogiken bei Fehlerantworten bestimmter Systeme sind weitere Maßnahmen, um größere Systemausfälle zu vermeiden.

## Human-in-the-Loop

Eine weitere effektive Methode, vertrauenswürdige AI Agent Systeme zu entwickeln, ist der Einsatz eines Human-in-the-Loop. Dabei entsteht ein Ablauf, bei dem Benutzer während der Ausführung Feedback an die Agents geben können. Benutzer agieren dabei quasi als Agents in einem Multi-Agenten-System und können den laufenden Prozess genehmigen oder abbrechen.

![Human in The Loop](../../../translated_images/human-in-the-loop.e9edbe8f6d42041b4213421410823250aa750fe8bdba5601d69ed46f3ff6489d.de.png)

Hier ein Codebeispiel mit AutoGen, das zeigt, wie dieses Konzept umgesetzt wird:

```python

# Create the agents.
model_client = OpenAIChatCompletionClient(model="gpt-4o-mini")
assistant = AssistantAgent("assistant", model_client=model_client)
user_proxy = UserProxyAgent("user_proxy", input_func=input)  # Use input() to get user input from console.

# Create the termination condition which will end the conversation when the user says "APPROVE".
termination = TextMentionTermination("APPROVE")

# Create the team.
team = RoundRobinGroupChat([assistant, user_proxy], termination_condition=termination)

# Run the conversation and stream to the console.
stream = team.run_stream(task="Write a 4-line poem about the ocean.")
# Use asyncio.run(...) when running in a script.
await Console(stream)

```

## Fazit

Vertrauenswürdige AI Agents zu entwickeln erfordert sorgfältiges Design, robuste Sicherheitsmaßnahmen und kontinuierliche Iteration. Durch die Implementierung strukturierter Meta-Prompting-Systeme, das Verständnis potenzieller Bedrohungen und die Anwendung von Gegenmaßnahmen können Entwickler AI Agents schaffen, die sowohl sicher als auch effektiv sind. Zusätzlich sorgt die Einbindung eines Human-in-the-Loop-Ansatzes dafür, dass AI Agents den Bedürfnissen der Nutzer entsprechen und Risiken minimiert werden. Da sich AI stetig weiterentwickelt, ist eine proaktive Haltung zu Sicherheit, Datenschutz und ethischen Aspekten entscheidend, um Vertrauen und Zuverlässigkeit in AI-gesteuerten Systemen zu fördern.

## Zusätzliche Ressourcen

- <a href="https://learn.microsoft.com/azure/ai-studio/responsible-use-of-ai-overview" target="_blank">Responsible AI overview</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Evaluation of generative AI models and AI applications</a>
- <a href="https://learn.microsoft.com/azure/ai-services/openai/concepts/system-message?context=%2Fazure%2Fai-studio%2Fcontext%2Fcontext&tabs=top-techniques" target="_blank">Safety system messages</a>
- <a href="https://blogs.microsoft.com/wp-content/uploads/prod/sites/5/2022/06/Microsoft-RAI-Impact-Assessment-Template.pdf?culture=en-us&country=us" target="_blank">Risk Assessment Template</a>

## Vorherige Lektion

[Agentic RAG](../05-agentic-rag/README.md)

## Nächste Lektion

[Planning Design Pattern](../07-planning-design/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.