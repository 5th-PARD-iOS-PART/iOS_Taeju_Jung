// ✅ NavigationPath 적용 View3 리팩토링
import SwiftUI

struct View3: View {
    @Binding var senderAccount: MockData
    let receiverAccount: View1Data
    @Binding var amount: Int
    @Binding var path: NavigationPath  // ✅ NavigationPath 바인딩으로 수정

    var body: some View {
        VStack(spacing: 32) {
            // 네비게이션 바
            TossButton()
                .navigationBarBackButtonHidden(true)

            // 메인 텍스트
            VStack(spacing: 4) {
                Text("내 \(receiverAccount.UserName)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("으로")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("\(amount.formatted())원을")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("옮길까요?")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.top)

            // 정보 요약
            VStack(spacing: 12) {
                HStack {
                    Text("받는 분에게 표시")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(receiverAccount.UserName)
                        .font(.caption)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                HStack {
                    Text("출금 계좌")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("내 \(senderAccount.KindOfAccount)")
                        .font(.caption)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                HStack {
                    Text("입금 계좌")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(receiverAccount.AccountNumber)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)

            // 옮기기 버튼
            Button(action: {
                if senderAccount.AccountBalance >= amount {
                    senderAccount.AccountBalance -= amount
                    amount = 0
                    path.removeLast(path.count)  // ✅ ContentView로 복귀
                }
            }) {
                Text("옮기기")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Text("평생수수료 무료")
                .font(.caption)
                .foregroundColor(.gray)

            Spacer()
        }
       // .navigationTitle("송금 확인")
        .navigationBarHidden(true)
    }
}

#Preview {
    @State var sender = MockData.sampleData[0][0]
    @State var amount = 1000
    @State var path = NavigationPath()

    return View3(
        senderAccount: $sender,
        receiverAccount: View1Data.Data1[0][0],
        amount: $amount,
        path: $path
    )
}
