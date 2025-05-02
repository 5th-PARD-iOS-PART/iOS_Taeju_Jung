import Foundation
import Combine

class ShoppingViewModel: ObservableObject {
    @Published var allProducts: [ShoppingData] = []
    
    private var timer: Timer?
    
    init() {
        loadMockData()  // 초기화 시 더미 데이터 로드
        startTimer()
    }
    
    // MARK: - 카테고리별 필터
    var dealProducts: [ShoppingData] {
        allProducts.filter { $0.category == .deal }
    }
    
    var foodProducts: [ShoppingData] {
        allProducts.filter { $0.category == .food }
    }
    
    var fashionProducts: [ShoppingData] {
        allProducts.filter { $0.category == .fashion }
    }
    
    var electronicsProducts: [ShoppingData] {
        allProducts.filter { $0.category == .electronics }
    }
    
    var beautyProducts: [ShoppingData] {
        allProducts.filter { $0.category == .beauty }
    }
    
    // MARK: - 더미 데이터 생성
    // 접근 제어자를 제거하여 View에서도 호출 가능
    func loadMockData() {
        allProducts = [
            // 하루특가 섹션 (deal)
            ShoppingData(
                imageName: "kiwi",
                title: "제스프리 루비레드키위 & 골드키위",
                subtitle: "[단독구매불가]압도적 당도",
                price: 2900,
                originalPrice: 5900,
                viewCount: 446_000,
                isLowestPriceGuaranteed: true,
                isFreeShipping: true,
                isDailyDeal: true,
                dealDeadline: Calendar.current.date(byAdding: .minute, value: 6, to: Date()),
                category: .deal,
                primePoints: 2000000
            ),
            ShoppingData(
                imageName: "protein",
                title: "프로틴 단백질 쉐이크 6종 x 2통",
                subtitle: "[보틀/파우치 증정]",
                price: 35900,
                originalPrice: 79800,
                viewCount: 933000,
                isLowestPriceGuaranteed: true,
                isFreeShipping: true,
                isDailyDeal: false,
                dealDeadline: nil,
                category: .food,
                primePoints: 2000000
            ),
            
            // 오늘의 상품 1 (식품)
            ShoppingData(
                imageName: "sparkle",
                title: "[오늘만] 스파클생수 500mL*60병 / 2L*24병",
                subtitle: "무료배송",
                price: 9900,
                originalPrice: 18000,
                viewCount: 549_000,
                isLowestPriceGuaranteed: false,
                isFreeShipping: true,
                isDailyDeal: false,
                dealDeadline: nil,
                category: .food,
                primePoints: 2000000
            ),
            
            // 오늘의 상품 2 (식품·하루특가)
            ShoppingData(
                imageName: "lemon",
                title: "[최초공개] 신품종 레몬 캔디 스테비아 방울토마토",
                subtitle: "[최초공개한정수량]",
                price: 6990,
                originalPrice: 12000,
                viewCount: 521_000,
                isLowestPriceGuaranteed: true,
                isFreeShipping: true,
                isDailyDeal: true,
                dealDeadline: nil,
                category: .food,
                primePoints: 2000000
            ),
            
            // 오늘의 상품 3 (뷰티)
            ShoppingData(
                imageName: "chamzone",
                title: "[단 하루 혜택] 참존 베스트 오일세럼 4종",
                subtitle: "[사은품 증정]",
                price: 12900,
                originalPrice: 40000,
                viewCount: 642_000,
                isLowestPriceGuaranteed: false,
                isFreeShipping: true,
                isDailyDeal: false,
                dealDeadline: nil,
                category: .beauty,
                primePoints: 2000000
            ),
            
            // 전자제품 예시
            ShoppingData(
                imageName: "airpods",
                title: "에어팟 프로 2세대",
                subtitle: "노이즈 캔슬링 무선 이어폰",
                price: 269000,
                originalPrice: 299000,
                viewCount: 832_000,
                isLowestPriceGuaranteed: false,
                isFreeShipping: true,
                isDailyDeal: false,
                dealDeadline: nil,
                category: .electronics,
                primePoints: 2000000
            ),
            ShoppingData(
                   imageName: "fashion",
                   title: "지피티가 만들어준 2025년을 강탈할 패션",
                   subtitle: "[베스트셀러]",
                   price: 35000,
                   originalPrice: 55000,
                   viewCount: 85_000,
                   isLowestPriceGuaranteed: true,
                   isFreeShipping: true,
                   isDailyDeal: false,
                   dealDeadline: nil,
                   category: .fashion,
                   primePoints: 2000000
               ),
        ]
    }
    
    // MARK: - 타이머
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.objectWillChange.send()
        }
    }
    
    func timeLeftText(for product: ShoppingData) -> String? {
        guard let deadline = product.dealDeadline else { return nil }
        let interval = deadline.timeIntervalSince(Date())
        if interval <= 0 { return "마감됨" }
        let hours = Int(interval) / 3600
        let minutes = (Int(interval) % 3600) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d:%02d 남음", hours, minutes, seconds)
    }
    
    deinit {
        timer?.invalidate()
    }
}

// MARK: - Computed Properties for UI formatting
extension ShoppingData {
    /// ex) 2,900원
    var formattedPrice: String {
        formatCurrency(price)
    }
    
    /// ex) 5,900원
    var formattedOriginalPrice: String {
        formatCurrency(originalPrice)
    }
    
    /// ex) "44.6만명이 구경함"
    var formattedViewCount: String {
        if viewCount >= 10_000 {
            return String(format: "%.1f만명이 구경함", Double(viewCount) / 10_000)
        } else {
            return "\(viewCount)명이 구경함"
        }
    }
    
    private func formatCurrency(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return (formatter.string(from: NSNumber(value: value)) ?? "\(value)") + "원"
    }
}
