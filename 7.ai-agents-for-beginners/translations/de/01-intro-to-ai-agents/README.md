<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d84943abc8f001ad4670418d32c2d899",
  "translation_date": "2025-05-20T09:06:41+00:00",
  "source_file": "01-intro-to-ai-agents/README.md",
  "language_code": "de"
}
-->
and connect with other learners and AI Agent Builders to ask any questions you have about this course.

Um diesen Kurs zu beginnen, starten wir damit, ein besseres Verständnis dafür zu entwickeln, was AI Agents sind und wie wir sie in den Anwendungen und Workflows, die wir erstellen, einsetzen können.

## Einführung

Diese Lektion behandelt:

- Was sind AI Agents und welche verschiedenen Agententypen gibt es?
- Für welche Anwendungsfälle eignen sich AI Agents am besten und wie können sie uns helfen?
- Was sind einige der grundlegenden Bausteine beim Entwerfen agentischer Lösungen?

## Lernziele
Nach Abschluss dieser Lektion sollten Sie in der Lage sein:

- Die Konzepte von AI Agents zu verstehen und wie sie sich von anderen KI-Lösungen unterscheiden.
- AI Agents effizient anzuwenden.
- Agentische Lösungen produktiv sowohl für Benutzer als auch Kunden zu gestalten.

## Definition von AI Agents und Arten von AI Agents

### Was sind AI Agents?

AI Agents sind **Systeme**, die es **Large Language Models (LLMs)** ermöglichen, **Aktionen auszuführen**, indem sie deren Fähigkeiten erweitern, indem sie den LLMs **Zugriff auf Werkzeuge** und **Wissen** geben.

Lassen Sie uns diese Definition in kleinere Teile aufschlüsseln:

- **System** – Es ist wichtig, Agenten nicht nur als einzelne Komponente, sondern als System aus vielen Komponenten zu betrachten. Auf der grundlegenden Ebene bestehen die Komponenten eines AI Agent aus:
  - **Umgebung** – Der definierte Raum, in dem der AI Agent operiert. Zum Beispiel könnte bei einem Reisebuchungs-AI-Agenten die Umgebung das Reisebuchungssystem sein, das der AI Agent nutzt, um Aufgaben zu erledigen.
  - **Sensoren** – Umgebungen enthalten Informationen und geben Feedback. AI Agents verwenden Sensoren, um diese Informationen über den aktuellen Zustand der Umgebung zu sammeln und zu interpretieren. Im Beispiel des Reisebuchungsagenten kann das System Informationen wie Hotelverfügbarkeit oder Flugpreise bereitstellen.
  - **Aktuatoren** – Sobald der AI Agent den aktuellen Zustand der Umgebung erhält, bestimmt er für die aktuelle Aufgabe, welche Aktion ausgeführt werden soll, um die Umgebung zu verändern. Beim Reisebuchungsagenten könnte dies beispielsweise das Buchen eines verfügbaren Zimmers für den Nutzer sein.

![Was sind AI Agents?](../../../translated_images/what-are-ai-agents.125520f55950b252a429b04a9f41e0152d4dafa1f1bd9081f4f574631acb759e.de.png)

**Large Language Models** – Das Konzept der Agenten existierte bereits vor der Entwicklung von LLMs. Der Vorteil, AI Agents mit LLMs zu bauen, liegt in deren Fähigkeit, menschliche Sprache und Daten zu interpretieren. Diese Fähigkeit ermöglicht es den LLMs, Umgebungsinformationen zu interpretieren und einen Plan zu entwickeln, um die Umgebung zu verändern.

**Aktionen ausführen** – Außerhalb von AI Agent-Systemen sind LLMs auf Situationen beschränkt, in denen die Aktion darin besteht, Inhalte oder Informationen basierend auf einer Benutzereingabe zu generieren. Innerhalb von AI Agent-Systemen können LLMs Aufgaben erfüllen, indem sie die Anfrage des Nutzers interpretieren und Werkzeuge nutzen, die in ihrer Umgebung verfügbar sind.

**Zugriff auf Werkzeuge** – Welche Werkzeuge der LLM nutzen kann, wird definiert durch 1) die Umgebung, in der er operiert, und 2) den Entwickler des AI Agents. In unserem Reiseagenten-Beispiel sind die Werkzeuge des Agenten durch die Operationen im Buchungssystem begrenzt, und/oder der Entwickler kann den Zugriff des Agenten auf Werkzeuge wie Flüge einschränken.

**Speicher + Wissen** – Der Speicher kann kurzfristig im Kontext der Konversation zwischen Nutzer und Agent sein. Langfristig, über die Informationen der Umgebung hinaus, können AI Agents auch Wissen aus anderen Systemen, Diensten, Werkzeugen und sogar anderen Agenten abrufen. Im Beispiel des Reiseagenten könnte dieses Wissen die Informationen zu den Reisepräferenzen des Nutzers sein, die in einer Kundendatenbank gespeichert sind.

### Die verschiedenen Agententypen

Nachdem wir eine allgemeine Definition von AI Agents haben, betrachten wir einige spezifische Agententypen und wie diese auf einen Reisebuchungs-AI-Agenten angewendet werden könnten.

| **Agententyp**               | **Beschreibung**                                                                                                                     | **Beispiel**                                                                                                                                                                                                                 |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Einfache Reflex-Agenten**  | Führen sofortige Aktionen basierend auf vordefinierten Regeln aus.                                                                   | Der Reiseagent interpretiert den Kontext einer E-Mail und leitet Reisebeschwerden an den Kundenservice weiter.                                                                                                              |
| **Modellbasierte Reflex-Agenten** | Führen Aktionen basierend auf einem Weltmodell und Änderungen daran aus.                                                          | Der Reiseagent priorisiert Routen mit signifikanten Preisänderungen basierend auf historische Preisdaten.                                                                                                                   |
| **Zielorientierte Agenten**  | Erstellen Pläne, um spezifische Ziele zu erreichen, indem sie das Ziel interpretieren und Aktionen zur Zielerreichung bestimmen.     | Der Reiseagent bucht eine Reise, indem er notwendige Reisevorbereitungen (Auto, öffentliche Verkehrsmittel, Flüge) vom aktuellen Standort zum Zielort bestimmt.                                                              |
| **Nutzenorientierte Agenten**| Berücksichtigen Präferenzen und wägen numerisch Abwägungen ab, um Ziele zu erreichen.                                               | Der Reiseagent maximiert den Nutzen, indem er Bequemlichkeit gegen Kosten bei der Buchung abwägt.                                                                                                                            |
| **Lernende Agenten**         | Verbessern sich im Laufe der Zeit, indem sie auf Feedback reagieren und Aktionen entsprechend anpassen.                             | Der Reiseagent verbessert sich, indem er Kundenfeedback aus Nachreiseumfragen nutzt, um zukünftige Buchungen anzupassen.                                                                                                     |
| **Hierarchische Agenten**    | Bestehen aus mehreren Agenten in einem gestuften System, wobei höherstufige Agenten Aufgaben in Teilaufgaben für niedrigstufige Agenten aufteilen. | Der Reiseagent storniert eine Reise, indem er die Aufgabe in Teilaufgaben (z. B. einzelne Buchungen stornieren) aufteilt und niedrigstufige Agenten diese erledigen, die dann an den höherstufigen Agenten berichten.           |
| **Multi-Agenten-Systeme (MAS)** | Agenten erledigen Aufgaben unabhängig, entweder kooperativ oder kompetitiv.                                                       | Kooperativ: Mehrere Agenten buchen spezifische Reisedienstleistungen wie Hotels, Flüge und Unterhaltung. Kompetitiv: Mehrere Agenten verwalten und konkurrieren um einen gemeinsamen Hotelbuchungskalender, um Kunden zu buchen. |

## Wann AI Agents einsetzen

Im vorherigen Abschnitt haben wir das Beispiel des Reiseagenten verwendet, um zu erklären, wie die verschiedenen Agententypen in unterschiedlichen Szenarien der Reisebuchung eingesetzt werden können. Wir werden diese Anwendung im gesamten Kurs weiter verwenden.

Schauen wir uns die Arten von Anwendungsfällen an, für die AI Agents am besten geeignet sind:

![Wann AI Agents einsetzen?](../../../translated_images/when-to-use-ai-agents.912b9a02e9e0e2af45a3e24faa4e912e334ec23f21f0cf5cb040b7e899b09cd0.de.png)

- **Offene Probleme** – LLMs können die notwendigen Schritte zur Erledigung einer Aufgabe selbst bestimmen, da diese nicht immer fest in einen Workflow programmiert werden können.
- **Mehrstufige Prozesse** – Aufgaben, die eine Komplexität erfordern, bei der der AI Agent Werkzeuge oder Informationen über mehrere Schritte hinweg nutzen muss, anstatt nur einmalig abzurufen.
- **Verbesserung über die Zeit** – Aufgaben, bei denen sich der Agent durch Feedback aus seiner Umgebung oder von Nutzern im Laufe der Zeit verbessern kann, um einen höheren Nutzen zu bieten.

Weitere Überlegungen zum Einsatz von AI Agents behandeln wir in der Lektion „Building Trustworthy AI Agents“.

## Grundlagen agentischer Lösungen

### Agentenentwicklung

Der erste Schritt bei der Gestaltung eines AI Agent-Systems besteht darin, Werkzeuge, Aktionen und Verhaltensweisen zu definieren. In diesem Kurs konzentrieren wir uns auf die Verwendung des **Azure AI Agent Service** zur Definition unserer Agenten. Dieser bietet Funktionen wie:

- Auswahl offener Modelle wie OpenAI, Mistral und Llama
- Nutzung lizenzierter Daten von Anbietern wie Tripadvisor
- Verwendung standardisierter OpenAPI 3.0-Werkzeuge

### Agentische Muster

Die Kommunikation mit LLMs erfolgt über Prompts. Aufgrund der halbautonomen Natur von AI Agents ist es nicht immer möglich oder erforderlich, den LLM manuell neu zu prompten, wenn sich die Umgebung ändert. Wir verwenden **Agentische Muster**, die es ermöglichen, den LLM über mehrere Schritte hinweg auf skalierbare Weise zu prompten.

Dieser Kurs ist in einige der aktuell populären agentischen Muster unterteilt.

### Agentische Frameworks

Agentische Frameworks ermöglichen Entwicklern, agentische Muster programmatisch umzusetzen. Diese Frameworks bieten Vorlagen, Plugins und Werkzeuge für eine bessere Zusammenarbeit von AI Agents. Diese Vorteile sorgen für bessere Beobachtbarkeit und Fehlerbehebung in AI Agent-Systemen.

In diesem Kurs werden wir das forschungsgetriebene AutoGen-Framework und das produktionsreife Agent-Framework von Semantic Kernel kennenlernen.

## Vorherige Lektion

[Course Setup](../00-course-setup/README.md)

## Nächste Lektion

[Exploring Agentic Frameworks](../02-explore-agentic-frameworks/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir auf Genauigkeit achten, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.