//import SwiftUI
//
//struct AccountPage: View {
//        let transactions: [AccountInfor]
//    
//        private var groupedTransactions: [(key: Date, value: [AccountInfor])] {
//            Dictionary(grouping: transactions) { Calendar.current.startOfDay(for: $0.date) }
//                .map { ($0.key, $0.value.sorted { $0.date > $1.date }) }
//                .sorted { $0.key > $1.key }
//        }
//    
//    var body: some View {
//        VStack(spacing: 0) {
//                        AccountTopBarView(balance: transactions.first?.balanceAfter ?? 0)
//            
//                        TransactionListView(groupedTransactions: groupedTransactions)
//            
//                        AccountBottomBarView()
//            Text("Hello, World!")
//                .font(.title)
//                    }
//           
//        
//    }
//}
//
//#Preview {
//    //AccountPage(transactions: sampleTransactions)
//    AccountPage(transactions: [])
//    
//}

import SwiftUI
struct AccountPage: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
            
        }
    }
}

#Preview {
    AccountPage()
}
