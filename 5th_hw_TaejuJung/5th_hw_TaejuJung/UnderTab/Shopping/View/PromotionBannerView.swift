//
//  PromotionBannerView.swift
//  5th_hw_TaejuJung
//
//  Created by 정태주 on 5/2/25.
//

import SwiftUI

struct PromotionBannerView: View {
  let title: String
  let subtitle: String
  let images: [String]   // Assets에 등록된 이미지 이름

  var body: some View {
    ZStack {
      Color(.systemGray6)
        .cornerRadius(12)

      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(title).font(.headline)
          Text(subtitle).font(.subheadline).foregroundColor(.gray)
        }
        Spacer()
        HStack(spacing: -20) {                // 겹쳐서 배치
          ForEach(images, id: \.self) { name in
            Image(name)
              .resizable()
              .scaledToFit()
              .frame(width: 60, height: 60)
              .cornerRadius(8)
          }
        }
      }
      .padding()
    }
    .frame(height: 100)
  }
}
