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
            case "Game":
                    return "Game"
            case "CU":
                    return "CU"
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
            .make(month: 3, day: 22, hour: 11, minute: 13, title: "카카오 택시_0", amount: -6200, balanceAfter: 38841, AccountName: "KAKAOT"),
            .make(month: 3, day: 22, hour: 11, minute: 00, title: "카카오 택시 선승인", amount: 6900, balanceAfter: 45041, AccountName: "KAKAOT"),
            .make(month: 3, day: 22, hour: 11, minute: 00, title: "카카오 택시 선승인", amount: -6900, balanceAfter: 38141, AccountName: "KAKAOT"),
            .make(month: 3, day: 21, hour: 22, minute: 44, title: "플렉스PC방", amount: -5500, balanceAfter: 45041, AccountName: "Game"),
            .make(month: 3, day: 21, hour: 21, minute: 35, title: "플렉스PC방", amount: -5000, balanceAfter: 50541, AccountName: "Game"),
            .make(month: 3, day: 21, hour: 16, minute: 17, title: "씨유한동대오션관점", amount: -2000, balanceAfter: 55541, AccountName: "CU"),
            .make(month: 3, day: 21, hour: 15, minute: 59, title: "씨유한동대오션관점", amount: -4400, balanceAfter: 57541, AccountName: "CU"),
            .make(month: 3, day: 21, hour: 10, minute: 00, title: "카카오 택시_0", amount: -7000, balanceAfter: 61941, AccountName: "KAKAOT"),
            .make(month: 3, day: 21, hour: 09, minute: 47, title: "카카오 택시 선승인", amount: 7300, balanceAfter: 68941, AccountName: "KAKAOT"),
            .make(month: 3, day: 21, hour: 09, minute: 47, title: "카카오 택시 선승인", amount: -7300, balanceAfter: 61641, AccountName: "KAKAOT"),
            .make(month: 3, day: 21, hour: 09, minute: 46, title: "카카오 택시 선승인", amount: 7300, balanceAfter: 68941, AccountName: "KAKAOT"),
            .make(month: 3, day: 21, hour: 09, minute: 45, title: "카카오 택시 선승인", amount: -7300, balanceAfter: 61641, AccountName: "KAKAOT"),

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
