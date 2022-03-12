//
//  ForecastDetailViewModel.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation

class ForecastDetailViewModel : NSObject {
    lazy var hourlyDataArray = [WeatherInfoModel]()
    lazy var dailyForecastData = DailyModel()
}
