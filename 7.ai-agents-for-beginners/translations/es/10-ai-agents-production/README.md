<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1ad5de6a6388d02c145a92dd04358bab",
  "translation_date": "2025-05-20T09:04:53+00:00",
  "source_file": "10-ai-agents-production/README.md",
  "language_code": "es"
}
-->
[![AI Agents In Production](../../../translated_images/lesson-10-thumbnail.0b68f4240618b3d5b26693b78cf2cf0a8b36131b50bb08daf91d548cecc87424.es.png)](https://youtu.be/l4TP6IyJxmQ?si=IvCW3cbw0NJ2mUMV)

> _(Haz clic en la imagen de arriba para ver el video de esta lección)_
# Agentes de IA en Producción

## Introducción

Esta lección cubrirá:

- Cómo planificar de manera efectiva el despliegue de tu Agente de IA en producción.
- Errores comunes y problemas que podrías enfrentar al desplegar tu Agente de IA en producción.
- Cómo gestionar los costos manteniendo el rendimiento de tu Agente de IA.

## Objetivos de Aprendizaje

Después de completar esta lección, sabrás cómo/entenderás:

- Técnicas para mejorar el rendimiento, los costos y la efectividad de un sistema de Agentes de IA en producción.
- Qué y cómo evaluar a tus Agentes de IA.
- Cómo controlar los costos al desplegar Agentes de IA en producción.

Es importante desplegar Agentes de IA que sean confiables. También revisa la lección "Building Trustworthy AI Agents".

## Evaluación de Agentes de IA

Antes, durante y después de desplegar Agentes de IA, contar con un sistema adecuado para evaluar tus Agentes es fundamental. Esto garantizará que tu sistema esté alineado con tus objetivos y los de tus usuarios.

Para evaluar un Agente de IA, es importante poder evaluar no solo la salida del agente, sino también todo el sistema en el que opera tu Agente de IA. Esto incluye, pero no se limita a:

- La solicitud inicial al modelo.
- La capacidad del agente para identificar la intención del usuario.
- La capacidad del agente para identificar la herramienta correcta para realizar la tarea.
- La respuesta de la herramienta a la solicitud del agente.
- La capacidad del agente para interpretar la respuesta de la herramienta.
- La retroalimentación del usuario a la respuesta del agente.

Esto te permite identificar áreas de mejora de manera más modular. Luego puedes monitorear el efecto de los cambios en modelos, prompts, herramientas y otros componentes con mayor eficiencia.

## Problemas Comunes y Posibles Soluciones con Agentes de IA

| **Problema**                                   | **Posible Solución**                                                                                                                                                                                                     |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| El Agente de IA no realiza tareas de forma consistente | - Refinar el prompt dado al Agente de IA; ser claro en los objetivos.<br>- Identificar cuándo dividir las tareas en subtareas y manejarlas por múltiples agentes puede ayudar.                                           |
| El Agente de IA entra en bucles continuos      | - Asegurarse de tener términos y condiciones claros de terminación para que el Agente sepa cuándo detener el proceso.<br>- Para tareas complejas que requieren razonamiento y planificación, usar un modelo más grande especializado en esas tareas. |
| Las llamadas a herramientas del Agente de IA no funcionan bien | - Probar y validar la salida de la herramienta fuera del sistema del agente.<br>- Refinar los parámetros definidos, prompts y nombres de las herramientas.                                                               |
| El sistema Multi-Agente no funciona consistentemente | - Refinar los prompts dados a cada agente para asegurar que sean específicos y distintos entre sí.<br>- Construir un sistema jerárquico usando un agente "enrutador" o controlador para determinar cuál agente es el correcto. |

## Gestión de Costos

Aquí algunas estrategias para manejar los costos del despliegue de Agentes de IA en producción:

- **Cachear Respuestas** - Identificar solicitudes y tareas comunes y proporcionar las respuestas antes de que pasen por tu sistema agente es una buena forma de reducir el volumen de solicitudes similares. Incluso puedes implementar un flujo para identificar qué tan similar es una solicitud a tus respuestas cacheadas usando modelos de IA más básicos.

- **Usar Modelos Más Pequeños** - Los Small Language Models (SLMs) pueden funcionar bien en ciertos casos de uso agente y reducirán los costos significativamente. Como se mencionó antes, construir un sistema de evaluación para determinar y comparar el rendimiento frente a modelos más grandes es la mejor forma de entender qué tan bien funcionará un SLM en tu caso.

- **Usar un Modelo Enrutador** - Una estrategia similar es usar una diversidad de modelos y tamaños. Puedes usar un LLM/SLM o función serverless para enrutar las solicitudes según la complejidad hacia los modelos más adecuados. Esto también ayudará a reducir costos mientras asegura el rendimiento en las tareas correctas.

## Felicitaciones

Esta es actualmente la última lección de "AI Agents for Beginners".

Planeamos seguir agregando lecciones basadas en comentarios y cambios en esta industria en constante crecimiento, así que vuelve pronto.

Si quieres continuar tu aprendizaje y construcción con Agentes de IA, únete al <a href="https://discord.gg/kzRShWzttr" target="_blank">Azure AI Community Discord</a>.

Allí organizamos talleres, mesas redondas comunitarias y sesiones de "pregúntame lo que sea".

También contamos con una colección Learn de materiales adicionales que pueden ayudarte a comenzar a construir Agentes de IA en producción.

## Lección Anterior

[Metacognition Design Pattern](../09-metacognition/README.md)

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas derivadas del uso de esta traducción.