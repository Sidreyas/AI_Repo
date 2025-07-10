<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d84943abc8f001ad4670418d32c2d899",
  "translation_date": "2025-05-20T07:46:17+00:00",
  "source_file": "01-intro-to-ai-agents/README.md",
  "language_code": "fr"
}
-->
pour rencontrer d'autres apprenants et créateurs d'agents IA et poser toutes vos questions concernant ce cours.

Pour commencer ce cours, nous allons d'abord mieux comprendre ce que sont les agents IA et comment nous pouvons les utiliser dans les applications et les flux de travail que nous construisons.

## Introduction

Cette leçon couvre :

- Qu'est-ce qu'un agent IA et quels sont les différents types d'agents ?
- Quels cas d'usage conviennent le mieux aux agents IA et comment peuvent-ils nous aider ?
- Quels sont les éléments de base à considérer lors de la conception de solutions agentiques ?

## Objectifs d'apprentissage
À l'issue de cette leçon, vous devriez être capable de :

- Comprendre les concepts des agents IA et en quoi ils diffèrent des autres solutions d'IA.
- Utiliser les agents IA de manière optimale.
- Concevoir des solutions agentiques de manière productive pour les utilisateurs et les clients.

## Définition des agents IA et types d'agents IA

### Qu'est-ce qu'un agent IA ?

Les agents IA sont des **systèmes** qui permettent aux **grands modèles de langage (LLM)** de **réaliser des actions** en étendant leurs capacités grâce à l'accès à des **outils** et à des **connaissances**.

Décomposons cette définition en parties plus petites :

- **Système** - Il est important de considérer les agents non pas comme un seul composant, mais comme un système composé de plusieurs éléments. Au niveau de base, les composants d'un agent IA sont :
  - **Environnement** - L'espace défini dans lequel l'agent IA opère. Par exemple, pour un agent IA de réservation de voyages, l'environnement pourrait être le système de réservation utilisé par l'agent pour accomplir ses tâches.
  - **Capteurs** - Les environnements contiennent des informations et fournissent des retours. Les agents IA utilisent des capteurs pour recueillir et interpréter ces informations sur l'état actuel de l'environnement. Dans l'exemple de l'agent de réservation, le système peut fournir des informations comme la disponibilité des hôtels ou les prix des vols.
  - **Actionneurs** - Une fois que l'agent IA reçoit l'état actuel de l'environnement, il détermine quelle action effectuer pour modifier cet environnement. Pour l'agent de réservation, cela pourrait être de réserver une chambre disponible pour l'utilisateur.

![Qu'est-ce qu'un agent IA ?](../../../translated_images/what-are-ai-agents.125520f55950b252a429b04a9f41e0152d4dafa1f1bd9081f4f574631acb759e.fr.png)

**Grands modèles de langage** - Le concept d'agents existait avant la création des LLM. L'avantage de construire des agents IA avec des LLM réside dans leur capacité à interpréter le langage humain et les données. Cette capacité leur permet d'interpréter les informations environnementales et de définir un plan pour modifier l'environnement.

**Réaliser des actions** - En dehors des systèmes d'agents IA, les LLM sont limités à des situations où l'action consiste à générer du contenu ou des informations à partir d'une demande utilisateur. Dans les systèmes d'agents IA, les LLM peuvent accomplir des tâches en interprétant la demande de l'utilisateur et en utilisant les outils disponibles dans leur environnement.

**Accès aux outils** - Les outils auxquels le LLM a accès sont définis par 1) l'environnement dans lequel il opère et 2) le développeur de l'agent IA. Dans notre exemple d'agent de voyage, les outils de l'agent sont limités par les opérations disponibles dans le système de réservation, et/ou le développeur peut restreindre l'accès aux outils pour les vols uniquement.

**Mémoire + Connaissances** - La mémoire peut être à court terme, dans le cadre de la conversation entre l'utilisateur et l'agent. À long terme, au-delà des informations fournies par l'environnement, les agents IA peuvent également récupérer des connaissances provenant d'autres systèmes, services, outils, voire d'autres agents. Dans l'exemple de l'agent de voyage, ces connaissances peuvent être les préférences de voyage de l'utilisateur stockées dans une base de données client.

### Les différents types d'agents

Maintenant que nous avons une définition générale des agents IA, examinons quelques types spécifiques d'agents et comment ils pourraient s'appliquer à un agent de réservation de voyages.

| **Type d'agent**             | **Description**                                                                                                                     | **Exemple**                                                                                                                                                                                                                  |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Agents réflexes simples**  | Effectuent des actions immédiates basées sur des règles prédéfinies.                                                              | L'agent de voyage interprète le contexte d'un e-mail et transfère les plaintes de voyage au service client.                                                                                                                 |
| **Agents réflexes basés sur un modèle** | Effectuent des actions basées sur un modèle du monde et les changements de ce modèle.                                      | L'agent de voyage privilégie les itinéraires avec des variations de prix importantes en se basant sur les données historiques de tarification.                                                                               |
| **Agents basés sur des objectifs** | Créent des plans pour atteindre des objectifs spécifiques en interprétant l'objectif et en déterminant les actions à effectuer. | L'agent de voyage organise un trajet en déterminant les arrangements nécessaires (voiture, transports en commun, vols) depuis le lieu actuel jusqu'à la destination.                                                          |
| **Agents basés sur l'utilité** | Prennent en compte les préférences et évaluent numériquement les compromis pour déterminer comment atteindre les objectifs.       | L'agent de voyage maximise l'utilité en équilibrant la commodité et le coût lors de la réservation.                                                                                                                          |
| **Agents apprenants**         | S'améliorent avec le temps en répondant aux retours et en ajustant leurs actions en conséquence.                                   | L'agent de voyage s'améliore en utilisant les retours clients issus des enquêtes post-voyage pour ajuster les futures réservations.                                                                                         |
| **Agents hiérarchiques**      | Composés de plusieurs agents dans un système en couches, les agents de niveau supérieur divisant les tâches en sous-tâches pour les agents de niveau inférieur. | L'agent de voyage annule un voyage en divisant la tâche en sous-tâches (par exemple, annuler des réservations spécifiques) et en laissant les agents de niveau inférieur les exécuter, avec un retour au niveau supérieur.      |
| **Systèmes multi-agents (MAS)** | Les agents accomplissent des tâches de manière indépendante, soit en coopération, soit en compétition.                          | Coopératif : Plusieurs agents réservent des services spécifiques comme hôtels, vols et divertissements. Compétitif : Plusieurs agents gèrent et se disputent un calendrier de réservation d'hôtel partagé pour accueillir les clients. |

## Quand utiliser les agents IA

Dans la section précédente, nous avons utilisé l'exemple de l'agent de voyage pour expliquer comment différents types d'agents peuvent être utilisés dans différents scénarios de réservation. Nous continuerons d'utiliser cette application tout au long du cours.

Voyons les types de cas d'usage pour lesquels les agents IA sont les plus adaptés :

![Quand utiliser les agents IA ?](../../../translated_images/when-to-use-ai-agents.912b9a02e9e0e2af45a3e24faa4e912e334ec23f21f0cf5cb040b7e899b09cd0.fr.png)

- **Problèmes ouverts** - laisser le LLM déterminer les étapes nécessaires pour accomplir une tâche car elles ne peuvent pas toujours être codées en dur dans un flux de travail.
- **Processus à plusieurs étapes** - tâches nécessitant un certain niveau de complexité où l'agent IA doit utiliser des outils ou des informations sur plusieurs tours d'échange plutôt qu'une simple récupération unique.
- **Amélioration dans le temps** - tâches où l'agent peut s'améliorer au fil du temps en recevant des retours de son environnement ou des utilisateurs afin d'offrir une meilleure utilité.

Nous abordons d'autres considérations liées à l'utilisation des agents IA dans la leçon sur la création d'agents IA fiables.

## Bases des solutions agentiques

### Développement d'agents

La première étape dans la conception d'un système d'agent IA est de définir les outils, actions et comportements. Dans ce cours, nous nous concentrons sur l'utilisation du **service Azure AI Agent** pour définir nos agents. Il offre des fonctionnalités telles que :

- Sélection de modèles ouverts comme OpenAI, Mistral et Llama
- Utilisation de données sous licence via des fournisseurs comme Tripadvisor
- Utilisation d'outils standardisés OpenAPI 3.0

### Modèles agentiques

La communication avec les LLM se fait via des invites (prompts). Étant donné la nature semi-autonome des agents IA, il n'est pas toujours possible ou nécessaire de relancer manuellement une invite après un changement dans l'environnement. Nous utilisons des **modèles agentiques** qui permettent de solliciter le LLM sur plusieurs étapes de manière plus évolutive.

Ce cours est divisé en plusieurs des modèles agentiques populaires actuels.

### Cadres agentiques

Les cadres agentiques permettent aux développeurs d'implémenter des modèles agentiques via du code. Ces cadres proposent des modèles, plugins et outils pour une meilleure collaboration entre agents IA. Ces avantages offrent des capacités d'observabilité et de dépannage améliorées pour les systèmes d'agents IA.

Dans ce cours, nous explorerons le cadre AutoGen basé sur la recherche ainsi que le cadre Agent prêt pour la production de Semantic Kernel.

## Leçon précédente

[Configuration du cours](../00-course-setup/README.md)

## Leçon suivante

[Exploration des cadres agentiques](../02-explore-agentic-frameworks/README.md)

**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.