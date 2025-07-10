<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f57852cac3a86c4a5ef47f793cc12178",
  "translation_date": "2025-05-20T07:38:26+00:00",
  "source_file": "06-building-trustworthy-agents/README.md",
  "language_code": "hk"
}
-->
[![Trustworthy AI Agents](../../../translated_images/lesson-6-thumbnail.74ea485dbd9a9c3fb4c749f30f2b8130d025072b4d7d911c6f540eac5a78e6b8.hk.png)](https://youtu.be/iZKkMEGBCUQ?si=Q-kEbcyHUMPoHp8L)

> _(點擊上方圖片觀看本課程影片)_

# 建立可信賴的 AI 代理人

## 介紹

本課程將涵蓋：

- 如何建立及部署安全且有效的 AI 代理人
- 開發 AI 代理人時的重要安全考量
- 在開發 AI 代理人時如何維護資料和用戶隱私

## 學習目標

完成本課程後，你將能夠：

- 識別及減輕建立 AI 代理人時的風險
- 實施安全措施，確保資料與存取權限得到妥善管理
- 創建能維護資料隱私並提供優質用戶體驗的 AI 代理人

## 安全性

我們先來看看如何建立安全的代理應用程式。安全性是指 AI 代理能按設計正常運作。作為代理應用的開發者，我們有方法和工具可以最大化安全性：

### 建立系統訊息框架

如果你曾用大型語言模型（LLM）建立 AI 應用程式，應該知道設計一個穩健的系統提示或系統訊息的重要性。這些提示設定了元規則、指示和指引，決定 LLM 如何與用戶及資料互動。

對 AI 代理人來說，系統提示更為重要，因為 AI 代理人需要非常具體的指示來完成我們設計的任務。

為了創建可擴展的系統提示，我們可以用系統訊息框架來建構應用程式中一個或多個代理人：

![Building a System Message Framework](../../../translated_images/system-message-framework.9df67f3d863520cd48878f71a1289740d8cb46e9d63ee065090ccf3b9b6b82a1.hk.png)

#### 第一步：建立元系統訊息

元提示會被 LLM 用來產生我們為代理人設計的系統提示。我們將它設計成範本，方便日後高效地創建多個代理人。

這裡是一個我們會給 LLM 的元系統訊息範例：

```plaintext
You are an expert at creating AI agent assistants. 
You will be provided a company name, role, responsibilities and other
information that you will use to provide a system prompt for.
To create the system prompt, be descriptive as possible and provide a structure that a system using an LLM can better understand the role and responsibilities of the AI assistant. 
```

#### 第二步：建立基本提示

下一步是建立一個基本提示，描述 AI 代理人。你應該包含代理人的角色、代理人將完成的任務，以及代理人的其他職責。

範例如下：

```plaintext
You are a travel agent for Contoso Travel that is great at booking flights for customers. To help customers you can perform the following tasks: lookup available flights, book flights, ask for preferences in seating and times for flights, cancel any previously booked flights and alert customers on any delays or cancellations of flights.  
```

#### 第三步：將基本系統訊息提供給 LLM

現在我們可以透過同時提供元系統訊息和基本系統訊息來優化這個系統訊息。

這樣會產生一個更適合引導 AI 代理人的系統訊息：

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

#### 第四步：反覆優化與改進

這個系統訊息框架的價值在於能讓你更輕鬆地擴展多個代理人的系統訊息創建，並隨時間改進你的系統訊息。很少有系統訊息能在第一次就完全符合你的使用需求。透過調整基本系統訊息並重新執行，你可以比較和評估結果，逐步優化。

## 了解威脅

要建立可信賴的 AI 代理人，了解並減輕風險與威脅非常重要。這裡只介紹部分 AI 代理人可能面對的威脅，以及你如何更好地規劃和準備。

![Understanding Threats](../../../translated_images/understanding-threats.f8fbe6fe11e025b3085fc91e82d975937ad1d672260a2aeed40458aa41798d0e.hk.png)

### 任務與指令

**描述：** 攻擊者嘗試透過提示或操控輸入，改變 AI 代理人的指令或目標。

**減輕措施：** 執行驗證檢查和輸入過濾，偵測潛在危險的提示，防止它們被 AI 代理處理。由於這類攻擊通常需要頻繁與代理互動，限制對話輪數也是防範此類攻擊的方法之一。

### 存取關鍵系統

**描述：** 若 AI 代理人能存取存放敏感資料的系統和服務，攻擊者可能會破壞代理人與這些服務間的通訊。這些攻擊可能是直接攻擊，也可能是透過代理人間接獲取系統資訊。

**減輕措施：** AI 代理人應僅在必要時存取系統，以防止此類攻擊。代理人與系統間的通訊也應保持安全，實施身份驗證與存取控制是保護資訊的另一方法。

### 資源與服務過載

**描述：** AI 代理人可以使用不同工具和服務來完成任務。攻擊者可能利用此能力，透過 AI 代理大量發送請求攻擊服務，導致系統故障或高昂成本。

**減輕措施：** 制定政策限制 AI 代理對服務的請求數量。限制對話輪數和請求數量，也是防止此類攻擊的有效方法。

### 知識庫污染

**描述：** 這類攻擊並非直接針對 AI 代理人，而是針對 AI 代理人所使用的知識庫及其他服務。可能涉及破壞資料，導致 AI 代理人產生偏頗或非預期的回應。

**減輕措施：** 定期驗證 AI 代理人工作流程中使用的資料。確保資料存取安全，僅由可信任的人員變更，以避免此類攻擊。

### 連鎖錯誤

**描述：** AI 代理人存取多種工具和服務完成任務。攻擊者引發的錯誤可能導致其他系統故障，使攻擊範圍擴大且難以排查。

**減輕措施：** 一種方法是讓 AI 代理在受限環境中運行，例如使用 Docker 容器執行任務，避免直接攻擊系統。建立備援機制及錯誤重試邏輯，也能防止系統大規模故障。

## 人工審核介入

另一種有效建立可信賴 AI 代理系統的方法是採用人工審核介入（Human-in-the-loop）。這讓用戶能在運行過程中對代理人提供回饋，用戶本質上成為多代理系統中的一員，並能批准或終止運行程序。

![Human in The Loop](../../../translated_images/human-in-the-loop.e9edbe8f6d42041b4213421410823250aa750fe8bdba5601d69ed46f3ff6489d.hk.png)

以下是使用 AutoGen 展示此概念實作的程式碼片段：

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

## 結論

建立可信賴的 AI 代理人需要謹慎設計、強健的安全措施與持續迭代。透過實施結構化的元提示系統、了解潛在威脅並採取減輕策略，開發者能打造既安全又有效的 AI 代理人。此外，結合人工審核介入能確保 AI 代理人持續符合用戶需求並降低風險。隨著 AI 持續演進，積極維護安全、隱私與倫理考量，是培養 AI 系統信任與可靠性的關鍵。

## 其他資源

- <a href="https://learn.microsoft.com/azure/ai-studio/responsible-use-of-ai-overview" target="_blank">Responsible AI overview</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Evaluation of generative AI models and AI applications</a>
- <a href="https://learn.microsoft.com/azure/ai-services/openai/concepts/system-message?context=%2Fazure%2Fai-studio%2Fcontext%2Fcontext&tabs=top-techniques" target="_blank">Safety system messages</a>
- <a href="https://blogs.microsoft.com/wp-content/uploads/prod/sites/5/2022/06/Microsoft-RAI-Impact-Assessment-Template.pdf?culture=en-us&country=us" target="_blank">Risk Assessment Template</a>

## 上一課

[Agentic RAG](../05-agentic-rag/README.md)

## 下一課

[Planning Design Pattern](../07-planning-design/README.md)

**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。