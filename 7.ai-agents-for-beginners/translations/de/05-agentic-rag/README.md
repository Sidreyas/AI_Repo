<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T09:09:27+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "de"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.de.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(Klicken Sie auf das Bild oben, um das Video zu dieser Lektion anzusehen)_

# Agentic RAG

Diese Lektion bietet einen umfassenden Überblick über Agentic Retrieval-Augmented Generation (Agentic RAG), ein aufkommendes KI-Paradigma, bei dem große Sprachmodelle (LLMs) eigenständig ihre nächsten Schritte planen und dabei Informationen aus externen Quellen abrufen. Im Gegensatz zu statischen „Abrufen-dann-Lesen“-Mustern beinhaltet Agentic RAG iterative Aufrufe des LLM, die mit Werkzeug- oder Funktionsaufrufen und strukturierten Ausgaben durchsetzt sind. Das System bewertet die Ergebnisse, verfeinert Anfragen, ruft bei Bedarf weitere Werkzeuge auf und setzt diesen Zyklus fort, bis eine zufriedenstellende Lösung erreicht ist.

## Einführung

Diese Lektion behandelt

- **Agentic RAG verstehen:** Lernen Sie das aufkommende Paradigma in der KI kennen, bei dem große Sprachmodelle (LLMs) eigenständig ihre nächsten Schritte planen und Informationen aus externen Datenquellen abrufen.
- **Das iterative Maker-Checker-Prinzip verstehen:** Verstehen Sie die Schleife aus iterativen LLM-Aufrufen, unterbrochen von Werkzeug- oder Funktionsaufrufen und strukturierten Ausgaben, die darauf ausgelegt ist, die Korrektheit zu verbessern und fehlerhafte Anfragen zu bearbeiten.
- **Praktische Anwendungen erkunden:** Identifizieren Sie Szenarien, in denen Agentic RAG besonders effektiv ist, wie z. B. in korrektheitsorientierten Umgebungen, bei komplexen Datenbankinteraktionen und in erweiterten Arbeitsabläufen.

## Lernziele

Nach Abschluss dieser Lektion werden Sie wissen, wie Sie/verstehen:

- **Agentic RAG verstehen:** Lernen Sie das aufkommende KI-Paradigma kennen, bei dem große Sprachmodelle (LLMs) eigenständig ihre nächsten Schritte planen und Informationen aus externen Datenquellen abrufen.
- **Iteratives Maker-Checker-Prinzip:** Verstehen Sie das Konzept einer Schleife aus iterativen LLM-Aufrufen, unterbrochen von Werkzeug- oder Funktionsaufrufen und strukturierten Ausgaben, die die Korrektheit verbessern und fehlerhafte Anfragen bearbeiten soll.
- **Den Denkprozess selbst steuern:** Verstehen Sie die Fähigkeit des Systems, seinen Denkprozess selbst zu steuern und Entscheidungen darüber zu treffen, wie Probleme angegangen werden, ohne vorgegebene Pfade zu nutzen.
- **Arbeitsablauf:** Verstehen Sie, wie ein agentisches Modell eigenständig entscheidet, Markttrendberichte abzurufen, Wettbewerberdaten zu identifizieren, interne Verkaufskennzahlen zu korrelieren, Erkenntnisse zu synthetisieren und die Strategie zu bewerten.
- **Iterative Schleifen, Werkzeugintegration und Gedächtnis:** Lernen Sie das auf einer Schleifeninteraktion basierende Muster kennen, das Zustand und Gedächtnis über die Schritte hinweg bewahrt, um Wiederholungen zu vermeiden und fundierte Entscheidungen zu treffen.
- **Umgang mit Fehlerfällen und Selbstkorrektur:** Erkunden Sie die robusten Selbstkorrekturmechanismen des Systems, einschließlich Iteration und erneuter Abfragen, Nutzung diagnostischer Werkzeuge und Rückgriff auf menschliche Aufsicht.
- **Grenzen der Autonomie:** Verstehen Sie die Grenzen von Agentic RAG, mit Fokus auf domänenspezifische Autonomie, Abhängigkeit von Infrastruktur und Einhaltung von Leitplanken.
- **Praktische Anwendungsfälle und Nutzen:** Identifizieren Sie Szenarien, in denen Agentic RAG besonders effektiv ist, etwa in korrektheitsorientierten Umgebungen, bei komplexen Datenbankinteraktionen und in erweiterten Arbeitsabläufen.
- **Governance, Transparenz und Vertrauen:** Lernen Sie die Bedeutung von Governance und Transparenz kennen, einschließlich erklärbarer Entscheidungsfindung, Bias-Kontrolle und menschlicher Aufsicht.

## Was ist Agentic RAG?

Agentic Retrieval-Augmented Generation (Agentic RAG) ist ein aufkommendes KI-Paradigma, bei dem große Sprachmodelle (LLMs) eigenständig ihre nächsten Schritte planen und dabei Informationen aus externen Quellen abrufen. Im Gegensatz zu statischen „Abrufen-dann-Lesen“-Mustern beinhaltet Agentic RAG iterative Aufrufe des LLM, die mit Werkzeug- oder Funktionsaufrufen und strukturierten Ausgaben durchsetzt sind. Das System bewertet die Ergebnisse, verfeinert Anfragen, ruft bei Bedarf weitere Werkzeuge auf und setzt diesen Zyklus fort, bis eine zufriedenstellende Lösung erreicht ist. Dieser iterative „Maker-Checker“-Ansatz verbessert die Korrektheit, behandelt fehlerhafte Anfragen und sorgt für qualitativ hochwertige Ergebnisse.

Das System steuert aktiv seinen Denkprozess, indem es fehlgeschlagene Anfragen umschreibt, unterschiedliche Abrufmethoden auswählt und mehrere Werkzeuge integriert – etwa Vektorsuche in Azure AI Search, SQL-Datenbanken oder benutzerdefinierte APIs – bevor es seine Antwort finalisiert. Das entscheidende Merkmal eines agentischen Systems ist seine Fähigkeit, den Denkprozess selbst zu steuern. Traditionelle RAG-Implementierungen folgen vorgegebenen Pfaden, während ein agentisches System die Abfolge der Schritte autonom anhand der Qualität der gefundenen Informationen bestimmt.

## Definition von Agentic Retrieval-Augmented Generation (Agentic RAG)

Agentic Retrieval-Augmented Generation (Agentic RAG) ist ein aufkommendes Paradigma in der KI-Entwicklung, bei dem LLMs nicht nur Informationen aus externen Datenquellen abrufen, sondern auch eigenständig ihre nächsten Schritte planen. Im Gegensatz zu statischen „Abrufen-dann-Lesen“-Mustern oder sorgfältig geskripteten Prompt-Sequenzen beinhaltet Agentic RAG eine Schleife aus iterativen LLM-Aufrufen, unterbrochen von Werkzeug- oder Funktionsaufrufen und strukturierten Ausgaben. Das System bewertet bei jedem Schritt die erhaltenen Ergebnisse, entscheidet, ob es seine Anfragen verfeinern soll, ruft bei Bedarf weitere Werkzeuge auf und setzt diesen Zyklus fort, bis eine zufriedenstellende Lösung erreicht ist.

Dieser iterative „Maker-Checker“-Arbeitsstil soll die Korrektheit verbessern, fehlerhafte Anfragen an strukturierte Datenbanken (z. B. NL2SQL) handhaben und ausgewogene, qualitativ hochwertige Ergebnisse sicherstellen. Anstatt sich ausschließlich auf sorgfältig entwickelte Prompt-Ketten zu verlassen, steuert das System seinen Denkprozess aktiv. Es kann fehlgeschlagene Anfragen umschreiben, unterschiedliche Abrufmethoden wählen und mehrere Werkzeuge integrieren – wie Vektorsuche in Azure AI Search, SQL-Datenbanken oder benutzerdefinierte APIs – bevor es seine Antwort finalisiert. Dadurch entfällt die Notwendigkeit für übermäßig komplexe Orchestrierungsframeworks. Stattdessen kann eine relativ einfache Schleife aus „LLM-Aufruf → Werkzeugnutzung → LLM-Aufruf → …“ anspruchsvolle und fundierte Ergebnisse liefern.

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.de.png)

## Den Denkprozess selbst steuern

Das entscheidende Merkmal, das ein System „agentisch“ macht, ist seine Fähigkeit, seinen Denkprozess selbst zu steuern. Traditionelle RAG-Implementierungen sind oft darauf angewiesen, dass Menschen einen Pfad für das Modell vorgeben: eine Gedankenfolge, die beschreibt, was wann abgerufen werden soll.  
Ein wirklich agentisches System entscheidet jedoch intern, wie es das Problem angeht. Es führt nicht einfach ein Skript aus, sondern bestimmt autonom die Abfolge der Schritte basierend auf der Qualität der gefundenen Informationen.  
Beispielsweise, wenn es darum geht, eine Produkt-Launch-Strategie zu erstellen, verlässt es sich nicht nur auf einen Prompt, der den gesamten Recherche- und Entscheidungsprozess vorgibt. Stattdessen entscheidet das agentische Modell eigenständig:

1. Aktuelle Markttrendberichte mithilfe von Bing Web Grounding abzurufen  
2. Relevante Wettbewerberdaten mit Azure AI Search zu identifizieren  
3. Historische interne Verkaufskennzahlen mit Azure SQL Database zu korrelieren  
4. Die Erkenntnisse zu einer kohärenten Strategie zusammenzuführen, orchestriert über Azure OpenAI Service  
5. Die Strategie auf Lücken oder Inkonsistenzen zu prüfen und bei Bedarf eine weitere Abrufrunde einzuleiten  

All diese Schritte – Anfragen verfeinern, Quellen auswählen, iterieren bis zur Zufriedenheit – werden vom Modell entschieden, nicht von einem Menschen vorgegeben.

## Iterative Schleifen, Werkzeugintegration und Gedächtnis

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.de.png)

Ein agentisches System basiert auf einem Schleifeninteraktionsmuster:

- **Erster Aufruf:** Das Ziel des Nutzers (auch Nutzerprompt genannt) wird dem LLM präsentiert.  
- **Werkzeugaufruf:** Erkennt das Modell fehlende Informationen oder unklare Anweisungen, wählt es ein Werkzeug oder eine Abrufmethode – z. B. eine Vektordatenbankabfrage (z. B. Azure AI Search Hybrid-Suche über private Daten) oder einen strukturierten SQL-Aufruf – um mehr Kontext zu sammeln.  
- **Bewertung & Verfeinerung:** Nach Prüfung der zurückgegebenen Daten entscheidet das Modell, ob die Informationen ausreichen. Falls nicht, verfeinert es die Anfrage, probiert ein anderes Werkzeug oder passt seine Vorgehensweise an.  
- **Wiederholen bis zur Zufriedenheit:** Dieser Zyklus läuft so lange, bis das Modell feststellt, dass es genügend Klarheit und Belege hat, um eine finale, gut begründete Antwort zu geben.  
- **Gedächtnis & Zustand:** Da das System Zustand und Gedächtnis über die Schritte hinweg bewahrt, kann es sich an frühere Versuche und deren Ergebnisse erinnern, Wiederholungen vermeiden und fundiertere Entscheidungen treffen.  

Im Laufe der Zeit entsteht so ein Gefühl von wachsendem Verständnis, das dem Modell erlaubt, komplexe, mehrstufige Aufgaben zu bewältigen, ohne dass ein Mensch ständig eingreifen oder den Prompt neu gestalten muss.

## Umgang mit Fehlerfällen und Selbstkorrektur

Die Autonomie von Agentic RAG umfasst auch robuste Selbstkorrekturmechanismen. Wenn das System auf Sackgassen stößt – etwa irrelevante Dokumente abruft oder fehlerhafte Anfragen erhält – kann es:

- **Iterieren und erneut abfragen:** Anstatt minderwertige Antworten zu liefern, versucht das Modell neue Suchstrategien, schreibt Datenbankanfragen um oder betrachtet alternative Datensätze.  
- **Diagnosewerkzeuge nutzen:** Das System kann zusätzliche Funktionen aufrufen, die ihm helfen, seine Denkprozesse zu debuggen oder die Korrektheit der abgerufenen Daten zu bestätigen. Werkzeuge wie Azure AI Tracing sind wichtig, um eine robuste Beobachtbarkeit und Überwachung zu gewährleisten.  
- **Auf menschliche Aufsicht zurückgreifen:** Bei besonders wichtigen oder wiederholt scheiternden Szenarien kann das Modell Unsicherheit signalisieren und menschliche Anleitung anfordern. Sobald der Mensch korrigierendes Feedback gibt, kann das Modell diese Lektion in zukünftigen Schritten berücksichtigen.  

Dieser iterative und dynamische Ansatz ermöglicht es dem Modell, sich kontinuierlich zu verbessern, sodass es nicht nur ein Einzelschuss-System ist, sondern während einer Sitzung aus Fehlern lernt.

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.de.png)

## Grenzen der Autonomie

Trotz seiner Eigenständigkeit innerhalb einer Aufgabe ist Agentic RAG nicht mit Artificial General Intelligence vergleichbar. Seine „agentischen“ Fähigkeiten beschränken sich auf die Werkzeuge, Datenquellen und Richtlinien, die von Menschen bereitgestellt werden. Es kann keine eigenen Werkzeuge erfinden oder die gesetzten Domänengrenzen überschreiten. Stattdessen glänzt es darin, die vorhandenen Ressourcen dynamisch zu orchestrieren.  
Wesentliche Unterschiede zu fortgeschritteneren KI-Formen sind:

1. **Domänenspezifische Autonomie:** Agentic RAG-Systeme konzentrieren sich darauf, benutzerdefinierte Ziele innerhalb einer bekannten Domäne zu erreichen und verbessern Ergebnisse durch Strategien wie Anfrageumschreibung oder Werkzeugauswahl.  
2. **Infrastrukturabhängigkeit:** Die Fähigkeiten des Systems hängen von den von Entwicklern integrierten Werkzeugen und Daten ab. Ohne menschliches Eingreifen kann es diese Grenzen nicht überschreiten.  
3. **Einhaltung von Leitplanken:** Ethische Richtlinien, Compliance-Vorgaben und Unternehmensrichtlinien bleiben sehr wichtig. Die Freiheit des Agenten ist stets durch Sicherheitsmaßnahmen und Überwachungsmechanismen eingeschränkt (hoffentlich).

## Praktische Anwendungsfälle und Nutzen

Agentic RAG zeigt seine Stärken in Szenarien, die iterative Verfeinerung und Präzision erfordern:

1. **Korrektheitsorientierte Umgebungen:** Bei Compliance-Prüfungen, regulatorischer Analyse oder juristischer Recherche kann das agentische Modell Fakten wiederholt überprüfen, mehrere Quellen konsultieren und Anfragen umschreiben, bis eine gründlich geprüfte Antwort vorliegt.  
2. **Komplexe Datenbankinteraktionen:** Bei der Arbeit mit strukturierten Daten, bei denen Anfragen oft scheitern oder angepasst werden müssen, kann das System seine Anfragen autonom mit Azure SQL oder Microsoft Fabric OneLake verfeinern, sodass die endgültige Abfrage dem Nutzerwunsch entspricht.  
3. **Erweiterte Arbeitsabläufe:** Länger laufende Sitzungen können sich weiterentwickeln, wenn neue Informationen auftauchen. Agentic RAG kann kontinuierlich neue Daten einbeziehen und Strategien anpassen, während es mehr über das Problem lernt.

## Governance, Transparenz und Vertrauen

Da diese Systeme zunehmend eigenständig denken, sind Governance und Transparenz entscheidend:

- **Erklärbare Entscheidungsfindung:** Das Modell kann eine Prüfkette der gestellten Anfragen, der konsultierten Quellen und der durchlaufenen Denkprozesse liefern. Werkzeuge wie Azure AI Content Safety und Azure AI Tracing / GenAIOps helfen, Transparenz zu bewahren und Risiken zu mindern.  
- **Bias-Kontrolle und ausgewogener Abruf:** Entwickler können Abrufstrategien so anpassen, dass ausgewogene, repräsentative Datenquellen berücksichtigt werden, und Ausgaben regelmäßig auf Verzerrungen oder Schieflagen prüfen – beispielsweise mit benutzerdefinierten Modellen für fortgeschrittene Datenwissenschaftler in Azure Machine Learning.  
- **Menschliche Aufsicht und Compliance:** Bei sensiblen Aufgaben bleibt die menschliche Überprüfung unerlässlich. Agentic RAG ersetzt menschliches Urteilsvermögen bei wichtigen Entscheidungen nicht, sondern ergänzt es durch gründlich geprüfte Optionen.  

Werkzeuge, die eine klare Dokumentation der Aktionen liefern, sind essenziell. Ohne sie ist das Debuggen eines mehrstufigen Prozesses sehr schwierig. Nachfolgend ein Beispiel von Literal AI (Firma hinter Chainlit) für einen Agent-Run:

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.de.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.de.png)

## Fazit

Agentic RAG stellt eine natürliche Weiterentwicklung dar, wie KI-Systeme komplexe, datenintensive Aufgaben bewältigen. Durch die Einführung eines Schleifeninteraktionsmusters, die autonome Auswahl von Werkzeugen und die Verfeinerung von Anfragen bis zu einem hochwertigen Ergebnis geht das System über statisches Prompt-Folgen hinaus hin zu einem adaptiven, kontextbewussten Entscheider. Obwohl es weiterhin durch von Menschen definierte Infrastrukturen und ethische Richtlinien begrenzt ist, ermöglichen diese agentischen Fähigkeiten reichhaltigere, dynamischere und letztlich nützlichere KI-Interaktionen für Unternehmen und Endanwender.

## Zusätzliche Ressourcen

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">Implement Retrieval Augmented Generation (RAG) with Azure OpenAI Service: Lernen Sie, wie Sie Ihre eigenen Daten mit dem Azure OpenAI Service nutzen. Dieses Microsoft Learn Modul bietet eine umfassende Anleitung zur Implementierung von RAG</a>  
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Bewertung generativer KI-Anwendungen mit Azure AI Foundry: Dieser Artikel behandelt die Bewertung und den Vergleich von Modellen anhand öffentlich verfügbarer Datensätze, einschließlich agentischer KI-Anwendungen und RAG-Architekturen</a>  
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">Was ist Agentic RAG | Weaviate</a>  
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG: Ein kompletter Leitfaden zur agentenbasierten Retrieval Augmented Generation – News von generation RAG</a>  
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG: Beschleunigen Sie Ihr RAG mit Anfrageumformulierung und Selbstabfrage! Hugging Face Open-Source AI Cookbook</a>  
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">Agentic Layers zu RAG hinzufügen</a>  
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">Die Zukunft der Knowledge Assistants: Jerry Liu</a>  
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">Wie man Agentic RAG Systeme baut</a>  
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">Azure AI Foundry Agent Service zur Skalierung Ihrer KI-Agenten nutzen</a>  

### Wissenschaftliche Veröffentlichungen

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine: Iterative Refinement with Self-Feedback</a>  
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion: Language Agents with Verbal Reinforcement Learning</a>  
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC: Large Language Models Can Self-Correct with Tool-Interactive Critiquing</a>  
- <a href="https://arxiv.org/abs/2501.09136" target="_blank">2501.09136 Agentic Retrieval-Augmented Generation: A Survey on Agentic RAG</a>  

## Vorherige Lektion

[Tool Use Design Pattern](../04-tool-use/README.md)

## Nächste Lektion

[Building Trustworthy AI Agents](../06-building-trustworthy-agents/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Originalsprache gilt als maßgebliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die durch die Verwendung dieser Übersetzung entstehen.