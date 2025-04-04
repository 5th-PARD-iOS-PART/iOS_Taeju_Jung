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
                    .contentShape(Rectangle())
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
                        .allowsHitTesting(false)
                }
            }
            
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(10)
            .contentShape(Rectangle())
            .listRowSeparator(.hidden)
            .background(Color.red)
            
        }
        .contentShape(Rectangle())

        

    }
    
    struct ActionButton: View {
        let title: String
        var fontSize: Font = .body
        
        var body: some View {
            Button(action: {
                print("\(title) 버튼 클릭됨")
            }) {
                Text(title)
                    .font(fontSize)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray5))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .contentShape(Rectangle()) //
            }
            .buttonStyle(BorderlessButtonStyle()) 
        }
    }
}
#Preview {
    AccountList(account: MockData.sampleData[0][0], sectionIndex: 0)
}
