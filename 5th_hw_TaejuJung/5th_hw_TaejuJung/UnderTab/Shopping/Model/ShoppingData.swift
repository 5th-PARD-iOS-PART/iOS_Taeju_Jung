// Model/ShoppingData.swift

import Foundation

enum ProductCategory: String, CaseIterable {
    case deal = "특가"
    case food = "식품"
    case fashion = "의류"
    case electronics = "전자제품"
    case beauty = "뷰티"
}

struct ShoppingData: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let price: Int
    let originalPrice: Int
    let viewCount: Int
    let isLowestPriceGuaranteed: Bool
    let isFreeShipping: Bool
    let isDailyDeal: Bool
    let dealDeadline: Date?
    let category: ProductCategory
    let primePoints: Int
}
