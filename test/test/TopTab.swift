import SwiftUI

struct TopTab: View {
    var body: some View {
        HStack {
            Image(systemName: "doc.text")
            Text("할 일")
                .font(.headline)
                .padding(.leading, 8)
            Image(systemName: "chevron.right")
            Spacer()
            Image(systemName: "creditcard")
            Image(systemName: "bell.fill")
                .padding(.trailing, 16)
        }
        .frame(height: 60)
        .background(Color.white)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopTab()
}
