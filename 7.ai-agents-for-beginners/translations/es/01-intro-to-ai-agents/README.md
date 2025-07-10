<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d84943abc8f001ad4670418d32c2d899",
  "translation_date": "2025-05-20T08:55:20+00:00",
  "source_file": "01-intro-to-ai-agents/README.md",
  "language_code": "es"
}
-->
para conocer a otros estudiantes y constructores de Agentes de IA y hacer cualquier pregunta que tengas sobre este curso.

Para comenzar este curso, empezamos por entender mejor qué son los Agentes de IA y cómo podemos usarlos en las aplicaciones y flujos de trabajo que construimos.

## Introducción

Esta lección cubre:

- ¿Qué son los Agentes de IA y cuáles son los diferentes tipos de agentes?
- ¿Para qué casos de uso son más adecuados los Agentes de IA y cómo pueden ayudarnos?
- ¿Cuáles son algunos de los elementos básicos al diseñar Soluciones Agénticas?

## Objetivos de Aprendizaje
Después de completar esta lección, deberías ser capaz de:

- Comprender los conceptos de Agentes de IA y en qué se diferencian de otras soluciones de IA.
- Aplicar los Agentes de IA de manera más eficiente.
- Diseñar soluciones agénticas de forma productiva tanto para usuarios como para clientes.

## Definiendo Agentes de IA y Tipos de Agentes de IA

### ¿Qué son los Agentes de IA?

Los Agentes de IA son **sistemas** que permiten que los **Modelos de Lenguaje Grande (LLMs)** **realicen acciones** extendiendo sus capacidades al dar a los LLMs **acceso a herramientas** y **conocimiento**.

Desglosemos esta definición en partes más pequeñas:

- **Sistema** - Es importante pensar en los agentes no solo como un componente único, sino como un sistema de muchos componentes. A nivel básico, los componentes de un Agente de IA son:
  - **Entorno** - El espacio definido donde el Agente de IA opera. Por ejemplo, si tuviéramos un agente de IA para reservas de viajes, el entorno podría ser el sistema de reservas que el agente usa para completar tareas.
  - **Sensores** - Los entornos tienen información y proporcionan retroalimentación. Los agentes usan sensores para recopilar e interpretar esta información sobre el estado actual del entorno. En el ejemplo del agente de reservas, el sistema puede proporcionar información como disponibilidad de hoteles o precios de vuelos.
  - **Actuadores** - Una vez que el agente recibe el estado actual del entorno, para la tarea actual determina qué acción realizar para cambiar el entorno. En el agente de reservas, podría ser reservar una habitación disponible para el usuario.

![¿Qué Son los Agentes de IA?](../../../translated_images/what-are-ai-agents.125520f55950b252a429b04a9f41e0152d4dafa1f1bd9081f4f574631acb759e.es.png)

**Modelos de Lenguaje Grande** - El concepto de agentes existía antes de la creación de los LLMs. La ventaja de construir Agentes de IA con LLMs es su capacidad para interpretar el lenguaje humano y los datos. Esta habilidad permite a los LLMs interpretar la información del entorno y definir un plan para cambiarlo.

**Realizar Acciones** - Fuera de los sistemas de Agentes de IA, los LLMs están limitados a situaciones donde la acción es generar contenido o información basada en la solicitud del usuario. Dentro de los sistemas de Agentes de IA, los LLMs pueden realizar tareas interpretando la petición del usuario y usando las herramientas disponibles en su entorno.

**Acceso a Herramientas** - Las herramientas a las que el LLM tiene acceso están definidas por 1) el entorno en el que opera y 2) el desarrollador del Agente de IA. En nuestro ejemplo del agente de viajes, las herramientas del agente están limitadas por las operaciones disponibles en el sistema de reservas, y/o el desarrollador puede limitar el acceso del agente a herramientas específicas como vuelos.

**Memoria+Conocimiento** - La memoria puede ser a corto plazo en el contexto de la conversación entre el usuario y el agente. A largo plazo, fuera de la información proporcionada por el entorno, los Agentes de IA también pueden recuperar conocimiento de otros sistemas, servicios, herramientas e incluso otros agentes. En el ejemplo del agente de viajes, este conocimiento podría ser la información sobre las preferencias de viaje del usuario almacenada en una base de datos de clientes.

### Los diferentes tipos de agentes

Ahora que tenemos una definición general de Agentes de IA, veamos algunos tipos específicos de agentes y cómo se aplicarían a un agente de reservas de viajes.

| **Tipo de Agente**            | **Descripción**                                                                                                                      | **Ejemplo**                                                                                                                                                                                                                  |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Agentes Reflexivos Simples**| Realizan acciones inmediatas basadas en reglas predefinidas.                                                                        | El agente de viajes interpreta el contexto del correo electrónico y reenvía quejas de viaje al servicio al cliente.                                                                                                         |
| **Agentes Reflexivos Basados en Modelo** | Realizan acciones basadas en un modelo del mundo y cambios en ese modelo.                                                        | El agente de viajes prioriza rutas con cambios significativos de precio basándose en acceso a datos históricos de precios.                                                                                                   |
| **Agentes Basados en Objetivos** | Crean planes para alcanzar objetivos específicos interpretando el objetivo y determinando acciones para lograrlo.                  | El agente de viajes reserva un viaje determinando los arreglos necesarios (auto, transporte público, vuelos) desde la ubicación actual hasta el destino.                                                                       |
| **Agentes Basados en Utilidad** | Consideran preferencias y ponderan compensaciones numéricamente para determinar cómo alcanzar objetivos.                           | El agente de viajes maximiza la utilidad sopesando conveniencia frente a costo al reservar el viaje.                                                                                                                        |
| **Agentes de Aprendizaje**    | Mejoran con el tiempo respondiendo a retroalimentación y ajustando acciones en consecuencia.                                        | El agente de viajes mejora usando comentarios de los clientes de encuestas post-viaje para ajustar futuras reservas.                                                                                                         |
| **Agentes Jerárquicos**       | Presentan múltiples agentes en un sistema escalonado, donde agentes de nivel superior dividen tareas en subtareas para agentes de nivel inferior. | El agente de viajes cancela un viaje dividiendo la tarea en subtareas (por ejemplo, cancelar reservas específicas) y dejando que agentes de nivel inferior las completen, reportando al agente de nivel superior.                |
| **Sistemas Multi-Agente (MAS)**| Los agentes completan tareas de forma independiente, ya sea cooperativa o competitivamente.                                         | Cooperativo: Múltiples agentes reservan servicios específicos de viaje como hoteles, vuelos y entretenimiento. Competitivo: Múltiples agentes gestionan y compiten por un calendario compartido de reservas hoteleras para alojar clientes. |

## Cuándo Usar Agentes de IA

En la sección anterior, usamos el caso de uso del Agente de Viajes para explicar cómo los diferentes tipos de agentes pueden usarse en distintos escenarios de reserva de viajes. Continuaremos usando esta aplicación a lo largo del curso.

Veamos los tipos de casos de uso para los que los Agentes de IA son más adecuados:

![¿Cuándo usar Agentes de IA?](../../../translated_images/when-to-use-ai-agents.912b9a02e9e0e2af45a3e24faa4e912e334ec23f21f0cf5cb040b7e899b09cd0.es.png)

- **Problemas Abiertos** - permitir que el LLM determine los pasos necesarios para completar una tarea porque no siempre se puede codificar de forma rígida en un flujo de trabajo.
- **Procesos de Múltiples Pasos** - tareas que requieren un nivel de complejidad en el que el Agente de IA necesita usar herramientas o información en múltiples interacciones en lugar de una sola recuperación.
- **Mejora con el Tiempo** - tareas donde el agente puede mejorar con el tiempo recibiendo retroalimentación ya sea de su entorno o de los usuarios para ofrecer mejor utilidad.

Cubriré más consideraciones sobre el uso de Agentes de IA en la lección de Construcción de Agentes de IA Confiables.

## Conceptos Básicos de Soluciones Agénticas

### Desarrollo de Agentes

El primer paso para diseñar un sistema de Agente de IA es definir las herramientas, acciones y comportamientos. En este curso, nos enfocamos en usar el **Azure AI Agent Service** para definir nuestros agentes. Ofrece características como:

- Selección de Modelos Abiertos como OpenAI, Mistral y Llama
- Uso de Datos Licenciados a través de proveedores como Tripadvisor
- Uso de herramientas estandarizadas OpenAPI 3.0

### Patrones Agénticos

La comunicación con los LLMs es a través de prompts. Dada la naturaleza semiautónoma de los Agentes de IA, no siempre es posible o necesario volver a enviar un prompt manualmente al LLM tras un cambio en el entorno. Usamos **Patrones Agénticos** que nos permiten enviar prompts al LLM en múltiples pasos de manera más escalable.

Este curso está dividido en algunos de los patrones agénticos populares actuales.

### Frameworks Agénticos

Los Frameworks Agénticos permiten a los desarrolladores implementar patrones agénticos mediante código. Estos frameworks ofrecen plantillas, plugins y herramientas para mejorar la colaboración entre agentes. Estos beneficios proporcionan mejores capacidades para la observabilidad y solución de problemas en sistemas de Agentes de IA.

En este curso, exploraremos el framework AutoGen, basado en investigación, y el framework Agent, listo para producción, de Semantic Kernel.

## Lección Anterior

[Configuración del Curso](../00-course-setup/README.md)

## Próxima Lección

[Explorando Frameworks Agénticos](../02-explore-agentic-frameworks/README.md)

**Aviso legal**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables por malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.