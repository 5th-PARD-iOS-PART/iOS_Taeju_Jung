import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var senderAccount = MockData.sampleData[0][0]
    @State private var selectedReceiver: View1Data? = nil
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
                        .listRowSeparator(.hidden)
                        .background(Color.white)
                    ThreeBotton()
                        .background(Color.white)

                    AccountInfo(account: senderAccount, path: $path)
                        .listRowSeparator(.hidden)

                    List {
                        Section {
                            Color.gray.opacity(0.1)
                                .frame(height: 10)
                                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                                .listRowSeparator(.hidden)
                        }

                        Section {
                            FilterAndSearchBar()
                                .cornerRadius(12)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        }

                        ForEach(groupedTransactions, id: \.key) { date, items in
                            Section(header:
                                Text(date.monthDayString)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 5)
                            ) {
                                ForEach(items) { item in
                                    TransactionRow(info: item)
                                        .padding(.horizontal, 16)
                                        .listRowSeparator(.hidden)
                                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(for: Int.self) { value in
                if value == 0 {
                    View1(path: $path, selectedReceiver: $selectedReceiver)
                } else if value == 1, let receiver = selectedReceiver {
                    View2(
                        senderAccount: $senderAccount,
                        receiverAccount: receiver,
                        amount: $amount,
                        path: $path
                    )
                } else if value == 2, let receiver = selectedReceiver {
                    View3(
                        senderAccount: $senderAccount,
                        receiverAccount: receiver,
                        amount: $amount,
                        path: $path
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
