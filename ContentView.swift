
import SwiftUI

struct ContentView: View {
    @State private var shouldShowAlert: Bool = false
    var body: some View {
       
        ZStack{
            Color(red: 144 / 255, green: 0 / 255, blue: 32 / 255)
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        Image("Plane")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                        
                        Image("Obey")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                        
                        Image("Monkey")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                        
                        Image("Queen")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, iOS Part")
                        .font(.title)
                    Image("Me")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                    Text("🔥정태주🔥")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("#PARD 5th \n #iOS \n#SwiftUI")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                    HStack{
                        Button("MBTI"){
                            print("MBTI 버튼이 클릭됨")
                            shouldShowAlert = true
                        }
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .cornerRadius(20)
                        .alert("정태주에 관한 정보", isPresented: $shouldShowAlert) {
                            Button("cancel", role: .cancel) {}
                        }
                        message: {Text("INFJ")}
                        
                            .padding(30)
                        
                        Button("더 알아보기"){
                            print("더보기 버튼이 클릭됨")
                            shouldShowAlert = true
                        }
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.red)
                        .cornerRadius(20)
                        .alert("정태주에 관한 정보", isPresented: $shouldShowAlert) {
                            Button("cancel", role: .cancel) {}
                        }
                        message: {Text("21학번 24살입니다\n한 학기 잘부탁드려요")}
                    }
                    
                }
            }
            
            
        }.ignoresSafeArea()
        
      
        
       
    }
}

#Preview {
    ContentView()
}
