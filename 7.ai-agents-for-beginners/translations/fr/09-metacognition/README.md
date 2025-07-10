<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8cbf460468c802c7994aa62e0e0779c9",
  "translation_date": "2025-05-20T07:52:54+00:00",
  "source_file": "09-metacognition/README.md",
  "language_code": "fr"
}
-->
[![Multi-Agent Design](../../../translated_images/lesson-9-thumbnail.8ce3844c60ee3125a381e225d70b4f7cde92ae1cc2b2ca5b83137e68e7c20885.fr.png)](https://youtu.be/His9R6gw6Ec?si=3_RMb8VprNvdLRhX)

> _(Cliquez sur l’image ci-dessus pour voir la vidéo de cette leçon)_
# Métacognition chez les agents IA  
## Introduction  
Bienvenue dans la leçon sur la métacognition chez les agents IA ! Ce chapitre est conçu pour les débutants curieux de comprendre comment les agents IA peuvent réfléchir à leurs propres processus de pensée. À la fin de cette leçon, vous comprendrez les concepts clés et disposerez d’exemples pratiques pour appliquer la métacognition dans la conception d’agents IA.  

## Objectifs d’apprentissage  
Après avoir terminé cette leçon, vous serez capable de :  
1. Comprendre les implications des boucles de raisonnement dans la définition des agents.  
2. Utiliser des techniques de planification et d’évaluation pour aider les agents à s’auto-corriger.  
3. Créer vos propres agents capables de manipuler du code pour accomplir des tâches.  

## Introduction à la métacognition  
La métacognition désigne les processus cognitifs de haut niveau qui consistent à penser à sa propre pensée. Pour les agents IA, cela signifie être capable d’évaluer et d’ajuster leurs actions en se basant sur la conscience de soi et les expériences passées. La métacognition, ou « penser à la pensée », est un concept important dans le développement des systèmes IA agentiques. Elle implique que les systèmes IA soient conscients de leurs propres processus internes et puissent surveiller, réguler et adapter leur comportement en conséquence. Un peu comme nous le faisons lorsque nous lisons l’ambiance d’une pièce ou analysons un problème. Cette conscience de soi peut aider les systèmes IA à prendre de meilleures décisions, à identifier des erreurs et à améliorer leurs performances au fil du temps — ce qui renvoie au test de Turing et au débat sur la prise de contrôle éventuelle par l’IA.  

Dans le contexte des systèmes IA agentiques, la métacognition peut aider à relever plusieurs défis, tels que :  
- Transparence : garantir que les systèmes IA peuvent expliquer leur raisonnement et leurs décisions.  
- Raisonnement : renforcer la capacité des systèmes IA à synthétiser l’information et à prendre des décisions judicieuses.  
- Adaptation : permettre aux systèmes IA de s’ajuster à de nouveaux environnements et à des conditions changeantes.  
- Perception : améliorer la précision des systèmes IA dans la reconnaissance et l’interprétation des données de leur environnement.  

### Qu’est-ce que la métacognition ?  
La métacognition, ou « penser à la pensée », est un processus cognitif de haut niveau qui implique la conscience de soi et l’autorégulation de ses propres processus cognitifs. Dans le domaine de l’IA, la métacognition permet aux agents d’évaluer et d’adapter leurs stratégies et actions, ce qui améliore leurs capacités à résoudre des problèmes et à prendre des décisions. En comprenant la métacognition, vous pouvez concevoir des agents IA non seulement plus intelligents, mais aussi plus adaptables et efficaces.  

Dans une véritable métacognition, on verrait l’IA raisonner explicitement sur son propre raisonnement. Exemple : « J’ai privilégié les vols moins chers parce que… Je pourrais passer à côté de vols directs, donc je vais revérifier. »  
Elle garde une trace de la manière dont elle a choisi un certain itinéraire.  
- Notant qu’elle a fait des erreurs parce qu’elle s’est trop appuyée sur les préférences utilisateur de la dernière fois, elle modifie donc sa stratégie de prise de décision et pas seulement la recommandation finale.  
- Diagnostiquant des schémas comme : « Chaque fois que je vois l’utilisateur mentionner ‘trop de monde’, je ne devrais pas seulement éliminer certaines attractions, mais aussi réfléchir au fait que ma méthode de sélection des ‘meilleures attractions’ est biaisée si je classe toujours par popularité. »  

### Importance de la métacognition chez les agents IA  
La métacognition joue un rôle crucial dans la conception des agents IA pour plusieurs raisons :  
![Importance of Metacognition](../../../translated_images/importance-of-metacognition.e351a5983bb745d60a1a60185391a39a6751d033c8c1948ceb6ad04eff7dbeac.fr.png)  
- Auto-réflexion : les agents peuvent évaluer leurs propres performances et identifier les points à améliorer.  
- Adaptabilité : les agents peuvent modifier leurs stratégies en fonction des expériences passées et des environnements changeants.  
- Correction d’erreurs : les agents peuvent détecter et corriger les erreurs de manière autonome, ce qui conduit à des résultats plus précis.  
- Gestion des ressources : les agents peuvent optimiser l’utilisation des ressources, comme le temps et la puissance de calcul, en planifiant et évaluant leurs actions.  

## Composants d’un agent IA  
Avant d’aborder les processus métacognitifs, il est essentiel de comprendre les composants de base d’un agent IA. Un agent IA se compose généralement de :  
- Persona : la personnalité et les caractéristiques de l’agent, qui définissent la manière dont il interagit avec les utilisateurs.  
- Outils : les capacités et fonctions que l’agent peut exécuter.  
- Compétences : les connaissances et expertises que l’agent possède.  

Ces composants travaillent ensemble pour créer une « unité d’expertise » capable d’accomplir des tâches spécifiques.  

**Exemple** : Prenez un agent de voyage, un service d’agent qui non seulement planifie vos vacances, mais ajuste également son parcours en fonction des données en temps réel et des expériences passées des clients.  

### Exemple : Métacognition dans un service d’agent de voyage  
Imaginez que vous conceviez un service d’agent de voyage alimenté par l’IA. Cet agent, « Travel Agent », aide les utilisateurs à planifier leurs vacances. Pour intégrer la métacognition, Travel Agent doit évaluer et ajuster ses actions en fonction de la conscience de soi et des expériences passées. Voici comment la métacognition pourrait intervenir :  

#### Tâche actuelle  
La tâche actuelle est d’aider un utilisateur à planifier un voyage à Paris.  

#### Étapes pour accomplir la tâche  
1. **Collecter les préférences de l’utilisateur** : demander à l’utilisateur ses dates de voyage, budget, centres d’intérêt (musées, cuisine, shopping, etc.) et exigences spécifiques.  
2. **Récupérer des informations** : rechercher des options de vols, hébergements, attractions et restaurants correspondant aux préférences de l’utilisateur.  
3. **Générer des recommandations** : fournir un itinéraire personnalisé avec détails sur les vols, réservations d’hôtel et activités suggérées.  
4. **Ajuster selon les retours** : demander un retour à l’utilisateur sur les recommandations et effectuer les ajustements nécessaires.  

#### Ressources requises  
- Accès aux bases de données de réservation de vols et d’hôtels.  
- Informations sur les attractions et restaurants parisiens.  
- Données de retour utilisateur issues des interactions précédentes.  

#### Expérience et auto-réflexion  
Travel Agent utilise la métacognition pour évaluer ses performances et apprendre de ses expériences passées. Par exemple :  
1. **Analyse des retours utilisateurs** : Travel Agent examine les retours pour déterminer quelles recommandations ont été bien accueillies et lesquelles ne l’ont pas été, puis ajuste ses suggestions futures en conséquence.  
2. **Adaptabilité** : si un utilisateur a précédemment exprimé une aversion pour les lieux bondés, Travel Agent évitera de recommander des sites touristiques populaires aux heures de pointe.  
3. **Correction d’erreurs** : si Travel Agent a commis une erreur lors d’une réservation précédente, comme suggérer un hôtel complet, il apprend à vérifier la disponibilité plus rigoureusement avant de faire des recommandations.  

#### Exemple pratique pour développeur  
Voici un exemple simplifié du code de Travel Agent intégrant la métacognition : ```python
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

#### Pourquoi la métacognition est importante  
- **Auto-réflexion** : les agents peuvent analyser leurs performances et identifier les points à améliorer.  
- **Adaptabilité** : les agents peuvent modifier leurs stratégies en fonction des retours et des conditions changeantes.  
- **Correction d’erreurs** : les agents peuvent détecter et corriger leurs erreurs de façon autonome.  
- **Gestion des ressources** : les agents peuvent optimiser l’utilisation des ressources, comme le temps et la puissance de calcul.  

En intégrant la métacognition, Travel Agent peut fournir des recommandations de voyage plus personnalisées et précises, améliorant ainsi l’expérience utilisateur globale.  

---  

## 2. Planification chez les agents  
La planification est un élément clé du comportement des agents IA. Elle consiste à définir les étapes nécessaires pour atteindre un objectif, en tenant compte de l’état actuel, des ressources et des obstacles possibles.  

### Éléments de la planification  
- **Tâche actuelle** : définir clairement la tâche.  
- **Étapes pour accomplir la tâche** : décomposer la tâche en étapes gérables.  
- **Ressources requises** : identifier les ressources nécessaires.  
- **Expérience** : utiliser les expériences passées pour guider la planification.  

**Exemple** : Voici les étapes que Travel Agent doit suivre pour aider efficacement un utilisateur à planifier son voyage :  

### Étapes pour Travel Agent  
1. **Collecter les préférences de l’utilisateur**  
- Demander à l’utilisateur des détails sur ses dates de voyage, budget, centres d’intérêt et exigences spécifiques.  
- Exemples : « Quand prévoyez-vous de voyager ? », « Quel est votre budget ? », « Quelles activités aimez-vous pendant vos vacances ? »  

2. **Récupérer des informations**  
- Rechercher des options de voyage pertinentes en fonction des préférences de l’utilisateur.  
- **Vols** : trouver des vols disponibles correspondant au budget et aux dates préférées.  
- **Hébergements** : trouver des hôtels ou locations qui correspondent aux préférences de localisation, prix et commodités.  
- **Attractions et restaurants** : identifier les attractions populaires, activités et restaurants en accord avec les centres d’intérêt de l’utilisateur.  

3. **Générer des recommandations**  
- Compiler les informations récupérées dans un itinéraire personnalisé.  
- Fournir des détails tels que les options de vol, réservations d’hôtel et activités suggérées, en adaptant les recommandations aux préférences de l’utilisateur.  

4. **Présenter l’itinéraire à l’utilisateur**  
- Partager l’itinéraire proposé pour que l’utilisateur puisse le consulter.  
- Exemple : « Voici un itinéraire suggéré pour votre voyage à Paris. Il comprend les détails des vols, les réservations d’hôtel et une liste d’activités et restaurants recommandés. Qu’en pensez-vous ? »  

5. **Collecter les retours**  
- Demander à l’utilisateur son avis sur l’itinéraire proposé.  
- Exemples : « Les options de vol vous conviennent-elles ? », « L’hôtel correspond-il à vos besoins ? », « Y a-t-il des activités que vous souhaitez ajouter ou retirer ? »  

6. **Ajuster selon les retours**  
- Modifier l’itinéraire en fonction des retours de l’utilisateur.  
- Effectuer les changements nécessaires sur les vols, hébergements et activités pour mieux correspondre aux préférences.  

7. **Confirmation finale**  
- Présenter l’itinéraire mis à jour pour confirmation finale.  
- Exemple : « J’ai fait les ajustements selon vos retours. Voici l’itinéraire actualisé. Tout vous convient-il ? »  

8. **Réserver et confirmer**  
- Une fois l’itinéraire approuvé, procéder à la réservation des vols, hébergements et activités planifiées.  
- Envoyer les détails de confirmation à l’utilisateur.  

9. **Assurer un support continu**  
- Rester disponible pour aider l’utilisateur en cas de changements ou demandes supplémentaires avant et pendant le voyage.  
- Exemple : « Si vous avez besoin d’aide supplémentaire durant votre voyage, n’hésitez pas à me contacter à tout moment ! »  

### Exemple d’interaction  
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

## 3. Système RAG correctif  
Commençons par comprendre la différence entre l’outil RAG et le chargement contextuel préventif  
![RAG vs Context Loading](../../../translated_images/rag-vs-context.9bb2b76d17aeba1489ad2a43ddbc9cd20e7ada4e4871cc99c63a498aa0ff70f7.fr.png)  

### Retrieval-Augmented Generation (RAG)  
RAG combine un système de récupération avec un modèle génératif. Lorsqu’une requête est faite, le système de récupération cherche des documents ou données pertinents dans une source externe, et ces informations récupérées sont utilisées pour enrichir l’entrée du modèle génératif. Cela aide le modèle à produire des réponses plus précises et contextuellement adaptées.  

Dans un système RAG, l’agent récupère des informations pertinentes à partir d’une base de connaissances et les utilise pour générer des réponses ou actions appropriées.  

### Approche RAG corrective  
L’approche RAG corrective se concentre sur l’utilisation des techniques RAG pour corriger les erreurs et améliorer la précision des agents IA. Cela implique :  
1. **Technique de prompt** : utiliser des instructions spécifiques pour guider l’agent dans la récupération des informations pertinentes.  
2. **Outil** : mettre en œuvre des algorithmes et mécanismes permettant à l’agent d’évaluer la pertinence des informations récupérées et de générer des réponses précises.  
3. **Évaluation** : évaluer continuellement les performances de l’agent et ajuster pour améliorer sa précision et son efficacité.  
####
Exemple : RAG correctif dans un agent de recherche  
Considérez un agent de recherche qui récupère des informations sur le web pour répondre aux requêtes des utilisateurs. L’approche RAG correctif pourrait impliquer :  
1. **Technique de prompt** : Formuler des requêtes de recherche basées sur l’entrée de l’utilisateur.  
2. **Outil** : Utiliser le traitement du langage naturel et des algorithmes d’apprentissage automatique pour classer et filtrer les résultats de recherche.  
3. **Évaluation** : Analyser les retours des utilisateurs pour identifier et corriger les inexactitudes dans les informations récupérées.  

### RAG correctif dans un agent de voyage  
Le RAG correctif (Retrieval-Augmented Generation) améliore la capacité d’une IA à récupérer et générer des informations tout en corrigeant les inexactitudes éventuelles. Voyons comment un agent de voyage peut utiliser l’approche RAG correctif pour fournir des recommandations de voyage plus précises et pertinentes.  
Cela implique :  
- **Technique de prompt :** Utiliser des invites spécifiques pour guider l’agent dans la récupération d’informations pertinentes.  
- **Outil :** Mettre en œuvre des algorithmes et mécanismes qui permettent à l’agent d’évaluer la pertinence des informations récupérées et de générer des réponses précises.  
- **Évaluation :** Évaluer en continu la performance de l’agent et ajuster pour améliorer sa précision et son efficacité.  

#### Étapes pour implémenter le RAG correctif dans un agent de voyage  
1. **Interaction initiale avec l’utilisateur**  
- L’agent de voyage recueille les préférences initiales de l’utilisateur, telles que la destination, les dates de voyage, le budget et les centres d’intérêt.  
- Exemple : ```python
     preferences = {
         "destination": "Paris",
         "dates": "2025-04-01 to 2025-04-10",
         "budget": "moderate",
         "interests": ["museums", "cuisine"]
     }
     ```  
2. **Récupération des informations**  
- L’agent de voyage récupère des informations sur les vols, hébergements, attractions et restaurants en fonction des préférences de l’utilisateur.  
- Exemple : ```python
     flights = search_flights(preferences)
     hotels = search_hotels(preferences)
     attractions = search_attractions(preferences)
     ```  
3. **Génération des recommandations initiales**  
- L’agent de voyage utilise les informations récupérées pour générer un itinéraire personnalisé.  
- Exemple : ```python
     itinerary = create_itinerary(flights, hotels, attractions)
     print("Suggested Itinerary:", itinerary)
     ```  
4. **Collecte des retours utilisateur**  
- L’agent de voyage demande à l’utilisateur son avis sur les recommandations initiales.  
- Exemple : ```python
     feedback = {
         "liked": ["Louvre Museum"],
         "disliked": ["Eiffel Tower (too crowded)"]
     }
     ```  
5. **Processus RAG correctif**  
- **Technique de prompt :** L’agent de voyage formule de nouvelles requêtes de recherche basées sur les retours utilisateur.  
- Exemple : ```python
       if "disliked" in feedback:
           preferences["avoid"] = feedback["disliked"]
       ```  
- **Outil :** L’agent utilise des algorithmes pour classer et filtrer les nouveaux résultats de recherche, en mettant l’accent sur la pertinence selon les retours utilisateur.  
- Exemple : ```python
       new_attractions = search_attractions(preferences)
       new_itinerary = create_itinerary(flights, hotels, new_attractions)
       print("Updated Itinerary:", new_itinerary)
       ```  
- **Évaluation :** L’agent évalue en continu la pertinence et la précision de ses recommandations en analysant les retours utilisateur et en effectuant les ajustements nécessaires.  
- Exemple : ```python
       def adjust_preferences(preferences, feedback):
           if "liked" in feedback:
               preferences["favorites"] = feedback["liked"]
           if "disliked" in feedback:
               preferences["avoid"] = feedback["disliked"]
           return preferences

       preferences = adjust_preferences(preferences, feedback)
       ```  

#### Exemple pratique  
Voici un exemple simplifié en Python incorporant l’approche RAG correctif dans un agent de voyage :  
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

### Chargement contextuel préventif  
Le chargement contextuel préventif consiste à charger un contexte ou des informations de fond pertinentes dans le modèle avant le traitement d’une requête. Cela signifie que le modèle a accès à ces informations dès le départ, ce qui peut l’aider à générer des réponses plus informées sans avoir besoin de récupérer des données supplémentaires durant le processus.  
Voici un exemple simplifié de ce à quoi pourrait ressembler un chargement contextuel préventif pour une application d’agent de voyage en Python :  
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

#### Explication  
1. **Initialisation (`__init__` method)**: The `TravelAgent` class pre-loads a dictionary containing information about popular destinations such as Paris, Tokyo, New York, and Sydney. This dictionary includes details like the country, currency, language, and major attractions for each destination.

2. **Retrieving Information (`get_destination_info` method)**: When a user queries about a specific destination, the `get_destination_info`)** : cette méthode récupère les informations pertinentes depuis le dictionnaire de contexte préchargé. En préchargeant le contexte, l’application agent de voyage peut répondre rapidement aux requêtes utilisateur sans devoir récupérer ces informations depuis une source externe en temps réel. Cela rend l’application plus efficace et réactive.  

### Bootstrap du plan avec un objectif avant itération  
Le bootstrap d’un plan avec un objectif consiste à commencer avec un but clair ou un résultat cible en tête. En définissant cet objectif dès le départ, le modèle peut l’utiliser comme principe directeur tout au long du processus itératif. Cela aide à garantir que chaque itération rapproche l’objectif souhaité, rendant le processus plus efficace et ciblé.  
Voici un exemple de la manière dont vous pourriez bootstrapper un plan de voyage avec un objectif avant d’itérer pour un agent de voyage en Python :  

### Scénario  
Un agent de voyage veut planifier des vacances personnalisées pour un client. L’objectif est de créer un itinéraire de voyage qui maximise la satisfaction du client en fonction de ses préférences et de son budget.  

### Étapes  
1. Définir les préférences et le budget du client.  
2. Bootstrapper le plan initial basé sur ces préférences.  
3. Itérer pour affiner le plan, en optimisant la satisfaction du client.  

#### Code Python  
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

#### Explication du code  
1. **Initialisation (`__init__` method)**: The `TravelAgent` class is initialized with a list of potential destinations, each having attributes like name, cost, and activity type.

2. **Bootstrapping the Plan (`bootstrap_plan` method)**: This method creates an initial travel plan based on the client's preferences and budget. It iterates through the list of destinations and adds them to the plan if they match the client's preferences and fit within the budget.

3. **Matching Preferences (`match_preferences` method)**: This method checks if a destination matches the client's preferences.

4. **Iterating the Plan (`iterate_plan` method)**: This method refines the initial plan by trying to replace each destination in the plan with a better match, considering the client's preferences and budget constraints.

5. **Calculating Cost (`calculate_cost`)** : cette méthode calcule le coût total du plan actuel, incluant une nouvelle destination potentielle.  

#### Exemple d’utilisation  
- **Plan initial** : l’agent de voyage crée un plan initial basé sur les préférences du client pour les visites touristiques et un budget de 2000 $.  
- **Plan affiné** : l’agent de voyage itère le plan, optimisant pour les préférences et le budget du client.  
En bootstrapant le plan avec un objectif clair (par exemple, maximiser la satisfaction du client) et en itérant pour affiner le plan, l’agent de voyage peut créer un itinéraire personnalisé et optimisé pour le client. Cette approche garantit que le plan de voyage est aligné avec les préférences et le budget du client dès le départ et s’améliore à chaque itération.  

### Tirer parti des LLM pour le re-classement et le scoring  
Les grands modèles de langage (LLM) peuvent être utilisés pour le re-classement et le scoring en évaluant la pertinence et la qualité des documents récupérés ou des réponses générées. Voici comment cela fonctionne :  
**Récupération :** l’étape initiale récupère un ensemble de documents ou réponses candidats basés sur la requête.  
**Re-classement :** le LLM évalue ces candidats et les re-classe en fonction de leur pertinence et qualité. Cette étape garantit que les informations les plus pertinentes et de haute qualité sont présentées en premier.  
**Scoring :** le LLM attribue des scores à chaque candidat, reflétant leur pertinence et qualité. Cela aide à sélectionner la meilleure réponse ou document pour l’utilisateur.  
En exploitant les LLM pour le re-classement et le scoring, le système peut fournir des informations plus précises et contextuellement pertinentes, améliorant l’expérience utilisateur globale.  
Voici un exemple de la manière dont un agent de voyage pourrait utiliser un LLM pour re-classer et scorer des destinations de voyage selon les préférences utilisateur en Python :  

#### Scénario - Voyage basé sur les préférences  
Un agent de voyage souhaite recommander les meilleures destinations de voyage à un client selon ses préférences. Le LLM aidera à re-classer et scorer les destinations pour garantir que les options les plus pertinentes sont présentées.  

#### Étapes :  
1. Collecter les préférences utilisateur.  
2. Récupérer une liste de destinations potentielles.  
3. Utiliser le LLM pour re-classer et scorer les destinations selon les préférences utilisateur.  
Voici comment vous pouvez mettre à jour l’exemple précédent pour utiliser les services Azure OpenAI :  

#### Prérequis  
1. Vous devez disposer d’un abonnement Azure.  
2. Créez une ressource Azure OpenAI et obtenez votre clé API.  

#### Exemple de code Python  
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

#### Explication du code - Gestionnaire de préférences  
1. **Initialisation** : le `TravelAgent` class is initialized with a list of potential travel destinations, each having attributes like name and description.

2. **Getting Recommendations (`get_recommendations` method)**: This method generates a prompt for the Azure OpenAI service based on the user's preferences and makes an HTTP POST request to the Azure OpenAI API to get re-ranked and scored destinations.

3. **Generating Prompt (`generate_prompt` method)**: This method constructs a prompt for the Azure OpenAI, including the user's preferences and the list of destinations. The prompt guides the model to re-rank and score the destinations based on the provided preferences.

4. **API Call**: The `requests` library is used to make an HTTP POST request to the Azure OpenAI API endpoint. The response contains the re-ranked and scored destinations.

5. **Example Usage**: The travel agent collects user preferences (e.g., interest in sightseeing and diverse culture) and uses the Azure OpenAI service to get re-ranked and scored recommendations for travel destinations.

Make sure to replace `your_azure_openai_api_key` with your actual Azure OpenAI API key and `https://your-endpoint.com/...` avec l’URL réelle du point de terminaison de votre déploiement Azure OpenAI.  
En exploitant le LLM pour le re-classement et le scoring, l’agent de voyage peut fournir des recommandations de voyage plus personnalisées et pertinentes aux clients, améliorant ainsi leur expérience globale.  

### RAG : Technique de prompt vs Outil  
Le Retrieval-Augmented Generation (RAG) peut être à la fois une technique de prompt et un outil dans le développement d’agents IA. Comprendre la distinction entre les deux peut vous aider à exploiter le RAG plus efficacement dans vos projets.  

#### RAG en tant que technique de prompt  
**Qu’est-ce que c’est ?**  
- En tant que technique de prompt, le RAG consiste à formuler des requêtes ou prompts spécifiques pour guider la récupération d’informations pertinentes à partir d’un large corpus ou base de données. Ces informations sont ensuite utilisées pour générer des réponses ou actions.  
**Comment ça marche :**  
1. **Formuler les prompts** : créer des prompts ou requêtes bien structurés basés sur la tâche ou l’entrée utilisateur.  
2. **Récupérer l’information** : utiliser les prompts pour rechercher des données pertinentes dans une base de connaissances ou dataset préexistant.  
3. **Générer la réponse** : combiner les informations récupérées avec des modèles d’IA générative pour produire une réponse complète et cohérente.  
**Exemple dans un agent de voyage** :  
- Entrée utilisateur : « Je veux visiter des musées à Paris. »  
- Prompt : « Trouve les meilleurs musées à Paris. »  
- Informations récupérées : détails sur le Louvre, Musée d’Orsay, etc.  
- Réponse générée : « Voici quelques musées incontournables à Paris : le Louvre, le Musée d’Orsay et le Centre Pompidou. »  

#### RAG en tant qu’outil  
**Qu’est-ce que c’est ?**  
- En tant qu’outil, le RAG est un système intégré qui automatise le processus de récupération et génération, facilitant ainsi l’implémentation de fonctionnalités IA complexes sans avoir à créer manuellement des prompts pour chaque requête.  
**Comment ça marche :**  
1. **Intégration** : intégrer le RAG dans l’architecture de l’agent IA, lui permettant de gérer automatiquement les tâches de récupération et génération.  
2. **Automatisation** : l’outil gère tout le processus, depuis la réception de l’entrée utilisateur jusqu’à la génération de la réponse finale, sans nécessiter de prompts explicites à chaque étape.  
3. **Efficacité** : améliore la performance de l’agent en rationalisant le processus de récupération et génération, permettant des réponses plus rapides et précises.  
**Exemple dans un agent de voyage** :  
- Entrée utilisateur : « Je veux visiter des musées à Paris. »  
- Outil RAG : récupère automatiquement les informations sur les musées et génère une réponse.  
- Réponse générée : « Voici quelques musées incontournables à Paris : le Louvre, le Musée d’Orsay et le Centre Pompidou. »  

### Comparaison  

| Aspect                 | Technique de prompt                                        | Outil                                             |  
|------------------------|-----------------------------------------------------------|--------------------------------------------------|  
| **Manuel vs Automatique** | Formulation manuelle des prompts pour chaque requête.     | Processus automatisé pour récupération et génération. |  
| **Contrôle**             | Offre plus de contrôle sur le processus de récupération.  | Rationalise et automatise la récupération et génération. |  
| **Flexibilité**          | Permet des prompts personnalisés selon les besoins.       | Plus efficace pour des implémentations à grande échelle. |  
| **Complexité**           | Nécessite la création et l’ajustement des prompts.        | Plus facile à intégrer dans l’architecture d’un agent IA. |  

### Exemples pratiques  
**Exemple de technique de prompt :** ```python
def search_museums_in_paris():
    prompt = "Find top museums in Paris"
    search_results = search_web(prompt)
    return search_results

museums = search_museums_in_paris()
print("Top Museums in Paris:", museums)
```  
**Exemple d’outil :** ```python
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

### Évaluation de la pertinence  
L’évaluation de la pertinence est un aspect crucial de la performance d’un agent IA. Elle garantit que les informations récupérées et générées par l’agent sont appropriées, exactes et utiles pour l’utilisateur. Explorons comment évaluer la pertinence dans les agents IA, avec des exemples pratiques et techniques.  

#### Concepts clés dans l’évaluation de la pertinence  
1. **Conscience du contexte** :  
- L’agent doit comprendre le contexte de la requête utilisateur pour récupérer et générer des informations pertinentes.  
- Exemple : si un utilisateur demande « meilleurs restaurants à Paris », l’agent doit prendre en compte les préférences de l’utilisateur, comme le type de cuisine et le budget.  
2. **Exactitude** :  
- Les informations fournies par l’agent doivent être factuellement correctes et à jour.  
- Exemple : recommander des restaurants actuellement ouverts avec de bonnes critiques plutôt que des options obsolètes ou fermées.  
3. **Intention de l’utilisateur** :  
-
L'agent doit déduire l'intention de l'utilisateur derrière la requête afin de fournir l'information la plus pertinente. - Exemple : Si un utilisateur demande des « hôtels économiques », l'agent doit prioriser les options abordables.  
4. **Boucle de rétroaction** :  
- Collecter et analyser continuellement les retours des utilisateurs aide l'agent à affiner son processus d'évaluation de la pertinence.  
- Exemple : Intégrer les notes et retours des utilisateurs sur les recommandations précédentes pour améliorer les réponses futures.  

#### Techniques pratiques pour évaluer la pertinence  
1. **Notation de la pertinence** :  
- Attribuer un score de pertinence à chaque élément récupéré en fonction de sa correspondance avec la requête et les préférences de l'utilisateur.  
- Exemple : ```python
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
2. **Filtrage et classement** :  
- Écarter les éléments non pertinents et classer les restants selon leurs scores de pertinence.  
- Exemple : ```python
     def filter_and_rank(items, query):
         ranked_items = sorted(items, key=lambda item: relevance_score(item, query), reverse=True)
         return ranked_items[:10]  # Return top 10 relevant items
     ```  
3. **Traitement du langage naturel (NLP)** :  
- Utiliser des techniques de NLP pour comprendre la requête de l'utilisateur et récupérer des informations pertinentes.  
- Exemple : ```python
     def process_query(query):
         # Use NLP to extract key information from the user's query
         processed_query = nlp(query)
         return processed_query
     ```  
4. **Intégration des retours utilisateurs** :  
- Collecter les retours des utilisateurs sur les recommandations fournies et les utiliser pour ajuster les évaluations de pertinence futures.  
- Exemple : ```python
     def adjust_based_on_feedback(feedback, items):
         for item in items:
             if item['name'] in feedback['liked']:
                 item['relevance'] += 1
             if item['name'] in feedback['disliked']:
                 item['relevance'] -= 1
         return items
     ```  

#### Exemple : Évaluation de la pertinence dans Travel Agent  
Voici un exemple pratique de la façon dont Travel Agent peut évaluer la pertinence des recommandations de voyage : ```python
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

### Recherche avec intention  
La recherche avec intention consiste à comprendre et interpréter le but ou l'objectif sous-jacent d'une requête utilisateur afin de récupérer et générer les informations les plus pertinentes et utiles. Cette approche dépasse la simple correspondance de mots-clés et se concentre sur la compréhension des besoins réels et du contexte de l'utilisateur.  

#### Concepts clés de la recherche avec intention  
1. **Compréhension de l'intention de l'utilisateur** :  
- L'intention de l'utilisateur peut être classée en trois types principaux : informationnelle, navigationnelle et transactionnelle.  
- **Intention informationnelle** : L'utilisateur cherche des informations sur un sujet (ex. : « Quels sont les meilleurs musées à Paris ? »).  
- **Intention navigationnelle** : L'utilisateur souhaite accéder à un site web ou une page spécifique (ex. : « Site officiel du musée du Louvre »).  
- **Intention transactionnelle** : L'utilisateur veut effectuer une transaction, comme réserver un vol ou faire un achat (ex. : « Réserver un vol pour Paris »).  
2. **Conscience du contexte** :  
- Analyser le contexte de la requête de l'utilisateur aide à identifier précisément son intention. Cela inclut la prise en compte des interactions précédentes, des préférences utilisateur et des détails spécifiques de la requête actuelle.  
3. **Traitement du langage naturel (NLP)** :  
- Les techniques de NLP sont utilisées pour comprendre et interpréter les requêtes en langage naturel fournies par les utilisateurs. Cela inclut des tâches comme la reconnaissance d'entités, l'analyse de sentiment et le parsing de requêtes.  
4. **Personnalisation** :  
- Personnaliser les résultats de recherche en fonction de l'historique, des préférences et des retours de l'utilisateur améliore la pertinence des informations récupérées.  

#### Exemple pratique : Recherche avec intention dans Travel Agent  
Prenons Travel Agent comme exemple pour voir comment la recherche avec intention peut être mise en œuvre.  
1. **Collecte des préférences utilisateur** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **Compréhension de l'intention utilisateur** ```python
   def identify_intent(query):
       if "book" in query or "purchase" in query:
           return "transactional"
       elif "website" in query or "official" in query:
           return "navigational"
       else:
           return "informational"
   ```  
3. **Conscience du contexte** ```python
   def analyze_context(query, user_history):
       # Combine current query with user history to understand context
       context = {
           "current_query": query,
           "user_history": user_history
       }
       return context
   ```  
4. **Recherche et personnalisation des résultats** ```python
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
5. **Exemple d'utilisation** ```python
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

## 4. Génération de code en tant qu'outil  
Les agents générateurs de code utilisent des modèles d'IA pour écrire et exécuter du code, résoudre des problèmes complexes et automatiser des tâches.  

### Agents générateurs de code  
Les agents générateurs de code utilisent des modèles d'IA génératifs pour écrire et exécuter du code. Ces agents peuvent résoudre des problèmes complexes, automatiser des tâches et fournir des insights précieux en générant et exécutant du code dans divers langages de programmation.  

#### Applications pratiques  
1. **Génération automatique de code** : Générer des extraits de code pour des tâches spécifiques, telles que l'analyse de données, le web scraping ou le machine learning.  
2. **SQL comme RAG** : Utiliser des requêtes SQL pour récupérer et manipuler des données dans des bases de données.  
3. **Résolution de problèmes** : Créer et exécuter du code pour résoudre des problèmes spécifiques, comme optimiser des algorithmes ou analyser des données.  

#### Exemple : Agent générateur de code pour l'analyse de données  
Imaginez que vous conceviez un agent générateur de code. Voici comment il pourrait fonctionner :  
1. **Tâche** : Analyser un jeu de données pour identifier des tendances et des motifs.  
2. **Étapes** :  
- Charger le jeu de données dans un outil d'analyse de données.  
- Générer des requêtes SQL pour filtrer et agréger les données.  
- Exécuter les requêtes et récupérer les résultats.  
- Utiliser les résultats pour générer des visualisations et des insights.  
3. **Ressources requises** : Accès au jeu de données, outils d'analyse de données et capacités SQL.  
4. **Expérience** : Utiliser les résultats d'analyses passées pour améliorer la précision et la pertinence des analyses futures.  

### Exemple : Agent générateur de code pour Travel Agent  
Dans cet exemple, nous allons concevoir un agent générateur de code, Travel Agent, pour aider les utilisateurs à planifier leur voyage en générant et exécutant du code. Cet agent peut gérer des tâches telles que récupérer des options de voyage, filtrer les résultats et compiler un itinéraire en utilisant l'IA générative.  

#### Vue d'ensemble de l'agent générateur de code  
1. **Collecte des préférences utilisateur** : Recueille les informations de l'utilisateur telles que la destination, les dates de voyage, le budget et les centres d'intérêt.  
2. **Génération de code pour récupérer les données** : Génère des extraits de code pour récupérer des données sur les vols, hôtels et attractions.  
3. **Exécution du code généré** : Exécute le code généré pour obtenir des informations en temps réel.  
4. **Génération de l'itinéraire** : Compile les données récupérées en un plan de voyage personnalisé.  
5. **Ajustement basé sur les retours** : Reçoit les retours des utilisateurs et régénère le code si nécessaire pour affiner les résultats.  

#### Implémentation étape par étape  
1. **Collecte des préférences utilisateur** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **Génération de code pour récupérer les données** ```python
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
3. **Exécution du code généré** ```python
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
4. **Génération de l'itinéraire** ```python
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
5. **Ajustement basé sur les retours** ```python
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

### Exploiter la conscience environnementale et le raisonnement  
S'appuyer sur le schéma de la table peut effectivement améliorer le processus de génération de requêtes en exploitant la conscience environnementale et le raisonnement. Voici un exemple de comment cela peut être fait :  
1. **Compréhension du schéma** : Le système comprend le schéma de la table et utilise cette information pour ancrer la génération de requêtes.  
2. **Ajustement basé sur les retours** : Le système ajuste les préférences utilisateur en fonction des retours et raisonne sur les champs du schéma qui doivent être mis à jour.  
3. **Génération et exécution des requêtes** : Le système génère et exécute des requêtes pour récupérer des données de vol et d'hôtel mises à jour selon les nouvelles préférences.  

Voici un exemple de code Python mis à jour qui intègre ces concepts : ```python
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

#### Explication - Réservation basée sur les retours  
1. **Conscience du schéma** : La méthode `schema` dictionary defines how preferences should be adjusted based on feedback. It includes fields like `favorites` and `avoid`, with corresponding adjustments.
2. **Adjusting Preferences (`adjust_based_on_feedback` method)**: This method adjusts preferences based on user feedback and the schema.
3. **Environment-Based Adjustments (`adjust_based_on_environment` personnalise les ajustements selon le schéma et les retours.  
4. **Génération et exécution des requêtes** : Le système génère du code pour récupérer des données mises à jour sur les vols et hôtels en fonction des préférences ajustées et simule l'exécution de ces requêtes.  
5. **Génération de l'itinéraire** : Le système crée un itinéraire mis à jour basé sur les nouvelles données de vols, hôtels et attractions.  

En rendant le système conscient de l'environnement et en raisonnant à partir du schéma, il peut générer des requêtes plus précises et pertinentes, conduisant à de meilleures recommandations de voyage et une expérience utilisateur plus personnalisée.  

### Utilisation de SQL comme technique de génération augmentée par récupération (RAG)  
SQL (Structured Query Language) est un outil puissant pour interagir avec les bases de données. Lorsqu'il est utilisé dans le cadre d'une approche Retrieval-Augmented Generation (RAG), SQL peut récupérer des données pertinentes dans les bases pour informer et générer des réponses ou actions dans les agents IA. Explorons comment SQL peut être utilisé comme technique RAG dans le contexte de Travel Agent.  

#### Concepts clés  
1. **Interaction avec la base de données** :  
- SQL est utilisé pour interroger les bases, récupérer des informations pertinentes et manipuler les données.  
- Exemple : Récupération des détails de vol, informations d'hôtel et attractions depuis une base de données de voyage.  
2. **Intégration avec RAG** :  
- Les requêtes SQL sont générées en fonction des entrées et préférences utilisateur.  
- Les données récupérées sont ensuite utilisées pour générer des recommandations ou actions personnalisées.  
3. **Génération dynamique de requêtes** :  
- L'agent IA génère des requêtes SQL dynamiques selon le contexte et les besoins de l'utilisateur.  
- Exemple : Personnalisation des requêtes SQL pour filtrer les résultats selon le budget, les dates et les intérêts.  

#### Applications  
- **Génération automatique de code** : Générer des extraits de code pour des tâches spécifiques.  
- **SQL comme RAG** : Utiliser des requêtes SQL pour manipuler des données.  
- **Résolution de problèmes** : Créer et exécuter du code pour résoudre des problèmes.  

**Exemple** : Un agent d'analyse de données :  
1. **Tâche** : Analyser un jeu de données pour trouver des tendances.  
2. **Étapes** :  
- Charger le jeu de données.  
- Générer des requêtes SQL pour filtrer les données.  
- Exécuter les requêtes et récupérer les résultats.  
- Générer des visualisations et insights.  
3. **Ressources** : Accès au jeu de données, capacités SQL.  
4. **Expérience** : Utiliser les résultats passés pour améliorer les analyses futures.  

#### Exemple pratique : Utilisation de SQL dans Travel Agent  
1. **Collecte des préférences utilisateur** ```python
   class Travel_Agent:
       def __init__(self):
           self.user_preferences = {}

       def gather_preferences(self, preferences):
           self.user_preferences = preferences
   ```  
2. **Génération des requêtes SQL** ```python
   def generate_sql_query(table, preferences):
       query = f"SELECT * FROM {table} WHERE "
       conditions = []
       for key, value in preferences.items():
           conditions.append(f"{key}='{value}'")
       query += " AND ".join(conditions)
       return query
   ```  
3. **Exécution des requêtes SQL** ```python
   import sqlite3

   def execute_sql_query(query, database="travel.db"):
       connection = sqlite3.connect(database)
       cursor = connection.cursor()
       cursor.execute(query)
       results = cursor.fetchall()
       connection.close()
       return results
   ```  
4. **Génération des recommandations** ```python
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

#### Exemples de requêtes SQL  
1. **Requête vol** ```sql
   SELECT * FROM flights WHERE destination='Paris' AND dates='2025-04-01 to 2025-04-10' AND budget='moderate';
   ```  
2. **Requête hôtel** ```sql
   SELECT * FROM hotels WHERE destination='Paris' AND budget='moderate';
   ```  
3. **Requête attraction** ```sql
   SELECT * FROM attractions WHERE destination='Paris' AND interests='museums, cuisine';
   ```  

En exploitant SQL dans le cadre de la technique Retrieval-Augmented Generation (RAG), des agents IA comme Travel Agent peuvent récupérer et utiliser dynamiquement des données pertinentes pour fournir des recommandations précises et personnalisées.  

### Exemple de métacognition  
Pour démontrer une implémentation de métacognition, créons un agent simple qui *réfléchit à son processus de prise de décision* tout en résolvant un problème. Pour cet exemple, nous construirons un système où un agent tente d’optimiser le choix d’un hôtel, puis évalue son propre raisonnement et ajuste sa stratégie lorsqu’il fait des erreurs ou des choix sous-optimaux.  

Nous simulerons cela avec un exemple basique où l’agent sélectionne les hôtels en fonction d’une combinaison prix et qualité, mais il va « réfléchir » à ses décisions et ajuster en conséquence.  

#### Comment cela illustre la métacognition :  
1. **Décision initiale** : L’agent choisira l’hôtel le moins cher, sans comprendre l’impact de la qualité.  
2. **Réflexion et évaluation** : Après le choix initial, l’agent vérifie si l’hôtel est un mauvais choix via les retours utilisateurs. S’il constate que la qualité de l’hôtel était trop basse, il réfléchit à son raisonnement.  
3. **Ajustement de la stratégie** : L’agent ajuste sa stratégie suite à cette réflexion, passant de « moins cher » à « meilleure qualité », améliorant ainsi son processus décisionnel pour les itérations futures.  

Voici un exemple : ```python
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

#### Capacités métacognitives de l’agent  
L’essentiel ici est la capacité de l’agent à :  
- Évaluer ses choix et son processus décisionnel précédents.  
- Ajuster sa stratégie basée sur cette réflexion, c’est-à-dire la métacognition en action.  

C’est une forme simple de métacognition où le système est capable d’ajuster son raisonnement en fonction de retours internes.  

### Conclusion  
La métacognition est un outil puissant qui peut significativement améliorer les capacités des agents IA. En incorporant la métacognition...
processus, vous pouvez concevoir des agents plus intelligents, adaptables et efficaces. Utilisez les ressources supplémentaires pour explorer davantage le monde fascinant de la métacognition chez les agents IA. ## Leçon précédente [Modèle de conception multi-agent](../08-multi-agent/README.md) ## Leçon suivante [Agents IA en production](../10-ai-agents-production/README.md)

**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.