<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T07:49:10+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "fr"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.fr.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(Cliquez sur l’image ci-dessus pour voir la vidéo de cette leçon)_

# Agentic RAG

Cette leçon offre un aperçu complet de l’Agentic Retrieval-Augmented Generation (Agentic RAG), un paradigme émergent en IA où les grands modèles de langage (LLM) planifient de manière autonome leurs prochaines étapes tout en extrayant des informations de sources externes. Contrairement aux schémas statiques de type récupération puis lecture, Agentic RAG implique des appels itératifs au LLM, entrecoupés d’appels à des outils ou fonctions et de sorties structurées. Le système évalue les résultats, affine les requêtes, fait appel à des outils supplémentaires si nécessaire, et poursuit ce cycle jusqu’à obtenir une solution satisfaisante.

## Introduction

Cette leçon abordera :

- **Comprendre Agentic RAG :** Découvrir ce paradigme émergent en IA où les grands modèles de langage (LLM) planifient de manière autonome leurs prochaines étapes tout en extrayant des informations de sources de données externes.
- **Appréhender le style itératif Maker-Checker :** Comprendre la boucle d’appels itératifs au LLM, entrecoupés d’appels à des outils ou fonctions et de sorties structurées, conçue pour améliorer la précision et gérer les requêtes mal formées.
- **Explorer les applications pratiques :** Identifier les scénarios où Agentic RAG excelle, comme les environnements axés sur la précision, les interactions complexes avec des bases de données, et les flux de travail étendus.

## Objectifs d’apprentissage

À l’issue de cette leçon, vous saurez / comprendrez :

- **Compréhension d’Agentic RAG :** Découvrir ce paradigme émergent en IA où les grands modèles de langage (LLM) planifient de manière autonome leurs prochaines étapes tout en extrayant des informations de sources de données externes.
- **Style itératif Maker-Checker :** Assimiler le concept d’une boucle d’appels itératifs au LLM, entrecoupés d’appels à des outils ou fonctions et de sorties structurées, conçue pour améliorer la précision et gérer les requêtes mal formées.
- **Maîtriser le processus de raisonnement :** Comprendre la capacité du système à s’approprier son processus de raisonnement, en décidant comment aborder les problèmes sans dépendre de chemins prédéfinis.
- **Flux de travail :** Comprendre comment un modèle agentic décide de manière autonome de récupérer des rapports sur les tendances du marché, d’identifier les données des concurrents, de corréler les métriques internes de ventes, de synthétiser les résultats et d’évaluer la stratégie.
- **Boucles itératives, intégration d’outils et mémoire :** Apprendre comment le système s’appuie sur un schéma d’interaction en boucle, en maintenant l’état et la mémoire au fil des étapes pour éviter les répétitions et prendre des décisions éclairées.
- **Gestion des modes de défaillance et autocorrection :** Explorer les mécanismes robustes d’autocorrection du système, incluant l’itération et la nouvelle interrogation, l’utilisation d’outils de diagnostic, et le recours à la supervision humaine.
- **Limites de l’autonomie :** Comprendre les limites d’Agentic RAG, notamment l’autonomie spécifique au domaine, la dépendance à l’infrastructure, et le respect des garde-fous.
- **Cas d’usage pratiques et valeur ajoutée :** Identifier les scénarios où Agentic RAG est particulièrement efficace, comme les environnements centrés sur la précision, les interactions complexes avec des bases de données, et les flux de travail prolongés.
- **Gouvernance, transparence et confiance :** Comprendre l’importance de la gouvernance et de la transparence, incluant un raisonnement explicable, le contrôle des biais, et la supervision humaine.

## Qu’est-ce que Agentic RAG ?

Agentic Retrieval-Augmented Generation (Agentic RAG) est un paradigme émergent en IA où les grands modèles de langage (LLM) planifient de manière autonome leurs prochaines étapes tout en extrayant des informations de sources externes. Contrairement aux schémas statiques de type récupération puis lecture, Agentic RAG implique des appels itératifs au LLM, entrecoupés d’appels à des outils ou fonctions et de sorties structurées. Le système évalue les résultats, affine les requêtes, fait appel à des outils supplémentaires si nécessaire, et poursuit ce cycle jusqu’à obtenir une solution satisfaisante. Ce style itératif « maker-checker » améliore la précision, gère les requêtes mal formées et garantit des résultats de haute qualité.

Le système s’approprie activement son processus de raisonnement, réécrivant les requêtes échouées, choisissant différentes méthodes de récupération, et intégrant plusieurs outils — tels que la recherche vectorielle dans Azure AI Search, les bases de données SQL, ou des API personnalisées — avant de finaliser sa réponse. La qualité distinctive d’un système agentic est sa capacité à s’approprier son processus de raisonnement. Les implémentations RAG traditionnelles reposent sur des chemins prédéfinis, alors qu’un système agentic détermine de manière autonome la séquence des étapes selon la qualité des informations trouvées.

## Définition de Agentic Retrieval-Augmented Generation (Agentic RAG)

Agentic Retrieval-Augmented Generation (Agentic RAG) est un paradigme émergent dans le développement de l’IA où les LLM non seulement extraient des informations de sources de données externes, mais planifient aussi de manière autonome leurs prochaines étapes. Contrairement aux schémas statiques de récupération puis lecture ou aux séquences de prompt soigneusement scriptées, Agentic RAG implique une boucle d’appels itératifs au LLM, entrecoupés d’appels à des outils ou fonctions et de sorties structurées. À chaque étape, le système évalue les résultats obtenus, décide s’il doit affiner ses requêtes, invoque des outils supplémentaires si besoin, et poursuit ce cycle jusqu’à obtenir une solution satisfaisante.

Ce style itératif « maker-checker » est conçu pour améliorer la précision, gérer les requêtes mal formées vers des bases de données structurées (ex. NL2SQL), et garantir des résultats équilibrés et de haute qualité. Plutôt que de s’appuyer uniquement sur des chaînes de prompt soigneusement élaborées, le système s’approprie activement son processus de raisonnement. Il peut réécrire les requêtes échouées, choisir différentes méthodes de récupération, et intégrer plusieurs outils — comme la recherche vectorielle dans Azure AI Search, des bases de données SQL, ou des API personnalisées — avant de finaliser sa réponse. Cela élimine le besoin de cadres d’orchestration trop complexes. À la place, une boucle relativement simple « appel LLM → utilisation d’outil → appel LLM → … » peut produire des sorties sophistiquées et bien fondées.

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.fr.png)

## S’approprier le processus de raisonnement

La qualité distinctive qui rend un système « agentic » est sa capacité à s’approprier son processus de raisonnement. Les implémentations traditionnelles de RAG dépendent souvent d’un chemin prédéfini par des humains : une chaîne de pensée qui décrit ce qu’il faut récupérer et quand.  
Mais lorsqu’un système est véritablement agentic, il décide en interne comment aborder le problème. Il n’exécute pas simplement un script ; il détermine de manière autonome la séquence des étapes selon la qualité des informations qu’il trouve.  
Par exemple, s’il doit créer une stratégie de lancement de produit, il ne se contente pas d’un prompt qui décrit tout le workflow de recherche et de prise de décision. Au lieu de cela, le modèle agentic décide de manière autonome de :

1. Récupérer des rapports actuels sur les tendances du marché en utilisant Bing Web Grounding  
2. Identifier les données pertinentes des concurrents via Azure AI Search  
3. Corréler les métriques historiques internes de ventes avec Azure SQL Database  
4. Synthétiser les résultats en une stratégie cohérente orchestrée via Azure OpenAI Service  
5. Évaluer la stratégie pour détecter des lacunes ou incohérences, en lançant une nouvelle phase de récupération si nécessaire  

Toutes ces étapes — affiner les requêtes, choisir les sources, itérer jusqu’à être « satisfait » de la réponse — sont décidées par le modèle, et non pré-scriptées par un humain.

## Boucles itératives, intégration d’outils et mémoire

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.fr.png)

Un système agentic repose sur un schéma d’interaction en boucle :

- **Appel initial :** L’objectif de l’utilisateur (alias prompt utilisateur) est présenté au LLM.  
- **Invocation d’outil :** Si le modèle détecte des informations manquantes ou des instructions ambiguës, il sélectionne un outil ou une méthode de récupération — comme une requête dans une base de données vectorielle (ex. recherche hybride Azure AI Search sur des données privées) ou un appel SQL structuré — pour obtenir plus de contexte.  
- **Évaluation et affinement :** Après examen des données retournées, le modèle décide si l’information est suffisante. Sinon, il affine la requête, teste un autre outil, ou ajuste sa méthode.  
- **Répéter jusqu’à satisfaction :** Ce cycle se poursuit jusqu’à ce que le modèle estime disposer d’assez de clarté et de preuves pour fournir une réponse finale bien argumentée.  
- **Mémoire et état :** Parce que le système conserve l’état et la mémoire entre les étapes, il peut se souvenir des tentatives précédentes et de leurs résultats, évitant les boucles répétitives et prenant des décisions plus éclairées au fil du processus.

Au fil du temps, cela crée une compréhension évolutive, permettant au modèle de gérer des tâches complexes en plusieurs étapes sans qu’un humain ait à intervenir constamment ou à reformuler le prompt.

## Gestion des modes de défaillance et autocorrection

L’autonomie d’Agentic RAG comprend aussi des mécanismes robustes d’autocorrection. Lorsqu’il rencontre des impasses — comme récupérer des documents non pertinents ou faire face à des requêtes mal formées — il peut :

- **Itérer et relancer des requêtes :** Plutôt que de fournir des réponses peu pertinentes, le modèle tente de nouvelles stratégies de recherche, réécrit les requêtes vers les bases de données, ou consulte d’autres ensembles de données.  
- **Utiliser des outils de diagnostic :** Le système peut invoquer des fonctions supplémentaires destinées à l’aider à déboguer ses étapes de raisonnement ou à confirmer la validité des données récupérées. Des outils comme Azure AI Tracing sont importants pour assurer une observabilité et un suivi robustes.  
- **Recours à la supervision humaine :** Pour les scénarios à enjeux élevés ou en cas d’échecs répétés, le modèle peut signaler une incertitude et demander une intervention humaine. Une fois le retour correctif fourni, le modèle peut intégrer cet apprentissage pour la suite.

Cette approche itérative et dynamique permet au modèle de s’améliorer continuellement, assurant qu’il ne s’agit pas d’un système « one-shot », mais d’un système qui apprend de ses erreurs au cours d’une session donnée.

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.fr.png)

## Limites de l’autonomie

Malgré son autonomie dans une tâche, Agentic RAG n’est pas équivalent à une Intelligence Artificielle Générale. Ses capacités « agentic » sont limitées aux outils, sources de données, et politiques fournies par les développeurs humains. Il ne peut pas inventer ses propres outils ni sortir des limites du domaine défini. En revanche, il excelle à orchestrer dynamiquement les ressources disponibles.  
Les principales différences avec des formes d’IA plus avancées incluent :

1. **Autonomie spécifique au domaine :** Les systèmes Agentic RAG se concentrent sur l’atteinte d’objectifs définis par l’utilisateur dans un domaine connu, en employant des stratégies comme la réécriture de requêtes ou la sélection d’outils pour améliorer les résultats.  
2. **Dépendance à l’infrastructure :** Les capacités du système dépendent des outils et données intégrés par les développeurs. Il ne peut pas dépasser ces limites sans intervention humaine.  
3. **Respect des garde-fous :** Les directives éthiques, règles de conformité, et politiques métier restent cruciales. La liberté de l’agent est toujours encadrée par des mesures de sécurité et des mécanismes de supervision (espérons-le ?).

## Cas d’usage pratiques et valeur ajoutée

Agentic RAG se distingue dans des scénarios nécessitant raffinement itératif et précision :

1. **Environnements axés sur la précision :** Dans les contrôles de conformité, analyses réglementaires ou recherches juridiques, le modèle agentic peut vérifier les faits à plusieurs reprises, consulter plusieurs sources, et réécrire les requêtes jusqu’à fournir une réponse rigoureusement validée.  
2. **Interactions complexes avec des bases de données :** Lorsqu’il s’agit de données structurées où les requêtes échouent souvent ou doivent être ajustées, le système peut affiner de manière autonome ses requêtes via Azure SQL ou Microsoft Fabric OneLake, garantissant que la récupération finale correspond à l’intention de l’utilisateur.  
3. **Flux de travail étendus :** Les sessions longues peuvent évoluer au fur et à mesure que de nouvelles informations apparaissent. Agentic RAG peut intégrer continuellement ces données, adaptant ses stratégies à mesure qu’il comprend mieux le problème.

## Gouvernance, transparence et confiance

À mesure que ces systèmes gagnent en autonomie dans leur raisonnement, la gouvernance et la transparence deviennent essentielles :

- **Raisonnement explicable :** Le modèle peut fournir une trace d’audit des requêtes effectuées, des sources consultées, et des étapes de raisonnement suivies pour parvenir à sa conclusion. Des outils comme Azure AI Content Safety et Azure AI Tracing / GenAIOps contribuent à maintenir la transparence et à réduire les risques.  
- **Contrôle des biais et récupération équilibrée :** Les développeurs peuvent ajuster les stratégies de récupération pour garantir que des sources de données équilibrées et représentatives sont prises en compte, et auditer régulièrement les résultats pour détecter biais ou déformations à l’aide de modèles personnalisés destinés aux organisations avancées en data science utilisant Azure Machine Learning.  
- **Supervision humaine et conformité :** Pour les tâches sensibles, la revue humaine reste indispensable. Agentic RAG ne remplace pas le jugement humain dans les décisions à fort enjeu — il l’enrichit en fournissant des options plus rigoureusement validées.

Disposer d’outils fournissant un enregistrement clair des actions est essentiel. Sans cela, déboguer un processus multi-étapes peut s’avérer très difficile. Voici un exemple issu de Literal AI (la société derrière Chainlit) pour une exécution d’Agent :

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.fr.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.fr.png)

## Conclusion

Agentic RAG représente une évolution naturelle dans la manière dont les systèmes d’IA gèrent des tâches complexes et riches en données. En adoptant un schéma d’interaction en boucle, en sélectionnant de manière autonome les outils, et en affinant les requêtes jusqu’à obtenir un résultat de haute qualité, le système dépasse la simple exécution de prompts statiques pour devenir un décideur plus adaptatif et conscient du contexte. Bien qu’il reste limité par les infrastructures et les directives éthiques définies par l’humain, ces capacités agentic permettent des interactions IA plus riches, dynamiques et finalement plus utiles, tant pour les entreprises que pour les utilisateurs finaux.

## Ressources supplémentaires

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">Implémenter Retrieval Augmented Generation (RAG) avec Azure OpenAI Service : Apprenez à utiliser vos propres données avec Azure OpenAI Service. Ce module Microsoft Learn fournit un guide complet pour implémenter RAG</a>  
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Évaluation des applications d’IA générative avec Azure AI Foundry : Cet article couvre l’évaluation et la comparaison de modèles sur des jeux de données publics, incluant les applications Agentic AI et les architectures RAG</a>  
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">Qu’est-ce que Agentic RAG | Weaviate</a>  
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG : Guide complet sur la génération augmentée par récupération basée sur agent – News from generation RAG</a>  
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG : dynamisez votre RAG avec la reformulation de requêtes et l’auto-interrogation ! Hugging Face Open-Source AI Cookbook</a>  
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">Ajout de couches Agentic à RAG</a>  
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">Le futur des assistants de connaissance : Jerry Liu</a>  
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">Comment construire des systèmes Agentic RAG</a>  
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">Utiliser Azure AI Foundry Agent Service pour scaler vos agents IA</a>

### Articles académiques

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine : Raffinement itératif avec auto-feedback</a>  
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion : Agents linguistiques avec apprentissage par renforcement verbal</a>  
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC : Les grands modèles de langage peuvent s’auto-corriger avec une critique interactive par outil</a>  
- <a href="https

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.