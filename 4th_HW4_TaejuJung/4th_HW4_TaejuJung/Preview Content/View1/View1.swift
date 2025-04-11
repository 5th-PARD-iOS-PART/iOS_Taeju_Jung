import SwiftUI

struct View1: View {
    @Binding var path: NavigationPath
    @Binding var selectedReceiver: View1Data?
    let myAccounts = View1Data.Data1[0]
    let recentAccounts = View1Data.Data1[1]
    @State private var selectedTab: SendTab = .account

    var body: some View {
        VStack(spacing: 16) {
            // 뒤로가기 + 타이틀
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

            // 탭 바
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

            // 검색 바
            HStack {
                Text("계좌번호입력")
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "camera")
                    .foregroundColor(.gray)
            }
            Divider()
                .padding()
                .cornerRadius(10)

            // 리스트 (계좌)
            List {
                Section(header: Text("내 계좌").font(.caption)) {
                    ForEach(myAccounts) { account in
                        Button {
                            selectedReceiver = account
                            DispatchQueue.main.async {
                                path.append(1)
                            }
                        } label: {
                            AccountRow(account: account)
                        }
                        .listRowSeparator(.hidden)
                    }
                }

                Section(header: Text("최근 보낸 계좌").font(.caption)) {
                    ForEach(recentAccounts) { account in
                        Button {
                            selectedReceiver = account
                            DispatchQueue.main.async {
                                path.append(1)
                            }
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

// MARK: - Preview
#Preview {
    @State var path = NavigationPath()
    @State var receiver: View1Data? = nil
    return View1(path: $path, selectedReceiver: $receiver)
}
