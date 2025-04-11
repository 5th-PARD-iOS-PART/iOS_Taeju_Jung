//
//  ContentView.swift
//  4th_HW4_TaejuJung
//
//  Created by 정태주 on 4/8/25.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        HStack {
           
            Image(systemName: "chevron.left")
                    
    
            Spacer()

            Text("통장관리")
                .font(.callout)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    BackButton()
}


