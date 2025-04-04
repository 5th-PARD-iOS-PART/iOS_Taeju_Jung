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
            case "삼성증권":
                return "삼성증권"
            case "INVEST":
                return "INVEST"
            case "신용":
                    return "신용"
            case "원":
                    return "원"
            case "card":
                    return "card"
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
          MockData(KindOfAccount: "입출금통장", AccountBalance: 0, BankName: "KAKAO"),
            MockData(KindOfAccount: "온라인자립예탁금", AccountBalance: 516, BankName: "NEWTOWN"),
          MockData(KindOfAccount: "저축예금", AccountBalance: 0, BankName: "HANA"),
            MockData(KindOfAccount: "KB나라사랑우대통장", AccountBalance: 400002, BankName: "KB"),
          MockData(KindOfAccount: "저축예금", AccountBalance: 4522, BankName: "IBK"),
            MockData(KindOfAccount: "보통예금(IBK나라사랑통장)", AccountBalance: 2000000, BankName: "IBK"),
          MockData(KindOfAccount: "증권 종합매매", AccountBalance: 901955, BankName: "삼성증권"),
          MockData(KindOfAccount: "투자 모아보기 5개", AccountBalance: 900235, BankName: "INVEST")
        ],
        [
            MockData(KindOfAccount: "4월에 쓴 돈", AccountBalance: 331270, BankName: "원"), // 기업은행
            MockData(KindOfAccount: "4월 15일 낼 카드값", AccountBalance: 14, BankName: "card"),
        ],[
            MockData(KindOfAccount: "내 신용점수", AccountBalance: 0, BankName: "신용"), // 기업은행
        ]
    ]
}
