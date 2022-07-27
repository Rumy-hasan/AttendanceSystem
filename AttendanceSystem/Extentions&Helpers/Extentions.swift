//
//  Extentions.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 24/7/22.
//

import Foundation

extension Date{
    func isSame(day: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.year, .month, .day], from: self, to: day)
        if diff.day == 0 && diff.year == 0 && diff.month == 0 {
            return true
        } else {
            return false
        }
    }
    
    private func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    private func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func diffInMinutes(of: Date) -> Int {
        return ((self.hours(from: of)*60) + self.minutes(from: of))
    }
    
    func isEarlier(ofDate: Date)->Bool{
        switch self.compare(ofDate) {
        case .orderedAscending: return true
        default: return false
        }
    }
    
    
    func dateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
    
    func timeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
}
