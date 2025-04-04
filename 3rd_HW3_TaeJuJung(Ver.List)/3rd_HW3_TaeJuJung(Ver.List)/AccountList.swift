import SwiftUI

struct AccountList: View {
    let account: MockData
    let sectionIndex: Int
    
    var body: some View {
        HStack {
            Image(account.bankImageName)
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if sectionIndex == 2 {
                    Text("\(account.AccountBalance)점")
                        .font(.headline)
                } else {
                    Text("\(account.AccountBalance)원")
                        .font(.headline)
                }
                Text(account.KindOfAccount)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Group {
                if sectionIndex == 0 {
                    ActionButton(title: "송금")
                } else if sectionIndex == 2 {
                    ActionButton(title: "확인하기", fontSize: .caption)
                } else {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 64, height: 36)
                        .allowsHitTesting(false) // ✅ 터치 방해 제거
                }
            }
            .onTapGesture {
                print("Tapped")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(10)
            .listRowSeparator(.hidden)
            .contentShape(Rectangle()) // ✅ 셀 전체 터치 영역 지정
            .onTapGesture {
                print("셀이 눌렸습니다.") // 테스트용
            }
        }
    }
    
    struct ActionButton: View {
        let title: String
        var fontSize: Font = .body
        
        var body: some View {
            Button(action: {
                print("\(title) 버튼 클릭됨11")
            }) {
                Text(title)
                    .font(fontSize)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray5))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .buttonStyle(BorderlessButtonStyle()) // 버튼만 따로 반응
        }
    }
}
#Preview {
    
    AccountList(account: MockData.sampleData[0][0], sectionIndex: 0)
}
