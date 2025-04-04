import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationView { // NavigationView는 여기 한 번만 사용
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    VStack {
                        TopTab()
                        List {
                            TossBanking()
                            Section {
                                ForEach(MockData.sampleData[0], id: \.id) { account in
                                    NavigationLink(destination: AccountPage(account: account)) {
                                        AccountList(account: account, sectionIndex: 0)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                ListBottom()
                            }
                            .listSectionSpacing(10) // 아래 여백 추가
                            
                            // 섹션 1
                            Section {
                                ForEach(Array(MockData.sampleData[1].enumerated()), id: \.offset) { index, account in
                                    AccountList(account: account, sectionIndex: 1)
                                }
                            }
                            
                            // 섹션 2
                            Section {
                                ForEach(MockData.sampleData[2], id: \.id) { account in
                                    AccountList(account: account, sectionIndex: 2)
                                }
                            }
                            Card()
                            Last()
                        }
                    }
                    .tag(0)
                    
                    // 다른 탭들
                    GoodView()
                        .tag(1)
                    ShoppingView()
                        .tag(2)
                    InvestingView()
                        .tag(3)
                    MenuView()
                        .tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                // 하단 탭
                HStack {
                    Spacer()
                    tabItem(icon: "house", label: "홈", tag: 0)
                    Spacer()
                    tabItem(icon: "gift", label: "혜택", tag: 1)
                    Spacer()
                    tabItem(icon: "bag", label: "쇼핑", tag: 2)
                    Spacer()
                    tabItem(icon: "chart.bar", label: "증권", tag: 3)
                    Spacer()
                    tabItem(icon: "ellipsis", label: "전체", tag: 4)
                    Spacer()
                }
                .padding(.vertical, 8)
                .background(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
                .frame(height: 60)
            }
        }
    }
    
    // TabItem 함수
    func tabItem(icon: String, label: String, tag: Int) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
            Text(label)
                .font(.caption2)
        }
        .foregroundColor(selectedTab == tag ? .blue : .gray)
        .onTapGesture {
            selectedTab = tag
        }
    }
}

#Preview {
    ContentView()
}
