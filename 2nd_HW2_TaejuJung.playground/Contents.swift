//
//  ContentView.swift
//  2st_HW2_TaejuJung
//
//  Created by 정태주 on 3/28/25.
//

import SwiftUI
import Foundation




// ---------- Mark : if문  ----------------
//문제 1: if 문
//문자열 변수 fruit이 "apple", "banana", "cherry" 중 하나일 때, 해당하는 과일을 출력하세요.
//var fruit = "apple" // 이 값을 "banana"나 "cherry"로 바꿔보세요.

// ---------- Mark : if문 답안 작성란  ----------------
    func main(){
        var fruit = "banana"
        //let fruit = ["apple", "banana", "cherry"]
        if ["apple", "banana", "cherry"].contains(fruit) {
            print(fruit)
        }
    
    }
    
        main()
  
    
    // ---------- Mark : guard문  ----------------
    //문제 2: guard 문
    //함수 printPositiveNumber를 작성하세요. 이 함수는 하나의 정수 인자를 받아, 그 값이 양수일 경우에만 그 값을 출력합니다. 만약 값이 양수가 아니라면, "The number is not positive."를 출력합니다.
    //
    //func printPositiveNumber(_ number: Int) {
    //}
    //
    //printPositiveNumber(5)  // 5를 출력해야 함
    //printPositiveNumber(-3) // "The number is not positive." 출력해야 함
    
    
    // ---------- Mark : guard문 답안 작성란 ----------------
    
    func printPositiveNumber(_ number: Int) {
        guard number < 0 else {
            print(number)
            return
        }
        print("The number is not positive.")
    }
    printPositiveNumber(5)
    printPositiveNumber(-3)
    
    // ---------- Mark : enum 연관값  ----------------
    
    //문제 1: 연관값 사용하기
    //"책(Book)", "비디오(Video)", "음악(Music)" 등의 미디어 아이템을 나타내는 열거형을 작성하세요. 각 아이템에는 타이틀(title)이라는 연관값을 부여합니다.
    
    // ---------- Mark : enum 연관값 답안 작성란 ----------------
    
    enum MediaItem {
    case book(title: String)
    case video(title: String)
    case music(title: String)
    }
    let myBook: MediaItem = .book(title: "Harry Potter and the Sorcerer's Stone")
    print("\(myBook)")
    
    // ---------- Mark : enum 원시값 ----------------
    
    //문제 2: 원시값 사용하기
    //열거형을 사용해 주중(sunday to saturday)을 나타내세요. 각 요일에는 1부터 7까지의 원시값을 부여합니다.
    
    // ---------- Mark : enum 원시값 답안 작성란 ----------------
    
    enum DayOfWeek: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    }
    let today: DayOfWeek = .sunday
    print("\(today)")

    let day1 = DayOfWeek(rawValue: 1)
    let day2 = DayOfWeek(rawValue: 2)
    let day5 = DayOfWeek(rawValue: 5)
    let day7 = DayOfWeek(rawValue: 7)
    let dayInvalid = DayOfWeek(rawValue: 0)

    print("\(day1 ?? .sunday)")      
    print("\(day2 ?? .sunday)")      
    print("\(day5 ?? .sunday)")      
    print("\(day7 ?? .sunday)")      
    print("\(dayInvalid ?? .sunday)")
    
    
    // ---------- Mark : function overloading  ----------------
    
    //문제 1: 함수 오버로딩 (Overloading)
    //printArea라는 함수를 작성해보세요. 이 함수는 사각형의 가로와 세로 길이를 받아 면적을 출력하고, 또 다른 버전의 함수는 원의 반지름을 받아 면적을 출력합니다.
    
    
    // ---------- Mark : function overloading 답안 작성란 ----------------
    //
    func printArea(width: Double, height: Double) {
        print("사각형의 면적: \(width * height)")
    }
    func printArea(radius: Double) {
    print("원의 면적: \(Double.pi * radius * radius)")
    }

printArea(radius: 5)
printArea(width: 10, height: 20)
    
    // ---------- Mark : function If문사용 / guard문 사용  ----------------
    
    //문제: 로그인 상태 확인
    //함수 checkLoginStatus를 작성해보세요. 이 함수는 로그인 상태를 나타내는 Bool 변수와 사용자 이름을 나타내는 String? 변수를 받습니다. 만약 로그인 상태가 true이면 사용자 이름을 출력하고, false이면 "로그인이 필요합니다."를 출력하세요. 사용자 이름이 nil이라면 "알 수 없는 사용자"를 출력하세요.
    
    // ---------- Mark : function If문사용 답안 작성란  ----------------
    
    func checkLoginStatus(isLoggedIn: Bool, userName: String?) {
    if isLoggedIn {
        if let userName = userName {
            print(userName)
        } else {
            print("알 수 없는 사용자")
        }
    } else {
        print("로그인이 필요합니다.")
    }
}

checkLoginStatus(isLoggedIn: true, userName: "Alice")
checkLoginStatus(isLoggedIn: true, userName: nil)
checkLoginStatus(isLoggedIn: false, userName: "Bob")
checkLoginStatus(isLoggedIn: false, userName: nil)



    
    // ---------- Mark : function guard문 사용 답안 작성란 ----------------
    
    
func LoginStatus(isLoggedIn: Bool, userName: String?){
    guard isLoggedIn else {
        print("로그인이 필요합니다")
        return
    }
    guard let userName = userName else {
        print("알 수 없는 사용자")
        return
    }
    print(userName)
}
    
LoginStatus(isLoggedIn: true, userName: "Charlie")
LoginStatus(isLoggedIn: true, userName: nil)
LoginStatus(isLoggedIn: false, userName: "David")
LoginStatus(isLoggedIn: false, userName: nil)
    // ---------- Mark : Optional Nil-coalescing 사용  ----------------
    
    //문제 1: Nil-coalescing 연산자 ?? 사용하기
    //문자열 배열 names에 이름이 몇 개 들어있습니다. 배열의 첫 번째 요소를 출력하세요. 만약 배열이 비어 있다면 "No name found"를 출력하세요.
    //var names: [String] = ["Alice", "Bob", "Charlie"]
    
    // ---------- Mark : Optional Nil-coalescing 사용 답안 작성란  ----------------
var names: [String] = ["Alice", "Bob", "Charlie"]

func OptionalNilCoalescing(){
    
    let firstName = names.first ??  "No name found"
        print("\(firstName)")
   
    }
    OptionalNilCoalescing()
    names.removeAll()
    OptionalNilCoalescing()
    // ---------- Mark : Optional if-let 사용  ----------------
    
    //문제 2: if-let을 사용한 옵셔널 바인딩
    //문자열 옵셔널 optionalString에 값이 있을 수도, 없을 수도 있습니다. 값이 있으면 "The string is:"와 함께 값을 출력하세요. 값이 없으면 "The string is nil."을 출력하세요.
    //var optionalString: String? = "Hello"
    
    
    // ---------- Mark : Optional if-let 사용 답안 작성란 ----------------
var optionalString: String? = "Hello"
func OptionalIfLet(){
   
    if let check = optionalString {
        print("The string is:  \(check)")
    }
    else {
        print("The string is nil.")
    }
}

    // ---------- Mark : Optional guard-let 사용 답안 작성란  ----------------
func OptionalGuardLet(){
    //var optionalString: String? = "Hello"
    guard let check = optionalString else {
        print("The string is nil."); return
    }
    print("The string is:  \(check)")
}

OptionalIfLet()
OptionalGuardLet()
optionalString = nil
OptionalIfLet()
OptionalGuardLet()

