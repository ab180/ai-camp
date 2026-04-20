# Block 1: 도구별 설계 철학

> 이 블록은 도구 설계 철학 설명이므로 공식 문서 URL이 없습니다.

## EXPLAIN

도구마다 **데이터를 구조화하는 방식**이 다릅니다. 이 구조를 이해하면 AI가 더 정확하게 활용합니다.

### 맥락의 지도

| 카테고리 | 도구 | 핵심 설계 철학 | AI가 읽는 맥락 |
|---------|------|--------------|--------------|
| 소통 | **Slack** | 투명한 채널 기반 소통 | 채널=경계선, 스레드=깊이 |
| 소통 | **Gmail** | 정리하지 말고 검색하라 | 라벨=메타데이터, 스레드=기록 |
| 지식 | **Notion** | Everything is a Block | 블록=구조화 데이터, DB=쿼리 |
| 지식 | **Drive** | 파일 공유 + 공동 편집 | 축적된 산출물 아카이브 |
| 실행 | **Linear** | 애자일 방법론 구현 | 이슈=실행 상태 |
| 실행 | **Calendar** | 미래의 시간 자원 구조화 | 이벤트=미래의 구조 |

### 주요 도구 상세

**Slack — "투명한 채널 기반 소통"**
- 채널 메인 (1층) — 무엇이 논의되고 있는지 (스캔용)
- 스레드 (2층) — 왜 그렇게 결정됐는지 (깊이 분석용)
- AI 활용: "지난주 #product 채널 논의 요약해줘"

**Gmail — "Search, not Sort"**
- 라벨 = 다차원 메타데이터 (여러 축으로 검색)
- 검색 연산자 = AI가 직접 조합하는 구조화된 쿼리
- 스레드 = 의사결정 기록

**Notion — "Everything is a Block"**
- 블록 = 타입이 있는 구조화된 데이터
- 데이터베이스 = 필터 가능한 메타데이터
- Relations = 지식 그래프 (Meeting → Project → Team → OKR)

### Calendar의 특별함

> 다른 모든 도구는 과거와 현재를 담지만, Calendar만 **미래**를 담는다.
> → 크로스 도구 검색의 **시작점**이 된다.

## EXECUTE

**도구별 설계 철학을 체험해보세요.**

Claude에게 아래를 요청해보세요:

```
내가 주로 사용하는 도구가 Slack, Gmail, Notion, Calendar 중 어떤 것인지 알려주면,
그 도구에서 AI가 어떤 맥락을 읽을 수 있는지 설명해줘.
```

→ 자신이 쓰는 도구의 데이터 구조를 Claude와 대화하면서 이해해보세요.

## QUIZ

**Q1. Slack에서 AI가 맥락을 읽는 구조는?**

```json
{
  "questions": [{
    "question": "Slack에서 AI가 맥락을 읽는 구조는?",
    "header": "Q1",
    "options": [
      {"label": "파일과 폴더", "description": "파일 기반 구조?"},
      {"label": "채널(경계선)과 스레드(깊이)", "description": "채널과 스레드의 2계층"},
      {"label": "페이지와 블록", "description": "페이지 기반?"},
      {"label": "라벨과 필터", "description": "라벨 기반?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (채널과 스레드)
해설: Slack은 채널이 맥락의 경계선, 스레드가 맥락의 깊이를 나타냅니다.

**Q2. Gmail의 설계 철학 "Search, not Sort"가 의미하는 것은?**

```json
{
  "questions": [{
    "question": "Gmail의 설계 철학 'Search, not Sort'가 의미하는 것은?",
    "header": "Q2",
    "options": [
      {"label": "이메일을 정렬하라", "description": "정렬 중심?"},
      {"label": "폴더에 정리하지 말고 검색으로 찾으라", "description": "검색 중심 패러다임"},
      {"label": "이메일을 삭제하라", "description": "삭제 중심?"},
      {"label": "라벨을 사용하지 말라", "description": "라벨 무시?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (폴더에 정리하지 말고 검색으로 찾으라)
해설: Gmail은 용량을 늘려 "절대 삭제하지 마라, 검색으로 찾아라"라는 패러다임을 만들었습니다.

**Q3. 다른 도구와 달리 Calendar만 담고 있는 정보는?**

```json
{
  "questions": [{
    "question": "다른 도구와 달리 Calendar만 담고 있는 정보는?",
    "header": "Q3",
    "options": [
      {"label": "과거의 기록", "description": "과거 데이터?"},
      {"label": "현재의 상태", "description": "현재 상태?"},
      {"label": "미래의 구조", "description": "미래를 담는 유일한 도구"},
      {"label": "파일의 버전", "description": "버전 관리?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (미래의 구조)
해설: Calendar만 미래를 담으므로, 크로스 도구 검색의 시작점이 됩니다.
