import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var senderAccount = MockData.sampleData[0][0]
    @State private var amount: Int = 0

    let transactions: [AccountData] = AccountData.sampleTransactions
    var groupedTransactions: [(key: Date, value: [AccountData])] {
        Dictionary(grouping: transactions) { Calendar.current.startOfDay(for: $0.date) }
            .map { ($0.key, $0.value.sorted { $0.date > $1.date }) }
            .sorted { $0.key > $1.key }
    }

    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    BackButton()
                    ThreeBotton()
                    AccountInfo(account: senderAccount, path: $path)

                    List {
                        Section {
                            Color.gray.opacity(0.1).frame(height: 10)
                        }

                        Section {
                            FilterAndSearchBar().cornerRadius(12)
                        }

                        ForEach(groupedTransactions, id: \.key) { date, items in
                            Section(header: Text(date.monthDayString).font(.caption).foregroundColor(.gray)) {
                                ForEach(items) { item in
                                    TransactionRow(info: item)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(for: NavigationTarget.self) { destination in
                switch destination {
                case .view1:
                    View1(path: $path)

                case .view2(let receiver):
                    View2(
                        senderAccount: $senderAccount,
                        receiverAccount: receiver,
                        amount: $amount,
                        path: $path
                    )

                    case .view3(let receiver, let amount):
                        View3(
                            senderAccount: $senderAccount,
                            receiverAccount: receiver,
                            amount: amount, // ✅ 이제 Int 그대로 넘김
                            path: $path
                        )                }
            }
        }
    }
}

#Preview {
    ContentView()
}
