<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T09:48:23+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "hi"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.hi.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(ऊपर दी गई छवि पर क्लिक करके इस पाठ का वीडियो देखें)_
# AI एजेंट्स में मेटाकॉग्निशन  
## परिचय  
AI एजेंट्स में मेटाकॉग्निशन पर इस पाठ में आपका स्वागत है! यह अध्याय उन शुरुआती लोगों के लिए तैयार किया गया है जो जानना चाहते हैं कि AI एजेंट्स अपनी सोच की प्रक्रियाओं के बारे में कैसे सोच सकते हैं। इस पाठ के अंत तक, आप मुख्य अवधारणाओं को समझेंगे और मेटाकॉग्निशन को AI एजेंट डिज़ाइन में लागू करने के लिए व्यावहारिक उदाहरणों से लैस होंगे।  

## सीखने के उद्देश्य  
इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:  
1. एजेंट परिभाषाओं में तर्क चक्रों के प्रभाव को समझना।  
2. स्वयं-सुधार करने वाले एजेंट्स की मदद के लिए योजना और मूल्यांकन तकनीकों का उपयोग करना।  
3. ऐसे एजेंट्स बनाना जो कोड को संशोधित करके कार्य पूरा कर सकें।  

## मेटाकॉग्निशन का परिचय  
मेटाकॉग्निशन उन उच्च स्तरीय संज्ञानात्मक प्रक्रियाओं को कहते हैं जिनमें अपनी ही सोच के बारे में सोचना शामिल होता है। AI एजेंट्स के लिए इसका मतलब है कि वे अपनी क्रियाओं का मूल्यांकन कर सकें और आत्म-जागरूकता और पिछले अनुभवों के आधार पर उन्हें समायोजित कर सकें। मेटाकॉग्निशन, यानी "सोच के बारे में सोचना," एजेंटिक AI सिस्टम के विकास में एक महत्वपूर्ण अवधारणा है। इसमें AI सिस्टम अपने आंतरिक प्रक्रियाओं से अवगत होते हैं और अपने व्यवहार की निगरानी, नियंत्रण और अनुकूलन करने में सक्षम होते हैं। ठीक वैसे ही जैसे हम माहौल को समझते हैं या किसी समस्या को देखते हैं। यह आत्म-जागरूकता AI सिस्टम को बेहतर निर्णय लेने, गलतियों की पहचान करने, और समय के साथ प्रदर्शन सुधारने में मदद करती है—जो ट्यूरिंग टेस्ट और AI के प्रभुत्व के विवाद से भी जुड़ती है।  

एजेंटिक AI सिस्टम के संदर्भ में, मेटाकॉग्निशन कई चुनौतियों का समाधान कर सकता है, जैसे:  
- पारदर्शिता: यह सुनिश्चित करना कि AI सिस्टम अपने तर्क और निर्णय स्पष्ट कर सकें।  
- तर्क: AI सिस्टम की जानकारी संश्लेषित करने और उचित निर्णय लेने की क्षमता को बढ़ाना।  
- अनुकूलन: AI सिस्टम को नए वातावरण और बदलती परिस्थितियों के अनुसार ढालने देना।  
- धारणा: AI सिस्टम की अपने परिवेश से डेटा पहचानने और व्याख्या करने की सटीकता में सुधार।  

### मेटाकॉग्निशन क्या है?  
मेटाकॉग्निशन, यानी "सोच के बारे में सोचना," एक उच्च स्तरीय संज्ञानात्मक प्रक्रिया है जिसमें स्वयं की सोच की प्रक्रियाओं के प्रति जागरूकता और नियंत्रण शामिल है। AI के क्षेत्र में, मेटाकॉग्निशन एजेंट्स को अपनी रणनीतियों और क्रियाओं का मूल्यांकन और अनुकूलन करने में सक्षम बनाता है, जिससे समस्या समाधान और निर्णय लेने की क्षमता बेहतर होती है। मेटाकॉग्निशन को समझकर, आप ऐसे AI एजेंट डिज़ाइन कर सकते हैं जो न केवल अधिक बुद्धिमान बल्कि अधिक अनुकूलनीय और प्रभावी भी हों।  

सच्चे मेटाकॉग्निशन में, AI स्पष्ट रूप से अपने तर्क के बारे में तर्क करता है। उदाहरण: "मैंने सस्ते फ्लाइट को प्राथमिकता दी क्योंकि... हो सकता है कि मैं सीधे फ्लाइट्स को मिस कर रहा हूँ, इसलिए मैं फिर से जांच करता हूँ।" यह ध्यान रखना कि उसने किसी मार्ग को क्यों चुना।  
- यह नोट करना कि उसने पिछली बार उपयोगकर्ता की प्राथमिकताओं पर अधिक भरोसा करने की वजह से गलतियां कीं, इसलिए वह अपनी निर्णय लेने की रणनीति को बदलता है, न कि केवल अंतिम सुझाव।  
- पैटर्न का विश्लेषण करना जैसे, "जब भी मैं उपयोगकर्ता को ‘बहुत भीड़’ कहते देखता हूँ, तो मुझे न केवल कुछ आकर्षण हटाने चाहिए बल्कि यह भी सोचना चाहिए कि मेरा ‘शीर्ष आकर्षण’ चुनने का तरीका यदि मैं हमेशा लोकप्रियता के आधार पर रैंक करता हूँ, तो वह गलत है।"  

### AI एजेंट्स में मेटाकॉग्निशन का महत्व  
मेटाकॉग्निशन AI एजेंट डिज़ाइन में कई कारणों से महत्वपूर्ण भूमिका निभाता है:  
![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.hi.png)  
- आत्म-प्रतिबिंब: एजेंट अपने प्रदर्शन का मूल्यांकन कर सकते हैं और सुधार के क्षेत्र पहचान सकते हैं।  
- अनुकूलनशीलता: एजेंट अपने रणनीतियों को पिछले अनुभवों और बदलते वातावरण के अनुसार संशोधित कर सकते हैं।  
- त्रुटि सुधार: एजेंट स्वतः ही त्रुटियों का पता लगा सकते हैं और उन्हें सुधार सकते हैं, जिससे परिणाम अधिक सटीक होते हैं।  
- संसाधन प्रबंधन: एजेंट अपने कार्यों की योजना बनाकर और उनका मूल्यांकन करके समय और कंप्यूटेशनल शक्ति जैसे संसाधनों का बेहतर उपयोग कर सकते हैं।  

## AI एजेंट के घटक  
मेटाकॉग्निटिव प्रक्रियाओं में जाने से पहले, AI एजेंट के मूल घटकों को समझना जरूरी है। एक AI एजेंट आमतौर पर निम्नलिखित से बना होता है:  
- पर्सोना: एजेंट की व्यक्तिगतता और विशेषताएं, जो उपयोगकर्ताओं के साथ उसकी बातचीत को परिभाषित करती हैं।  
- टूल्स: वे क्षमताएं और कार्य जो एजेंट कर सकता है।  
- कौशल: एजेंट के पास मौजूद ज्ञान और विशेषज्ञता।  

ये घटक मिलकर एक "विशेषज्ञता इकाई" बनाते हैं जो विशिष्ट कार्य कर सकती है।  
**उदाहरण**: एक ट्रैवल एजेंट को सोचिए, जो न केवल आपकी छुट्टियों की योजना बनाता है बल्कि वास्तविक समय के डेटा और पिछले ग्राहक अनुभवों के आधार पर अपनी योजना भी समायोजित करता है।  

### उदाहरण: ट्रैवल एजेंट सेवा में मेटाकॉग्निशन  
कल्पना करें कि आप AI संचालित ट्रैवल एजेंट सेवा डिज़ाइन कर रहे हैं। यह एजेंट, "ट्रैवल एजेंट," उपयोगकर्ताओं की छुट्टियों की योजना बनाने में मदद करता है। मेटाकॉग्निशन को शामिल करने के लिए, ट्रैवल एजेंट को अपनी क्रियाओं का आत्म-जागरूकता और पिछले अनुभवों के आधार पर मूल्यांकन और समायोजन करना होगा। मेटाकॉग्निशन इस प्रकार काम कर सकता है:  

#### वर्तमान कार्य  
उपयोगकर्ता की पेरिस यात्रा की योजना बनाने में मदद करना।  

#### कार्य पूरा करने के चरण  
1. **उपयोगकर्ता की प्राथमिकताएँ इकट्ठा करना**: उपयोगकर्ता से यात्रा की तारीखें, बजट, रुचियाँ (जैसे संग्रहालय, भोजन, खरीदारी) और कोई विशिष्ट आवश्यकताएँ पूछना।  
2. **सूचना प्राप्त करना**: उपयोगकर्ता की प्राथमिकताओं के अनुसार उड़ान विकल्प, आवास, आकर्षण और रेस्तरां ढूंढना।  
3. **सिफारिशें बनाना**: उड़ान विवरण, होटल आरक्षण, और सुझाए गए गतिविधियों के साथ व्यक्तिगत यात्रा कार्यक्रम प्रदान करना।  
4. **प्रतिक्रिया के आधार पर समायोजन**: उपयोगकर्ता से सिफारिशों पर प्रतिक्रिया लेना और आवश्यक समायोजन करना।  

#### आवश्यक संसाधन  
- उड़ान और होटल बुकिंग डेटाबेस तक पहुँच।  
- पेरिस के आकर्षण और रेस्तरां की जानकारी।  
- पिछले इंटरैक्शन से उपयोगकर्ता प्रतिक्रिया डेटा।  

#### अनुभव और आत्म-प्रतिबिंब  
ट्रैवल एजेंट मेटाकॉग्निशन का उपयोग अपने प्रदर्शन का मूल्यांकन करने और पिछले अनुभवों से सीखने के लिए करता है। उदाहरण के लिए:  
1. **उपयोगकर्ता प्रतिक्रिया का विश्लेषण**: ट्रैवल एजेंट यह समीक्षा करता है कि कौन सी सिफारिशें अच्छी लगीं और कौन सी नहीं, और भविष्य की सिफारिशों को उसी अनुसार समायोजित करता है।  
2. **अनुकूलनशीलता**: यदि किसी उपयोगकर्ता ने पहले भीड़-भाड़ वाले स्थानों को नापसंद किया है, तो ट्रैवल एजेंट भविष्य में व्यस्त समय पर लोकप्रिय पर्यटन स्थलों की सिफारिश से बचेगा।  
3. **त्रुटि सुधार**: यदि ट्रैवल एजेंट ने पिछली बुकिंग में कोई गलती की, जैसे कि पूरी तरह से बुक होटल सुझाना, तो वह भविष्य में उपलब्धता की जांच अधिक सख्ती से करेगा।  

#### व्यावहारिक डेवलपर उदाहरण  
यहाँ एक सरल उदाहरण है कि ट्रैवल एजेंट के कोड में मेटाकॉग्निशन को कैसे शामिल किया जा सकता है:  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        # Search for flights, hotels, and attractions based on preferences
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        itinerary = create_itinerary(flights, hotels, attractions)
        return itinerary

    def adjust_based_on_feedback(self, feedback):
        self.experience_data.append(feedback)
        # Analyze feedback and adjust future recommendations
        self.user_preferences = adjust_preferences(self.user_preferences, feedback)

# Example usage
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
travel_agent.adjust_based_on_feedback(feedback)
```  

#### मेटाकॉग्निशन क्यों महत्वपूर्ण है  
- **आत्म-प्रतिबिंब**: एजेंट अपने प्रदर्शन का विश्लेषण कर सुधार के क्षेत्र पहचान सकते हैं।  
- **अनुकूलनशीलता**: एजेंट प्रतिक्रिया और बदलती परिस्थितियों के अनुसार रणनीतियाँ बदल सकते हैं।  
- **त्रुटि सुधार**: एजेंट स्वतः ही गलतियों का पता लगा कर सुधार कर सकते हैं।  
- **संसाधन प्रबंधन**: एजेंट समय और कंप्यूटेशनल शक्ति जैसे संसाधनों का बेहतर उपयोग कर सकते हैं।  

मेटाकॉग्निशन को शामिल करके, ट्रैवल एजेंट अधिक व्यक्तिगत और सटीक यात्रा सिफारिशें दे सकता है, जिससे उपयोगकर्ता का अनुभव बेहतर होता है।  

---  
## 2. एजेंट्स में योजना बनाना  
योजना बनाना AI एजेंट के व्यवहार का एक महत्वपूर्ण हिस्सा है। इसमें लक्ष्य प्राप्ति के लिए आवश्यक कदमों की रूपरेखा तैयार करना शामिल है, जिसमें वर्तमान स्थिति, संसाधन, और संभावित बाधाओं पर विचार किया जाता है।  

### योजना के तत्व  
- **वर्तमान कार्य**: कार्य को स्पष्ट रूप से परिभाषित करें।  
- **कार्य पूरा करने के चरण**: कार्य को प्रबंधनीय चरणों में विभाजित करें।  
- **आवश्यक संसाधन**: जरूरी संसाधनों की पहचान करें।  
- **अनुभव**: योजना बनाने में पिछले अनुभवों का उपयोग करें।  

**उदाहरण**: ट्रैवल एजेंट को उपयोगकर्ता की यात्रा योजना बनाने में मदद के लिए जिन चरणों का पालन करना है, वे इस प्रकार हैं:  

### ट्रैवल एजेंट के लिए चरण  
1. **उपयोगकर्ता की प्राथमिकताएँ इकट्ठा करना**  
- उपयोगकर्ता से उनकी यात्रा की तारीखें, बजट, रुचियाँ, और कोई विशिष्ट आवश्यकताएँ पूछें।  
- उदाहरण: "आप कब यात्रा करने की योजना बना रहे हैं?" "आपका बजट क्या है?" "आप छुट्टियों में कौन-कौन सी गतिविधियाँ पसंद करते हैं?"  

2. **सूचना प्राप्त करना**  
- उपयोगकर्ता की प्राथमिकताओं के आधार पर संबंधित यात्रा विकल्प खोजें।  
- **उड़ानें**: उपयोगकर्ता के बजट और पसंदीदा यात्रा तिथियों के अनुसार उपलब्ध उड़ानें देखें।  
- **आवास**: स्थान, कीमत, और सुविधाओं के अनुसार होटल या किराये की संपत्तियाँ खोजें।  
- **आकर्षण और रेस्तरां**: उपयोगकर्ता की रुचियों के अनुरूप लोकप्रिय आकर्षण, गतिविधियाँ, और भोजन विकल्प पहचानें।  

3. **सिफारिशें बनाना**  
- प्राप्त जानकारी को एक व्यक्तिगत यात्रा कार्यक्रम में संकलित करें।  
- उड़ान विकल्प, होटल आरक्षण, और सुझाए गए गतिविधियों का विवरण प्रदान करें, यह सुनिश्चित करते हुए कि सिफारिशें उपयोगकर्ता की प्राथमिकताओं के अनुरूप हों।  

4. **यात्रा कार्यक्रम उपयोगकर्ता को प्रस्तुत करना**  
- प्रस्तावित यात्रा कार्यक्रम को उपयोगकर्ता के समीक्षा के लिए साझा करें।  
- उदाहरण: "यहाँ आपकी पेरिस यात्रा के लिए सुझाया गया यात्रा कार्यक्रम है। इसमें उड़ान विवरण, होटल बुकिंग, और सुझाई गई गतिविधियाँ और रेस्तरां शामिल हैं। कृपया अपनी राय बताएं!"  

5. **प्रतिक्रिया एकत्र करना**  
- प्रस्तावित यात्रा कार्यक्रम पर उपयोगकर्ता से प्रतिक्रिया लें।  
- उदाहरण: "क्या आपको उड़ान विकल्प पसंद आए?" "क्या होटल आपकी आवश्यकताओं के अनुसार है?" "क्या आप कोई गतिविधि जोड़ना या हटाना चाहते हैं?"  

6. **प्रतिक्रिया के आधार पर समायोजन करना**  
- उपयोगकर्ता की प्रतिक्रिया के अनुसार यात्रा कार्यक्रम में बदलाव करें।  
- उड़ान, आवास, और गतिविधि सिफारिशों को उपयोगकर्ता की प्राथमिकताओं के अनुसार बेहतर बनाएं।  

7. **अंतिम पुष्टि**  
- अपडेट किए गए यात्रा कार्यक्रम को अंतिम पुष्टि के लिए उपयोगकर्ता को प्रस्तुत करें।  
- उदाहरण: "मैंने आपकी प्रतिक्रिया के आधार पर समायोजन कर दिए हैं। यह नया यात्रा कार्यक्रम है। क्या यह सब ठीक लग रहा है?"  

8. **बुकिंग और पुष्टि करना**  
- उपयोगकर्ता की मंजूरी मिलने पर उड़ानें, आवास, और पूर्व-निर्धारित गतिविधियों की बुकिंग करें।  
- पुष्टि विवरण उपयोगकर्ता को भेजें।  

9. **लगातार सहायता प्रदान करना**  
- यात्रा के दौरान और उससे पहले उपयोगकर्ता की किसी भी बदलाव या अतिरिक्त अनुरोध में सहायता के लिए उपलब्ध रहें।  
- उदाहरण: "यदि आपकी यात्रा के दौरान आपको किसी भी तरह की मदद चाहिए, तो आप मुझसे कभी भी संपर्क कर सकते हैं!"  

### उदाहरण इंटरैक्शन  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        itinerary = create_itinerary(flights, hotels, attractions)
        return itinerary

    def adjust_based_on_feedback(self, feedback):
        self.experience_data.append(feedback)
        self.user_preferences = adjust_preferences(self.user_preferences, feedback)

# Example usage within a booing request
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
travel_agent.adjust_based_on_feedback(feedback)
```  

## 3. सुधारात्मक RAG सिस्टम  
सबसे पहले, RAG टूल और प्री-एम्प्टिव कॉन्टेक्स्ट लोड के बीच का अंतर समझते हैं।  
![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.hi.png)  

### Retrieval-Augmented Generation (RAG)  
RAG एक retrieval सिस्टम को एक जनरेटिव मॉडल के साथ जोड़ता है। जब कोई प्रश्न किया जाता है, तो retrieval सिस्टम बाहरी स्रोत से प्रासंगिक दस्तावेज़ या डेटा प्राप्त करता है, और इस प्राप्त जानकारी का उपयोग जनरेटिव मॉडल के इनपुट को बढ़ाने के लिए किया जाता है। इससे मॉडल अधिक सटीक और संदर्भानुकूल उत्तर दे पाता है।  

RAG सिस्टम में, एजेंट ज्ञान आधार से प्रासंगिक जानकारी प्राप्त करता है और उसका उपयोग उपयुक्त प्रतिक्रियाएँ या क्रियाएं उत्पन्न करने के लिए करता है।  

### सुधारात्मक RAG दृष्टिकोण  
सुधारात्मक RAG दृष्टिकोण AI एजेंट्स की त्रुटियों को सुधारने और उनकी सटीकता बढ़ाने के लिए RAG तकनीकों का उपयोग करता है। इसमें शामिल हैं:  
1. **प्रॉम्प्टिंग तकनीक**: एजेंट को प्रासंगिक जानकारी प्राप्त करने के लिए विशिष्ट प्रॉम्प्ट का उपयोग करना।  
2. **टूल**: ऐसे एल्गोरिदम और तंत्र लागू करना जो एजेंट को प्राप्त जानकारी की प्रासंगिकता का मूल्यांकन करने और सटीक प्रतिक्रियाएँ उत्पन्न करने में सक्षम बनाते हैं।  
3. **मूल्यांकन**: एजेंट के प्रदर्शन का निरंतर आकलन करना और उसकी सटीकता व दक्षता सुधारने के लिए समायोजन करना।  

उदाहरण: एक सर्च एजेंट में Corrective RAG  
एक सर्च एजेंट पर विचार करें जो उपयोगकर्ता के प्रश्नों के उत्तर देने के लिए वेब से जानकारी प्राप्त करता है। Corrective RAG दृष्टिकोण में शामिल हो सकता है:  
1. **प्रॉम्प्टिंग तकनीक**: उपयोगकर्ता के इनपुट के आधार पर खोज क्वेरी तैयार करना।  
2. **टूल**: प्राकृतिक भाषा प्रसंस्करण और मशीन लर्निंग एल्गोरिदम का उपयोग करके खोज परिणामों को रैंक और फ़िल्टर करना।  
3. **मूल्यांकन**: प्राप्त जानकारी में त्रुटियों की पहचान और सुधार के लिए उपयोगकर्ता प्रतिक्रिया का विश्लेषण करना।  

### यात्रा एजेंट में Corrective RAG  
Corrective RAG (Retrieval-Augmented Generation) AI की जानकारी प्राप्त करने और उत्पन्न करने की क्षमता को बढ़ाता है, साथ ही किसी भी त्रुटि को सुधारता है। आइए देखें कि यात्रा एजेंट कैसे Corrective RAG दृष्टिकोण का उपयोग करके अधिक सटीक और प्रासंगिक यात्रा सुझाव प्रदान कर सकता है। इसमें शामिल हैं:  
- **प्रॉम्प्टिंग तकनीक:** एजेंट को प्रासंगिक जानकारी प्राप्त करने के लिए विशिष्ट प्रॉम्प्ट का उपयोग करना।  
- **टूल:** ऐसे एल्गोरिदम और तंत्र लागू करना जो एजेंट को प्राप्त जानकारी की प्रासंगिकता का मूल्यांकन करने और सटीक प्रतिक्रियाएं उत्पन्न करने में सक्षम बनाते हैं।  
- **मूल्यांकन:** एजेंट के प्रदर्शन का लगातार आकलन करना और उसकी सटीकता और दक्षता सुधारने के लिए आवश्यक समायोजन करना।  

#### यात्रा एजेंट में Corrective RAG लागू करने के चरण  
1. **प्रारंभिक उपयोगकर्ता इंटरैक्शन**  
- यात्रा एजेंट उपयोगकर्ता से प्रारंभिक प्राथमिकताएँ एकत्र करता है, जैसे गंतव्य, यात्रा तिथियां, बजट, और रुचियां।  
- उदाहरण: ```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  

2. **जानकारी प्राप्त करना**  
- यात्रा एजेंट उपयोगकर्ता की प्राथमिकताओं के आधार पर उड़ानों, आवास, आकर्षणों और रेस्तरां की जानकारी प्राप्त करता है।  
- उदाहरण: ```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  

3. **प्रारंभिक सिफारिशें तैयार करना**  
- यात्रा एजेंट प्राप्त जानकारी का उपयोग करके एक व्यक्तिगत यात्रा कार्यक्रम बनाता है।  
- उदाहरण: ```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  

4. **उपयोगकर्ता प्रतिक्रिया एकत्र करना**  
- यात्रा एजेंट प्रारंभिक सिफारिशों पर उपयोगकर्ता से प्रतिक्रिया मांगता है।  
- उदाहरण: ```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  

5. **Corrective RAG प्रक्रिया**  
- **प्रॉम्प्टिंग तकनीक**: यात्रा एजेंट उपयोगकर्ता प्रतिक्रिया के आधार पर नई खोज क्वेरी तैयार करता है।  
- उदाहरण: ```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **टूल**: यात्रा एजेंट उपयोगकर्ता प्रतिक्रिया के आधार पर प्रासंगिकता पर जोर देते हुए नई खोज परिणामों को रैंक और फ़िल्टर करने के लिए एल्गोरिदम का उपयोग करता है।  
- उदाहरण: ```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **मूल्यांकन**: यात्रा एजेंट उपयोगकर्ता प्रतिक्रिया का विश्लेषण करके अपनी सिफारिशों की प्रासंगिकता और सटीकता का लगातार आकलन करता है और आवश्यक समायोजन करता है।  
- उदाहरण: ```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### व्यावहारिक उदाहरण  
यहाँ यात्रा एजेंट में Corrective RAG दृष्टिकोण को शामिल करते हुए एक सरल Python कोड उदाहरण है:  
```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        itinerary = create_itinerary(flights, hotels, attractions)
        return itinerary

    def adjust_based_on_feedback(self, feedback):
        self.experience_data.append(feedback)
        self.user_preferences = adjust_preferences(self.user_preferences, feedback)
        new_itinerary = self.generate_recommendations()
        return new_itinerary

# Example usage
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
new_itinerary = travel_agent.adjust_based_on_feedback(feedback)
print("Updated Itinerary:", new_itinerary)
```  

### प्री-एम्प्टिव कॉन्टेक्स्ट लोड  
प्री-एम्प्टिव कॉन्टेक्स्ट लोड का मतलब है कि क्वेरी संसाधित करने से पहले मॉडल में प्रासंगिक संदर्भ या पृष्ठभूमि जानकारी लोड करना। इसका मतलब है कि मॉडल को शुरू से ही इस जानकारी तक पहुंच होती है, जो इसे अतिरिक्त डेटा पुनः प्राप्त किए बिना अधिक सूचित प्रतिक्रियाएं उत्पन्न करने में मदद कर सकती है। यहाँ Python में एक यात्रा एजेंट एप्लिकेशन के लिए प्री-एम्प्टिव कॉन्टेक्स्ट लोड का एक सरल उदाहरण है:  
```python
class TravelAgent:
    def __init__(self):
        # Pre-load popular destinations and their information
        self.context = {
            "Paris": {"country": "France", "currency": "Euro", "language": "French", "attractions": ["Eiffel Tower", "Louvre Museum"]},
            "Tokyo": {"country": "Japan", "currency": "Yen", "language": "Japanese", "attractions": ["Tokyo Tower", "Shibuya Crossing"]},
            "New York": {"country": "USA", "currency": "Dollar", "language": "English", "attractions": ["Statue of Liberty", "Times Square"]},
            "Sydney": {"country": "Australia", "currency": "Dollar", "language": "English", "attractions": ["Sydney Opera House", "Bondi Beach"]}
        }

    def get_destination_info(self, destination):
        # Fetch destination information from pre-loaded context
        info = self.context.get(destination)
        if info:
            return f"{destination}:\nCountry: {info['country']}\nCurrency: {info['currency']}\nLanguage: {info['language']}\nAttractions: {', '.join(info['attractions'])}"
        else:
            return f"Sorry, we don't have information on {destination}."

# Example usage
travel_agent = TravelAgent()
print(travel_agent.get_destination_info("Paris"))
print(travel_agent.get_destination_info("Tokyo"))
```  

#### व्याख्या  
1. **Initialization (`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info` मेथड)**  
यह मेथड प्री-लोड किए गए संदर्भ शब्दकोश से प्रासंगिक जानकारी प्राप्त करता है। संदर्भ को प्री-लोड करके, यात्रा एजेंट एप्लिकेशन उपयोगकर्ता के प्रश्नों का त्वरित उत्तर दे सकता है बिना वास्तविक समय में इस जानकारी को बाहरी स्रोत से पुनः प्राप्त किए। यह एप्लिकेशन को अधिक कुशल और प्रतिक्रियाशील बनाता है।  

### लक्ष्य के साथ योजना को बूटस्ट्रैप करना (Bootstrapping the Plan with a Goal)  
लक्ष्य के साथ योजना को बूटस्ट्रैप करना स्पष्ट उद्देश्य या लक्षित परिणाम के साथ शुरुआत करना है। इस लक्ष्य को पहले से परिभाषित करके, मॉडल इसे पुनरावृत्त प्रक्रिया के दौरान मार्गदर्शक सिद्धांत के रूप में उपयोग कर सकता है। इससे यह सुनिश्चित होता है कि प्रत्येक पुनरावृत्ति वांछित परिणाम की ओर बढ़ती है, जिससे प्रक्रिया अधिक कुशल और केंद्रित होती है। यहाँ Python में यात्रा एजेंट के लिए लक्ष्य के साथ यात्रा योजना को बूटस्ट्रैप करने का एक उदाहरण है:  

### परिदृश्य  
एक यात्रा एजेंट ग्राहक के लिए एक अनुकूलित छुट्टी योजना बनाना चाहता है। लक्ष्य ग्राहक की प्राथमिकताओं और बजट के आधार पर उनकी संतुष्टि को अधिकतम करने वाली यात्रा योजना बनाना है।  

### चरण  
1. ग्राहक की प्राथमिकताएँ और बजट परिभाषित करें।  
2. इन प्राथमिकताओं के आधार पर प्रारंभिक योजना बनाएं।  
3. योजना को परिष्कृत करने के लिए पुनरावृत्त करें, ग्राहक की संतुष्टि के लिए अनुकूलित करें।  

#### Python कोड  
```python
class TravelAgent:
    def __init__(self, destinations):
        self.destinations = destinations

    def bootstrap_plan(self, preferences, budget):
        plan = []
        total_cost = 0

        for destination in self.destinations:
            if total_cost + destination['cost'] <= budget and self.match_preferences(destination, preferences):
                plan.append(destination)
                total_cost += destination['cost']

        return plan

    def match_preferences(self, destination, preferences):
        for key, value in preferences.items():
            if destination.get(key) != value:
                return False
        return True

    def iterate_plan(self, plan, preferences, budget):
        for i in range(len(plan)):
            for destination in self.destinations:
                if destination not in plan and self.match_preferences(destination, preferences) and self.calculate_cost(plan, destination) <= budget:
                    plan[i] = destination
                    break
        return plan

    def calculate_cost(self, plan, new_destination):
        return sum(destination['cost'] for destination in plan) + new_destination['cost']

# Example usage
destinations = [
    {"name": "Paris", "cost": 1000, "activity": "sightseeing"},
    {"name": "Tokyo", "cost": 1200, "activity": "shopping"},
    {"name": "New York", "cost": 900, "activity": "sightseeing"},
    {"name": "Sydney", "cost": 1100, "activity": "beach"},
]

preferences = {"activity": "sightseeing"}
budget = 2000

travel_agent = TravelAgent(destinations)
initial_plan = travel_agent.bootstrap_plan(preferences, budget)
print("Initial Plan:", initial_plan)

refined_plan = travel_agent.iterate_plan(initial_plan, preferences, budget)
print("Refined Plan:", refined_plan)
```  

#### कोड व्याख्या  
1. **Initialization (`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost` मेथड)**  
यह मेथड वर्तमान योजना की कुल लागत की गणना करता है, जिसमें एक संभावित नया गंतव्य भी शामिल है।  

#### उदाहरण उपयोग  
- **प्रारंभिक योजना**: यात्रा एजेंट ग्राहक की सैर-सपाटे की प्राथमिकताओं और $2000 के बजट के आधार पर प्रारंभिक योजना बनाता है।  
- **परिष्कृत योजना**: यात्रा एजेंट योजना को पुनरावृत्त करता है, ग्राहक की प्राथमिकताओं और बजट के लिए अनुकूलित करता है।  
लक्ष्य (जैसे ग्राहक संतुष्टि को अधिकतम करना) के साथ योजना को बूटस्ट्रैप करके और योजना को परिष्कृत करने के लिए पुनरावृत्त करके, यात्रा एजेंट ग्राहक के लिए एक अनुकूलित और अनुकूलित यात्रा कार्यक्रम बना सकता है। यह दृष्टिकोण सुनिश्चित करता है कि यात्रा योजना शुरू से ही ग्राहक की प्राथमिकताओं और बजट के अनुरूप हो और प्रत्येक पुनरावृत्ति के साथ बेहतर हो।  

### पुनः रैंकिंग और स्कोरिंग के लिए LLM का लाभ उठाना  
बड़े भाषा मॉडल (LLMs) का उपयोग पुनः रैंकिंग और स्कोरिंग के लिए किया जा सकता है, जो प्राप्त दस्तावेज़ों या उत्पन्न प्रतिक्रियाओं की प्रासंगिकता और गुणवत्ता का मूल्यांकन करते हैं। यह इस प्रकार काम करता है:  
**प्राप्ति:** प्रारंभिक प्राप्ति चरण क्वेरी के आधार पर उम्मीदवार दस्तावेज़ों या प्रतिक्रियाओं का एक सेट प्राप्त करता है।  
**पुनः रैंकिंग:** LLM इन उम्मीदवारों का मूल्यांकन करता है और उनकी प्रासंगिकता और गुणवत्ता के आधार पर पुनः रैंक करता है। यह चरण सुनिश्चित करता है कि सबसे प्रासंगिक और उच्च गुणवत्ता वाली जानकारी पहले प्रस्तुत हो।  
**स्कोरिंग:** LLM प्रत्येक उम्मीदवार को प्रासंगिकता और गुणवत्ता को दर्शाने वाले स्कोर असाइन करता है। इससे उपयोगकर्ता के लिए सर्वोत्तम प्रतिक्रिया या दस्तावेज़ चुनने में मदद मिलती है।  
LLM का उपयोग पुनः रैंकिंग और स्कोरिंग के लिए करके, सिस्टम अधिक सटीक और संदर्भानुकूल जानकारी प्रदान कर सकता है, जिससे समग्र उपयोगकर्ता अनुभव बेहतर होता है।  

यहाँ Python में उपयोगकर्ता प्राथमिकताओं के आधार पर यात्रा गंतव्यों को पुनः रैंक और स्कोर करने के लिए एक यात्रा एजेंट में बड़े भाषा मॉडल (LLM) का उपयोग करने का एक उदाहरण है:  

#### परिदृश्य - प्राथमिकताओं के आधार पर यात्रा  
एक यात्रा एजेंट ग्राहक की प्राथमिकताओं के आधार पर सर्वोत्तम यात्रा गंतव्यों की सिफारिश करना चाहता है। LLM गंतव्यों को पुनः रैंक और स्कोर करने में मदद करेगा ताकि सबसे प्रासंगिक विकल्प प्रस्तुत किए जा सकें।  

#### चरण:  
1. उपयोगकर्ता प्राथमिकताएँ एकत्र करें।  
2. संभावित यात्रा गंतव्यों की सूची प्राप्त करें।  
3. उपयोगकर्ता प्राथमिकताओं के आधार पर गंतव्यों को पुनः रैंक और स्कोर करने के लिए LLM का उपयोग करें।  

यहाँ पिछले उदाहरण को Azure OpenAI सेवाओं का उपयोग करने के लिए कैसे अपडेट किया जा सकता है:  

#### आवश्यकताएँ  
1. आपके पास Azure सदस्यता होनी चाहिए।  
2. एक Azure OpenAI संसाधन बनाएं और अपनी API कुंजी प्राप्त करें।  

#### उदाहरण Python कोड  
```python
import requests
import json

class TravelAgent:
    def __init__(self, destinations):
        self.destinations = destinations

    def get_recommendations(self, preferences, api_key, endpoint):
        # Generate a prompt for the Azure OpenAI
        prompt = self.generate_prompt(preferences)
        
        # Define headers and payload for the request
        headers = {
            'Content-Type': 'application/json',
            'Authorization': f'Bearer {api_key}'
        }
        payload = {
            "prompt": prompt,
            "max_tokens": 150,
            "temperature": 0.7
        }
        
        # Call the Azure OpenAI API to get the re-ranked and scored destinations
        response = requests.post(endpoint, headers=headers, json=payload)
        response_data = response.json()
        
        # Extract and return the recommendations
        recommendations = response_data['choices'][0]['text'].strip().split('\n')
        return recommendations

    def generate_prompt(self, preferences):
        prompt = "Here are the travel destinations ranked and scored based on the following user preferences:\n"
        for key, value in preferences.items():
            prompt += f"{key}: {value}\n"
        prompt += "\nDestinations:\n"
        for destination in self.destinations:
            prompt += f"- {destination['name']}: {destination['description']}\n"
        return prompt

# Example usage
destinations = [
    {"name": "Paris", "description": "City of lights, known for its art, fashion, and culture."},
    {"name": "Tokyo", "description": "Vibrant city, famous for its modernity and traditional temples."},
    {"name": "New York", "description": "The city that never sleeps, with iconic landmarks and diverse culture."},
    {"name": "Sydney", "description": "Beautiful harbour city, known for its opera house and stunning beaches."},
]

preferences = {"activity": "sightseeing", "culture": "diverse"}
api_key = 'your_azure_openai_api_key'
endpoint = 'https://your-endpoint.com/openai/deployments/your-deployment-name/completions?api-version=2022-12-01'

travel_agent = TravelAgent(destinations)
recommendations = travel_agent.get_recommendations(preferences, api_key, endpoint)
print("Recommended Destinations:")
for rec in recommendations:
    print(rec)
```  

#### कोड व्याख्या - Preference Booker  
1. **Initialization**: `TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` के साथ अपने Azure OpenAI तैनाती के वास्तविक endpoint URL का उपयोग करें।  
LLM का उपयोग पुनः रैंकिंग और स्कोरिंग के लिए करके, यात्रा एजेंट ग्राहकों को अधिक व्यक्तिगत और प्रासंगिक यात्रा सिफारिशें प्रदान कर सकता है, जिससे उनका समग्र अनुभव बेहतर होता है।  

### RAG: प्रॉम्प्टिंग तकनीक बनाम टूल  
Retrieval-Augmented Generation (RAG) AI एजेंटों के विकास में प्रॉम्प्टिंग तकनीक और टूल दोनों हो सकता है। दोनों के बीच अंतर को समझना आपको अपने प्रोजेक्ट्स में RAG का अधिक प्रभावी ढंग से उपयोग करने में मदद कर सकता है।  

#### प्रॉम्प्टिंग तकनीक के रूप में RAG  
**यह क्या है?**  
- प्रॉम्प्टिंग तकनीक के रूप में, RAG विशिष्ट क्वेरी या प्रॉम्प्ट तैयार करता है ताकि बड़े कॉर्पस या डेटाबेस से प्रासंगिक जानकारी प्राप्त की जा सके। इस जानकारी का उपयोग फिर प्रतिक्रियाएं या क्रियाएं उत्पन्न करने के लिए किया जाता है।  

**यह कैसे काम करता है:**  
1. **प्रॉम्प्ट तैयार करें:** कार्य या उपयोगकर्ता के इनपुट के आधार पर अच्छी तरह से संरचित प्रॉम्प्ट या क्वेरी बनाएं।  
2. **जानकारी प्राप्त करें:** प्री-एक्सिस्टिंग ज्ञान आधार या डेटासेट से प्रासंगिक डेटा खोजने के लिए प्रॉम्प्ट का उपयोग करें।  
3. **प्रतिक्रिया उत्पन्न करें:** प्राप्त जानकारी को जनरेटिव AI मॉडल के साथ संयोजित करके व्यापक और सुसंगत प्रतिक्रिया उत्पन्न करें।  

**यात्रा एजेंट में उदाहरण:**  
- उपयोगकर्ता इनपुट: "मैं पेरिस में संग्रहालय देखना चाहता हूँ।"  
- प्रॉम्प्ट: "पेरिस के शीर्ष संग्रहालय खोजें।"  
- प्राप्त जानकारी: लूवर म्यूजियम, म्यूज़े ड'ऑर्से आदि के विवरण।  
- उत्पन्न प्रतिक्रिया: "यहाँ पेरिस के कुछ शीर्ष संग्रहालय हैं: लूवर म्यूजियम, म्यूज़े ड'ऑर्से, और सेंटर पोंपिडू।"  

#### टूल के रूप में RAG  
**यह क्या है?**  
- टूल के रूप में, RAG एक एकीकृत सिस्टम है जो पुनः प्राप्ति और जनरेशन प्रक्रिया को स्वचालित करता है, जिससे डेवलपर्स के लिए जटिल AI कार्यक्षमताओं को लागू करना आसान हो जाता है बिना हर क्वेरी के लिए मैन्युअल प्रॉम्प्ट तैयार किए।  

**यह कैसे काम करता है:**  
1. **एकीकरण:** AI एजेंट की वास्तुकला में RAG को एम्बेड करें, जिससे यह स्वचालित रूप से पुनः प्राप्ति और जनरेशन कार्य संभाले।  
2. **स्वचालन:** टूल पूरी प्रक्रिया का प्रबंधन करता है, उपयोगकर्ता इनपुट प्राप्त करने से लेकर अंतिम प्रतिक्रिया उत्पन्न करने तक, बिना प्रत्येक चरण के लिए स्पष्ट प्रॉम्प्ट की आवश्यकता के।  
3. **दक्षता:** पुनः प्राप्ति और जनरेशन प्रक्रिया को सुव्यवस्थित करके एजेंट के प्रदर्शन को बेहतर बनाता है, जिससे तेज़ और अधिक सटीक प्रतिक्रियाएं मिलती हैं।  

**यात्रा एजेंट में उदाहरण:**  
- उपयोगकर्ता इनपुट: "मैं पेरिस में संग्रहालय देखना चाहता हूँ।"  
- RAG टूल: स्वचालित रूप से संग्रहालयों के बारे में जानकारी प्राप्त करता है और प्रतिक्रिया उत्पन्न करता है।  
- उत्पन्न प्रतिक्रिया: "यहाँ पेरिस के कुछ शीर्ष संग्रहालय हैं: लूवर म्यूजियम, म्यूज़े ड'ऑर्से, और सेंटर पोंपिडू।"  

### तुलना  

| पहलू                  | प्रॉम्प्टिंग तकनीक                               | टूल                                         |  
|-----------------------|------------------------------------------------|----------------------------------------------|  
| **मैनुअल बनाम स्वचालित** | प्रत्येक क्वेरी के लिए मैन्युअल प्रॉम्प्ट तैयार करना। | पुनः प्राप्ति और जनरेशन की स्वचालित प्रक्रिया। |  
| **नियंत्रण**             | पुनः प्राप्ति प्रक्रिया पर अधिक नियंत्रण प्रदान करता है। | पुनः प्राप्ति और जनरेशन को सुव्यवस्थित और स्वचालित करता है। |  
| **लचीलापन**             | विशिष्ट आवश्यकताओं के आधार पर अनुकूलित प्रॉम्प्ट की अनुमति देता है। | बड़े पैमाने पर कार्यान्वयन के लिए अधिक कुशल। |  
| **जटिलता**              | प्रॉम्प्ट तैयार करने और संशोधित करने की आवश्यकता होती है। | AI एजेंट की वास्तुकला में एकीकृत करना आसान। |  

### व्यावहारिक उदाहरण  
**प्रॉम्प्टिंग तकनीक उदाहरण:** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**टूल उदाहरण:** ```python
class Travel_Agent:
    def __init__(self):
        self.rag_tool = RAGTool()

    def get_museums_in_paris(self):
        user_input = "I want to visit museums in Paris."
        response = self.rag_tool.retrieve_and_generate(user_input)
        return response

travel_agent = Travel_Agent()
museums = travel_agent.get_museums_in_paris()
print("Top Museums in Paris:", museums)
```  

### प्रासंगिकता का मूल्यांकन  
प्रासंगिकता का मूल्यांकन AI एजेंट के प्रदर्शन का एक महत्वपूर्ण पहलू है। यह सुनिश्चित करता है कि एजेंट द्वारा प्राप्त और उत्पन्न की गई जानकारी उपयुक्त, सटीक और उपयोगकर्ता के लिए उपयोगी हो। आइए देखें कि AI एजेंटों में प्रासंगिकता का मूल्यांकन कैसे करें, जिसमें व्यावहारिक उदाहरण और तकनीकें शामिल हैं।  

#### प्रासंगिकता मूल्यांकन के प्रमुख सिद्धांत  
1. **संदर्भ जागरूकता:**  
- एजेंट को उपयोगकर्ता की क्वेरी के संदर्भ को समझना चाहिए ताकि वह प्रासंगिक जानकारी प्राप्त और उत्पन्न कर सके।  
- उदाहरण: यदि उपयोगकर्ता "पेरिस में सर्वश्रेष्ठ रेस्तरां" पूछता है, तो एजेंट को उपयोगकर्ता की प्राथमिकताओं जैसे भोजन प्रकार और बजट पर विचार करना चाहिए।  

2. **सटीकता:**  
- एजेंट द्वारा प्रदान की गई जानकारी तथ्यात्मक रूप से सही और अद्यतन होनी चाहिए।  
- उदाहरण: वर्तमान में खुले हुए और अच्छी समीक्षाओं वाले रेस्तरां की सिफारिश करना, न कि पुराने या बंद विकल्प।  

3. **उपयोगकर्ता का इरादा:**  
-
एजेंट को उपयोगकर्ता के प्रश्न के पीछे उपयोगकर्ता की मंशा का अनुमान लगाना चाहिए ताकि सबसे प्रासंगिक जानकारी प्रदान की जा सके।  
- उदाहरण: यदि कोई उपयोगकर्ता "बजट-फ्रेंडली होटेल" के लिए पूछता है, तो एजेंट को किफायती विकल्पों को प्राथमिकता देनी चाहिए।  

4. **फीडबैक लूप**:  
- उपयोगकर्ता फीडबैक को निरंतर एकत्रित और विश्लेषित करने से एजेंट अपनी प्रासंगिकता मूल्यांकन प्रक्रिया को परिष्कृत कर सकता है।  
- उदाहरण: पिछले सुझावों पर उपयोगकर्ता रेटिंग और फीडबैक को शामिल करके भविष्य की प्रतिक्रियाओं में सुधार करना।  

#### प्रासंगिकता मूल्यांकन के लिए व्यावहारिक तकनीकें  
1. **प्रासंगिकता स्कोरिंग**:  
- प्रत्येक प्राप्त आइटम को एक प्रासंगिकता स्कोर असाइन करें, यह इस बात पर निर्भर करता है कि वह उपयोगकर्ता के प्रश्न और प्राथमिकताओं से कितना मेल खाता है।  
- उदाहरण: ```python
     def relevance_score(item, query):
         score = 0
         if item['category'] in query['interests']:
             score += 1
         if item['price'] <= query['budget']:
             score += 1
         if item['location'] == query['destination']:
             score += 1
         return score
     ```  

2. **फिल्टरिंग और रैंकिंग**:  
- अप्रासंगिक आइटम को फ़िल्टर करें और शेष आइटम को उनके प्रासंगिकता स्कोर के आधार पर रैंक करें।  
- उदाहरण: ```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  

3. **नेचुरल लैंग्वेज प्रोसेसिंग (NLP)**:  
- उपयोगकर्ता के प्रश्न को समझने और प्रासंगिक जानकारी प्राप्त करने के लिए NLP तकनीकों का उपयोग करें।  
- उदाहरण: ```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  

4. **उपयोगकर्ता फीडबैक इंटीग्रेशन**:  
- प्रदान किए गए सुझावों पर उपयोगकर्ता फीडबैक एकत्र करें और इसका उपयोग भविष्य के प्रासंगिकता मूल्यांकन को समायोजित करने के लिए करें।  
- उदाहरण: ```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### उदाहरण: ट्रैवल एजेंट में प्रासंगिकता का मूल्यांकन  
यहाँ एक व्यावहारिक उदाहरण है कि ट्रैवल एजेंट कैसे यात्रा सुझावों की प्रासंगिकता का मूल्यांकन कर सकता है: ```python
class Travel_Agent:
    def __init__(self):
        self.user_preferences = {}
        self.experience_data = []

    def gather_preferences(self, preferences):
        self.user_preferences = preferences

    def retrieve_information(self):
        flights = search_flights(self.user_preferences)
        hotels = search_hotels(self.user_preferences)
        attractions = search_attractions(self.user_preferences)
        return flights, hotels, attractions

    def generate_recommendations(self):
        flights, hotels, attractions = self.retrieve_information()
        ranked_hotels = self.filter_and_rank(hotels, self.user_preferences)
        itinerary = create_itinerary(flights, ranked_hotels, attractions)
        return itinerary

    def filter_and_rank(self, items, query):
        ranked_items = sorted(items, key=lambda item: self.relevance_score(item, query), reverse=True)
        return ranked_items[:10]  # Return top 10 relevant items

    def relevance_score(self, item, query):
        score = 0
        if item['category'] in query['interests']:
            score += 1
        if item['price'] <= query['budget']:
            score += 1
        if item['location'] == query['destination']:
            score += 1
        return score

    def adjust_based_on_feedback(self, feedback, items):
        for item in items:
            if item['name'] in feedback['liked']:
                item['relevance'] += 1
            if item['name'] in feedback['disliked']:
                item['relevance'] -= 1
        return items

# Example usage
travel_agent = Travel_Agent()
preferences = {
    "destination": "Paris",
    "dates": "2025-04-01 to 2025-04-10",
    "budget": "moderate",
    "interests": ["museums", "cuisine"]
}
travel_agent.gather_preferences(preferences)
itinerary = travel_agent.generate_recommendations()
print("Suggested Itinerary:", itinerary)
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
updated_items = travel_agent.adjust_based_on_feedback(feedback, itinerary['hotels'])
print("Updated Itinerary with Feedback:", updated_items)
```  

### मंशा के साथ खोज  
मंशा के साथ खोज में उपयोगकर्ता के प्रश्न के पीछे निहित उद्देश्य या लक्ष्य को समझना और व्याख्यायित करना शामिल है ताकि सबसे प्रासंगिक और उपयोगी जानकारी प्राप्त की जा सके। यह दृष्टिकोण केवल कीवर्ड मैचिंग से आगे बढ़ता है और उपयोगकर्ता की वास्तविक आवश्यकताओं और संदर्भ को समझने पर केंद्रित होता है।  

#### मंशा के साथ खोज में मुख्य अवधारणाएँ  
1. **उपयोगकर्ता की मंशा को समझना**:  
- उपयोगकर्ता की मंशा को तीन मुख्य प्रकारों में वर्गीकृत किया जा सकता है: सूचना संबंधी, नेविगेशनल, और लेनदेन संबंधी।  
- **सूचना संबंधी मंशा**: उपयोगकर्ता किसी विषय के बारे में जानकारी चाहता है (जैसे, "पेरिस के सर्वश्रेष्ठ संग्रहालय कौन से हैं?")।  
- **नेविगेशनल मंशा**: उपयोगकर्ता किसी विशिष्ट वेबसाइट या पेज पर जाना चाहता है (जैसे, "लूव्र संग्रहालय की आधिकारिक वेबसाइट")।  
- **लेनदेन संबंधी मंशा**: उपयोगकर्ता कोई लेनदेन करना चाहता है, जैसे फ्लाइट बुक करना या खरीदारी करना (जैसे, "पेरिस के लिए फ्लाइट बुक करें")।  

2. **संदर्भ जागरूकता**:  
- उपयोगकर्ता के प्रश्न के संदर्भ का विश्लेषण करना उनकी मंशा की सही पहचान में मदद करता है। इसमें पिछले इंटरैक्शन, उपयोगकर्ता की प्राथमिकताएँ, और वर्तमान प्रश्न के विशिष्ट विवरण शामिल हैं।  

3. **नेचुरल लैंग्वेज प्रोसेसिंग (NLP)**:  
- उपयोगकर्ताओं द्वारा प्रदान किए गए प्राकृतिक भाषा प्रश्नों को समझने और व्याख्यायित करने के लिए NLP तकनीकों का उपयोग किया जाता है। इसमें एंटिटी रिकग्निशन, सेंटिमेंट एनालिसिस, और प्रश्न पार्सिंग जैसे कार्य शामिल हैं।  

4. **व्यक्तिगत अनुकूलन**:  
- उपयोगकर्ता के इतिहास, प्राथमिकताओं, और फीडबैक के आधार पर खोज परिणामों को व्यक्तिगत बनाना प्राप्त जानकारी की प्रासंगिकता को बढ़ाता है।  

#### व्यावहारिक उदाहरण: ट्रैवल एजेंट में मंशा के साथ खोज  
आइए ट्रैवल एजेंट को उदाहरण के रूप में लें और देखें कि मंशा के साथ खोज कैसे लागू की जा सकती है।  
1. **उपयोगकर्ता प्राथमिकताओं का संग्रह** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **उपयोगकर्ता मंशा को समझना** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **संदर्भ जागरूकता** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
4. **खोज और परिणामों का व्यक्तिगत अनुकूलन** ```python
   def search_with_intent(query, preferences, user_history):
       intent = identify_intent(query)
       context = analyze_context(query, user_history)
       if intent == "informational":
           search_results = search_information(query, preferences)
       elif intent == "navigational":
           search_results = search_navigation(query)
       elif intent == "transactional":
           search_results = search_transaction(query, preferences)
       personalized_results = personalize_results(search_results, user_history)
       return personalized_results

   def search_information(query, preferences):
       # Example search logic for informational intent
       results = search_web(f"best {preferences['interests']} in {preferences['destination']}")
       return results

   def search_navigation(query):
       # Example search logic for navigational intent
       results = search_web(query)
       return results

   def search_transaction(query, preferences):
       # Example search logic for transactional intent
       results = search_web(f"book {query} to {preferences['destination']}")
       return results

   def personalize_results(results, user_history):
       # Example personalization logic
       personalized = [result for result in results if result not in user_history]
       return personalized[:10]  # Return top 10 personalized results
   ```  
5. **उदाहरण उपयोग** ```python
   travel_agent = Travel_Agent()
   preferences = {
       "destination": "Paris",
       "interests": ["museums", "cuisine"]
   }
   travel_agent.gather_preferences(preferences)
   user_history = ["Louvre Museum website", "Book flight to Paris"]
   query = "best museums in Paris"
   results = search_with_intent(query, preferences, user_history)
   print("Search Results:", results)
   ```  

---  

## 4. टूल के रूप में कोड जनरेशन  
कोड जनरेटिंग एजेंट AI मॉडल का उपयोग करके कोड लिखते और निष्पादित करते हैं, जटिल समस्याओं को हल करते हैं और कार्यों को स्वचालित करते हैं।  

### कोड जनरेटिंग एजेंट  
कोड जनरेटिंग एजेंट जनरेटिव AI मॉडल का उपयोग करते हैं ताकि कोड लिखा और चलाया जा सके। ये एजेंट जटिल समस्याओं को हल कर सकते हैं, कार्यों को स्वचालित कर सकते हैं, और विभिन्न प्रोग्रामिंग भाषाओं में कोड जनरेट और रन करके मूल्यवान अंतर्दृष्टि प्रदान कर सकते हैं।  

#### व्यावहारिक अनुप्रयोग  
1. **स्वचालित कोड जनरेशन**: विशिष्ट कार्यों के लिए कोड स्निपेट्स उत्पन्न करना, जैसे डेटा विश्लेषण, वेब स्क्रैपिंग, या मशीन लर्निंग।  
2. **RAG के रूप में SQL**: डेटाबेस से डेटा प्राप्त करने और उसे प्रबंधित करने के लिए SQL क्वेरीज का उपयोग।  
3. **समस्या समाधान**: विशिष्ट समस्याओं को हल करने के लिए कोड बनाना और निष्पादित करना, जैसे एल्गोरिदम का अनुकूलन या डेटा विश्लेषण।  

#### उदाहरण: डेटा विश्लेषण के लिए कोड जनरेटिंग एजेंट  
कल्पना करें कि आप एक कोड जनरेटिंग एजेंट डिजाइन कर रहे हैं। यह इस प्रकार काम कर सकता है:  
1. **कार्य**: डेटा सेट का विश्लेषण कर रुझान और पैटर्न पहचानना।  
2. **कदम**:  
- डेटा सेट को डेटा विश्लेषण उपकरण में लोड करें।  
- डेटा को फ़िल्टर और समेकित करने के लिए SQL क्वेरीज जनरेट करें।  
- क्वेरीज को निष्पादित करें और परिणाम प्राप्त करें।  
- परिणामों का उपयोग विज़ुअलाइज़ेशन और अंतर्दृष्टि उत्पन्न करने के लिए करें।  
3. **आवश्यक संसाधन**: डेटा सेट तक पहुँच, डेटा विश्लेषण उपकरण, और SQL क्षमताएं।  
4. **अनुभव**: पिछले विश्लेषण परिणामों का उपयोग भविष्य के विश्लेषण की सटीकता और प्रासंगिकता बढ़ाने के लिए करें।  

### उदाहरण: ट्रैवल एजेंट के लिए कोड जनरेटिंग एजेंट  
इस उदाहरण में, हम एक कोड जनरेटिंग एजेंट, ट्रैवल एजेंट, डिज़ाइन करेंगे जो उपयोगकर्ताओं की यात्रा योजना बनाने में सहायता करेगा, कोड जनरेट और निष्पादित करके। यह एजेंट यात्रा विकल्प प्राप्त करने, परिणामों को फ़िल्टर करने, और जनरेटिव AI का उपयोग करके एक यात्रा कार्यक्रम संकलित करने जैसे कार्य कर सकता है।  

#### कोड जनरेटिंग एजेंट का अवलोकन  
1. **उपयोगकर्ता प्राथमिकताओं का संग्रह**: गंतव्य, यात्रा तिथियाँ, बजट, और रुचियों जैसे उपयोगकर्ता इनपुट एकत्र करता है।  
2. **डेटा प्राप्त करने के लिए कोड जनरेशन**: उड़ानों, होटलों, और आकर्षणों के बारे में डेटा प्राप्त करने के लिए कोड स्निपेट्स बनाता है।  
3. **जनरेट किए गए कोड का निष्पादन**: वास्तविक समय की जानकारी प्राप्त करने के लिए कोड चलाता है।  
4. **यात्रा कार्यक्रम बनाना**: प्राप्त डेटा को एक व्यक्तिगत यात्रा योजना में संकलित करता है।  
5. **फीडबैक के आधार पर समायोजन**: उपयोगकर्ता फीडबैक प्राप्त करता है और यदि आवश्यक हो तो परिणामों को परिष्कृत करने के लिए कोड पुनः जनरेट करता है।  

#### चरण-दर-चरण कार्यान्वयन  
1. **उपयोगकर्ता प्राथमिकताओं का संग्रह** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **डेटा प्राप्त करने के लिए कोड जनरेशन** ```python
   def generate_code_to_fetch_data(preferences):
       # Example: Generate code to search for flights based on user preferences
       code = f"""
       def search_flights():
           import requests
           response = requests.get('https://api.example.com/flights', params={preferences})
           return response.json()
       """
       return code

   def generate_code_to_fetch_hotels(preferences):
       # Example: Generate code to search for hotels
       code = f"""
       def search_hotels():
           import requests
           response = requests.get('https://api.example.com/hotels', params={preferences})
           return response.json()
       """
       return code
   ```  
3. **जनरेट किए गए कोड का निष्पादन** ```python
   def execute_code(code):
       # Execute the generated code using exec
       exec(code)
       result = locals()
       return result

   travel_agent = Travel_Agent()
   preferences = {
       "destination": "Paris",
       "dates": "2025-04-01 to 2025-04-10",
       "budget": "moderate",
       "interests": ["museums", "cuisine"]
   }
   travel_agent.gather_preferences(preferences)
   
   flight_code = generate_code_to_fetch_data(preferences)
   hotel_code = generate_code_to_fetch_hotels(preferences)
   
   flights = execute_code(flight_code)
   hotels = execute_code(hotel_code)

   print("Flight Options:", flights)
   print("Hotel Options:", hotels)
   ```  
4. **यात्रा कार्यक्रम बनाना** ```python
   def generate_itinerary(flights, hotels, attractions):
       itinerary = {
           "flights": flights,
           "hotels": hotels,
           "attractions": attractions
       }
       return itinerary

   attractions = search_attractions(preferences)
   itinerary = generate_itinerary(flights, hotels, attractions)
   print("Suggested Itinerary:", itinerary)
   ```  
5. **फीडबैक के आधार पर समायोजन** ```python
   def adjust_based_on_feedback(feedback, preferences):
       # Adjust preferences based on user feedback
       if "liked" in feedback:
           preferences["favorites"] = feedback["liked"]
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       return preferences

   feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
   updated_preferences = adjust_based_on_feedback(feedback, preferences)
   
   # Regenerate and execute code with updated preferences
   updated_flight_code = generate_code_to_fetch_data(updated_preferences)
   updated_hotel_code = generate_code_to_fetch_hotels(updated_preferences)
   
   updated_flights = execute_code(updated_flight_code)
   updated_hotels = execute_code(updated_hotel_code)
   
   updated_itinerary = generate_itinerary(updated_flights, updated_hotels, attractions)
   print("Updated Itinerary:", updated_itinerary)
   ```  

### पर्यावरणीय जागरूकता और तर्क का लाभ उठाना  
टेबल के स्कीमा के आधार पर क्वेरी जनरेशन प्रक्रिया को पर्यावरणीय जागरूकता और तर्क के माध्यम से बेहतर बनाया जा सकता है। यहाँ इसका एक उदाहरण है:  
1. **स्कीमा को समझना**: सिस्टम टेबल के स्कीमा को समझेगा और इस जानकारी का उपयोग क्वेरी जनरेशन को आधार बनाने के लिए करेगा।  
2. **फीडबैक के आधार पर समायोजन**: सिस्टम फीडबैक के आधार पर उपयोगकर्ता प्राथमिकताओं को समायोजित करेगा और तर्क करेगा कि स्कीमा में कौन से फ़ील्ड अपडेट किए जाने चाहिए।  
3. **क्वेरीज का जनरेशन और निष्पादन**: सिस्टम नई प्राथमिकताओं के आधार पर उड़ान और होटल डेटा को अपडेट करने के लिए क्वेरीज जनरेट और निष्पादित करेगा।  

यहाँ एक अपडेटेड Python कोड उदाहरण है जो इन अवधारणाओं को शामिल करता है: ```python
def adjust_based_on_feedback(feedback, preferences, schema):
    # Adjust preferences based on user feedback
    if "liked" in feedback:
        preferences["favorites"] = feedback["liked"]
    if "disliked" in feedback:
        preferences["avoid"] = feedback["disliked"]
    # Reasoning based on schema to adjust other related preferences
    for field in schema:
        if field in preferences:
            preferences[field] = adjust_based_on_environment(feedback, field, schema)
    return preferences

def adjust_based_on_environment(feedback, field, schema):
    # Custom logic to adjust preferences based on schema and feedback
    if field in feedback["liked"]:
        return schema[field]["positive_adjustment"]
    elif field in feedback["disliked"]:
        return schema[field]["negative_adjustment"]
    return schema[field]["default"]

def generate_code_to_fetch_data(preferences):
    # Generate code to fetch flight data based on updated preferences
    return f"fetch_flights(preferences={preferences})"

def generate_code_to_fetch_hotels(preferences):
    # Generate code to fetch hotel data based on updated preferences
    return f"fetch_hotels(preferences={preferences})"

def execute_code(code):
    # Simulate execution of code and return mock data
    return {"data": f"Executed: {code}"}

def generate_itinerary(flights, hotels, attractions):
    # Generate itinerary based on flights, hotels, and attractions
    return {"flights": flights, "hotels": hotels, "attractions": attractions}

# Example schema
schema = {
    "favorites": {"positive_adjustment": "increase", "negative_adjustment": "decrease", "default": "neutral"},
    "avoid": {"positive_adjustment": "decrease", "negative_adjustment": "increase", "default": "neutral"}
}

# Example usage
preferences = {"favorites": "sightseeing", "avoid": "crowded places"}
feedback = {"liked": ["Louvre Museum"], "disliked": ["Eiffel Tower (too crowded)"]}
updated_preferences = adjust_based_on_feedback(feedback, preferences, schema)

# Regenerate and execute code with updated preferences
updated_flight_code = generate_code_to_fetch_data(updated_preferences)
updated_hotel_code = generate_code_to_fetch_hotels(updated_preferences)

updated_flights = execute_code(updated_flight_code)
updated_hotels = execute_code(updated_hotel_code)

updated_itinerary = generate_itinerary(updated_flights, updated_hotels, feedback["liked"])
print("Updated Itinerary:", updated_itinerary)
```  

#### व्याख्या - फीडबैक के आधार पर बुकिंग  
1. **स्कीमा जागरूकता**: `schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` मेथड): यह मेथड स्कीमा और फीडबैक के आधार पर समायोजन को कस्टमाइज़ करता है।  
4. **क्वेरीज का जनरेशन और निष्पादन**: सिस्टम समायोजित प्राथमिकताओं के आधार पर उड़ान और होटल डेटा प्राप्त करने के लिए कोड जनरेट करता है और इन क्वेरीज के निष्पादन का अनुकरण करता है।  
5. **यात्रा कार्यक्रम बनाना**: सिस्टम नए उड़ान, होटल, और आकर्षण डेटा के आधार पर अपडेटेड यात्रा कार्यक्रम बनाता है।  

सिस्टम को पर्यावरण- जागरूक और स्कीमा आधारित तर्कशील बनाकर, यह अधिक सटीक और प्रासंगिक क्वेरीज जनरेट कर सकता है, जिससे बेहतर यात्रा सुझाव और अधिक व्यक्तिगत उपयोगकर्ता अनुभव संभव होता है।  

### SQL का उपयोग Retrieval-Augmented Generation (RAG) तकनीक के रूप में  
SQL (Structured Query Language) डेटाबेस के साथ इंटरैक्ट करने के लिए एक शक्तिशाली उपकरण है। जब इसे Retrieval-Augmented Generation (RAG) दृष्टिकोण के हिस्से के रूप में उपयोग किया जाता है, तो SQL डेटाबेस से प्रासंगिक डेटा प्राप्त कर सकता है ताकि AI एजेंट्स में प्रतिक्रियाओं या कार्यों को सूचित और जनरेट किया जा सके।  

आइए देखें कि ट्रैवल एजेंट के संदर्भ में SQL को RAG तकनीक के रूप में कैसे उपयोग किया जा सकता है।  

#### मुख्य अवधारणाएँ  
1. **डेटाबेस इंटरैक्शन**:  
- SQL का उपयोग डेटाबेस से क्वेरी करने, प्रासंगिक जानकारी प्राप्त करने, और डेटा को प्रबंधित करने के लिए किया जाता है।  
- उदाहरण: यात्रा डेटाबेस से उड़ान विवरण, होटल जानकारी, और आकर्षण प्राप्त करना।  

2. **RAG के साथ एकीकरण**:  
- SQL क्वेरीज उपयोगकर्ता इनपुट और प्राथमिकताओं के आधार पर जनरेट की जाती हैं।  
- प्राप्त डेटा का उपयोग व्यक्तिगत सुझाव या कार्य उत्पन्न करने के लिए किया जाता है।  

3. **डायनामिक क्वेरी जनरेशन**:  
- AI एजेंट संदर्भ और उपयोगकर्ता की आवश्यकताओं के आधार पर डायनामिक SQL क्वेरीज जनरेट करता है।  
- उदाहरण: बजट, तिथियों, और रुचियों के आधार पर परिणामों को फ़िल्टर करने के लिए SQL क्वेरीज को अनुकूलित करना।  

#### अनुप्रयोग  
- **स्वचालित कोड जनरेशन**: विशिष्ट कार्यों के लिए कोड स्निपेट्स बनाना।  
- **RAG के रूप में SQL**: डेटा को प्रबंधित करने के लिए SQL क्वेरीज का उपयोग।  
- **समस्या समाधान**: समस्याओं को हल करने के लिए कोड बनाना और निष्पादित करना।  

**उदाहरण**: एक डेटा विश्लेषण एजेंट:  
1. **कार्य**: रुझान खोजने के लिए डेटा सेट का विश्लेषण।  
2. **कदम**:  
- डेटा सेट लोड करें।  
- डेटा को फ़िल्टर करने के लिए SQL क्वेरीज जनरेट करें।  
- क्वेरीज निष्पादित करें और परिणाम प्राप्त करें।  
- विज़ुअलाइज़ेशन और अंतर्दृष्टि उत्पन्न करें।  
3. **संसाधन**: डेटा सेट की पहुँच, SQL क्षमताएं।  
4. **अनुभव**: भविष्य के विश्लेषण को बेहतर बनाने के लिए पिछले परिणामों का उपयोग करें।  

#### व्यावहारिक उदाहरण: ट्रैवल एजेंट में SQL का उपयोग  
1. **उपयोगकर्ता प्राथमिकताओं का संग्रह** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **SQL क्वेरीज जनरेट करना** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
3. **SQL क्वेरीज निष्पादित करना** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
4. **सिफारिशें जनरेट करना** ```python
   def generate_recommendations(preferences):
       flight_query = generate_sql_query("flights", preferences)
       hotel_query = generate_sql_query("hotels", preferences)
       attraction_query = generate_sql_query("attractions", preferences)
       
       flights = execute_sql_query(flight_query)
       hotels = execute_sql_query(hotel_query)
       attractions = execute_sql_query(attraction_query)
       
       itinerary = {
           "flights": flights,
           "hotels": hotels,
           "attractions": attractions
       }
       return itinerary

   travel_agent = Travel_Agent()
   preferences = {
       "destination": "Paris",
       "dates": "2025-04-01 to 2025-04-10",
       "budget": "moderate",
       "interests": ["museums", "cuisine"]
   }
   travel_agent.gather_preferences(preferences)
   itinerary = generate_recommendations(preferences)
   print("Suggested Itinerary:", itinerary)
   ```  

#### उदाहरण SQL क्वेरीज  
1. **फ्लाइट क्वेरी** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
2. **होटल क्वेरी** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **आकर्षण क्वेरी** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

SQL को Retrieval-Augmented Generation (RAG) तकनीक के हिस्से के रूप में उपयोग करके, ट्रैवल एजेंट जैसे AI एजेंट प्रासंगिक डेटा को डायनामिकली प्राप्त और उपयोग कर सकते हैं ताकि सटीक और व्यक्तिगत सुझाव प्रदान किए जा सकें।  

### मेटाकॉग्निशन का उदाहरण  
मेटाकॉग्निशन के कार्यान्वयन को प्रदर्शित करने के लिए, चलिए एक सरल एजेंट बनाते हैं जो *अपने निर्णय लेने की प्रक्रिया पर चिंतन* करता है जब वह किसी समस्या को हल करता है।  

इस उदाहरण के लिए, हम एक ऐसा सिस्टम बनाएंगे जहां एजेंट होटल के चयन को अनुकूलित करने का प्रयास करता है, लेकिन फिर अपनी सोच का मूल्यांकन करता है और अपनी रणनीति को समायोजित करता है जब वह त्रुटियाँ या उपयुक्त से कम विकल्प चुनता है।  

हम इसे एक बुनियादी उदाहरण के माध्यम से सिमुलेट करेंगे जहाँ एजेंट मूल्य और गुणवत्ता के संयोजन के आधार पर होटल चुनता है, लेकिन वह अपने निर्णयों पर "चिंतन" करता है और तदनुसार समायोजित करता है।  

#### यह मेटाकॉग्निशन को कैसे दर्शाता है:  
1. **प्रारंभिक निर्णय**: एजेंट सबसे सस्ता होटल चुनेगा, गुणवत्ता के प्रभाव को समझे बिना।  
2. **चिंतन और मूल्यांकन**: प्रारंभिक चयन के बाद, एजेंट जांचेगा कि क्या होटल "खराब" विकल्प है उपयोगकर्ता फीडबैक के आधार पर। यदि वह पाता है कि होटल की गुणवत्ता बहुत कम थी, तो वह अपनी सोच पर चिंतन करेगा।  
3. **रणनीति समायोजन**: एजेंट अपनी चिंतन के आधार पर अपनी रणनीति समायोजित करता है, "सबसे सस्ता" से "सबसे उच्च गुणवत्ता" पर स्विच करता है, इस प्रकार भविष्य के निर्णय लेने की प्रक्रिया में सुधार करता है।  

यहाँ एक उदाहरण है: ```python
class HotelRecommendationAgent:
    def __init__(self):
        self.previous_choices = []  # Stores the hotels chosen previously
        self.corrected_choices = []  # Stores the corrected choices
        self.recommendation_strategies = ['cheapest', 'highest_quality']  # Available strategies

    def recommend_hotel(self, hotels, strategy):
        """
        Recommend a hotel based on the chosen strategy.
        The strategy can either be 'cheapest' or 'highest_quality'.
        """
        if strategy == 'cheapest':
            recommended = min(hotels, key=lambda x: x['price'])
        elif strategy == 'highest_quality':
            recommended = max(hotels, key=lambda x: x['quality'])
        else:
            recommended = None
        self.previous_choices.append((strategy, recommended))
        return recommended

    def reflect_on_choice(self):
        """
        Reflect on the last choice made and decide if the agent should adjust its strategy.
        The agent considers if the previous choice led to a poor outcome.
        """
        if not self.previous_choices:
            return "No choices made yet."

        last_choice_strategy, last_choice = self.previous_choices[-1]
        # Let's assume we have some user feedback that tells us whether the last choice was good or not
        user_feedback = self.get_user_feedback(last_choice)

        if user_feedback == "bad":
            # Adjust strategy if the previous choice was unsatisfactory
            new_strategy = 'highest_quality' if last_choice_strategy == 'cheapest' else 'cheapest'
            self.corrected_choices.append((new_strategy, last_choice))
            return f"Reflecting on choice. Adjusting strategy to {new_strategy}."
        else:
            return "The choice was good. No need to adjust."

    def get_user_feedback(self, hotel):
        """
        Simulate user feedback based on hotel attributes.
        For simplicity, assume if the hotel is too cheap, the feedback is "bad".
        If the hotel has quality less than 7, feedback is "bad".
        """
        if hotel['price'] < 100 or hotel['quality'] < 7:
            return "bad"
        return "good"

# Simulate a list of hotels (price and quality)
hotels = [
    {'name': 'Budget Inn', 'price': 80, 'quality': 6},
    {'name': 'Comfort Suites', 'price': 120, 'quality': 8},
    {'name': 'Luxury Stay', 'price': 200, 'quality': 9}
]

# Create an agent
agent = HotelRecommendationAgent()

# Step 1: The agent recommends a hotel using the "cheapest" strategy
recommended_hotel = agent.recommend_hotel(hotels, 'cheapest')
print(f"Recommended hotel (cheapest): {recommended_hotel['name']}")

# Step 2: The agent reflects on the choice and adjusts strategy if necessary
reflection_result = agent.reflect_on_choice()
print(reflection_result)

# Step 3: The agent recommends again, this time using the adjusted strategy
adjusted_recommendation = agent.recommend_hotel(hotels, 'highest_quality')
print(f"Adjusted hotel recommendation (highest_quality): {adjusted_recommendation['name']}")
```  

#### एजेंट की मेटाकॉग्निशन क्षमताएँ  
मुख्य बात यह है कि एजेंट में:  
- अपने पिछले विकल्पों और निर्णय प्रक्रिया का मूल्यांकन करने की क्षमता हो।  
- उस चिंतन के आधार पर अपनी रणनीति समायोजित करे, यानी मेटाकॉग्निशन का क्रियान्वयन।  

यह मेटाकॉग्निशन का एक सरल रूप है जहाँ सिस्टम आंतरिक फीडबैक के आधार पर अपनी सोच प्रक्रिया को समायोजित करने में सक्षम होता है।  

### निष्कर्ष  
मेटाकॉग्निशन एक शक्तिशाली उपकरण है जो AI एजेंट की क्षमताओं को काफी बढ़ा सकता है। मेटाकॉग्निटिव तत्वों को शामिल करके...
प्रक्रियाओं के माध्यम से, आप ऐसे एजेंट डिजाइन कर सकते हैं जो अधिक बुद्धिमान, अनुकूलनीय और कुशल हों। अतिरिक्त संसाधनों का उपयोग करके एआई एजेंट्स में मेटाकॉग्निशन की आकर्षक दुनिया का और अधिक अन्वेषण करें।  
## पिछला पाठ  
[मल्टी-एजेंट डिजाइन पैटर्न](../08-multi-agent/README.md)  
## अगला पाठ  
[उत्पादन में एआई एजेंट्स](../10-ai-agents-production/README.md)

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।