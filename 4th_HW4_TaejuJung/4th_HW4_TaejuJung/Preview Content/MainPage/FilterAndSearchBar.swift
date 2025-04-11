//
//  ContentView.swift
//  4th_HW4_TaejuJung
//
//  Created by 정태주 on 4/8/25.
//

import SwiftUI

struct FilterAndSearchBar: View {
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                Text("전체")
                    .font(.caption)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.down")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 16) 
               .padding(.vertical, 10)
               .frame(maxWidth: .infinity)
               .background(Color.white)
               .cornerRadius(12)
    }
}
#Preview {
    FilterAndSearchBar()
}

/**
 제일 위의 바
 - 제일 오른쪽 시간 space() 주파수 LTE 베터리
 
 그 아래 바
 -  Image(systemname: "chevron.right " ) 버튼 space() 통장관리
 
아래 버튼
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
