//
//  View2.swift
//  4th_HW4_TaejuJung
//
//  Created by 정태주 on 4/9/25.
//

import SwiftUI
struct TossButton: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                       
                    }
                    Spacer()
                        .frame(width: 130)
                    Text("토스뱅킹송금")
                        .font(.callout)
                        .foregroundColor(Color.gray.opacity(1))
                    Spacer()
                }
                .padding()
                
            }
            
        
    }
    
}
#Preview {
    TossButton()
}
