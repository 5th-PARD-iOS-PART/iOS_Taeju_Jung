import Foundation

struct AccountData: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let amount: Int
    let balanceAfter: Int
    let AccountName: String
    var AccountImageName: String {
        switch AccountName{
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
    
    static func make(
        month: Int, day: Int, hour: Int, minute: Int,
        title: String,
        amount: Int,
        balanceAfter: Int,
        AccountName: String
    ) -> AccountData {
        let components = DateComponents( month: month, day: day, hour: hour, minute: minute)
        let date = Calendar.current.date(from: components)!
        return AccountData(date: date, title: title, amount: amount, balanceAfter: balanceAfter, AccountName: AccountName)
    }
}
    extension AccountData {
        static var sampleTransactions: [AccountData] = [
            .make(month: 4, day: 4, hour: 17, minute: 39, title: "흥영숙", amount: 29223, balanceAfter: 619465,AccountName: "KAKAOT"),
            .make(month: 4, day: 4, hour: 14, minute: 22, title: "그레이스 더 테이블 G", amount: 66835, balanceAfter: 623133,AccountName: "KAKAOT"),
            .make(month: 4, day: 4, hour: 13, minute: 43, title: "카카오페이", amount: -3999, balanceAfter: 396001,AccountName: "KAKAOT"),
            .make(month: 4, day: 4, hour: 11, minute: 25, title: "체크 후불 교통 출금", amount: -9829, balanceAfter: 556298,AccountName: "KAKAOT"),
            .make(month: 4, day: 3, hour: 17, minute: 39, title: "CU 양덕 원룸 점", amount: -4018, balanceAfter: 619115,AccountName: "KAKAOT"),
            .make(month: 4, day: 3, hour: 12, minute: 57, title: "박지연", amount: 52965, balanceAfter: 448966,AccountName: "KAKAOT"),
            .make(month: 4, day: 3, hour: 11, minute: 25, title: "신현미", amount: -42994, balanceAfter: 576471,AccountName: "KAKAOT"),
            .make(month: 4, day: 2, hour: 20, minute: 14, title: "그레이스 더 테이블 G", amount: 57147, balanceAfter: 590242,AccountName: "KAKAOT"),
            .make(month: 4, day: 2, hour: 20, minute: 14, title: "(주)아이엔텍", amount: -26874, balanceAfter: 549597,AccountName: "KAKAOT"),
            .make(month: 4, day: 2, hour: 17, minute: 39, title: "(주)아이엔텍", amount: -91925, balanceAfter: 556035,AccountName: "KAKAOT"),
            .make(month: 4, day: 1, hour: 11, minute: 25, title: "김도원", amount: 52714, balanceAfter: 561850,AccountName: "KAKAOT"),
            .make(month: 4, day: 1, hour: 9, minute: 26, title: "체크 후불 교통 출금", amount: -7858, balanceAfter: 609297,AccountName: "KAKAOT"),
            .make(month: 3, day: 31, hour: 14, minute: 36, title: "CU 양덕 원룸 점", amount: -38987, balanceAfter: 580128,AccountName: "KAKAOT"),
            .make(month: 3, day: 31, hour: 13, minute: 43, title: "박지연", amount: 34240, balanceAfter: 614368,AccountName: "KAKAOT"),
            .make(month: 3, day: 31, hour: 12, minute: 57, title: "그레이스 더 테이블 G", amount: -46899, balanceAfter: 509136,AccountName: "KAKAOT"),
            .make(month: 3, day: 31, hour: 11, minute: 25, title: "김도원", amount: 44338, balanceAfter: 653635,AccountName: "KAKAOT"),
            .make(month: 3, day: 31, hour: 9, minute: 26, title: "정당", amount: -44836, balanceAfter: 566127,AccountName: "KAKAOT"),
            .make(month: 3, day: 29, hour: 20, minute: 14, title: "신현미", amount: 84129, balanceAfter: 533095,AccountName: "KAKAOT"),
            .make(month: 3, day: 29, hour: 20, minute: 14, title: "김도원", amount: 61366, balanceAfter: 610963,AccountName: "KAKAOT"),
            .make(month: 3, day: 29, hour: 12, minute: 57, title: "카카오페이", amount: -5675, balanceAfter: 647960,AccountName: "KAKAOT"),
            .make(month: 3, day: 28, hour: 14, minute: 22, title: "김도원", amount: 2787, balanceAfter: 617155,AccountName: "KAKAOT")
        ]
    }

extension Int {
    var signedFormatted: String {
        self < 0 ? "\(self.formatted())원" : "+\(self.formatted())원"
    }
}

// MARK: - 날짜 포맷 확장
extension Date {
    var monthDayString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월d일"
        return formatter.string(from: self)
    }
}
