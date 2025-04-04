import SwiftUI

struct UnderTab: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            Spacer()
            tab(icon: "house", label: "홈", tag: 0)
            Spacer()
            tab(icon: "gift", label: "혜택", tag: 1)
            Spacer()
            tab(icon: "bag", label: "쇼핑", tag: 2)
            Spacer()
            tab(icon: "chart.bar", label: "증권", tag: 3)
            Spacer()
            tab(icon: "ellipsis", label: "전체", tag: 4)
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
        .frame(height: 60)
    }

    func tab(icon: String, label: String, tag: Int) -> some View {
        VStack {
            Image(systemName: icon)
            Text(label).font(.caption)
        }
        .foregroundColor(selectedTab == tag ? .blue : .gray)
        .onTapGesture {
            selectedTab = tag
        }
    }
}

#Preview {
        UnderTab(selectedTab: .constant(0))
            .padding()
            .background(Color.gray.opacity(0.2))
    
    
}
