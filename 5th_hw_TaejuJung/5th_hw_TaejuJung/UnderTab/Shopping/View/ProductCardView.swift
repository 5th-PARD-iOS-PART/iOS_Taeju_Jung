import SwiftUI

struct ProductCardView: View {
    let product: ShoppingData
    let timeLeftText: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // MARK: - 이미지 & 배지
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                
                HStack(spacing: 6) {
                    if let timeLeft = timeLeftText {
                        Text(timeLeft)
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(5)
                    }
                    if product.isLowestPriceGuaranteed {
                        Text("최저가보상+")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(Color.pink)
                            .cornerRadius(6)
                    }
                }
                .padding(.leading, 12)
                .padding(.top, 12)
            }
            
            // MARK: - 텍스트 정보
            Text(product.title)
                .font(.headline)
                .lineLimit(1)
            
            Text(product.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(1)
            
            // 가격 + 토스프라임 배지
            HStack(spacing: 6) {
                Text(product.formattedPrice)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(product.formattedOriginalPrice)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .strikethrough()
                
                // 토스프라임 적립 배지
                if product.primePoints > 0 {
                    HStack(spacing: 4) {
                        Image("TossPrime")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("토스프라임\(product.primePoints)원 적립")
                            .font(.caption2)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(6)
                }
            }
            
            // 조회수
            Text(product.formattedViewCount)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.top, 10)
        .padding([.horizontal, .bottom], 12)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ProductCardView(
        product: ShoppingData(
            imageName: "kiwi",
            title: "제스프리 루비레드키위 & 골드키위",
            subtitle: "[단독구매불가]압도적 당도",
            price: 2900,
            originalPrice: 5900,
            viewCount: 446000,
            isLowestPriceGuaranteed: true,
            isFreeShipping: true,
            isDailyDeal: true,
            dealDeadline: Calendar.current.date(byAdding: .minute, value: 6, to: Date()),
            category: .deal,
            primePoints: 2513
        ),
        timeLeftText: "00:05:19 남음"
    )
    .previewLayout(.sizeThatFits)
    .padding()
}
