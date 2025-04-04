
import SwiftUI

struct AccountPage: View {
    let account: MockData

    var body: some View {
        VStack(spacing: 20) {
            Text("💳 \(account.KindOfAccount)")
                .font(.title2)
            Text("잔액: \(account.AccountBalance)")
                .font(.title3)
        }
        .navigationTitle("입출금 계좌")
        .padding()
    }
}
