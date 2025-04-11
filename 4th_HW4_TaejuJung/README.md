


<img width="335" alt="스크린샷 2025-04-11 22 00 37" src="https://github.com/user-attachments/assets/2a91e3bc-61b9-42f4-bbda-15ac24044d1a" />
<img width="274" alt="스크린샷 2025-04-11 22 00 50" src="https://github.com/user-attachments/assets/2b5914c3-d8c2-4c53-8315-73187bb862d5" />
<img width="307" alt="스크린샷 2025-04-11 22 00 58" src="https://github.com/user-attachments/assets/7f443b63-896c-4bb6-aad1-7e579b3c0c85" />
<img width="312" alt="스크린샷 2025-04-11 22 01 11" src="https://github.com/user-attachments/assets/ba82dc9a-0430-4265-b631-98180306bbb1" />
<img width="328" alt="스크린샷 2025-04-11 22 01 20" src="https://github.com/user-attachments/assets/dbd8de35-d9a1-4f6a-a373-4b364d970cb3" />
<img width="280" alt="스크린샷 2025-04-11 22 01 33" src="https://github.com/user-attachments/assets/3a253a86-92b2-4964-978e-46a589c32139" />


이 프로젝트는 SwiftUI의 `NavigationStack`과 `NavigationPath`를 기반으로 토스(Toss) 앱 스타일의 송금 인터페이스를 구현한 예제입니다.  
직관적인 화면 흐름과 enum 기반 라우팅 구조를 도입해 **안정적이고 확장 가능한 화면 전환과 데이터 전달**을 목표로 설계되었습니다.

---

## 프로젝트 목표

- SwiftUI의 최신 라우팅 시스템(`NavigationStack`, `NavigationPath`) 학습 및 적용
- 화면 전환 시 **데이터 전달을 안정적으로 관리하는 방법** 구현
- 실제 송금 UI 플로우에 가까운 사용자 경험 제공
- 확장 가능하고 버그에 강한 구조 설계

---

## 핵심 기술

- `NavigationStack`, `NavigationPath`: View 간 전환과 경로 추적
- `enum NavigationTarget`: 각 화면에 대한 타입 기반 라우팅
- 상태 전달을 위한 `@State`, `@Binding`
- List/Section을 이용한 날짜 기반 거래 내역 UI
- 사용자 정의 컴포넌트(`AccountInfo`, `AccountRow`, `TransactionRow`)를 통한 View 분리

---

## 화면 구성

### 1. `ContentView.swift`

- 홈 화면 역할
- 계좌 정보, 거래 내역 표시
- `NavigationPath`를 통해 다음 화면으로 이동하는 시작점
- `.navigationDestination(for: NavigationTarget.self)`을 이용한 라우팅 처리

### 2. `View1.swift`

- 송금 대상 계좌 선택 화면
- 내 계좌 / 최근 보낸 계좌 리스트로 구성
- 선택 시 `.view2(account)` enum 값을 path에 append하여 View2로 이동

### 3. `View2.swift`

- 금액 입력 화면
- 키패드를 이용한 송금 금액 입력
- 유효성 검사 후 `.view3(account, amount)`으로 이동

### 4. `View3.swift`

- 송금 확인 화면
- 금액과 계좌 정보 확인 후 잔액 차감
- `path.removeLast(path.count)`를 통해 루트로 복귀

---

## NavigationTarget Enum

```swift
enum NavigationTarget: Hashable {
    case view1
    case view2(View1Data)
    case view3(View1Data, Int)
}
