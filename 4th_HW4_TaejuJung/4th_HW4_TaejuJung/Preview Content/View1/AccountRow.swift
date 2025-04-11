import SwiftUI
struct AccountRow: View {
    let account: View1Data

    var body: some View {
        HStack {
            Image(account.bankImageName)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(account.UserName)
                    .font(.body)
                Text(account.AccountNumber)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            if account.isFavorited {
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    AccountRow(account: View1Data.Data1[0][0])
}
