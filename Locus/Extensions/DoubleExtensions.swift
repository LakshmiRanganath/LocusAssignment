//
//  DoubleExtensions.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

extension Double {
    func convertUnixTimeToDate() -> Date {
        return Date(timeIntervalSince1970: self)
    }
}
