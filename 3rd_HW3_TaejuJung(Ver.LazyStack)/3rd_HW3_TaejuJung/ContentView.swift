import SwiftUI

// HEX 컬러 지원 확장
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(hex: "#F0F0F0")
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(MockData.sampleData.indices, id: \.self) { sectionIndex in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("토스뱅크")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal,16)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                                  
                            ForEach(MockData.sampleData[sectionIndex]) { account in
                                HStack {
                                    Image(account.bankImageName)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .clipShape(Circle())

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(account.AccountBalance)원") // swiftUI는 Int 기본적으로 formatted()를 기본적으로 제공하기 때문에 금액 사이에 , 가 들어감.
                                            .font(.headline)
                                        Text(account.KindOfAccount)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()

                                    Button("송금") {
                                        print("송금 페이지로 이동")
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color(.systemGray5))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                }
                                .padding(.horizontal,16)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                            
                        }
                        .padding(.horizontal,12)
                        .padding(.vertical, 8)
                        .padding(.bottom, 20)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ContentView()
}
