//
//  ContentView.swift
//  3rd_HW3_TaejuJung
//
//  Created by 정태주 on 4/3/25.
//

import SwiftUI
struct MockData: Identifiable {
    let id = UUID()
    var KindOfAccount: String
    var AccountBalance: Int
    var BankName: String
    var bankImageName: String {
            switch BankName {
            case "IBK":
                return "IBK" // 너의 Asset 이름에 맞춰서
            case "KAKAO":
                return "KAKAO"
            case "HANA":
                return "HANA"
            case "NEWTOWN":
                return "NEWTOWN"
            case "KB":
                return "KB"
            default:
                return "default_bank"
            }
        }
}

    extension MockData {
    static var sampleData: [[MockData]]  =  [
        [
            MockData(KindOfAccount: "보통예금(IBK평생한가족통장)", AccountBalance: 331270, BankName: "IBK"), // 기업은행
            MockData(KindOfAccount: "저금통", AccountBalance: 14, BankName: "KAKAO"),
          MockData(KindOfAccount: "입출금통장", AccountBalance: 10000, BankName: "KAKAO"),
            MockData(KindOfAccount: "온라인자립예탁금", AccountBalance: 50000, BankName: "NEWTOWN"),
          MockData(KindOfAccount: "저축예금", AccountBalance: 10000, BankName: "HANA"),
            MockData(KindOfAccount: "KB나라사랑우대통장", AccountBalance: 50000, BankName: "KB"),
          MockData(KindOfAccount: "저축예금", AccountBalance: 10000, BankName: "IBK"),
            MockData(KindOfAccount: "보통예금(IBK나라사랑통장)", AccountBalance: 50000, BankName: "IBK"),
          MockData(KindOfAccount: "증권 종합매매", AccountBalance: 10000, BankName: "삼성증권"),
          MockData(KindOfAccount: "투자 모아보기 5개", AccountBalance: 50000, BankName: "IBK")
        ],
        [
            
        ]
    ]
}
