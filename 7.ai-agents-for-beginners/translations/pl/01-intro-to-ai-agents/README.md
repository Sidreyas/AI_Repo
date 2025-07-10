<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d84943abc8f001ad4670418d32c2d899",
  "translation_date": "2025-05-20T09:29:18+00:00",
  "source_file": "01-intro-to-ai-agents/README.md",
  "language_code": "pl"
}
-->
być z innymi uczestnikami kursu oraz twórcami AI Agentów i zadawać pytania dotyczące tego kursu.

Aby rozpocząć kurs, zaczniemy od lepszego zrozumienia, czym są AI Agenci i jak możemy ich używać w aplikacjach i procesach, które tworzymy.

## Wprowadzenie

W tej lekcji omówimy:

- Czym są AI Agenci i jakie są różne typy agentów?
- Do jakich zastosowań najlepiej nadają się AI Agenci i jak mogą nam pomóc?
- Jakie są podstawowe elementy przy projektowaniu rozwiązań agentowych?

## Cele nauki
Po ukończeniu tej lekcji powinieneś być w stanie:

- Zrozumieć koncepcje AI Agentów i jak różnią się od innych rozwiązań AI.
- Efektywnie stosować AI Agentów.
- Produktywnie projektować rozwiązania agentowe zarówno dla użytkowników, jak i klientów.

## Definiowanie AI Agentów i typy AI Agentów

### Czym są AI Agenci?

AI Agenci to **systemy**, które umożliwiają **Large Language Models (LLMs)** **wykonywanie działań** poprzez rozszerzenie ich możliwości przez zapewnienie LLM-om **dostępu do narzędzi** i **wiedzy**.

Rozbijmy tę definicję na mniejsze części:

- **System** – ważne jest, aby myśleć o agentach nie jako o pojedynczym komponencie, lecz jako o systemie wielu elementów. Na podstawowym poziomie, składniki AI Agenta to:
  - **Środowisko** – określona przestrzeń, w której działa AI Agent. Na przykład, jeśli mielibyśmy AI Agenta do rezerwacji podróży, środowiskiem byłby system rezerwacji podróży, z którego agent korzysta, by wykonać zadania.
  - **Sensory** – środowiska posiadają informacje i dostarczają informacji zwrotnej. AI Agenci używają sensorów do zbierania i interpretacji informacji o aktualnym stanie środowiska. W przykładzie agenta podróżniczego system rezerwacji może dostarczać informacje, takie jak dostępność hoteli czy ceny lotów.
  - **Aktuatory** – po otrzymaniu przez AI Agenta aktualnego stanu środowiska, agent decyduje, jakie działanie wykonać, aby zmienić środowisko w ramach bieżącego zadania. W przypadku agenta podróżniczego może to być zarezerwowanie dostępnego pokoju dla użytkownika.

![What Are AI Agents?](../../../translated_images/what-are-ai-agents.125520f55950b252a429b04a9f41e0152d4dafa1f1bd9081f4f574631acb759e.pl.png)

**Large Language Models** – koncepcja agentów istniała już przed powstaniem LLM-ów. Zaletą budowania AI Agentów z użyciem LLM jest ich zdolność do interpretacji języka ludzkiego i danych. Ta umiejętność pozwala LLM na interpretację informacji ze środowiska i określenie planu zmiany tego środowiska.

**Wykonywanie działań** – poza systemami AI Agentów, LLM są ograniczone do sytuacji, w których działaniem jest generowanie treści lub informacji na podstawie zapytania użytkownika. W systemach AI Agentów LLM mogą realizować zadania poprzez interpretację prośby użytkownika i korzystanie z narzędzi dostępnych w ich środowisku.

**Dostęp do narzędzi** – do jakich narzędzi LLM ma dostęp, określa 1) środowisko, w którym działa, oraz 2) twórca AI Agenta. W naszym przykładzie agenta podróżniczego narzędzia agenta są ograniczone do operacji dostępnych w systemie rezerwacji, a twórca może dodatkowo ograniczyć dostęp agenta do rezerwacji lotów.

**Pamięć + Wiedza** – pamięć może być krótkoterminowa w kontekście rozmowy między użytkownikiem a agentem. W dłuższej perspektywie, poza informacjami dostarczanymi przez środowisko, AI Agenci mogą również pobierać wiedzę z innych systemów, usług, narzędzi, a nawet innych agentów. W przykładzie agenta podróżniczego ta wiedza może obejmować informacje o preferencjach podróżnych użytkownika zapisane w bazie danych klientów.

### Różne typy agentów

Mając już ogólną definicję AI Agentów, przyjrzyjmy się konkretnym typom agentów i jak można je zastosować w agencie do rezerwacji podróży.

| **Typ Agenta**                | **Opis**                                                                                                                       | **Przykład**                                                                                                                                                                                                                   |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Proste Agenty Refleksyjne**      | Wykonują natychmiastowe działania na podstawie zdefiniowanych reguł.                                                                                  | Agent podróżniczy interpretuje kontekst e-maila i przekazuje reklamacje dotyczące podróży do obsługi klienta.                                                                                                                          |
| **Model-Based Reflex Agents** | Wykonują działania na podstawie modelu świata i zmian w tym modelu.                                                              | Agent podróżniczy priorytetyzuje trasy z istotnymi zmianami cen na podstawie dostępu do historycznych danych cen.                                                                                                             |
| **Agenty Celowe**         | Tworzą plany, aby osiągnąć konkretne cele, interpretując cel i określając działania do jego realizacji.                                  | Agent podróżniczy rezerwuje podróż, ustalając niezbędne środki transportu (samochód, transport publiczny, loty) z aktualnej lokalizacji do celu podróży.                                                                                |
| **Agenty Użytkowe**      | Uwzględniają preferencje i numerycznie oceniają kompromisy, aby zdecydować, jak osiągnąć cele.                                               | Agent podróżniczy maksymalizuje użyteczność, ważąc wygodę względem kosztów przy rezerwacji podróży.                                                                                                                                          |
| **Agenty Uczące się**           | Poprawiają się z czasem, reagując na informacje zwrotne i odpowiednio dostosowując działania.                                                        | Agent podróżniczy poprawia swoje działanie na podstawie opinii klientów z ankiet po podróży, aby dostosować przyszłe rezerwacje.                                                                                                               |
| **Agenty Hierarchiczne**       | Składają się z wielu agentów w systemie wielopoziomowym, gdzie agenty wyższego poziomu dzielą zadania na podzadania dla agentów niższego poziomu. | Agent podróżniczy anuluje podróż, dzieląc zadanie na podzadania (np. anulowanie konkretnych rezerwacji) i zlecając ich wykonanie agentom niższego poziomu, które raportują z powrotem do agenta wyższego poziomu.                                     |
| **Systemy Wieloagentowe (MAS)** | Agenty wykonują zadania niezależnie, współpracując lub konkurując ze sobą.                                                           | Współpraca: Wielu agentów rezerwuje różne usługi podróżnicze, takie jak hotele, loty i rozrywkę. Konkurencja: Wielu agentów zarządza i konkuruje o rezerwacje w tym samym kalendarzu hotelowym, aby przydzielić miejsca klientom. |

## Kiedy stosować AI Agentów

W poprzedniej sekcji użyliśmy przykładu agenta podróżniczego, aby wyjaśnić, jak różne typy agentów można stosować w różnych scenariuszach rezerwacji podróży. Będziemy kontynuować używanie tej aplikacji w całym kursie.

Spójrzmy na typy zastosowań, do których AI Agenci nadają się najlepiej:

![When to use AI Agents?](../../../translated_images/when-to-use-ai-agents.912b9a02e9e0e2af45a3e24faa4e912e334ec23f21f0cf5cb040b7e899b09cd0.pl.png)

- **Problemy otwarte** – pozwalające LLM określić potrzebne kroki do wykonania zadania, ponieważ nie zawsze można je zapisać na stałe w przepływie pracy.
- **Procesy wieloetapowe** – zadania wymagające pewnego poziomu złożoności, w których AI Agent musi korzystać z narzędzi lub informacji na wielu etapach, a nie tylko jednorazowo.
- **Poprawa w czasie** – zadania, w których agent może się poprawiać dzięki otrzymywaniu informacji zwrotnej od środowiska lub użytkowników, by zapewnić lepszą użyteczność.

Więcej aspektów dotyczących stosowania AI Agentów omawiamy w lekcji Budowanie godnych zaufania AI Agentów.

## Podstawy rozwiązań agentowych

### Tworzenie agentów

Pierwszym krokiem w projektowaniu systemu AI Agenta jest zdefiniowanie narzędzi, działań i zachowań. W tym kursie skupiamy się na użyciu **Azure AI Agent Service** do definiowania naszych agentów. Usługa ta oferuje funkcje takie jak:

- Wybór otwartych modeli, takich jak OpenAI, Mistral i Llama
- Korzystanie z licencjonowanych danych od dostawców, takich jak Tripadvisor
- Używanie standardowych narzędzi OpenAPI 3.0

### Wzorce agentowe

Komunikacja z LLM odbywa się za pomocą promptów. Ze względu na półautonomiczny charakter AI Agentów, nie zawsze możliwe lub konieczne jest ręczne ponowne wysyłanie promptów do LLM po zmianie w środowisku. Używamy **wzorców agentowych**, które pozwalają na wieloetapowe promptowanie LLM w bardziej skalowalny sposób.

Ten kurs jest podzielony na niektóre z obecnie popularnych wzorców agentowych.

### Frameworki agentowe

Frameworki agentowe umożliwiają programistom implementację wzorców agentowych za pomocą kodu. Frameworki te oferują szablony, wtyczki i narzędzia do lepszej współpracy AI Agentów. Te korzyści zapewniają lepszą obserwowalność i możliwość rozwiązywania problemów w systemach AI Agentów.

W tym kursie zapoznamy się z badawczym frameworkiem AutoGen oraz gotowym do produkcji frameworkiem Agent od Semantic Kernel.

## Poprzednia lekcja

[Course Setup](../00-course-setup/README.md)

## Następna lekcja

[Exploring Agentic Frameworks](../02-explore-agentic-frameworks/README.md)

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do jak największej dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być traktowany jako autorytatywne źródło. W przypadku informacji o kluczowym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.