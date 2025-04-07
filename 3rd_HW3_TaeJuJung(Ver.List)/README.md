## 3rd_HW3_TaejuJung
Toss Clone Cording



<img width="356" alt="스크린샷 2025-04-07 23 39 25" src="https://github.com/user-attachments/assets/730b4676-5aa8-447a-a02e-259f56bb0d50" />
<img width="390" alt="스크린샷 2025-04-07 23 38 58" src="https://github.com/user-attachments/assets/d139318c-fd79-4f46-bb54-d7856e0fbb2b" />

### 홈 화면 (TabView)
- TabView를 써서 화면을 5개로 나눔. (홈, 혜택, 쇼핑, 증권, 전체)
- 그 중에 홈 화면에만 계좌 리스트가 들어 있고, 나머지는 아직 내용 없음.
- 홈 화면 안에는 상단 탭처럼 보이는 뷰(Toptab)랑 계좌 목록이 있고, 그 아래에는 토스뱅크나 기타 안내 같은 영역도 있음.

### 계좌 상세 페이지
- 홈 화면에서 계좌 하나를 누르면 상세 화면으로 넘어감.
- 날짜별로 거래 내역을 Section으로 나눠서 보여주고, 거래 금액이 양수면 파란색으로, 아니면 기본 텍스트 색으로 나눴음.
- 시간, 거래명, 잔액 등도 같이 보여줌.

## 데이터 구조

### MockData.swift
- 홈 화면에 나오는 계좌 정보들
- 섹션별로 구분된 2차원 배열 형태
- 계좌 이름, 잔액, 은행 이름이 들어가 있음.

### AccountData.swift
- 각 계좌의 입출금 내역
- 날짜, 시간, 거래처, 금액, 잔액 포함
- 날짜별로 묶어서 리스트에 Section으로 표현할 수 있게 만들었음.
