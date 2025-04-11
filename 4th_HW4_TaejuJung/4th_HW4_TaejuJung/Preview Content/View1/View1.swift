import SwiftUI

struct View1: View {
    @Binding var path: NavigationPath
    let myAccounts = View1Data.Data1[0]
    let recentAccounts = View1Data.Data1[1]
    @State private var selectedTab: SendTab = .account

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: {
                    path.removeLast()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.top)

            Text("어디로 돈을 보낼까요?")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 0) {
                ForEach(SendTab.allCases, id: \.self) { tab in
                    Button(action: { selectedTab = tab }) {
                        Text(tab.rawValue)
                            .font(.subheadline)
                            .foregroundColor(selectedTab == tab ? .black : .gray)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(selectedTab == tab ? Color.white : Color.clear)
                    }
                }
            }
            .padding(4)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 10))

            HStack {
                Text("계좌번호입력")
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            Divider().padding()

            List {
                Section(header: Text("내 계좌").font(.caption)) {
                    ForEach(myAccounts) { account in
                        Button {
                            path.append(NavigationTarget.view2(account))
                        } label: {
                            AccountRow(account: account)
                        }
                        .listRowSeparator(.hidden)
                    }
                }

                Section(header: Text("최근 보낸 계좌").font(.caption)) {
                    ForEach(recentAccounts) { account in
                        Button {
                            path.append(NavigationTarget.view2(account))
                        } label: {
                            AccountRow(account: account)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}

enum SendTab: String, CaseIterable {
    case account = "계좌"
    case contact = "연락처"
}

#Preview {
    @State var path = NavigationPath()
    View1(path: $path)
}
