import SwiftUI

struct MainTabMenu: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            Spacer()
            tabItem(icon: "house", label: "홈", tag: 0)
            Spacer()
            tabItem(icon: "gift", label: "혜택", tag: 1)
            Spacer()
            tabItem(icon: "bag", label: "쇼핑", tag: 2)
            Spacer()
            tabItem(icon: "chart.bar", label: "투자", tag: 3)
            Spacer()
            tabItem(icon: "ellipsis", label: "전체", tag: 4)
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
    }

    func tabItem(icon: String, label: String, tag: Int) -> some View {
        let isSelected = selectedTab == tag
        let iconName = isSelected ? icon + ".fill" : icon

        return VStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: 20))
            Text(label)
                .font(.caption2)
        }
        .foregroundColor(isSelected ? .blue : .gray) // ✅ 여기서만 컬러 적용
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = tag
            }
        }
    }
}
