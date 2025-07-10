<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "76945069b52a49cd0432ae3e0b0ba22e",
  "translation_date": "2025-06-17T08:37:37+00:00",
  "source_file": "00-course-setup/README.md",
  "language_code": "hi"
}
-->
अपने GitHub अकाउंट में जाएं।

`Fine-grained tokens` चुनें और फिर `Generate new token` पर क्लिक करें। `.env` फाइल में नीचे दिया गया कमांड अपने टर्मिनल में चलाएं।

```bash
cp .env.example .env
```

यह उदाहरण फाइल की एक कॉपी बना देगा और `.env` फाइल बनाएगा।

`.env` फाइल में नीचे दिया गया कमांड अपने टर्मिनल में चलाएं।

```bash
cp .env.example .env
```

यह उदाहरण फाइल की एक कॉपी बना देगा और `.env` फाइल बनाएगा।

`PROJECT_ENDPOINT`, `az login --use-device-code`, `AZURE_SUBSCRIPTION_ID`, `AZURE_AI_PROJECT_NAME`, `AZURE_OPENAI_SERVICE`, `AZURE_OPENAI_RESOURCE_GROUP`, `GLOBAL_LLM_SERVICE`, `AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME`, `text-embedding-ada-002`, `AZURE_OPENAI_CHAT_DEPLOYMENT_NAME`, `gpt-4o-mini`, `AZURE_OPENAI_ENDPOINT`, `AZURE_OPENAI_API_KEY`, `AZURE_SEARCH_SERVICE_ENDPOINT`, `AZURE_SEARCH_API_KEY`, `AZURE_OPENAI_API_VERSION`, `DefaultAzureCredential` का उपयोग करके क्रेडेंशियल प्राप्त करने के लिए `DefaultAzureCredential` फ़ंक्शन का उपयोग करें।

```python
from azure.identity import DefaultAzureCredential, InteractiveBrowserCredential
```

## कहीं फंस गए हैं?

अगर आपको इस सेटअप को चलाने में कोई समस्या हो, तो हमारे समुदाय में शामिल हों

या

.

## अगला पाठ

अब आप इस कोर्स के कोड को चलाने के लिए तैयार हैं। AI एजेंट्स की दुनिया के बारे में और जानने के लिए शुभकामनाएं!

[AI एजेंट्स और एजेंट उपयोग मामलों का परिचय](../01-intro-to-ai-agents/README.md)

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।