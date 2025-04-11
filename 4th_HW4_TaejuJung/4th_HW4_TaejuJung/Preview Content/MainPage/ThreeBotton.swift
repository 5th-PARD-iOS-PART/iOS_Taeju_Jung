//
//  ContentView.swift
//  4th_HW4_TaejuJung
//
//  Created by 정태주 on 4/8/25.
//

import SwiftUI

struct ThreeBotton: View {
    @State private var selectedTab = 0
    let tabs = ["통장", "내 토스뱅크", "상품찾기"]

    var body: some View {
        HStack(spacing: 40) {
            ForEach(tabs.indices, id: \.self) { index in
                Button(action: { selectedTab = index }) {
                    VStack(spacing: 4) {
                        Text(tabs[index])
                            .font(.system(size: 14))
                            .fontWeight(selectedTab == index ? .semibold : .regular)
                            .foregroundColor(selectedTab == index ? .black : .gray)

                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(selectedTab == index ? .gray : .clear)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}

#Preview {
    ThreeBotton()
}

/**
 제일 위의 바 TopBar()
 - 제일 오른쪽 시간 space() 주파수 LTE 베터리
 
 그 아래 바 BackButton()
 -  Image(systemname: "chevron.right " ) 버튼 space() 통장관리
 
아래 버튼 ThreeButton
- 통장 / 내 토스뱅크 / 상품찾기
 - Divider()
 
 List {
    section {
 토스뱅크 계좌 번호
 계좌 잔액
 채우기 버튼  | 보내기 버튼
Hstack{
 번개 사진
 VStack{
    어제까지 쌓인 이자 받기
    114원 지금 받기
    }
 }
  Image(systemname: "chevron.right " )
 }
 section{
    HStack{
    전체
    Image(systemName: "chevron.right ")
    space()
 Image(systemName: " magnifyingglass")
 }
 }
}
 */
