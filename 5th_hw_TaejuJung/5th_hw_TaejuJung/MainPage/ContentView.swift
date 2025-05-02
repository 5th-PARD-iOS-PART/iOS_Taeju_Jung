import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case 0:
                    NavigationStack {
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
                                .listSectionSpacing(10)

                                Section {
                                    ForEach(Array(MockData.sampleData[1].enumerated()), id: \.offset) { index, account in
                                        AccountList(account: account, sectionIndex: 1)
                                    }
                                }

                                Section {
                                    ForEach(MockData.sampleData[2], id: \.id) { account in
                                        AccountList(account: account, sectionIndex: 2)
                                    }
                                }

                                Card()
                                Last()
                            }
                            .navigationBarTitleDisplayMode(.inline)
                        }
                    }

                case 1:
                    NavigationStack {
                        GoodView()
                    }

                case 2:
                    NavigationStack {
                        ShoppingView()
                    }

                case 3:
                    NavigationStack {
                        InvestingView()
                    }

                case 4:
                    NavigationStack {
                        MenuView()
                    }

                default:
                    Text("잘못된 탭 선택")
                }
            }

            MainTabMenu(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
