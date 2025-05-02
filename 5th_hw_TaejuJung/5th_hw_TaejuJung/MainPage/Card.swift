import SwiftUI

extension Color {
    init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct Card: View {
    var body: some View {
        Section(header: Text("정태주님을 위해 준비했어요")
            .font(.headline)
            .foregroundColor(Color.black)
        ) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    CardItemView(title: "혜택 받는\n체크카드", imageName: "체크카드")
                    CardItemView(title: "내 카드보다\n혜택받기", imageName: "신용카드")
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
        .listSectionSpacing(10)
    }
}

struct CardItemView: View {
    let title: String
    let imageName: String

    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)

            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 28)
                .padding(.leading, 12)
        }
        .frame(maxWidth: .infinity, minHeight: 60)
        .background(Color(hex: "FFFFFF"))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
    }
}

#Preview{
    Card()
}
