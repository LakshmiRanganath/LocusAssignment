//
//  WeatherInfoModel.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

struct WeatherInfoModel : Codable {
    var dt : Double?
    var sunrise : Double?
    var sunset : Double?
    var temp : Double?
    var feels_like : Double?
    var pressure : Double?
    var humidity : Double?
    var dew_point : Double?
    var uvi : Double?
    var clouds : Double?
    var visibility : Double?
    var wind_speed : Double?
    var wind_deg : Double?
    var weather : [WeatherModel]?
    var pop : Double?
}
