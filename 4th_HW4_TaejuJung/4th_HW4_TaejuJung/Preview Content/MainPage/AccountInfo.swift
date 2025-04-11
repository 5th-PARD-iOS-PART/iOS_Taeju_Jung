import SwiftUI

struct AccountInfo: View {
    var account: MockData
    @Binding var path: NavigationPath  // ✅ NavigationTarget 기반이어야 함

    var body: some View {
        VStack(spacing: 12) {
            // 상단 계좌 정보
            HStack {
                Text("토스뱅크 1000-9047-0710")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.black)
                    Text("카드")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.gray.opacity(0.15))
                .cornerRadius(16)
            }

            // 잔액
            HStack {
                Text("\(account.AccountBalance.formatted())원")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            // 버튼 영역
            HStack(spacing: 16) {
                Button("채우기") {}
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(12)

                Button(action: {
                    path.append(NavigationTarget.view1)  // ✅ enum 기반으로 수정
                }) {
                    Text("보내기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }

            // 이자 안내
            HStack(alignment: .center, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 32, height: 32)
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("어제까지 쌓인 이자")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    HStack(spacing: 4) {
                        Text("114원 지급받기")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .underline()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    @State var path = NavigationPath()
    AccountInfo(account: MockData.sampleData[0][0], path: $path)
}
