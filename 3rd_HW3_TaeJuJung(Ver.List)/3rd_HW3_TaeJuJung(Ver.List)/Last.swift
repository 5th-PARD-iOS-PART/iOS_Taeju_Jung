import SwiftUI

struct Last: View {
    var body: some View {
        Section {
            MenuRow(imageName: "영수증", title: "현금영수증")
            MenuRow(imageName: "card", title: "토스신용카드")
            MenuRow(imageName: "계산기", title: "차량 보험 보기")
        }
    }
}

struct MenuRow: View {
    let imageName: String
    let title: String

    var body: some View {
        HStack {
            Image(imageName)
            Text(title)
                .font(.subheadline)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}
