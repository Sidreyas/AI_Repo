<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7622aa72f9e676e593339f5f694ecd7d",
  "translation_date": "2025-05-20T08:35:47+00:00",
  "source_file": "05-agentic-rag/README.md",
  "language_code": "ko"
}
-->
[![Agentic RAG](../../../translated_images/lesson-5-thumbnail.1bab9551989766fa0dbea97c250a68c41e0f36ed9b02d3aa8ee8fdcc62596981.ko.png)](https://youtu.be/WcjAARvdL7I?si=BCgwjwFb2yCkEhR9)

> _(위 이미지를 클릭하면 이번 강의 영상을 볼 수 있습니다)_

# Agentic RAG

이 강의에서는 Agentic Retrieval-Augmented Generation(Agentic RAG)에 대해 포괄적으로 다룹니다. 이는 대형 언어 모델(LLM)이 외부 소스에서 정보를 끌어오면서 다음 단계를 자율적으로 계획하는 새로운 AI 패러다임입니다. 정적인 검색 후 읽기 방식과 달리, Agentic RAG는 LLM에 반복적으로 호출을 하며 도구나 함수 호출, 구조화된 출력을 중간중간 포함합니다. 시스템은 결과를 평가하고, 쿼리를 다듬으며, 필요 시 추가 도구를 호출하고, 만족스러운 해결책이 나올 때까지 이 과정을 반복합니다.

## 소개

이번 강의에서는 다음 내용을 다룹니다

- **Agentic RAG 이해하기:** 대형 언어 모델(LLM)이 외부 데이터 소스에서 정보를 가져오면서 다음 단계를 자율적으로 계획하는 AI의 새로운 패러다임을 배웁니다.
- **반복적인 메이커-체커 스타일 파악:** 도구나 함수 호출과 구조화된 출력을 포함한 LLM에 대한 반복 호출 루프를 이해하여 정확성을 높이고 잘못된 쿼리를 처리하는 방법을 익힙니다.
- **실용적 적용 사례 탐색:** Agentic RAG가 빛을 발하는 상황, 예를 들어 정확성이 중요한 환경, 복잡한 데이터베이스 상호작용, 확장된 워크플로우를 확인합니다.

## 학습 목표

이 강의를 마치면 다음을 이해하거나 할 수 있습니다:

- **Agentic RAG 이해:** 대형 언어 모델(LLM)이 외부 데이터 소스에서 정보를 가져오면서 자율적으로 다음 단계를 계획하는 새로운 AI 패러다임을 배웁니다.
- **반복적인 메이커-체커 스타일:** 도구나 함수 호출과 구조화된 출력을 포함한 LLM에 대한 반복 호출 루프 개념을 익혀 정확성 향상과 잘못된 쿼리 처리를 이해합니다.
- **추론 과정 주도:** 사전에 정의된 경로에 의존하지 않고 문제 접근 방식을 결정하는 시스템의 자율적 추론 능력을 이해합니다.
- **워크플로우:** 에이전트 모델이 시장 동향 보고서를 독자적으로 조회하고, 경쟁사 데이터를 식별하며, 내부 판매 지표를 연관시키고, 결과를 종합해 전략을 평가하는 과정을 이해합니다.
- **반복 루프, 도구 통합, 메모리:** 상태와 메모리를 유지하며 반복 루프를 피하고 정보에 기반한 결정을 내리는 시스템의 상호작용 패턴을 배웁니다.
- **실패 모드 처리 및 자기 수정:** 반복적 재질의, 진단 도구 사용, 인간 감독에 의존하는 강력한 자기 수정 메커니즘을 탐구합니다.
- **에이전시의 한계:** 도메인별 자율성, 인프라 의존성, 가드레일 준수 등 Agentic RAG의 한계를 이해합니다.
- **실용 사례와 가치:** 정확성 우선 환경, 복잡한 데이터베이스 상호작용, 확장된 워크플로우 등에서의 활용 사례를 확인합니다.
- **거버넌스, 투명성, 신뢰:** 설명 가능한 추론, 편향 제어, 인간 감독 등 거버넌스와 투명성의 중요성을 배웁니다.

## Agentic RAG란?

Agentic Retrieval-Augmented Generation(Agentic RAG)은 대형 언어 모델(LLM)이 외부 소스에서 정보를 가져오면서 다음 단계를 자율적으로 계획하는 새로운 AI 패러다임입니다. 정적인 검색 후 읽기 방식과 달리, Agentic RAG는 LLM에 반복 호출을 하며 도구나 함수 호출과 구조화된 출력을 포함합니다. 시스템은 결과를 평가하고 쿼리를 다듬으며, 필요 시 추가 도구를 호출하고, 만족스러운 해결책이 나올 때까지 이 과정을 반복합니다. 이 반복적인 “메이커-체커” 스타일은 정확성을 높이고 잘못된 쿼리를 처리하며 고품질 결과를 보장합니다.

시스템은 추론 과정을 적극적으로 주도하며 실패한 쿼리를 다시 작성하고, 다른 검색 방법을 선택하며, Azure AI Search의 벡터 검색, SQL 데이터베이스, 맞춤 API 등 여러 도구를 통합하여 최종 답변을 완성합니다. 에이전트 시스템의 핵심 특징은 스스로 추론 과정을 주도하는 능력입니다. 기존 RAG는 사전에 정의된 경로에 의존하지만, 에이전트 시스템은 찾은 정보의 품질에 따라 단계 순서를 자율적으로 결정합니다.

## Agentic Retrieval-Augmented Generation (Agentic RAG) 정의

Agentic Retrieval-Augmented Generation(Agentic RAG)은 LLM이 외부 데이터 소스에서 정보를 가져올 뿐만 아니라 다음 단계를 자율적으로 계획하는 AI 개발의 새로운 패러다임입니다. 정적인 검색 후 읽기 방식이나 신중하게 스크립트화된 프롬프트 시퀀스와 달리, Agentic RAG는 LLM에 반복 호출을 하며 도구나 함수 호출과 구조화된 출력을 포함하는 루프를 가집니다. 매 단계마다 시스템은 얻은 결과를 평가하고, 쿼리를 다듬을지 결정하며, 필요 시 추가 도구를 호출하고, 만족스러운 해결책이 나올 때까지 이 과정을 반복합니다.

이 반복적인 “메이커-체커” 스타일은 정확성을 높이고, 구조화된 데이터베이스(NL2SQL 등)에서 잘못된 쿼리를 처리하며, 균형 잡히고 고품질의 결과를 보장하도록 설계되었습니다. 단순히 정교한 프롬프트 체인에만 의존하는 대신, 시스템은 추론 과정을 적극적으로 주도합니다. 실패한 쿼리를 다시 작성하고, 다른 검색 방법을 선택하며, Azure AI Search의 벡터 검색, SQL 데이터베이스, 맞춤 API 등 여러 도구를 통합해 답변을 완성합니다. 이로 인해 지나치게 복잡한 오케스트레이션 프레임워크가 필요 없으며, “LLM 호출 → 도구 사용 → LLM 호출 → …”의 비교적 단순한 루프만으로도 정교하고 근거 있는 출력을 만들어냅니다.

![Agentic RAG Core Loop](../../../translated_images/agentic-rag-core-loop.2224925a913fb3439f518bda61a40096ddf6aa432a11c9b5bba8d0d625e47b79.ko.png)

## 추론 과정 주도하기

시스템을 “에이전틱”하게 만드는 핵심은 추론 과정을 스스로 주도하는 능력입니다. 기존 RAG는 모델이 무엇을 언제 검색할지 사전에 사람이 정의한 경로(사고 사슬)에 의존하는 경우가 많습니다.  
하지만 진정한 에이전트 시스템은 내부적으로 문제 접근 방식을 스스로 결정합니다. 단순히 스크립트를 실행하는 것이 아니라, 찾은 정보의 품질에 따라 단계 순서를 자율적으로 판단합니다.  
예를 들어, 제품 출시 전략을 수립하라는 요청을 받으면, 전체 조사와 의사결정 워크플로우를 명확히 설명하는 프롬프트에만 의존하지 않고, 에이전트 모델은 다음을 독립적으로 결정합니다:

1. Bing Web Grounding을 통해 최신 시장 동향 보고서 조회  
2. Azure AI Search를 활용해 관련 경쟁사 데이터 식별  
3. Azure SQL Database를 이용해 과거 내부 판매 지표 연관 분석  
4. Azure OpenAI Service를 통해 결과를 통합해 일관된 전략 수립  
5. 전략의 허점이나 불일치 여부 평가, 필요 시 추가 조회 반복  

이 모든 단계—쿼리 다듬기, 출처 선택, 답변에 만족할 때까지 반복—는 사람이 미리 스크립트화하지 않고 모델이 스스로 결정합니다.

## 반복 루프, 도구 통합, 메모리

![Tool Integration Architecture](../../../translated_images/tool-integration.7b05a923e3278bf1fd2972faa228fb2ac725f166ed084362b031a24bffd26287.ko.png)

에이전트 시스템은 반복되는 상호작용 패턴에 의존합니다:

- **초기 호출:** 사용자의 목표(즉, 사용자 프롬프트)가 LLM에 전달됩니다.  
- **도구 호출:** 모델이 정보가 부족하거나 지시가 모호하다고 판단하면, 벡터 데이터베이스 쿼리(예: Azure AI Search의 하이브리드 검색)나 구조화된 SQL 호출 같은 도구나 검색 방법을 선택해 추가 정보를 수집합니다.  
- **평가 및 다듬기:** 반환된 데이터를 검토한 후, 정보가 충분한지 판단합니다. 부족하다면 쿼리를 다듬거나 다른 도구를 시도하거나 접근 방식을 조정합니다.  
- **만족할 때까지 반복:** 이 과정을 모델이 최종적으로 명확하고 근거 있는 답변을 제공할 때까지 계속합니다.  
- **메모리 및 상태 유지:** 시스템은 단계별 상태와 메모리를 유지해 이전 시도와 결과를 기억하며, 반복 루프를 피하고 더 현명한 결정을 내립니다.

시간이 지나면서 이해도가 점진적으로 발전해, 사람이 지속적으로 개입하거나 프롬프트를 재구성하지 않아도 복잡하고 다단계 작업을 수행할 수 있게 됩니다.

## 실패 모드 처리 및 자기 수정

Agentic RAG의 자율성은 강력한 자기 수정 메커니즘도 포함합니다. 시스템이 막다른 길에 부딪히거나(예: 관련 없는 문서 검색, 잘못된 쿼리) 실패할 때는 다음을 수행할 수 있습니다:

- **반복 및 재질의:** 낮은 가치의 응답을 반환하는 대신, 새로운 검색 전략을 시도하거나 데이터베이스 쿼리를 다시 작성하거나 대체 데이터 세트를 살펴봅니다.  
- **진단 도구 사용:** 추론 단계를 디버그하거나 검색 데이터의 정확성을 확인하는 데 도움이 되는 추가 기능을 호출할 수 있습니다. Azure AI Tracing 같은 도구는 견고한 관찰성과 모니터링을 가능하게 합니다.  
- **인간 감독에 의존:** 고위험 상황이나 반복 실패 시, 불확실성을 표시하고 인간의 지도를 요청할 수 있습니다. 인간이 교정 피드백을 제공하면, 모델은 이를 학습해 이후에 반영합니다.

이 반복적이고 동적인 접근법 덕분에 모델은 단발성 시스템이 아니라, 세션 중 실수를 통해 계속 학습하고 개선하는 시스템이 됩니다.

![Self Correction Mechanism](../../../translated_images/self-correction.3d42c31baf4a476bb89313cec58efb196b0e97959c04d7439cc23d27ef1242ac.ko.png)

## 에이전시의 한계

작업 내에서 자율적이지만, Agentic RAG는 범용 인공지능(AGI)과는 다릅니다. 에이전틱 능력은 인간 개발자가 제공한 도구, 데이터 소스, 정책에 국한됩니다. 스스로 도구를 만들거나 설정된 도메인 경계를 벗어날 수 없습니다. 대신 주어진 자원을 동적으로 조율하는 데 탁월합니다.  
더 발전된 AI 형태와의 주요 차이점은 다음과 같습니다:

1. **도메인 특화 자율성:** Agentic RAG 시스템은 알려진 도메인 내에서 사용자 정의 목표를 달성하는 데 집중하며, 쿼리 재작성이나 도구 선택 같은 전략을 사용해 결과를 개선합니다.  
2. **인프라 의존성:** 시스템 능력은 개발자가 통합한 도구와 데이터에 의존하며, 인간 개입 없이는 이 한계를 넘어설 수 없습니다.  
3. **가드레일 존중:** 윤리 지침, 준수 규칙, 비즈니스 정책이 매우 중요하며, 에이전트의 자유는 안전 조치와 감독 메커니즘에 의해 항상 제한됩니다(희망컨대).

## 실용적 사용 사례 및 가치

Agentic RAG는 반복적인 개선과 정밀함이 요구되는 상황에서 빛을 발합니다:

1. **정확성 우선 환경:** 컴플라이언스 점검, 규제 분석, 법률 조사 등에서 에이전트 모델은 사실을 반복 검증하고 여러 출처를 참조하며 쿼리를 다시 작성해 철저히 검증된 답변을 만듭니다.  
2. **복잡한 데이터베이스 상호작용:** 쿼리가 자주 실패하거나 조정이 필요한 구조화된 데이터 처리 시, 시스템은 Azure SQL 또는 Microsoft Fabric OneLake를 이용해 쿼리를 자율적으로 다듬어 최종 검색 결과가 사용자 의도에 부합하도록 합니다.  
3. **확장된 워크플로우:** 장기 세션에서 새로운 정보가 나타나면 Agentic RAG는 계속해서 데이터를 통합하고 문제 영역에 대해 더 많이 학습하며 전략을 조정합니다.

## 거버넌스, 투명성, 신뢰

이러한 시스템이 추론에서 점점 더 자율적이 됨에 따라, 거버넌스와 투명성이 매우 중요해집니다:

- **설명 가능한 추론:** 모델은 수행한 쿼리, 참조한 출처, 결론에 이르기까지의 추론 단계를 감사 추적할 수 있습니다. Azure AI Content Safety, Azure AI Tracing / GenAIOps 같은 도구가 투명성을 유지하고 위험을 완화하는 데 도움을 줍니다.  
- **편향 제어 및 균형 잡힌 검색:** 개발자는 균형 잡히고 대표성 있는 데이터 소스를 고려하도록 검색 전략을 조정할 수 있으며, Azure Machine Learning을 사용하는 고급 데이터 과학 조직을 위해 맞춤형 모델로 편향이나 왜곡 패턴을 정기적으로 감사합니다.  
- **인간 감독 및 준수:** 민감한 작업에서는 인간 검토가 필수적입니다. Agentic RAG는 고위험 의사결정에서 인간 판단을 대체하지 않고, 더 철저히 검증된 옵션을 제공해 보조합니다.

행동 기록을 명확히 제공하는 도구가 반드시 필요합니다. 그렇지 않으면 다단계 프로세스 디버깅이 매우 어렵습니다. 다음은 Literal AI(Chainlit 배후 회사)의 Agent 실행 예시입니다:

![AgentRunExample](../../../translated_images/AgentRunExample.27e2df23ad898772d1b3e7a3e3cd4615378e10dfda87ae8f06b4748bf8eea97d.ko.png)

![AgentRunExample2](../../../translated_images/AgentRunExample2.c0e8c78b1f2540a641515e60035abcc6a9c5e3688bae143eb6c559dd37cdee9f.ko.png)

## 결론

Agentic RAG는 AI 시스템이 복잡하고 데이터 집약적인 작업을 처리하는 자연스러운 진화입니다. 반복되는 상호작용 패턴을 채택하고, 도구를 자율적으로 선택하며, 쿼리를 다듬어 고품질 결과를 얻을 때까지 계속하는 이 시스템은 정적인 프롬프트 따르기를 넘어서 더 적응적이고 상황 인지적인 의사결정자가 됩니다. 인간이 정의한 인프라와 윤리 지침에 제한받지만, 이러한 에이전틱 능력은 기업과 최종 사용자 모두에게 더 풍부하고 역동적이며 궁극적으로 더 유용한 AI 상호작용을 가능하게 합니다.

## 추가 자료

- <a href="https://learn.microsoft.com/training/modules/use-own-data-azure-openai" target="_blank">Azure OpenAI Service로 Retrieval Augmented Generation(RAG) 구현하기: Azure OpenAI Service에서 자신의 데이터를 사용하는 방법을 배울 수 있는 Microsoft Learn 모듈입니다.</a>
- <a href="https://learn.microsoft.com/azure/ai-studio/concepts/evaluation-approach-gen-ai" target="_blank">Azure AI Foundry를 이용한 생성 AI 애플리케이션 평가: 공개 데이터셋에서 모델 평가 및 비교, Agentic AI 애플리케이션과 RAG 아키텍처를 다룹니다.</a>
- <a href="https://weaviate.io/blog/what-is-agentic-rag" target="_blank">Agentic RAG란? | Weaviate</a>
- <a href="https://ragaboutit.com/agentic-rag-a-complete-guide-to-agent-based-retrieval-augmented-generation/" target="_blank">Agentic RAG: 에이전트 기반 Retrieval Augmented Generation 완전 가이드 – generation RAG 뉴스</a>
- <a href="https://huggingface.co/learn/cookbook/agent_rag" target="_blank">Agentic RAG: 쿼리 재작성과 자기 질의를 통해 RAG 가속하기! Hugging Face 오픈소스 AI 요리책</a>
- <a href="https://youtu.be/aQ4yQXeB1Ss?si=2HUqBzHoeB5tR04U" target="_blank">Agentic 레이어를 RAG에 추가하기</a>
- <a href="https://www.youtube.com/watch?v=zeAyuLc_f3Q&t=244s" target="_blank">지식 비서의 미래: Jerry Liu</a>
- <a href="https://www.youtube.com/watch?v=AOSjiXP1jmQ" target="_blank">Agentic RAG 시스템 구축 방법</a>
- <a href="https://ignite.microsoft.com/sessions/BRK102?source=sessions" target="_blank">Azure AI Foundry Agent Service를 사용해 AI 에이전트 확장하기</a>

### 학술 논문

- <a href="https://arxiv.org/abs/2303.17651" target="_blank">2303.17651 Self-Refine: Iterative Refinement with Self-Feedback</a>
- <a href="https://arxiv.org/abs/2303.11366" target="_blank">2303.11366 Reflexion: Language Agents with Verbal Reinforcement Learning</a>
- <a href="https://arxiv.org/abs/2305.11738" target="_blank">2305.11738 CRITIC: Large Language Models Can Self-Correct with Tool-Interactive Critiquing</a>
- <a href="https://arxiv.org/abs/2501.09136" target="_blank">2501.09136 Agentic Retrieval-Augmented Generation: A Survey on Agentic RAG</a>

## 이전 강의

[Tool Use Design Pattern](../04-tool-use/README.md)

## 다음 강의

[Building Trustworthy AI Agents](../06-building-trust

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문은 해당 언어의 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 책임을 지지 않습니다.