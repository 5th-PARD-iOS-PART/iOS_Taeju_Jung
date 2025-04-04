//import SwiftUI
//
//struct AccountTopBarView: View {
//    var balance: Int
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack {
//                Button(action: {
//                    // 뒤로가기 액션 추가
//                    print("뒤로가기 클릭됨")
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                }
//
//                Spacer()
//
//                Text("보통예금(IBK평생한가족통장)")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//
//                Spacer()
//
//                HStack(spacing: 16) {
//                    Image(systemName: "arrow.clockwise")
//                    Image(systemName: "gearshape")
//                }
//                .foregroundColor(.gray)
//                .font(.headline)
//            }
//
//            Text("IBK기업은행 65704249601019")
//                .font(.caption)
//                .foregroundColor(.gray)
//
//            Text("\(balance, format: .number)원") // 더 명확한 숫자 형식 지정
//                .font(.title2)
//                .bold()
//
//            Text("연 0.1%")
//                .font(.caption)
//                .foregroundColor(.gray)
//
//            Divider()
//        }
//        .padding()
//    }
//}
//#Preview {
//    AccountTopBarView(balance: 123456789)
//}