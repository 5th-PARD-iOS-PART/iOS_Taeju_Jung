// ✅ NavigationPath 적용 View2 리팩토링
import SwiftUI

struct View2: View {
    @Binding var senderAccount: MockData
    let receiverAccount: View1Data
    @Binding var amount: Int
    @Binding var path: NavigationPath

    @State private var inputAmount: Int = 0
    @State private var showExceededWarning: Bool = false

    let keypadButtons: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["00", "0", "⌫"]
    ]

    var body: some View {
        VStack {
            // 네비게이션 바
            VStack {
                TossButton()
                Spacer()
            }
            .padding(.top)

            // 본문 입력 뷰
            VStack(alignment: .leading, spacing: 20) {
                Text("내 \(senderAccount.KindOfAccount) 에서")
                    .font(.headline)
                Text("잔액 \(senderAccount.AccountBalance.formatted())원")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)

                Text("내 \(receiverAccount.UserName) 님으로")
                    .font(.headline)
                Text("\(receiverAccount.AccountNumber)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)

                Text("\(inputAmount.formatted())원")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if inputAmount > senderAccount.AccountBalance {
                    Text("잔액이 \(senderAccount.AccountBalance)원입니다.")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding()

            Button(action: {
                if inputAmount > senderAccount.AccountBalance {
                    showExceededWarning = true
                } else {
                    amount = inputAmount
                    path.append(2) // ✅ View3로 이동
                }
            }) {
                Text("다음")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top)

            // 키패드 입력 영역
            VStack(spacing: 16) {
                ForEach(keypadButtons, id: \.self) { row in
                    HStack(spacing: 24) {
                        ForEach(row, id: \.self) { value in
                            Button(action: {
                                handleTap(value)
                            }) {
                                Text(value)
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .frame(width: 80, height: 60)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }

    func handleTap(_ value: String) {
        showExceededWarning = false
        switch value {
        case "⌫":
            inputAmount /= 10
        default:
            if let number = Int(value) {
                inputAmount = inputAmount * (value == "00" ? 100 : 10) + number
            }
        }
    }
}

#Preview {
    @State var sender = MockData.sampleData[0][0]
    @State var amount = 0
    @State var path = NavigationPath()

    return View2(
        senderAccount: $sender,
        receiverAccount: View1Data.Data1[0][0],
        amount: $amount,
        path: $path
    )
}
