<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T08:59:13+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "es"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.es.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(Haz clic en la imagen de arriba para ver el video de esta lección)_

# Agentic RAG

Esta lección ofrece una visión completa sobre Agentic Retrieval-Augmented Generation (Agentic RAG), un paradigma emergente de IA donde los grandes modelos de lenguaje (LLMs) planifican de manera autónoma sus siguientes pasos mientras extraen información de fuentes externas. A diferencia de los patrones estáticos de recuperación y lectura, Agentic RAG implica llamadas iterativas al LLM, intercaladas con llamadas a herramientas o funciones y salidas estructuradas. El sistema evalúa los resultados, refina las consultas, invoca herramientas adicionales si es necesario y continúa este ciclo hasta lograr una solución satisfactoria.

## Introducción

En esta lección se cubrirá:

- **Entender Agentic RAG:** Conocer el paradigma emergente en IA donde los grandes modelos de lenguaje (LLMs) planifican de manera autónoma sus siguientes pasos mientras extraen información de fuentes de datos externas.
- **Comprender el estilo iterativo Maker-Checker:** Entender el ciclo de llamadas iterativas al LLM, intercaladas con llamadas a herramientas o funciones y salidas estructuradas, diseñado para mejorar la corrección y manejar consultas mal formadas.
- **Explorar aplicaciones prácticas:** Identificar escenarios donde Agentic RAG destaca, como entornos donde la corrección es prioritaria, interacciones complejas con bases de datos y flujos de trabajo extendidos.

## Objetivos de aprendizaje

Al completar esta lección, sabrás/entenderás cómo:

- **Comprender Agentic RAG:** Conocer el paradigma emergente en IA donde los grandes modelos de lenguaje (LLMs) planifican de manera autónoma sus siguientes pasos mientras extraen información de fuentes externas.
- **Estilo iterativo Maker-Checker:** Captar el concepto de un ciclo de llamadas iterativas al LLM, intercaladas con llamadas a herramientas o funciones y salidas estructuradas, diseñado para mejorar la corrección y manejar consultas mal formadas.
- **Controlar el proceso de razonamiento:** Entender la capacidad del sistema para controlar su proceso de razonamiento, tomando decisiones sobre cómo abordar problemas sin depender de rutas predefinidas.
- **Flujo de trabajo:** Comprender cómo un modelo agentic decide de forma independiente recuperar informes de tendencias de mercado, identificar datos de competidores, correlacionar métricas internas de ventas, sintetizar hallazgos y evaluar la estrategia.
- **Bucles iterativos, integración de herramientas y memoria:** Aprender sobre el patrón de interacción en bucle del sistema, manteniendo estado y memoria a lo largo de los pasos para evitar ciclos repetitivos y tomar decisiones informadas.
- **Manejo de fallos y autocorrección:** Explorar los mecanismos robustos de autocorrección del sistema, incluyendo iteración y nuevas consultas, uso de herramientas diagnósticas y recurrencia a supervisión humana.
- **Límites de la agencia:** Entender las limitaciones de Agentic RAG, enfocándose en la autonomía específica del dominio, dependencia de la infraestructura y respeto a las reglas de seguridad.
- **Casos de uso prácticos y valor:** Identificar escenarios donde Agentic RAG destaca, como entornos donde la corrección es prioritaria, interacciones complejas con bases de datos y flujos de trabajo extendidos.
- **Gobernanza, transparencia y confianza:** Conocer la importancia de la gobernanza y la transparencia, incluyendo razonamiento explicable, control de sesgos y supervisión humana.

## ¿Qué es Agentic RAG?

Agentic Retrieval-Augmented Generation (Agentic RAG) es un paradigma emergente en IA donde los grandes modelos de lenguaje (LLMs) planifican de manera autónoma sus siguientes pasos mientras extraen información de fuentes externas. A diferencia de los patrones estáticos de recuperación y lectura, Agentic RAG implica llamadas iterativas al LLM, intercaladas con llamadas a herramientas o funciones y salidas estructuradas. El sistema evalúa los resultados, refina las consultas, invoca herramientas adicionales si es necesario y continúa este ciclo hasta lograr una solución satisfactoria. Este estilo iterativo “maker-checker” mejora la corrección, maneja consultas mal formadas y asegura resultados de alta calidad.

El sistema controla activamente su proceso de razonamiento, reescribiendo consultas fallidas, eligiendo diferentes métodos de recuperación e integrando múltiples herramientas — como búsqueda vectorial en Azure AI Search, bases de datos SQL o APIs personalizadas — antes de finalizar su respuesta. La cualidad distintiva de un sistema agentic es su capacidad para controlar su proceso de razonamiento. Las implementaciones tradicionales de RAG dependen de rutas predefinidas, pero un sistema agentic determina de forma autónoma la secuencia de pasos basándose en la calidad de la información que encuentra.

## Definiendo Agentic Retrieval-Augmented Generation (Agentic RAG)

Agentic Retrieval-Augmented Generation (Agentic RAG) es un paradigma emergente en el desarrollo de IA donde los LLMs no solo extraen información de fuentes externas, sino que también planifican de manera autónoma sus siguientes pasos. A diferencia de los patrones estáticos de recuperación y lectura o las secuencias de prompts cuidadosamente guionizadas, Agentic RAG implica un ciclo de llamadas iterativas al LLM, intercaladas con llamadas a herramientas o funciones y salidas estructuradas. En cada paso, el sistema evalúa los resultados obtenidos, decide si debe refinar sus consultas, invoca herramientas adicionales si es necesario y continúa este ciclo hasta lograr una solución satisfactoria.

Este estilo iterativo “maker-checker” está diseñado para mejorar la corrección, manejar consultas mal formadas a bases de datos estructuradas (por ejemplo, NL2SQL) y asegurar resultados equilibrados y de alta calidad. En lugar de depender únicamente de cadenas de prompts cuidadosamente diseñadas, el sistema controla activamente su proceso de razonamiento. Puede reescribir consultas fallidas, elegir diferentes métodos de recuperación e integrar múltiples herramientas — como búsqueda vectorial en Azure AI Search, bases de datos SQL o APIs personalizadas — antes de finalizar su respuesta. Esto elimina la necesidad de marcos de orquestación excesivamente complejos. En su lugar, un ciclo relativamente simple de “llamada al LLM → uso de herramienta → llamada al LLM → …” puede producir salidas sofisticadas y bien fundamentadas.

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.es.png)

## Controlando el proceso de razonamiento

La cualidad distintiva que hace que un sistema sea “agentic” es su capacidad para controlar su proceso de razonamiento. Las implementaciones tradicionales de RAG suelen depender de que humanos definan previamente una ruta para el modelo: una cadena de pensamiento que detalla qué recuperar y cuándo.  
Pero cuando un sistema es verdaderamente agentic, decide internamente cómo abordar el problema. No solo ejecuta un guion; determina de forma autónoma la secuencia de pasos basándose en la calidad de la información que encuentra.  
Por ejemplo, si se le pide crear una estrategia de lanzamiento de producto, no depende únicamente de un prompt que describa todo el flujo de investigación y toma de decisiones. En cambio, el modelo agentic decide de forma independiente:

1. Recuperar informes actuales de tendencias de mercado usando Bing Web Grounding  
2. Identificar datos relevantes de competidores usando Azure AI Search  
3. Correlacionar métricas históricas internas de ventas usando Azure SQL Database  
4. Sintetizar los hallazgos en una estrategia cohesiva orquestada vía Azure OpenAI Service  
5. Evaluar la estrategia para detectar vacíos o inconsistencias, iniciando otra ronda de recuperación si es necesario  

Todos estos pasos — refinar consultas, elegir fuentes, iterar hasta estar “satisfecho” con la respuesta — son decididos por el modelo, no predefinidos por un humano.

## Bucles iterativos, integración de herramientas y memoria

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.es.png)

Un sistema agentic se basa en un patrón de interacción en bucle:

- **Llamada inicial:** Se presenta al LLM el objetivo del usuario (es decir, el prompt del usuario).  
- **Invocación de herramientas:** Si el modelo identifica información faltante o instrucciones ambiguas, selecciona una herramienta o método de recuperación — como una consulta a base de datos vectorial (por ejemplo, búsqueda híbrida en Azure AI Search sobre datos privados) o una llamada SQL estructurada — para obtener más contexto.  
- **Evaluación y refinamiento:** Tras revisar los datos retornados, el modelo decide si la información es suficiente. Si no, refina la consulta, prueba una herramienta diferente o ajusta su enfoque.  
- **Repetir hasta satisfacción:** Este ciclo continúa hasta que el modelo determina que tiene suficiente claridad y evidencia para entregar una respuesta final bien fundamentada.  
- **Memoria y estado:** Debido a que el sistema mantiene estado y memoria a lo largo de los pasos, puede recordar intentos previos y sus resultados, evitando ciclos repetitivos y tomando decisiones más informadas conforme avanza.

Con el tiempo, esto crea una sensación de comprensión evolutiva, permitiendo al modelo navegar tareas complejas y de múltiples pasos sin requerir intervención humana constante o reformulación del prompt.

## Manejo de fallos y autocorrección

La autonomía de Agentic RAG también incluye mecanismos robustos de autocorrección. Cuando el sistema se encuentra con callejones sin salida — como recuperar documentos irrelevantes o enfrentar consultas mal formadas — puede:

- **Iterar y volver a consultar:** En lugar de devolver respuestas de bajo valor, el modelo intenta nuevas estrategias de búsqueda, reescribe consultas a bases de datos o examina conjuntos de datos alternativos.  
- **Usar herramientas diagnósticas:** El sistema puede invocar funciones adicionales diseñadas para ayudar a depurar sus pasos de razonamiento o confirmar la corrección de los datos recuperados. Herramientas como Azure AI Tracing serán importantes para habilitar una observabilidad y monitoreo robustos.  
- **Recurre a supervisión humana:** Para escenarios de alto riesgo o fallas repetidas, el modelo puede señalar incertidumbre y solicitar guía humana. Una vez que el humano proporciona retroalimentación correctiva, el modelo puede incorporar esa lección en adelante.

Este enfoque iterativo y dinámico permite que el modelo mejore continuamente, asegurando que no sea solo un sistema de un solo intento, sino uno que aprende de sus errores durante una sesión dada.

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.es.png)

## Límites de la agencia

A pesar de su autonomía dentro de una tarea, Agentic RAG no es análogo a una Inteligencia Artificial General. Sus capacidades “agentic” están confinadas a las herramientas, fuentes de datos y políticas proporcionadas por desarrolladores humanos. No puede inventar sus propias herramientas ni salirse de los límites del dominio establecidos. Más bien, sobresale en la orquestación dinámica de los recursos disponibles.  
Las diferencias clave con formas de IA más avanzadas incluyen:

1. **Autonomía específica del dominio:** Los sistemas Agentic RAG se enfocan en alcanzar objetivos definidos por el usuario dentro de un dominio conocido, empleando estrategias como reescritura de consultas o selección de herramientas para mejorar resultados.  
2. **Dependencia de infraestructura:** Las capacidades del sistema dependen de las herramientas y datos integrados por desarrolladores. No puede superar estos límites sin intervención humana.  
3. **Respeto a las reglas de seguridad:** Las directrices éticas, normas de cumplimiento y políticas empresariales siguen siendo muy importantes. La libertad del agente está siempre limitada por medidas de seguridad y mecanismos de supervisión (¿esperemos?).

## Casos prácticos y valor

Agentic RAG destaca en escenarios que requieren refinamiento iterativo y precisión:

1. **Entornos donde la corrección es prioritaria:** En revisiones de cumplimiento, análisis regulatorios o investigación legal, el modelo agentic puede verificar hechos repetidamente, consultar múltiples fuentes y reescribir consultas hasta producir una respuesta completamente validada.  
2. **Interacciones complejas con bases de datos:** Cuando se trabaja con datos estructurados donde las consultas pueden fallar o necesitar ajustes, el sistema puede refinar autónomamente sus consultas usando Azure SQL o Microsoft Fabric OneLake, asegurando que la recuperación final se alinee con la intención del usuario.  
3. **Flujos de trabajo extendidos:** Las sesiones de larga duración pueden evolucionar a medida que surge nueva información. Agentic RAG puede incorporar continuamente nuevos datos, ajustando estrategias conforme aprende más sobre el problema.

## Gobernanza, transparencia y confianza

A medida que estos sistemas se vuelven más autónomos en su razonamiento, la gobernanza y la transparencia son cruciales:

- **Razonamiento explicable:** El modelo puede proporcionar una auditoría de las consultas realizadas, las fuentes consultadas y los pasos de razonamiento seguidos para llegar a su conclusión. Herramientas como Azure AI Content Safety y Azure AI Tracing / GenAIOps ayudan a mantener la transparencia y mitigar riesgos.  
- **Control de sesgos y recuperación equilibrada:** Los desarrolladores pueden ajustar las estrategias de recuperación para asegurar que se consideren fuentes de datos equilibradas y representativas, y auditar regularmente las salidas para detectar sesgos o patrones sesgados utilizando modelos personalizados para organizaciones avanzadas de ciencia de datos con Azure Machine Learning.  
- **Supervisión humana y cumplimiento:** Para tareas sensibles, la revisión humana sigue siendo esencial. Agentic RAG no reemplaza el juicio humano en decisiones críticas, sino que lo complementa ofreciendo opciones más rigurosamente validadas.

Contar con herramientas que provean un registro claro de acciones es fundamental. Sin ellas, depurar un proceso de múltiples pasos puede ser muy difícil. Véase el siguiente ejemplo de Literal AI (empresa detrás de Chainlit) para una ejecución de agente:

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.es.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.es.png)

## Conclusión

Agentic RAG representa una evolución natural en cómo los sistemas de IA manejan tareas complejas y con gran volumen de datos. Al adoptar un patrón de interacción en bucle, seleccionar herramientas de forma autónoma y refinar consultas hasta lograr un resultado de alta calidad, el sistema va más allá de seguir prompts estáticos hacia un tomador de decisiones más adaptativo y consciente del contexto. Aunque aún limitado por infraestructuras y directrices éticas definidas por humanos, estas capacidades agentic permiten interacciones de IA más ricas, dinámicas y, en última instancia, más útiles tanto para empresas como para usuarios finales.

## Recursos adicionales

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">Implementar Retrieval Augmented Generation (RAG) con Azure OpenAI Service: Aprende a usar tus propios datos con Azure OpenAI Service. Este módulo de Microsoft Learn ofrece una guía completa para implementar RAG</a>  
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Evaluación de aplicaciones de IA generativa con Azure AI Foundry: Este artículo cubre la evaluación y comparación de modelos en conjuntos de datos públicos, incluyendo aplicaciones Agentic AI y arquitecturas RAG</a>  
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">Qué es Agentic RAG | Weaviate</a>  
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG: Guía completa sobre generación aumentada basada en agentes – Noticias de generación RAG</a>  
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG: potencia tu RAG con reformulación de consultas y auto-consulta! Hugging Face Open-Source AI Cookbook</a>  
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">Añadiendo capas agentic a RAG</a>  
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">El futuro de los asistentes de conocimiento: Jerry Liu</a>  
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">Cómo construir sistemas Agentic RAG</a>  
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">Usando Azure AI Foundry Agent Service para escalar tus agentes de IA</a>

### Artículos académicos

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine: Refinamiento iterativo con retroalimentación propia</a>  
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion: Agentes de lenguaje con aprendizaje reforzado verbal</a>  
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC: Grandes modelos de lenguaje pueden autocorregirse con crítica interactiva mediante herramientas</a>  
- <a href="https://arxiv.org/abs/2501.09136" target="_blank">2501.09136 Agentic Retrieval-Augmented Generation: Una encuesta sobre Agentic RAG</a>

## Lección anterior

[Patrón de diseño para uso de herramientas](../04-tool-use/README.md)

## Próxima lección

[Construyendo agentes de IA confiables](../06-building-trustworthy-agents/README.md)

**Aviso legal**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional realizada por humanos. No nos hacemos responsables por malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.