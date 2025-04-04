//
//  ContentView.swift
//  3rd_HW3_TaeJuJung(Ver.List)
//
//  Created by 정태주 on 4/3/25.
//

import SwiftUI
extension Color {
    init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
struct ContentView: View {
    @State private var selectedTab: Int = 1
    var body: some View {
        VStack {
            TopTab()
            List{
                Section(){
                    HStack{
                        Text("토스뱅킹")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .listSectionSpacing(10)
                ForEach(MockData.sampleData.indices, id: \.self) { sectionIndex in
                    Section(){
                        ForEach(MockData.sampleData[sectionIndex]) { account in
                            HStack {
                                
                                Image(account.bankImageName)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    if sectionIndex == 2 {
                                        Text("\(account.AccountBalance)점")
                                            .font(.headline)
                                    }
                                    else {
                                        Text("\(account.AccountBalance)원") // swiftUI는 Int 기본적으로 formatted()를 기본적으로 제공하기 때문에 금액 사이에 , 가 들어감.
                                            .font(.headline)
                                    }
                                    Text(account.KindOfAccount)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Group{
                                    if sectionIndex == 0 {
                                        Button("송금") {
                                            print("송금 페이지로 이동")
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color(.systemGray5))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                        
                                    }
                                    else if sectionIndex == 2 {
                                        Button("확인하기") {
                                            print("확인 페이지로 이동")
                                        }
                                        .font(.caption)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color(.systemGray5))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                    }
                                    else {
                                        // 동일한 크기의 투명 버튼 (디자인 유지용)
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 64, height: 36) // 기존 버튼 크기와 맞춰줘야 함
                                    }
                                }
                                
                                
                                
                            }
                            .listRowSeparator(.hidden) // list 줄 제거
                            .padding(.horizontal,16)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(10)
                            
                        }
                        if sectionIndex == 0 {
                            HStack(spacing: 0){
                                Group{
                                    Text("대출")
                                    Divider()
                                    Text("증권")
                                    Divider()
                                    Text("계좌")
                                    Divider()
                                    Text("전체")
                                }
                                .font(.caption)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                                
                            }
                            
                        }
                        if sectionIndex == 2{
                            HStack(spacing: 0){
                                Group{
                                    Text("계좌개설")
                                    Divider()
                                    Text("카드발급")
                                    Divider()
                                    Text("대출받기")
                                }
                                .font(.caption)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .listSectionSpacing(10)
                }
                Section(header: Text("정태주님을 위해 준비했어요")
                    .font(.headline)
                    .foregroundColor(Color.black)
                ) {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack(spacing: 12) {
                            // 체크카드
                            HStack {
                                Text("혜택 받는\n체크카드")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                
                                Image("체크카드")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 28)
                                    .padding(.leading, 12)
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color(hex: "FFFFFF"))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
                            
                            // 신용카드
                            HStack {
                                Text("내 카드보다\n혜택받기")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                
                                Image("신용카드")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 28)
                                    .padding(.leading, 12)
                                
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color(hex: "FFFFFF"))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
                        }
                    }
                    .frame(maxWidth: .infinity) // ✅ 이 줄을 추가!
                    .padding(.vertical, 8)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listSectionSpacing(10)
                Section {
                    HStack{
                        Image("영수증")
                        Text("현금영수증")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack{
                        Image("card")
                        Text("토스신용카드")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack{
                        Image("계산기")
                        Text("차량 보험 보기")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
               
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}



#Preview {
    ContentView()
}
