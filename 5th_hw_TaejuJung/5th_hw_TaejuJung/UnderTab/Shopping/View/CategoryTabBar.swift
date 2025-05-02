import SwiftUI

struct CategoryTabBar: View {
    @Binding var selectedCategory: ProductCategory?
    @Namespace private var underlineNS

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                makeTab("모두", nil)
                ForEach(ProductCategory.allCases, id: \.self) { cat in
                    makeTab(cat.rawValue, cat)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.white)
        }
    }
    
    @ViewBuilder
    private func makeTab(_ title: String, _ tag: ProductCategory?) -> some View {
        let isSel = (selectedCategory == tag)
        Button {
            withAnimation(.spring()) {
                selectedCategory = tag
            }
        } label: {
            Text(title)
                .font(.callout)
                .fontWeight(isSel ? .semibold : .regular)
                .foregroundColor(isSel ? .primary : .gray)
                .fixedSize()
                .padding(.bottom, 4)     // 언더라인 공간 확보
                .overlay(alignment: .bottom) {
                    if isSel {
                        Rectangle()
                            .fill(tag == nil ? Color.black : Color.blue)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "underline", in: underlineNS)
                    }
                }
        }
    }
}

#Preview {
    CategoryTabBar(selectedCategory: .constant(nil))
        .previewLayout(.sizeThatFits)
}
