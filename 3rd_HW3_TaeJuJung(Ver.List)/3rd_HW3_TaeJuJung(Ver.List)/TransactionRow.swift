//import SwiftUI
//
//struct TransactionRow: View {
//    let info: AccountInfor
//
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 4) {
//                Text(info.title)
//                    .font(.subheadline)
//                Text(info.date, style: .time)
//                    .font(.caption2)
//                    .foregroundColor(.gray)
//            }
//
//            Spacer()
//
//            VStack(alignment: .trailing, spacing: 2) {
//                Text("\(info.amount < 0 ? "" : "+")\(info.amount.formatted())원")
//                    .foregroundColor(info.amount < 0 ? .primary : .blue)
//                    .font(.subheadline)
//                    .bold()
//                Text("\(info.balanceAfter.formatted())원")
//                    .font(.caption2)
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding(.vertical, 6)
//    }
//}
