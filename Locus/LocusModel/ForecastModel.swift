//
//  ForecastModel.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

struct ForecastModel: Codable {
    var lat : Double?
    var long : Double?
    var timezone : String?
    var timezone_offset : Double?
    var current : WeatherInfoModel?
    var daily : [DailyModel]?
    var hourly : [WeatherInfoModel]?
}
