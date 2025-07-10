<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T09:33:08+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "pl"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.pl.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(Kliknij powyższy obraz, aby obejrzeć wideo z tej lekcji)_

# Agentic RAG

Ta lekcja przedstawia kompleksowy przegląd Agentic Retrieval-Augmented Generation (Agentic RAG), nowatorskiego paradygmatu AI, w którym duże modele językowe (LLM) samodzielnie planują kolejne kroki, jednocześnie pozyskując informacje z zewnętrznych źródeł. W przeciwieństwie do statycznych wzorców „pobierz i przeczytaj”, Agentic RAG obejmuje iteracyjne wywołania LLM, przeplatane wywołaniami narzędzi lub funkcji oraz generowaniem ustrukturyzowanych wyników. System ocenia wyniki, udoskonala zapytania, w razie potrzeby korzysta z dodatkowych narzędzi i kontynuuje ten cykl, aż zostanie osiągnięte zadowalające rozwiązanie.

## Wprowadzenie

W tej lekcji omówimy:

- **Poznanie Agentic RAG:** Dowiedz się o nowym paradygmacie AI, w którym duże modele językowe (LLM) samodzielnie planują kolejne kroki, pozyskując informacje z zewnętrznych źródeł danych.
- **Zrozumienie iteracyjnego stylu Maker-Checker:** Pojmij pętlę iteracyjnych wywołań LLM, przeplatanych wywołaniami narzędzi lub funkcji oraz generowaniem ustrukturyzowanych wyników, mających na celu poprawę poprawności i obsługę błędnych zapytań.
- **Poznanie praktycznych zastosowań:** Zidentyfikuj scenariusze, w których Agentic RAG sprawdza się najlepiej, takie jak środowiska nastawione na poprawność, złożone interakcje z bazami danych oraz rozbudowane procesy.

## Cele nauki

Po ukończeniu tej lekcji będziesz potrafił/zrozumiesz:

- **Zrozumienie Agentic RAG:** Poznasz nowy paradygmat AI, w którym duże modele językowe (LLM) samodzielnie planują kolejne kroki, pozyskując informacje z zewnętrznych źródeł danych.
- **Iteracyjny styl Maker-Checker:** Pojmiesz koncepcję pętli iteracyjnych wywołań LLM, przeplatanych wywołaniami narzędzi lub funkcji oraz generowaniem ustrukturyzowanych wyników, mających na celu poprawę poprawności i obsługę błędnych zapytań.
- **Posiadanie procesu rozumowania:** Zrozumiesz zdolność systemu do samodzielnego prowadzenia procesu rozumowania, podejmowania decyzji, jak podejść do problemów, bez polegania na z góry ustalonych ścieżkach.
- **Przebieg pracy:** Poznasz, jak model agentic samodzielnie decyduje o pobieraniu raportów o trendach rynkowych, identyfikacji danych konkurencji, korelacji wewnętrznych wskaźników sprzedaży, syntezie wniosków oraz ocenie strategii.
- **Iteracyjne pętle, integracja narzędzi i pamięć:** Dowiesz się o oparciu systemu na wzorcu interakcji w pętli, utrzymując stan i pamięć między krokami, aby unikać powtarzających się pętli i podejmować świadome decyzje.
- **Obsługa trybów awarii i samokorekta:** Poznasz mechanizmy samokorekty systemu, w tym iteracje i ponowne zapytania, korzystanie z narzędzi diagnostycznych oraz wsparcie nadzoru ludzkiego.
- **Granice autonomii:** Zrozumiesz ograniczenia Agentic RAG, skupiając się na autonomii specyficznej dla domeny, zależności od infrastruktury oraz przestrzeganiu reguł bezpieczeństwa.
- **Praktyczne zastosowania i wartość:** Zidentyfikujesz scenariusze, w których Agentic RAG jest szczególnie przydatny, takie jak środowiska nastawione na poprawność, złożone interakcje z bazami danych oraz rozbudowane procesy.
- **Zarządzanie, przejrzystość i zaufanie:** Poznasz znaczenie zarządzania i przejrzystości, w tym wyjaśnialnego rozumowania, kontroli uprzedzeń i nadzoru ludzkiego.

## Czym jest Agentic RAG?

Agentic Retrieval-Augmented Generation (Agentic RAG) to nowy paradygmat AI, w którym duże modele językowe (LLM) samodzielnie planują kolejne kroki, pozyskując informacje z zewnętrznych źródeł. W przeciwieństwie do statycznych wzorców „pobierz i przeczytaj”, Agentic RAG obejmuje iteracyjne wywołania LLM, przeplatane wywołaniami narzędzi lub funkcji oraz generowaniem ustrukturyzowanych wyników. System ocenia wyniki, udoskonala zapytania, korzysta z dodatkowych narzędzi, jeśli to konieczne, i kontynuuje ten cykl, aż zostanie osiągnięte zadowalające rozwiązanie. Ten iteracyjny styl „maker-checker” poprawia poprawność, obsługuje błędne zapytania i zapewnia wysoką jakość wyników.

System aktywnie prowadzi swój proces rozumowania, przepisując nieudane zapytania, wybierając różne metody pozyskiwania informacji oraz integrując wiele narzędzi — takich jak wyszukiwanie wektorowe w Azure AI Search, bazy danych SQL czy niestandardowe API — zanim sfinalizuje odpowiedź. Kluczową cechą systemu agentic jest jego zdolność do samodzielnego prowadzenia procesu rozumowania. Tradycyjne implementacje RAG opierają się na z góry ustalonych ścieżkach, natomiast system agentic samodzielnie decyduje o kolejności kroków na podstawie jakości znalezionych informacji.

## Definicja Agentic Retrieval-Augmented Generation (Agentic RAG)

Agentic Retrieval-Augmented Generation (Agentic RAG) to nowy paradygmat w rozwoju AI, w którym LLM nie tylko pobierają informacje z zewnętrznych źródeł danych, ale również samodzielnie planują kolejne kroki. W przeciwieństwie do statycznych wzorców „pobierz i przeczytaj” lub starannie zaplanowanych sekwencji promptów, Agentic RAG polega na pętli iteracyjnych wywołań LLM, przeplatanych wywołaniami narzędzi lub funkcji oraz generowaniem ustrukturyzowanych wyników. Na każdym etapie system ocenia uzyskane wyniki, decyduje, czy należy udoskonalić zapytania, korzysta z dodatkowych narzędzi w razie potrzeby i kontynuuje ten cykl, aż osiągnie zadowalające rozwiązanie.

Ten iteracyjny styl „maker-checker” ma na celu poprawę poprawności, obsługę błędnych zapytań do ustrukturyzowanych baz danych (np. NL2SQL) oraz zapewnienie zrównoważonych, wysokiej jakości wyników. Zamiast polegać wyłącznie na starannie zaprojektowanych łańcuchach promptów, system aktywnie prowadzi swój proces rozumowania. Może przepisywać nieudane zapytania, wybierać różne metody pozyskiwania informacji oraz integrować wiele narzędzi — takich jak wyszukiwanie wektorowe w Azure AI Search, bazy danych SQL czy niestandardowe API — zanim sfinalizuje odpowiedź. Dzięki temu nie jest potrzebne stosowanie skomplikowanych frameworków orkiestracji. Zamiast tego stosunkowo prosta pętla „wywołanie LLM → użycie narzędzia → wywołanie LLM → …” może generować zaawansowane i dobrze ugruntowane wyniki.

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.pl.png)

## Prowadzenie procesu rozumowania

Cechą wyróżniającą system „agentic” jest jego zdolność do samodzielnego prowadzenia procesu rozumowania. Tradycyjne implementacje RAG często polegają na tym, że ludzie z góry definiują ścieżkę dla modelu: łańcuch myślenia określający, co i kiedy pobrać.
Jednak gdy system jest naprawdę agentic, sam decyduje, jak podejść do problemu. Nie wykonuje tylko skryptu; autonomicznie ustala kolejność kroków na podstawie jakości znalezionych informacji.
Na przykład, jeśli zostanie poproszony o stworzenie strategii wprowadzenia produktu na rynek, nie polega wyłącznie na promptcie opisującym cały proces badawczy i decyzyjny. Zamiast tego model agentic samodzielnie decyduje o:

1. Pobranie aktualnych raportów o trendach rynkowych za pomocą Bing Web Grounding
2. Identyfikacja istotnych danych konkurencji z wykorzystaniem Azure AI Search
3. Korelacja historycznych wewnętrznych wskaźników sprzedaży przy użyciu Azure SQL Database
4. Synteza wniosków w spójną strategię zarządzaną przez Azure OpenAI Service
5. Ocena strategii pod kątem luk lub niespójności, z kolejnym etapem pobierania danych w razie potrzeby

Wszystkie te kroki — udoskonalanie zapytań, wybór źródeł, iteracje aż do uzyskania „zadowalającej” odpowiedzi — są podejmowane przez model, a nie wcześniej zaprogramowane przez człowieka.

## Iteracyjne pętle, integracja narzędzi i pamięć

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.pl.png)

System agentic opiera się na wzorcu interakcji w pętli:

- **Początkowe wywołanie:** Cel użytkownika (czyli prompt użytkownika) jest przekazywany do LLM.
- **Wywołanie narzędzia:** Jeśli model wykryje brakujące informacje lub niejasne instrukcje, wybiera narzędzie lub metodę pozyskiwania danych — np. zapytanie do bazy wektorowej (np. hybrydowe wyszukiwanie w Azure AI Search po danych prywatnych) lub ustrukturyzowane wywołanie SQL — aby zebrać więcej kontekstu.
- **Ocena i udoskonalenie:** Po przejrzeniu zwróconych danych model decyduje, czy informacje są wystarczające. Jeśli nie, udoskonala zapytanie, próbuje innego narzędzia lub zmienia podejście.
- **Powtarzaj aż do satysfakcji:** Cykl trwa, aż model uzna, że ma wystarczającą jasność i dowody, aby dostarczyć ostateczną, dobrze uzasadnioną odpowiedź.
- **Pamięć i stan:** Ponieważ system utrzymuje stan i pamięć między krokami, może przypominać sobie poprzednie próby i ich wyniki, unikając powtarzających się pętli i podejmując bardziej świadome decyzje w trakcie działania.

Z czasem tworzy to poczucie rozwijającego się zrozumienia, pozwalając modelowi radzić sobie z złożonymi, wieloetapowymi zadaniami bez konieczności ciągłej interwencji człowieka lub modyfikowania promptu.

## Obsługa trybów awarii i samokorekta

Autonomia Agentic RAG obejmuje również solidne mechanizmy samokorekty. Gdy system napotyka ślepe zaułki — takie jak pobieranie nieistotnych dokumentów lub błędne zapytania — może:

- **Iterować i ponownie pytać:** Zamiast zwracać niskowartościowe odpowiedzi, model podejmuje nowe strategie wyszukiwania, przepisuje zapytania do bazy danych lub sprawdza alternatywne zestawy danych.
- **Korzystać z narzędzi diagnostycznych:** System może wywoływać dodatkowe funkcje pomagające debugować kroki rozumowania lub potwierdzać poprawność pobranych danych. Narzędzia takie jak Azure AI Tracing są ważne dla zapewnienia solidnej obserwowalności i monitoringu.
- **Wspierać się nadzorem ludzkim:** W sytuacjach o wysokim ryzyku lub przy powtarzających się błędach model może zgłaszać niepewność i prosić o wskazówki od człowieka. Po otrzymaniu korekty model może uwzględnić tę lekcję w dalszej pracy.

To iteracyjne i dynamiczne podejście pozwala modelowi na ciągłą poprawę, zapewniając, że nie jest to system jednorazowy, lecz taki, który uczy się na błędach podczas danej sesji.

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.pl.png)

## Granice autonomii

Pomimo autonomii w ramach zadania, Agentic RAG nie jest odpowiednikiem sztucznej inteligencji ogólnej (AGI). Jego „agentic” możliwości są ograniczone do narzędzi, źródeł danych i zasad ustalonych przez ludzi. Nie może wymyślać własnych narzędzi ani wykraczać poza granice domeny, które zostały ustalone. Zamiast tego doskonale radzi sobie z dynamiczną orkiestracją dostępnych zasobów.
Kluczowe różnice w porównaniu z bardziej zaawansowanymi formami AI to:

1. **Autonomia specyficzna dla domeny:** Systemy Agentic RAG koncentrują się na realizacji celów zdefiniowanych przez użytkownika w znanej domenie, stosując strategie takie jak przepisywanie zapytań czy wybór narzędzi w celu poprawy wyników.
2. **Zależność od infrastruktury:** Możliwości systemu zależą od narzędzi i danych zintegrowanych przez deweloperów. Nie może przekraczać tych granic bez ingerencji człowieka.
3. **Poszanowanie reguł bezpieczeństwa:** Wytyczne etyczne, zasady zgodności i polityki biznesowe są bardzo ważne. Wolność agenta jest zawsze ograniczona przez mechanizmy bezpieczeństwa i nadzoru (oby tak było).

## Praktyczne zastosowania i wartość

Agentic RAG sprawdza się w scenariuszach wymagających iteracyjnego udoskonalania i precyzji:

1. **Środowiska nastawione na poprawność:** W kontrolach zgodności, analizach regulacyjnych czy badaniach prawnych model agentic może wielokrotnie weryfikować fakty, konsultować wiele źródeł i przepisywać zapytania, aż uzyska w pełni zweryfikowaną odpowiedź.
2. **Złożone interakcje z bazami danych:** W przypadku pracy z ustrukturyzowanymi danymi, gdzie zapytania często zawodzą lub wymagają korekt, system może samodzielnie udoskonalać zapytania za pomocą Azure SQL lub Microsoft Fabric OneLake, zapewniając, że ostateczne wyniki odpowiadają intencjom użytkownika.
3. **Rozbudowane procesy:** Dłuższe sesje mogą ewoluować wraz z pojawianiem się nowych informacji. Agentic RAG może nieustannie integrować nowe dane, zmieniając strategie w miarę zdobywania wiedzy o problemie.

## Zarządzanie, przejrzystość i zaufanie

W miarę jak systemy te stają się bardziej autonomiczne w rozumowaniu, zarządzanie i przejrzystość są kluczowe:

- **Wyjaśnialne rozumowanie:** Model może dostarczać ścieżkę audytu zapytań, źródeł, z których korzystał, oraz kroków rozumowania prowadzących do wniosku. Narzędzia takie jak Azure AI Content Safety oraz Azure AI Tracing / GenAIOps pomagają utrzymać przejrzystość i ograniczać ryzyka.
- **Kontrola uprzedzeń i zrównoważone pozyskiwanie danych:** Deweloperzy mogą dostosowywać strategie pozyskiwania danych, aby zapewnić uwzględnienie zrównoważonych, reprezentatywnych źródeł oraz regularnie audytować wyniki pod kątem uprzedzeń lub zniekształceń, korzystając z niestandardowych modeli dla zaawansowanych organizacji zajmujących się data science przy użyciu Azure Machine Learning.
- **Nadzór ludzki i zgodność:** W zadaniach wrażliwych przegląd ludzki pozostaje niezbędny. Agentic RAG nie zastępuje ludzkiego osądu w decyzjach o wysokim ryzyku — wspomaga go, dostarczając bardziej zweryfikowane opcje.

Posiadanie narzędzi umożliwiających jasne rejestrowanie działań jest niezbędne. Bez nich debugowanie wieloetapowego procesu może być bardzo trudne. Zobacz poniższy przykład od Literal AI (firma stojąca za Chainlit) przedstawiający przebieg działania agenta:

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.pl.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.pl.png)

## Podsumowanie

Agentic RAG to naturalna ewolucja w sposobie, w jaki systemy AI radzą sobie ze złożonymi, intensywnymi w dane zadaniami. Dzięki zastosowaniu wzorca interakcji w pętli,

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.