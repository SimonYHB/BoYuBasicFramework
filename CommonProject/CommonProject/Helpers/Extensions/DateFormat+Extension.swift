//
//  DateFormat+Extension.swift
//  Vankeyi-Swift
//
//  Created by SimonYHB on 2017/3/15.
//  Copyright © 2017年 yhb. All rights reserved.
//

import Foundation
extension DateFormatter{
    static func getFormatString(time: String, formatStr: String) -> String
    {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = format.date(from: time)
        format.dateFormat = formatStr
        return format.string(from: date!)
    }
    
    static func compareDateStr(first: String, second: String) -> ComparisonResult? {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let firstDate = format.date(from: first) else {
            return nil
        }
        guard let secondDate = format.date(from: second) else {
            return nil
        }
        return firstDate.compare(secondDate)
    }
    static func getDateString(currentDate: Date, months: Int)->String {
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
//        let comps = calendar.component(Calendar.Component.month, from: currentDate)
        var dateComponents = DateComponents()
        dateComponents.month = months
        dateComponents.day = -1
        let endDate = calendar.date(byAdding: dateComponents, to: currentDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: endDate!)
    }
    static func getDateString(currentDateString: String, months: Int)->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDate = formatter.date(from: currentDateString)
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        //        let comps = calendar.component(Calendar.Component.month, from: currentDate)
        var dateComponents = DateComponents()
        dateComponents.month = months
        dateComponents.day = -1
        let endDate = calendar.date(byAdding: dateComponents, to: currentDate!)
        return formatter.string(from: endDate!)
    }
}
