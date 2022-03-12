//
//  WeatherForeCastViewModel.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

class WeatherForeCastViewModel : NSObject {
    lazy var foreCastResponse = ForecastModel()
    lazy var location : String = .emptyString
    var hourlyArrayDict : [Int : [WeatherInfoModel]] = [:]
    
    //To split hourlyArray into two parts. As we get hourly data for only two days
    func generateHourlyArrayDict() {
        let splitsOfHourlyArray = foreCastResponse.hourly?.chunked(into: 24)
        hourlyArrayDict[0] = splitsOfHourlyArray?.first
        hourlyArrayDict[1] = splitsOfHourlyArray?.last
    }
}
