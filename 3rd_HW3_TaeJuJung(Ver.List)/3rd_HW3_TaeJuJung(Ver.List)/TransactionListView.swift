//import SwiftUI
//
//struct TransactionListView: View {
//    let groupedTransactions: [(key: Date, value: [AccountInfor])]
//
//    var body: some View {
//        List {
//            ForEach(groupedTransactions, id: \..key) { date, items in
//                Section(header: EmptyView()) {
//                    ForEach(items) { item in
//                        TransactionRow(info: item)
//                    }
//                }
//            }
//        }
//        .listStyle(.plain)
//    }
//}
