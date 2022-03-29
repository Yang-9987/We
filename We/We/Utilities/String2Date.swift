//
//  StringDate.swift
//  We
//
//  Created by Yang Jianqi on 2022/3/28.
//

import Foundation

func string2data(strDate: String) -> Date {
    let dateString = strDate
    var newDate: Date?
    let dateformatter = DateFormatter()

    dateformatter.dateFormat = "YYYY-MM-dd"
    newDate = dateformatter.date(from: dateString)

    return newDate!
}
