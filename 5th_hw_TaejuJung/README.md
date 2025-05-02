# 5th_hw_TaejuJung

📱 **토스 스타일 iOS UI 구현 과제**  
본 프로젝트는 SwiftUI를 활용하여 실제 토스 앱의 주요 화면을 MVVM 패턴 기반으로 재현한 개인 과제입니다.

---

## 📦 프로젝트 구조

```
5th_hw_TaejuJung/
├── AccountInfo/              # 계좌 관련 정보 및 상세 페이지
│   ├── AccountData.swift
│   ├── AccountList.swift
│   ├── AccountPage.swift
│   └── TabMenu.swift
├── MainPage/                 # 메인 계좌 화면 구성
│   ├── Card.swift
│   ├── ContentView.swift
│   ├── Last.swift
│   ├── ListBottom.swift
│   ├── MockData.swift
│   ├── TopTab.swift
│   └── TossBanking.swift
├── UnderTab/                 # 하단 탭 구현
│   └── Shopping/             
│       ├── Model/
│       ├── View/
│       └── ViewModel/
│           ├── ShoppingViewModel.swift
│           └── TimeFormatter.swift
├── GoodView.swift
├── HomeView.swift
├── InvestingView.swift
├── MainTabMenu.swift
├── MenuView.swift
├── _5th_hw_TaejuJungApp.swift
├── Assets/
├── Preview Content/
├── 5th_hw_TaejuJungTests/
└── 5th_hw_TaejuJungUITests/
```

---

## 🧩 주요 기능

- **계좌 목록 페이지**
  - 계좌별 잔액 및 은행명 표시
  - 실제 앱처럼 Section 별로 구분된 UI

- **계좌 상세 페이지**
  - 날짜별 입출금 내역 표시
  - 커스텀 네비게이션 바, 고정 탭 구현

- **송금 UI**
  - 금액 입력, 계좌 선택, 메모 기능

- **쇼핑 탭 (탭뷰)**
  - 특가, 식품, 뷰티 뷰 전환
  - MVVM 패턴 기반 뷰모델 연결

---

## 🛠️ 사용 기술

- SwiftUI  
- MVVM Architecture  
- Custom TabView  
- Static Mock Data  
- Git & GitHub  

---

## 📸 미리보기
<img width="408" alt="스크린샷 2025-05-02 17 17 27" src="https://github.com/user-attachments/assets/1ac810cf-31d1-4d07-9749-f496daad8369" />
<img width="434" alt="스크린샷 2025-05-02 17 17 59" src="https://github.com/user-attachments/assets/8fb871ce-3adb-49c4-8b31-0f0514bc53fe" />
<img width="471" alt="스크린샷 2025-05-02 17 18 20" src="https://github.com/user-attachments/assets/2d15b93b-576d-4adb-ae03-2adde0ac23c3" />
<img width="410" alt="스크린샷 2025-05-02 17 18 37" src="https://github.com/user-attachments/assets/cd068ffc-316e-4a28-a21b-f6cc6cd06a89" />
<img width="408" alt="스크린샷 2025-05-02 17 18 46" src="https://github.com/user-attachments/assets/c88844ca-d2b3-4fb1-89bc-33769eae3afd" />
<img width="471" alt="스크린샷 2025-05-02 17 19 06" src="https://github.com/user-attachments/assets/dd5116f4-f5a8-468b-acfd-f8cb5ab4d38d" />



