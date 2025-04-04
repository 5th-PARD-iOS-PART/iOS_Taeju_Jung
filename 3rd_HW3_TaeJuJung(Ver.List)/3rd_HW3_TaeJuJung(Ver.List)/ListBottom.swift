import SwiftUI

struct ListBottom: View {
    let items: [String] = ["대출", "증권", "계좌", "전체"]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(items.indices, id: \.self) { i in
                if i > 0 {
                    Divider()
                }
                Text(items[i])
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.vertical, 8)
    }
}
#Preview {
    ListBottom()
}
