//
//  ContentView.swift
//  3rd_HW3_TaejuJung
//
//  Created by 정태주 on 4/3/25.
//
import SwiftUI

struct TopTab: View {
    @Binding var selectedTab: Int

    var body: some View {
        Picker("TopTab", selection: $selectedTab) {
            Text("전체").tag(0)
            Text("인기").tag(1)
            Text("최신").tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .background(Color.white)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}
