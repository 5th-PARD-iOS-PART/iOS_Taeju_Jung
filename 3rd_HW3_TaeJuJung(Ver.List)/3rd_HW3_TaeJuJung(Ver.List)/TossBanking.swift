import SwiftUI

struct BankingHeaderSection: View {
    var body: some View {
        Section {
            HStack {
                Text("토스뱅킹")
                    .font(.headline)
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .listSectionSpacing(10)
    }
}

#Preview {
    BankingHeaderSection()
}
