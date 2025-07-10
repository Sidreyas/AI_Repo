<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d84943abc8f001ad4670418d32c2d899",
  "translation_date": "2025-05-20T08:44:03+00:00",
  "source_file": "01-intro-to-ai-agents/README.md",
  "language_code": "pt"
}
-->
para conhecer outros aprendizes e construtores de Agentes de IA e tirar quaisquer dúvidas que você tenha sobre este curso.

Para começar este curso, iniciamos entendendo melhor o que são Agentes de IA e como podemos usá-los nas aplicações e fluxos de trabalho que criamos.

## Introdução

Esta lição aborda:

- O que são Agentes de IA e quais os diferentes tipos de agentes?
- Quais casos de uso são mais indicados para Agentes de IA e como eles podem nos ajudar?
- Quais são alguns dos blocos básicos na hora de projetar Soluções Agentes?

## Objetivos de Aprendizagem
Após concluir esta lição, você deverá ser capaz de:

- Compreender os conceitos de Agentes de IA e como eles se diferenciam de outras soluções de IA.
- Aplicar Agentes de IA da forma mais eficiente.
- Projetar soluções agentes de forma produtiva para usuários e clientes.

## Definindo Agentes de IA e Tipos de Agentes de IA

### O que são Agentes de IA?

Agentes de IA são **sistemas** que permitem que **Modelos de Linguagem de Grande Porte (LLMs)** **executem ações** ampliando suas capacidades ao dar aos LLMs **acesso a ferramentas** e **conhecimento**.

Vamos dividir essa definição em partes menores:

- **Sistema** - É importante pensar em agentes não como um único componente, mas como um sistema composto por vários componentes. No nível básico, os componentes de um Agente de IA são:
  - **Ambiente** - O espaço definido onde o Agente de IA opera. Por exemplo, se tivermos um agente de IA para reservas de viagem, o ambiente pode ser o sistema de reservas de viagem que o agente usa para realizar tarefas.
  - **Sensores** - Os ambientes têm informações e fornecem feedback. Os Agentes de IA usam sensores para coletar e interpretar essas informações sobre o estado atual do ambiente. No exemplo do Agente de Reservas de Viagem, o sistema de reservas pode fornecer informações como disponibilidade de hotéis ou preços de voos.
  - **Atuadores** - Depois que o Agente de IA recebe o estado atual do ambiente, para a tarefa atual o agente determina qual ação executar para modificar o ambiente. No caso do agente de reservas, pode ser reservar um quarto disponível para o usuário.

![O que são Agentes de IA?](../../../translated_images/what-are-ai-agents.125520f55950b252a429b04a9f41e0152d4dafa1f1bd9081f4f574631acb759e.pt.png)

**Modelos de Linguagem de Grande Porte** - O conceito de agentes existia antes da criação dos LLMs. A vantagem de construir Agentes de IA com LLMs é sua capacidade de interpretar a linguagem humana e dados. Essa habilidade permite que os LLMs interpretem informações ambientais e definam um plano para alterar o ambiente.

**Executar Ações** - Fora dos sistemas de Agentes de IA, os LLMs são limitados a situações onde a ação é gerar conteúdo ou informação com base no comando do usuário. Dentro dos sistemas de Agentes de IA, os LLMs podem realizar tarefas interpretando o pedido do usuário e usando as ferramentas disponíveis em seu ambiente.

**Acesso a Ferramentas** - As ferramentas que o LLM tem acesso são definidas por 1) o ambiente em que ele opera e 2) o desenvolvedor do Agente de IA. No exemplo do agente de viagem, as ferramentas do agente são limitadas pelas operações disponíveis no sistema de reservas, e/ou o desenvolvedor pode restringir o acesso do agente apenas a voos.

**Memória+Conhecimento** - A memória pode ser de curto prazo, no contexto da conversa entre o usuário e o agente. A longo prazo, além das informações fornecidas pelo ambiente, os Agentes de IA também podem recuperar conhecimento de outros sistemas, serviços, ferramentas e até outros agentes. No exemplo do agente de viagem, esse conhecimento pode ser as preferências de viagem do usuário armazenadas em um banco de dados de clientes.

### Os diferentes tipos de agentes

Agora que temos uma definição geral de Agentes de IA, vamos ver alguns tipos específicos de agentes e como eles seriam aplicados a um agente de reservas de viagem.

| **Tipo de Agente**           | **Descrição**                                                                                                                        | **Exemplo**                                                                                                                                                                                                                   |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Agentes Reflexos Simples** | Executam ações imediatas baseadas em regras pré-definidas.                                                                           | O agente de viagem interpreta o contexto de um e-mail e encaminha reclamações de viagem para o atendimento ao cliente.                                                                                                        |
| **Agentes Reflexos Baseados em Modelo** | Executam ações com base em um modelo do mundo e alterações nesse modelo.                                                          | O agente de viagem prioriza rotas com mudanças significativas de preço com base no acesso a dados históricos de preços.                                                                                                       |
| **Agentes Baseados em Objetivos** | Criam planos para alcançar objetivos específicos interpretando o objetivo e determinando ações para alcançá-lo.                    | O agente de viagem reserva uma viagem determinando os arranjos necessários (carro, transporte público, voos) do local atual até o destino.                                                                                     |
| **Agentes Baseados em Utilidade** | Consideram preferências e avaliam compensações numericamente para determinar como atingir os objetivos.                           | O agente de viagem maximiza a utilidade ao ponderar conveniência versus custo na reserva de viagens.                                                                                                                          |
| **Agentes de Aprendizado**   | Melhoram com o tempo respondendo a feedbacks e ajustando ações conforme necessário.                                                  | O agente de viagem melhora usando o feedback dos clientes em pesquisas pós-viagem para ajustar futuras reservas.                                                                                                             |
| **Agentes Hierárquicos**     | Contam com múltiplos agentes em um sistema em camadas, com agentes de nível superior dividindo tarefas em subtarefas para agentes de nível inferior completarem. | O agente de viagem cancela uma viagem dividindo a tarefa em subtarefas (por exemplo, cancelar reservas específicas) e agentes de nível inferior as completam, reportando ao agente de nível superior.                           |
| **Sistemas Multiagentes (MAS)** | Agentes completam tarefas independentemente, seja cooperando ou competindo.                                                        | Cooperativo: Múltiplos agentes reservam serviços específicos de viagem, como hotéis, voos e entretenimento. Competitivo: Múltiplos agentes gerenciam e competem por um calendário compartilhado de reservas de hotel para acomodar clientes. |

## Quando Usar Agentes de IA

Na seção anterior, usamos o caso de uso do Agente de Viagem para explicar como os diferentes tipos de agentes podem ser usados em diferentes cenários de reservas. Continuaremos usando essa aplicação ao longo do curso.

Vamos ver os tipos de casos de uso para os quais os Agentes de IA são mais indicados:

![Quando usar Agentes de IA?](../../../translated_images/when-to-use-ai-agents.912b9a02e9e0e2af45a3e24faa4e912e334ec23f21f0cf5cb040b7e899b09cd0.pt.png)

- **Problemas Abertos** - permitindo que o LLM determine os passos necessários para completar uma tarefa, pois nem sempre isso pode ser codificado diretamente em um fluxo de trabalho.
- **Processos de Múltiplas Etapas** - tarefas que exigem um nível de complexidade em que o Agente de IA precisa usar ferramentas ou informações em várias interações, e não apenas uma recuperação única.
- **Melhoria ao Longo do Tempo** - tarefas em que o agente pode melhorar ao receber feedback do ambiente ou dos usuários para oferecer melhor utilidade.

Abordamos mais considerações sobre o uso de Agentes de IA na lição Construindo Agentes de IA Confiáveis.

## Noções Básicas de Soluções Agentes

### Desenvolvimento de Agentes

O primeiro passo para projetar um sistema de Agente de IA é definir as ferramentas, ações e comportamentos. Neste curso, focamos no uso do **Azure AI Agent Service** para definir nossos agentes. Ele oferece recursos como:

- Seleção de Modelos Abertos, como OpenAI, Mistral e Llama
- Uso de Dados Licenciados por provedores como Tripadvisor
- Uso de ferramentas padronizadas OpenAPI 3.0

### Padrões Agentes

A comunicação com LLMs é feita por meio de prompts. Dada a natureza semi-autônoma dos Agentes de IA, nem sempre é possível ou necessário reemitir prompts manualmente ao LLM após uma mudança no ambiente. Usamos **Padrões Agentes** que nos permitem enviar prompts ao LLM em múltiplas etapas de forma mais escalável.

Este curso está dividido em alguns dos padrões agentes mais populares atualmente.

### Frameworks Agentes

Frameworks agentes permitem que desenvolvedores implementem padrões agentes por meio de código. Esses frameworks oferecem templates, plugins e ferramentas para melhor colaboração entre Agentes de IA. Esses benefícios proporcionam maior observabilidade e facilidade na resolução de problemas em sistemas de Agentes de IA.

Neste curso, exploraremos o framework AutoGen, baseado em pesquisa, e o framework Agent, pronto para produção, do Semantic Kernel.

## Lição Anterior

[Configuração do Curso](../00-course-setup/README.md)

## Próxima Lição

[Explorando Frameworks Agentes](../02-explore-agentic-frameworks/README.md)

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.