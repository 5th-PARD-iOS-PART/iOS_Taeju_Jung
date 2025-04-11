import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack {
            // 시간
            Text("15:15")
                .font(.system(size: 14))
                .fontWeight(.medium)
            
            Spacer()
            
            // 오른쪽 요소들
            HStack(spacing: 5) {
                Image(systemName: "cellularbars") // iOS 16+ 에서 지원
                Text("LTE")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                BatteryIconView(percentage: 76)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
    }
}


struct BatteryIconView: View {
    var percentage: Int = 76
    
    var body: some View {
        ZStack {
            // 좌우 배경 나누기
            HStack(spacing: 0) {
                Color.green
                    .frame(width: 28)
                Color.gray.opacity(0.4)
                    .frame(width: 12)
            }
            .frame(width: 40, height: 20)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            
            // 숫자 + 번개 아이콘
            HStack(spacing: 2) {
                Text("\(percentage)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                Image(systemName: "bolt.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
            }
            
        }
        .overlay(
            // 배터리 머리
            Capsule()
                .fill(Color.gray.opacity(0.6))
                .frame(width: 3, height: 8)
                .offset(x: 3),
            alignment: .trailing
        )
    }
}
#Preview {
    TopBar()
}
