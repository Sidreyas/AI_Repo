<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1ad5de6a6388d02c145a92dd04358bab",
  "translation_date": "2025-05-20T09:39:05+00:00",
  "source_file": "10-ai-agents-production/README.md",
  "language_code": "pl"
}
-->
[![AI Agents In Production](../../../translated_images/lesson-10-thumbnail.0b68f4240618b3d5b26693b78cf2cf0a8b36131b50bb08daf91d548cecc87424.pl.png)](https://youtu.be/l4TP6IyJxmQ?si=IvCW3cbw0NJ2mUMV)

> _(Kliknij powyższy obraz, aby obejrzeć wideo z tej lekcji)_
# AI Agents w produkcji

## Wprowadzenie

Ta lekcja obejmie:

- Jak skutecznie zaplanować wdrożenie swojego AI Agenta do produkcji.
- Typowe błędy i problemy, które możesz napotkać podczas wdrażania AI Agenta do produkcji.
- Jak zarządzać kosztami, jednocześnie utrzymując wydajność AI Agenta.

## Cele nauki

Po ukończeniu tej lekcji będziesz wiedzieć/jak rozumieć:

- Techniki poprawy wydajności, kosztów i efektywności systemu AI Agenta w produkcji.
- Co i jak oceniać w swoich AI Agentach.
- Jak kontrolować koszty podczas wdrażania AI Agentów do produkcji.

Ważne jest, aby wdrażać AI Agentów, którym można zaufać. Sprawdź także lekcję „Building Trustworthy AI Agents”.

## Ocena AI Agentów

Przed, w trakcie i po wdrożeniu AI Agentów kluczowe jest posiadanie odpowiedniego systemu oceny AI Agentów. Dzięki temu upewnisz się, że system jest zgodny z Twoimi i użytkowników celami.

Aby ocenić AI Agenta, ważne jest, aby mieć możliwość oceny nie tylko wyników agenta, ale także całego systemu, w którym działa AI Agent. Obejmuje to, ale nie ogranicza się do:

- Początkowego zapytania do modelu.
- Zdolności agenta do rozpoznania intencji użytkownika.
- Zdolności agenta do wyboru odpowiedniego narzędzia do wykonania zadania.
- Odpowiedzi narzędzia na zapytanie agenta.
- Zdolności agenta do interpretacji odpowiedzi narzędzia.
- Informacji zwrotnej użytkownika na odpowiedź agenta.

Daje to możliwość identyfikacji obszarów do poprawy w bardziej modułowy sposób. Możesz wtedy efektywniej monitorować wpływ zmian w modelach, promptach, narzędziach i innych komponentach.

## Typowe problemy i potencjalne rozwiązania z AI Agentami

| **Problem**                                     | **Potencjalne rozwiązanie**                                                                                                                                                                                                  |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AI Agent nie wykonuje zadań konsekwentnie       | - Doprecyzuj prompt podany AI Agentowi; jasno określ cele.<br>- Zidentyfikuj, gdzie podział zadań na podzadania i obsługa ich przez wielu agentów może pomóc.                                                                 |
| AI Agent wpada w pętle ciągłe                    | - Upewnij się, że masz jasne warunki zakończenia, aby Agent wiedział, kiedy zatrzymać proces.<br>- W przypadku zadań wymagających rozumowania i planowania, użyj większego modelu specjalizującego się w takich zadaniach.       |
| Wywołania narzędzi AI Agenta działają słabo      | - Testuj i weryfikuj wyniki narzędzi poza systemem agenta.<br>- Doprecyzuj parametry, prompty i nazewnictwo narzędzi.                                                                                                         |
| System Multi-Agent nie działa spójnie            | - Doprecyzuj prompty dla każdego agenta, aby były konkretne i różniły się od siebie.<br>- Zbuduj system hierarchiczny z użyciem agenta „routingowego” lub kontrolera, który zdecyduje, który agent jest właściwy.              |

## Zarządzanie kosztami

Oto kilka strategii zarządzania kosztami wdrażania AI Agentów do produkcji:

- **Buforowanie odpowiedzi** – Identyfikowanie typowych zapytań i zadań oraz dostarczanie odpowiedzi zanim trafią do systemu agentowego to dobry sposób na zmniejszenie liczby podobnych zapytań. Możesz nawet wdrożyć mechanizm oceniający podobieństwo zapytania do buforowanych odpowiedzi, wykorzystując prostsze modele AI.

- **Używanie mniejszych modeli** – Małe modele językowe (SLM) mogą dobrze sprawdzać się w niektórych zastosowaniach agentowych i znacząco obniżyć koszty. Jak wspomniano wcześniej, najlepszym sposobem jest budowa systemu oceny, który pozwoli porównać wydajność SLM z większymi modelami w Twoim przypadku użycia.

- **Używanie modelu routera** – Podobną strategią jest stosowanie różnorodnych modeli i rozmiarów. Możesz użyć LLM/SLM lub funkcji serverless do kierowania zapytań na odpowiednie modele w zależności od złożoności. To także pomaga obniżyć koszty, zapewniając jednocześnie wydajność na właściwych zadaniach.

## Gratulacje

To obecnie ostatnia lekcja z serii „AI Agents for Beginners”.

Planujemy dodawać kolejne lekcje na podstawie opinii i zmian w tej szybko rozwijającej się branży, więc zaglądaj do nas ponownie w niedalekiej przyszłości.

Jeśli chcesz kontynuować naukę i budowę z AI Agentami, dołącz do <a href="https://discord.gg/kzRShWzttr" target="_blank">Azure AI Community Discord</a>.

Organizujemy tam warsztaty, spotkania społecznościowe i sesje „zapytaj mnie o cokolwiek”.

Mamy również kolekcję Learn z dodatkowymi materiałami, które pomogą Ci zacząć budować AI Agentów w produkcji.

## Poprzednia lekcja

[Metacognition Design Pattern](../09-metacognition/README.md)

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być traktowany jako autorytatywne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.