import SwiftUI

struct View3: View {
    @Binding var senderAccount: MockData
    let receiverAccount: View1Data
    let amount: Int  // ✅ 더 이상 Binding 아님
    @Binding var path: NavigationPath
    
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
                    path.removeLast(path.count)
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
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

#Preview {
    @State var sender = MockData.sampleData[0][0]
    @State var path = NavigationPath()

    return View3(
        senderAccount: $sender,
        receiverAccount: View1Data.Data1[0][0],
        amount: 1000, // ✅ 이제 그냥 값 넘기면 됨
        path: $path
    )
}
