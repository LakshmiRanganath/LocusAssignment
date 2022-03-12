//
//  DateExtensions.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        return Constants.weekDays[weekDay-1]
    }
   
    func createDateTime(unixTime: Double , timeZone: String , format: String ) -> String {
        var dateString = String.emptyString
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timeZone) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format //Specify your format that you want
        dateString = dateFormatter.string(from: date)
        return dateString
    }
}


