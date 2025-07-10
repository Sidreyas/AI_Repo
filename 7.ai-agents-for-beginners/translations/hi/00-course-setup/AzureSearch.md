<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f0ce2d470f3efad6f8c7df376f416a4b",
  "translation_date": "2025-05-20T09:40:22+00:00",
  "source_file": "00-course-setup/AzureSearch.md",
  "language_code": "hi"
}
-->
# Azure AI Search Setup Guide

यह गाइड आपको Azure पोर्टल का उपयोग करके Azure AI Search सेटअप करने में मदद करेगा। अपने Azure AI Search सेवा को बनाने और कॉन्फ़िगर करने के लिए नीचे दिए गए चरणों का पालन करें।

## Prerequisites

शुरू करने से पहले, सुनिश्चित करें कि आपके पास निम्नलिखित हैं:

- एक Azure सब्सक्रिप्शन। यदि आपके पास Azure सब्सक्रिप्शन नहीं है, तो आप [Azure Free Account](https://azure.microsoft.com/free/?wt.mc_id=studentamb_258691) पर जाकर मुफ्त खाता बना सकते हैं।

## Step 1: Create an Azure AI Search Service

1. [Azure portal](https://portal.azure.com/?wt.mc_id=studentamb_258691) में साइन इन करें।
2. बाईं ओर नेविगेशन पेन में, **Create a resource** पर क्लिक करें।
3. सर्च बॉक्स में "Azure AI Search" टाइप करें और परिणामों की सूची में से **Azure AI Search** चुनें।
4. **Create** बटन पर क्लिक करें।
5. **Basics** टैब में निम्न जानकारी दें:
   - **Subscription**: अपना Azure सब्सक्रिप्शन चुनें।
   - **Resource group**: नया रिसोर्स ग्रुप बनाएं या किसी मौजूदा को चुनें।
   - **Resource name**: अपनी सर्च सेवा के लिए एक यूनिक नाम दर्ज करें।
   - **Region**: अपने उपयोगकर्ताओं के सबसे नजदीकी क्षेत्र का चयन करें।
   - **Pricing tier**: अपनी आवश्यकताओं के अनुसार एक प्राइसिंग टियर चुनें। परीक्षण के लिए आप Free टियर से शुरू कर सकते हैं।
6. **Review + create** पर क्लिक करें।
7. सेटिंग्स की समीक्षा करें और सर्च सेवा बनाने के लिए **Create** पर क्लिक करें।

## Step 2: Get Started with Azure AI Search

1. डिप्लॉयमेंट पूरा होने के बाद, Azure पोर्टल में अपनी सर्च सेवा पर जाएं।
2. सर्च सेवा के ओवरव्यू पेज पर, **Quickstart** बटन पर क्लिक करें।
3. Quickstart गाइड में दिए गए चरणों का पालन करें ताकि आप एक इंडेक्स बना सकें, डेटा अपलोड कर सकें, और सर्च क्वेरी चला सकें।

### Create an Index

1. Quickstart गाइड में, **Create an index** पर क्लिक करें।
2. इंडेक्स स्कीमा को परिभाषित करें, जिसमें फील्ड्स और उनके गुण (जैसे डेटा टाइप, सर्चेबल, फिल्टरेबल) शामिल हैं।
3. इंडेक्स बनाने के लिए **Create** पर क्लिक करें।

### Upload Data

1. Quickstart गाइड में, **Upload data** पर क्लिक करें।
2. एक डेटा स्रोत चुनें (जैसे Azure Blob Storage, Azure SQL Database) और आवश्यक कनेक्शन विवरण प्रदान करें।
3. डेटा स्रोत के फील्ड्स को इंडेक्स फील्ड्स से मैप करें।
4. डेटा को इंडेक्स में अपलोड करने के लिए **Submit** पर क्लिक करें।

### Perform a Search Query

1. Quickstart गाइड में, **Search explorer** पर क्लिक करें।
2. सर्च बॉक्स में एक सर्च क्वेरी दर्ज करें ताकि सर्च कार्यक्षमता का परीक्षण किया जा सके।
3. सर्च परिणामों की समीक्षा करें और आवश्यकतानुसार इंडेक्स स्कीमा या डेटा समायोजित करें।

## Step 3: Use Azure AI Search Tools

Azure AI Search विभिन्न टूल्स के साथ इंटीग्रेट होता है ताकि आपकी सर्च क्षमताओं को बढ़ाया जा सके। आप Azure CLI, Python SDK, और अन्य टूल्स का उपयोग उन्नत कॉन्फ़िगरेशन और संचालन के लिए कर सकते हैं।

### Using Azure CLI

1. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?wt.mc_id=studentamb_258691) पर दिए गए निर्देशों का पालन करके Azure CLI इंस्टॉल करें।
2. Azure CLI में साइन इन करें इस कमांड का उपयोग करके:
   ```bash
   az login
   ```
3. Azure CLI का उपयोग करके नई सर्च सेवा बनाएं:
   ```bash
   az search service create --resource-group <resource-group> --name <service-name> --sku Free
   ```
4. Azure CLI का उपयोग करके इंडेक्स बनाएं:
   ```bash
   az search index create --service-name <service-name> --name <index-name> --fields "field1:type, field2:type"
   ```

### Using Python SDK

1. Python के लिए Azure Cognitive Search क्लाइंट लाइब्रेरी इंस्टॉल करें:
   ```bash
   pip install azure-search-documents
   ```
2. निम्न Python कोड का उपयोग करके इंडेक्स बनाएं और दस्तावेज़ अपलोड करें:
   ```python
   from azure.core.credentials import AzureKeyCredential
   from azure.search.documents import SearchClient
   from azure.search.documents.indexes import SearchIndexClient
   from azure.search.documents.indexes.models import SearchIndex, SimpleField, edm

   service_endpoint = "https://<service-name>.search.windows.net"
   api_key = "<api-key>"

   index_client = SearchIndexClient(service_endpoint, AzureKeyCredential(api_key))

   fields = [
       SimpleField(name="id", type=edm.String, key=True),
       SimpleField(name="content", type=edm.String, searchable=True),
   ]

   index = SearchIndex(name="sample-index", fields=fields)

   index_client.create_index(index)

   search_client = SearchClient(service_endpoint, "sample-index", AzureKeyCredential(api_key))

   documents = [
       {"id": "1", "content": "Hello world"},
       {"id": "2", "content": "Azure Cognitive Search"}
   ]

   search_client.upload_documents(documents)
   ```

अधिक विस्तृत जानकारी के लिए निम्नलिखित दस्तावेज़ देखें:

- [Create an Azure Cognitive Search service](https://learn.microsoft.com/en-us/azure/search/search-create-service-portal?wt.mc_id=studentamb_258691)
- [Get started with Azure Cognitive Search](https://learn.microsoft.com/en-us/azure/search/search-get-started-portal?wt.mc_id=studentamb_258691)
- [Azure AI Search Tools](https://learn.microsoft.com/en-us/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=code-examples?wt.mc_id=studentamb_258691)

## Conclusion

आपने सफलतापूर्वक Azure पोर्टल और इंटीग्रेटेड टूल्स का उपयोग करके Azure AI Search सेटअप कर लिया है। अब आप Azure AI Search की अधिक उन्नत सुविधाओं और क्षमताओं का अन्वेषण कर सकते हैं ताकि अपनी सर्च सॉल्यूशंस को बेहतर बनाया जा सके।

अधिक सहायता के लिए, [Azure Cognitive Search documentation](https://learn.microsoft.com/en-us/azure/search/?wt.mc_id=studentamb_258691) पर जाएं।

**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।