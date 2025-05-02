import SwiftUI

struct ShoppingView: View {
    @StateObject private var viewModel: ShoppingViewModel
    @State private var selectedCategory: ProductCategory?
    
    init(viewModel: ShoppingViewModel = ShoppingViewModel(),
         selectedCategory: ProductCategory? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _selectedCategory = State(initialValue: selectedCategory)
    }
    
    // 1) 탭별로 보여 줄 상품
    private var displayedProducts: [ShoppingData] {
        switch selectedCategory {
        case .deal:
            return viewModel.dealProducts
        case .food:
            return viewModel.foodProducts
        case .fashion:
            return viewModel.fashionProducts
        case .electronics:
            return viewModel.electronicsProducts
        case .beauty:
            return viewModel.beautyProducts
        case .none:
            return viewModel.allProducts
        }
    }
    
    // 2) 탭별 헤더 텍스트
    private var headerTitle: String {
        switch selectedCategory {
        case .deal:        return "특가"
        case .food:        return "식품"
        case .fashion:     return "의류"
        case .electronics: return "전자제품"
        case .beauty:      return "뷰티"
        case .none:        return "오늘의 상품"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 고정 상단 바: 상태바, 토스쇼핑, 카테고리 탭
                StatusBarView()
                    .padding(.bottom, 4)
                TossShopping()
                    .padding(.bottom, 2)
                CategoryTabBar(selectedCategory: $selectedCategory)
                    .padding(.vertical, 8)

                Divider()
                
                // 스크롤 가능한 컨텐츠
                ScrollView {
                    VStack(spacing: 24) {
                        // ● “모두” 탭에서만 프로모션 배너와 안내선 표시
                        if selectedCategory == nil {
                            PromotionBannerView(
                                title: "1천원대부터 고르는 국민간식",
                                subtitle: "삼립식품 초저가 구매하기",
                                images: ["danpat"]
                            )
                            .padding(.horizontal)
                            
                            HStack(alignment: .center, spacing: 8) {
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray.opacity(0.3))
                                Text("50초·스크롤 해야 시간이 줄어듭니다")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    .layoutPriority(1)
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray.opacity(0.3))
                            }
                            .padding(.horizontal)
                        }
                        
                        // 섹션 구성
                        if selectedCategory == nil {
                            // 1) 하루특가 섹션
                            Section(header:
                                HStack {
                                    Text("하루특가")
                                        .font(.title2).bold()
                                    Spacer()
                                    Button(action: { /* 전체보기 */ }) {
                                        HStack(spacing: 4) {
                                            Text("전체보기")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Image(systemName: "chevron.right")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            ) {
                                LazyVStack(spacing: 16) {
                                    ForEach(viewModel.dealProducts) { product in
                                        let timeText = viewModel.timeLeftText(for: product)
                                        ProductCardView(product: product, timeLeftText: timeText)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                            
                            // 2) 오늘의 상품 섹션
                            Section(header:
                                HStack {
                                    Text("오늘의 상품")
                                        .font(.title2).bold()
                                    Spacer()
                                    Text("AD")
                                        .font(.caption2)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(6)
                                }
                                .padding(.horizontal)
                            ) {
                                LazyVStack(spacing: 16) {
                                    ForEach(viewModel.allProducts.filter { !$0.isDailyDeal }) { product in
                                        let timeText = viewModel.timeLeftText(for: product)
                                        ProductCardView(product: product, timeLeftText: timeText)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        } else {
                            // 선택된 카테고리가 있을 때, 단일 섹션 (특가 포함)
                            Section(header:
                                HStack {
                                    Text(headerTitle)
                                        .font(.title2).bold()
                                    Spacer()
                                }
                                .padding(.horizontal)
                            ) {
                                LazyVStack(spacing: 16) {
                                    ForEach(displayedProducts) { product in
                                        let timeText = viewModel.timeLeftText(for: product)
                                        ProductCardView(product: product, timeLeftText: timeText)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 60) // 하단 탭바 자리
                    }
                    .padding(.top, 12)
                    .padding(.vertical)
                }
                .navigationBarHidden(true)
            }
        }
        .onAppear { viewModel.loadMockData() }
    }
}

#Preview {
    ShoppingView(
        viewModel: ShoppingViewModel(),
        selectedCategory: nil
    )
}
