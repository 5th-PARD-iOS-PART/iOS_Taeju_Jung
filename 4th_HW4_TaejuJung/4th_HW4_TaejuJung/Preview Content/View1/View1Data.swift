//
//  ContentView.swift
//  3rd_HW3_TaejuJung
//
//  Created by 정태주 on 4/3/25.
//

import SwiftUI
enum AccountType {
    case checking
    
}

struct View1Data: Identifiable {
    let id = UUID()
   // var KindOfAccount: String
    var UserName: String
    var AccountNumber: String
    var BankName: String
    var isFavorited: Bool
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
            case "TOSS":
                return "TOSS"
            default:
                return "default_bank"
        }
    }
}

extension View1Data {
    static var Data1: [[View1Data]]  =  [
        [
            View1Data(UserName: "WINGO통장",AccountNumber:"하나은행157-891652-62107",BankName: "HANA",isFavorited: true), // 기업은행
            View1Data(UserName: "종합매매",AccountNumber:"삼성증권7112898902-01",BankName: "삼성증권",isFavorited: true)
            
        ],
        [
            View1Data(UserName: "김정희",AccountNumber:"KB국민96314175848",BankName: "KB",isFavorited: false), // 기업은행
            View1Data(UserName: "내입출금통장",AccountNumber:"카카오뱅크3333-20-8455642",BankName: "KAKAO",isFavorited: false),
            View1Data(UserName: "김래언",AccountNumber:"IBK기업286-104115-01-019",BankName: "IBK",isFavorited:false),
            View1Data(UserName: "김정희",AccountNumber:"KB국민96314175848",BankName: "KB",isFavorited: false), // 기업은행
            View1Data(UserName: "내입출금통장",AccountNumber:"카카오뱅크3333-20-8455642",BankName: "KAKAO",isFavorited: false),
            View1Data(UserName: "김래언",AccountNumber:"IBK기업286-104115-01-019",BankName: "IBK",isFavorited: false)
            
        ]
    ]
}



