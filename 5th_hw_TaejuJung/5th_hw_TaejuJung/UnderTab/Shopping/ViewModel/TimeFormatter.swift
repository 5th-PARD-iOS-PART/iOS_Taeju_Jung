//
//  TimeFormatter.swift
//  5th_hw_TaejuJung
//
//  Created by 정태주 on 5/1/25.
//

// Helpers/TimeFormatter.swift

import Foundation

struct TimeFormatter {
    static func formattedTimeLeft(until deadline: Date?) -> String? {
        guard let deadline = deadline else { return nil }

        let now = Date()
        let remaining = deadline.timeIntervalSince(now)

        if remaining <= 0 {
            return "마감됨"
        }

        let hours = Int(remaining) / 3600
        let minutes = (Int(remaining) % 3600) / 60

        return "\(hours)시간 \(minutes)분 남음"
    }
}
