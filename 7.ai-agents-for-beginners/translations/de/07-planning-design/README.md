<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e4e06d3b5d6207459a019c05fee5eb4b",
  "translation_date": "2025-05-20T09:10:52+00:00",
  "source_file": "07-planning-design/README.md",
  "language_code": "de"
}
-->
für die Lösung komplexer Aufgaben.

## Zusammenfassung

In diesem Artikel haben wir ein Beispiel betrachtet, wie wir einen Planer erstellen können, der dynamisch die verfügbaren definierten Agenten auswählt. Die Ausgabe des Planers zerlegt die Aufgaben und weist die Agenten zu, damit diese ausgeführt werden können. Es wird davon ausgegangen, dass die Agenten Zugriff auf die Funktionen/Werkzeuge haben, die zur Durchführung der Aufgabe erforderlich sind. Zusätzlich zu den Agenten können weitere Muster wie Reflexion, Zusammenfassung und Round-Robin-Chat zur weiteren Anpassung einbezogen werden.

## Zusätzliche Ressourcen

* AutoGen Magnetic One – Ein generalistisches Multi-Agenten-System zur Lösung komplexer Aufgaben, das beeindruckende Ergebnisse bei mehreren herausfordernden agentischen Benchmarks erzielt hat. Referenz:

. In dieser Implementierung erstellt der Orchestrator aufgabenspezifische Pläne und delegiert diese Aufgaben an die verfügbaren Agenten. Zusätzlich zur Planung verwendet der Orchestrator auch einen Tracking-Mechanismus, um den Fortschritt der Aufgabe zu überwachen und bei Bedarf neu zu planen.

## Vorherige Lektion

[Building Trustworthy AI Agents](../06-building-trustworthy-agents/README.md)

## Nächste Lektion

[Multi-Agent Design Pattern](../08-multi-agent/README.md)

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.