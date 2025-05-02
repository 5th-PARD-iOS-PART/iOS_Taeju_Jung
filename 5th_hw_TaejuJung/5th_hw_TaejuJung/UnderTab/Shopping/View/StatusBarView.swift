//
//  MockStatusBarView.swift
//  5th_hw_TaejuJung
//
//  Created by 정태주 on 5/2/25.
//

import SwiftUI

struct StatusBarView: View {
    var body: some View {
        HStack {
            Text("23:53")
                .fontWeight(.medium)

            Spacer()

            HStack(spacing: 6) {
                Image(systemName: "chart.bar.fill")
                Text("5G")
                Image(systemName: "battery.25")
            }
        }
        .font(.caption)
        .padding(.horizontal, 12)
        .padding(.top, 6)
        .padding(.bottom, 2)
        .background(Color.white)
    }
}

#Preview {
    StatusBarView()
}
