<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f57852cac3a86c4a5ef47f793cc12178",
  "translation_date": "2025-05-20T09:34:04+00:00",
  "source_file": "06-building-trustworthy-agents/README.md",
  "language_code": "pl"
}
-->
[![Trustworthy AI Agents](../../../translated_images/lesson-6-thumbnail.74ea485dbd9a9c3fb4c749f30f2b8130d025072b4d7d911c6f540eac5a78e6b8.pl.png)](https://youtu.be/iZKkMEGBCUQ?si=Q-kEbcyHUMPoHp8L)

> _(Kliknij powyższy obraz, aby obejrzeć wideo z tej lekcji)_

# Tworzenie godnych zaufania agentów AI

## Wprowadzenie

Ta lekcja obejmie:

- Jak tworzyć i wdrażać bezpiecznych i skutecznych agentów AI
- Ważne aspekty bezpieczeństwa podczas tworzenia agentów AI
- Jak dbać o prywatność danych i użytkowników podczas tworzenia agentów AI

## Cele nauki

Po ukończeniu tej lekcji będziesz potrafił:

- Identyfikować i minimalizować ryzyka związane z tworzeniem agentów AI
- Wdrażać środki bezpieczeństwa, aby odpowiednio zarządzać danymi i dostępem
- Tworzyć agentów AI, którzy dbają o prywatność danych i zapewniają wysoką jakość doświadczenia użytkownika

## Bezpieczeństwo

Najpierw przyjrzyjmy się tworzeniu bezpiecznych aplikacji agentowych. Bezpieczeństwo oznacza, że agent AI działa zgodnie z założeniami. Jako twórcy aplikacji agentowych dysponujemy metodami i narzędziami maksymalizującymi bezpieczeństwo:

### Tworzenie struktury komunikatów systemowych

Jeśli kiedykolwiek tworzyłeś aplikację AI z użyciem dużych modeli językowych (LLM), wiesz, jak ważne jest zaprojektowanie solidnego prompta systemowego lub komunikatu systemowego. Te prompt’y ustalają meta zasady, instrukcje i wytyczne dotyczące interakcji LLM z użytkownikiem i danymi.

Dla agentów AI prompt systemowy jest jeszcze ważniejszy, ponieważ agenci potrzebują bardzo precyzyjnych instrukcji do wykonania zaprojektowanych dla nich zadań.

Aby tworzyć skalowalne prompt’y systemowe, możemy wykorzystać strukturę komunikatów systemowych do budowy jednego lub więcej agentów w naszej aplikacji:

![Building a System Message Framework](../../../translated_images/system-message-framework.9df67f3d863520cd48878f71a1289740d8cb46e9d63ee065090ccf3b9b6b82a1.pl.png)

#### Krok 1: Stwórz meta komunikat systemowy

Meta prompt będzie używany przez LLM do generowania promptów systemowych dla tworzonych agentów. Projektujemy go jako szablon, aby efektywnie tworzyć wielu agentów w razie potrzeby.

Oto przykład meta komunikatu systemowego, który przekazalibyśmy LLM:

```plaintext
You are an expert at creating AI agent assistants. 
You will be provided a company name, role, responsibilities and other
information that you will use to provide a system prompt for.
To create the system prompt, be descriptive as possible and provide a structure that a system using an LLM can better understand the role and responsibilities of the AI assistant. 
```

#### Krok 2: Stwórz podstawowy prompt

Następny krok to stworzenie podstawowego promptu opisującego agenta AI. Powinien on zawierać rolę agenta, zadania, które ma wykonać, oraz inne obowiązki.

Oto przykład:

```plaintext
You are a travel agent for Contoso Travel that is great at booking flights for customers. To help customers you can perform the following tasks: lookup available flights, book flights, ask for preferences in seating and times for flights, cancel any previously booked flights and alert customers on any delays or cancellations of flights.  
```

#### Krok 3: Przekaż podstawowy komunikat systemowy do LLM

Teraz możemy zoptymalizować ten komunikat systemowy, przekazując meta komunikat systemowy jako komunikat systemowy oraz nasz podstawowy komunikat.

W efekcie otrzymamy komunikat systemowy lepiej zaprojektowany do kierowania naszymi agentami AI:

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

#### Krok 4: Iteruj i ulepszaj

Wartość tej struktury komunikatów systemowych polega na łatwiejszym skalowaniu tworzenia komunikatów dla wielu agentów oraz na możliwości poprawiania ich z czasem. Rzadko zdarza się, że komunikat systemowy działa idealnie od razu dla całego zastosowania. Możliwość wprowadzania drobnych poprawek i ulepszeń poprzez zmianę podstawowego komunikatu i przetworzenie go przez system pozwoli Ci porównywać i oceniać wyniki.

## Zrozumienie zagrożeń

Aby stworzyć godnych zaufania agentów AI, ważne jest zrozumienie i ograniczanie ryzyk i zagrożeń dla Twojego agenta AI. Przyjrzyjmy się tylko niektórym z różnych zagrożeń dla agentów AI oraz jak lepiej się do nich przygotować.

![Understanding Threats](../../../translated_images/understanding-threats.f8fbe6fe11e025b3085fc91e82d975937ad1d672260a2aeed40458aa41798d0e.pl.png)

### Zadanie i instrukcje

**Opis:** Atakujący próbują zmienić instrukcje lub cele agenta AI poprzez promptowanie lub manipulowanie danymi wejściowymi.

**Łagodzenie:** Wykonuj kontrole walidacyjne i filtry wejściowe, aby wykrywać potencjalnie niebezpieczne prompt’y zanim zostaną przetworzone przez agenta AI. Ponieważ takie ataki zwykle wymagają częstej interakcji z agentem, ograniczenie liczby tur w rozmowie jest kolejnym sposobem na zapobieganie tego typu atakom.

### Dostęp do krytycznych systemów

**Opis:** Jeśli agent AI ma dostęp do systemów i usług przechowujących wrażliwe dane, atakujący mogą przechwycić komunikację między agentem a tymi usługami. Mogą to być bezpośrednie ataki lub pośrednie próby zdobycia informacji o tych systemach za pośrednictwem agenta.

**Łagodzenie:** Agenci AI powinni mieć dostęp do systemów tylko w razie konieczności, aby zapobiegać tego typu atakom. Komunikacja między agentem a systemem powinna być również bezpieczna. Wdrożenie uwierzytelniania i kontroli dostępu to kolejny sposób na ochronę tych informacji.

### Przeciążenie zasobów i usług

**Opis:** Agenci AI mogą korzystać z różnych narzędzi i usług do realizacji zadań. Atakujący mogą wykorzystać tę zdolność, wysyłając dużą liczbę żądań przez agenta AI, co może prowadzić do awarii systemów lub wysokich kosztów.

**Łagodzenie:** Wprowadź polityki ograniczające liczbę żądań, które agent AI może wysłać do usługi. Ograniczenie liczby tur rozmowy i żądań do agenta to kolejny sposób na zapobieganie tego typu atakom.

### Zatrucie bazy wiedzy

**Opis:** Ten typ ataku nie jest skierowany bezpośrednio na agenta AI, ale na bazę wiedzy i inne usługi, z których agent korzysta. Może to obejmować uszkodzenie danych lub informacji, które agent wykorzystuje do realizacji zadań, co prowadzi do stronniczych lub niezamierzonych odpowiedzi dla użytkownika.

**Łagodzenie:** Regularnie weryfikuj dane, z których korzysta agent AI w swoich procesach. Upewnij się, że dostęp do tych danych jest bezpieczny i mogą je zmieniać tylko zaufane osoby, aby uniknąć tego typu ataku.

### Kaskadowe błędy

**Opis:** Agenci AI korzystają z różnych narzędzi i usług do wykonywania zadań. Błędy wywołane przez atakujących mogą prowadzić do awarii innych systemów powiązanych z agentem, powodując, że atak staje się bardziej rozległy i trudniejszy do zdiagnozowania.

**Łagodzenie:** Jednym ze sposobów zapobiegania temu jest uruchamianie agenta AI w ograniczonym środowisku, np. w kontenerze Docker, aby zapobiec bezpośrednim atakom na system. Tworzenie mechanizmów awaryjnych i logiki ponawiania prób, gdy niektóre systemy zgłaszają błąd, to kolejny sposób na zapobieganie poważniejszym awariom systemu.

## Human-in-the-Loop

Innym skutecznym sposobem tworzenia godnych zaufania systemów agentów AI jest zastosowanie modelu Human-in-the-loop. Tworzy to przepływ, w którym użytkownicy mogą przekazywać opinie agentom podczas działania. Użytkownicy pełnią w zasadzie rolę agentów w systemie wieloagentowym, zatwierdzając lub przerywając działanie procesu.

![Human in The Loop](../../../translated_images/human-in-the-loop.e9edbe8f6d42041b4213421410823250aa750fe8bdba5601d69ed46f3ff6489d.pl.png)

Oto fragment kodu z użyciem AutoGen pokazujący, jak ten koncept jest realizowany:

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

## Podsumowanie

Tworzenie godnych zaufania agentów AI wymaga starannego projektowania, solidnych środków bezpieczeństwa oraz ciągłej iteracji. Poprzez wdrażanie strukturalnych systemów meta promptów, zrozumienie potencjalnych zagrożeń i stosowanie strategii łagodzących, deweloperzy mogą tworzyć agentów AI, którzy są zarówno bezpieczni, jak i skuteczni. Dodatkowo, włączenie podejścia human-in-the-loop zapewnia, że agenci AI pozostają zgodni z potrzebami użytkowników, minimalizując ryzyko. W miarę rozwoju AI, utrzymanie proaktywnej postawy wobec bezpieczeństwa, prywatności i kwestii etycznych będzie kluczowe dla budowania zaufania i niezawodności systemów opartych na AI.

## Dodatkowe zasoby

- <a href="https://learn.microsoft.com/azure/ai-studio/responsible-use-of-ai-overview" target="_blank">Responsible AI overview</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Evaluation of generative AI models and AI applications</a>
- <a href="https://learn.microsoft.com/azure/ai-services/openai/concepts/system-message?context=%2Fazure%2Fai-studio%2Fcontext%2Fcontext&tabs=top-techniques" target="_blank">Safety system messages</a>
- <a href="https://blogs.microsoft.com/wp-content/uploads/prod/sites/5/2022/06/Microsoft-RAI-Impact-Assessment-Template.pdf?culture=en-us&country=us" target="_blank">Risk Assessment Template</a>

## Poprzednia lekcja

[Agentic RAG](../05-agentic-rag/README.md)

## Następna lekcja

[Planning Design Pattern](../07-planning-design/README.md)

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najbardziej precyzyjne, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznawany za źródło wiarygodne. W przypadku informacji o krytycznym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.