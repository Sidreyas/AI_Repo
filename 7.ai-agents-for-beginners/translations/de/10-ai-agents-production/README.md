<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1ad5de6a6388d02c145a92dd04358bab",
  "translation_date": "2025-05-20T09:15:45+00:00",
  "source_file": "10-ai-agents-production/README.md",
  "language_code": "de"
}
-->
[![AI Agents In Production](../../../translated_images/lesson-10-thumbnail.0b68f4240618b3d5b26693b78cf2cf0a8b36131b50bb08daf91d548cecc87424.de.png)](https://youtu.be/l4TP6IyJxmQ?si=IvCW3cbw0NJ2mUMV)

> _(Klicken Sie auf das Bild oben, um das Video zu dieser Lektion anzusehen)_
# KI-Agenten in der Produktion

## Einführung

Diese Lektion behandelt:

- Wie Sie die Bereitstellung Ihres KI-Agenten für die Produktion effektiv planen.
- Häufige Fehler und Probleme, die bei der Bereitstellung Ihres KI-Agenten in der Produktion auftreten können.
- Wie Sie die Kosten steuern und gleichzeitig die Leistung Ihres KI-Agenten erhalten.

## Lernziele

Nach Abschluss dieser Lektion wissen Sie, wie Sie/verstehen Sie:

- Techniken zur Verbesserung der Leistung, Kosten und Effektivität eines produktiven KI-Agenten-Systems.
- Was und wie Sie Ihre KI-Agenten bewerten.
- Wie Sie die Kosten bei der Bereitstellung von KI-Agenten in der Produktion kontrollieren.

Es ist wichtig, vertrauenswürdige KI-Agenten bereitzustellen. Schauen Sie sich auch die Lektion „Building Trustworthy AI Agents“ an.

## Bewertung von KI-Agenten

Vor, während und nach der Bereitstellung von KI-Agenten ist es entscheidend, ein geeignetes System zur Bewertung Ihrer KI-Agenten zu haben. So stellen Sie sicher, dass Ihr System mit Ihren und den Zielen Ihrer Nutzer übereinstimmt.

Um einen KI-Agenten zu bewerten, ist es wichtig, nicht nur die Ausgabe des Agenten zu bewerten, sondern auch das gesamte System, in dem Ihr KI-Agent arbeitet. Dazu gehören unter anderem:

- Die ursprüngliche Modellanfrage.
- Die Fähigkeit des Agenten, die Absicht des Nutzers zu erkennen.
- Die Fähigkeit des Agenten, das richtige Werkzeug für die Aufgabe auszuwählen.
- Die Reaktion des Werkzeugs auf die Anfrage des Agenten.
- Die Fähigkeit des Agenten, die Antwort des Werkzeugs zu interpretieren.
- Das Feedback des Nutzers zur Antwort des Agenten.

So können Sie Verbesserungsmöglichkeiten modularer erkennen. Sie können dann die Auswirkungen von Änderungen an Modellen, Eingabeaufforderungen, Werkzeugen und anderen Komponenten effizienter überwachen.

## Häufige Probleme und mögliche Lösungen mit KI-Agenten

| **Problem**                                     | **Mögliche Lösung**                                                                                                                                                                                                       |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| KI-Agent führt Aufgaben nicht zuverlässig aus  | - Verfeinern Sie die Eingabeaufforderung für den KI-Agenten; seien Sie klar in den Zielen.<br>- Identifizieren Sie, ob das Aufteilen der Aufgaben in Unteraufgaben und deren Bearbeitung durch mehrere Agenten hilft.       |
| KI-Agent gerät in Endlosschleifen               | - Stellen Sie klare Abbruchbedingungen sicher, damit der Agent weiß, wann er den Prozess stoppen soll.<br>- Für komplexe Aufgaben, die Planung und Überlegung erfordern, verwenden Sie ein größeres Modell, das auf solche Aufgaben spezialisiert ist. |
| Werkzeugaufrufe des KI-Agenten funktionieren nicht gut | - Testen und validieren Sie die Ausgabe des Werkzeugs außerhalb des Agentensystems.<br>- Verfeinern Sie die definierten Parameter, Eingabeaufforderungen und Benennungen der Werkzeuge.                                      |
| Multi-Agenten-System arbeitet inkonsistent      | - Verfeinern Sie die Eingabeaufforderungen für jeden Agenten, damit diese spezifisch und voneinander unterscheidbar sind.<br>- Bauen Sie ein hierarchisches System mit einem „Routing“- oder Steuerungsagenten, der bestimmt, welcher Agent der richtige ist. |

## Kostenmanagement

Hier einige Strategien, um die Kosten bei der Bereitstellung von KI-Agenten in der Produktion zu steuern:

- **Antworten zwischenspeichern** – Häufige Anfragen und Aufgaben zu identifizieren und Antworten bereitzustellen, bevor sie durch Ihr Agentensystem laufen, ist eine gute Möglichkeit, das Volumen ähnlicher Anfragen zu reduzieren. Sie können sogar einen Ablauf implementieren, der mithilfe einfacherer KI-Modelle ermittelt, wie ähnlich eine Anfrage zu Ihren zwischengespeicherten Anfragen ist.

- **Verwendung kleinerer Modelle** – Kleine Sprachmodelle (SLMs) können in bestimmten agentenbasierten Anwendungsfällen gut abschneiden und die Kosten deutlich senken. Wie bereits erwähnt, ist der Aufbau eines Bewertungssystems zur Bestimmung und zum Vergleich der Leistung gegenüber größeren Modellen der beste Weg, um zu verstehen, wie gut ein SLM in Ihrem Anwendungsfall funktioniert.

- **Verwendung eines Router-Modells** – Eine ähnliche Strategie ist die Nutzung verschiedener Modelle und Größen. Sie können ein LLM/SLM oder eine serverlose Funktion verwenden, um Anfragen je nach Komplexität an die am besten geeigneten Modelle weiterzuleiten. Dies hilft ebenfalls, Kosten zu reduzieren und gleichzeitig die Leistung bei den richtigen Aufgaben sicherzustellen.

## Glückwunsch

Dies ist derzeit die letzte Lektion von „AI Agents for Beginners“.

Wir planen, basierend auf Feedback und Veränderungen in dieser sich ständig weiterentwickelnden Branche weitere Lektionen hinzuzufügen, also schauen Sie bald wieder vorbei.

Wenn Sie Ihr Lernen und Ihre Arbeit mit KI-Agenten fortsetzen möchten, treten Sie dem <a href="https://discord.gg/kzRShWzttr" target="_blank">Azure AI Community Discord</a> bei.

Dort veranstalten wir Workshops, Community-Roundtables und „Frag mich alles“-Sessions.

Wir bieten auch eine Learn-Sammlung mit zusätzlichen Materialien, die Ihnen helfen können, KI-Agenten in der Produktion zu entwickeln.

## Vorherige Lektion

[Metacognition Design Pattern](../09-metacognition/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die durch die Nutzung dieser Übersetzung entstehen.