//
//  DailyModel.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

struct DailyModel : Codable {
    var dt : Double?
    var sunrise : Double?
    var sunset : Double?
    var moonrise : Double?
    var moonset : Double?
    var temp : TempModel?
    var feels_like : TempModel?
    var pressure : Double?
    var humidity : Double?
    var dew_point : Double?
    var uvi : Double?
    var clouds : Double?
    var wind_speed : Double?
    var wind_deg : Double?
    var weather : [WeatherModel]?
    var snow : Double?
    var pop : Double?
    var rain : Double?
}
