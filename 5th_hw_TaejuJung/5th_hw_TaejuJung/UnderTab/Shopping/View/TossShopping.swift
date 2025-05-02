//
//  TossShoppinh.swift
//  5th_hw_TaejuJung
//
//  Created by 정태주 on 5/2/25.
//

import SwiftUI

struct TossShopping: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("토스쇼핑")
                    .font(.title2)
                    .bold()

                Spacer()

                HStack(spacing: 16) {
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "person")
                    Image(systemName: "cart")
                }
                .font(.title3)
                .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 6)
            .padding(.bottom, 12)
            .background(Color.white)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .ignoresSafeArea(edges: .top) // 상태바 영역까지 확장
    }
}
