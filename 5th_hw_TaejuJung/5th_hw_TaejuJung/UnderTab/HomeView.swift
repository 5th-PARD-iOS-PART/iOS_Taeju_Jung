import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    @State private var navigateToContentView = false

    var body: some View {
        NavigationStack(path: $path) {
            Text("잠시만 기다려 주세요...") // 필요 시 로딩 문구
            
                .onAppear {
                    // 뷰가 등장하면 자동으로 push
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        navigateToContentView = true
                    }
                }
                .navigationDestination(isPresented: $navigateToContentView) {
                    ContentView()
                }
        }
    }
}
#Preview {
    HomeView()
}