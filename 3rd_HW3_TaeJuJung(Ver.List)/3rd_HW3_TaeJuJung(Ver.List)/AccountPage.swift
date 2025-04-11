import SwiftUI

struct AccountPage: View {
    @Environment(\.dismiss) private var dismiss

    let account: MockData
    let transactions: [AccountData] = AccountData.sampleTransactions

    var groupedTransactions: [(key: Date, value: [AccountData])] {
        Dictionary(grouping: transactions) { Calendar.current.startOfDay(for: $0.date) }
            .map { ($0.key, $0.value.sorted { $0.date > $1.date }) }
            .sorted { $0.key > $1.key }
    }

    var body: some View {
        VStack(spacing: 0) {
            AccountTopBarView(onBack: { dismiss() })
            TabSelectorView()

            List {
                AccountInfoSectionView(account: account)
                    .listRowSeparator(.hidden)

                
                Section {
                    VStack(spacing: 0) {
                        Color.gray.opacity(0.06)
                            .frame(height: 10)

                        FilterAndSearchBar()
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(Color.white)
                    }
                    .listRowInsets(EdgeInsets()) 
                    .listRowSeparator(.hidden)
                }

                // 거래 내역
                ForEach(groupedTransactions, id: \.key) { date, items in
                    Section(header:
                        Text(date.monthDayString)
                            .font(.caption)
                            .foregroundColor(.gray)
                    ) {
                        ForEach(items) { item in
                            TransactionRow(info: item)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - 상단 앱바
struct AccountTopBarView: View {
    var onBack: () -> Void

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundColor(.black)
            }

            Spacer()

            Text("통장관리")
                .font(.callout)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

// MARK: - 상단 탭 메뉴
struct TabSelectorView: View {
    @State private var selectedTab = 0
    let tabs = ["통장", "내 토스뱅크", "상품찾기"]

    var body: some View {
        HStack(spacing: 40) {
            ForEach(tabs.indices, id: \.self) { index in
                Button(action: { selectedTab = index }) {
                    VStack(spacing: 4) {
                        Text(tabs[index])
                            .font(.system(size: 14))
                            .fontWeight(selectedTab == index ? .semibold : .regular)
                            .foregroundColor(selectedTab == index ? .black : .gray)

                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(selectedTab == index ? .gray : .clear)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}

// MARK: - 회색 상자 + 필터 & 검색바
struct FilterAndSearchBar: View {
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                Text("전체")
                    .font(.caption)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
    }
}

// MARK: - 계좌 정보 뷰
struct AccountInfoSectionView: View {
    var account: MockData

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("토스뱅크 1000-9047-0710")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.black)
                    Text("카드")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(16)
            }

            HStack {
                Text("\(account.AccountBalance.formatted())원")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            HStack(spacing: 16) {
                Button("채우기") {}
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(12)

                Button("보내기") {}
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 32, height: 32)
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("어제까지 쌓인 이자")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    HStack(spacing: 4) {
                        Text("114원 지급받기")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .underline()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

// MARK: - 트랜잭션 셀
struct TransactionRow: View {
    let info: AccountData

    var body: some View {
        HStack {
            Image(info.AccountName)
            VStack(alignment: .leading, spacing: 4) {
                Text(info.title)
                    .font(.subheadline)
                Text(info.date, style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                Text("\(info.amount < 0 ? "" : "+")\(info.amount.formatted())원")
                    .foregroundColor(info.amount < 0 ? .primary : .blue)
                    .font(.subheadline)
                    .bold()
                Text("\(info.balanceAfter.formatted())원")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 6)
    }
}

// MARK: - 미리보기
#Preview {
    AccountPage(account: MockData.sampleData[0][0])
}
