//
//  Constants.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

struct Constants {
    static let API_KEY = "***************"
    static let weekDays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]
    static let dateInddMMYYYY = "dd.MM.yyyy HH:mm:ss"
    static let maxLRUCacheSize = 30
    static let noDataFoundError = "No data found"
    static let imageFetchErrorFromUrl = "Error occured while fetching image from url"
    static let dateInHHmm = "HH:mm"
    static let dateInMMMMddHHmm = "MMMM.dd HH:mm"
    static let dateInMMMMdd = "MMMM dd"
    static let indexZeroHeight : CGFloat = 450
    static let indexThreeHeight : CGFloat = 270
    static let indexFourHeight : CGFloat = UIDevice.current.isiPad ? 300 : 250
    static let detailForecastHeight : CGFloat = 150
    
    
}
extension String {
    //    MARK: -   URL Strings
    static let weatherIconUrl = "http://openweathermap.org/img/wn/"
    static let oneCallUrl = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely&units=metric&appid="
    
    //    MARK: -    StoryBoard and Nib Names
    static let cityWeatherForecastViewController = "CityWeatherForecastViewController"
    static let main = "Main"
    static let weatherForecastTableViewCell = "WeatherForecastTableViewCell"
    static let forecastDetailViewController = "ForecastDetailViewController"
    static let hourlyTableViewCell = "HourlyTableViewCell"
    static let weatherDetailsTableViewCell = "WeatherDetailsTableViewCell"
    static let sunNMoonTimeDetailTableViewCell = "SunNMoonTimeDetailTableViewCell"
    static let temperatureDetailTableViewCell = "TemperatureDetailTableViewCell"
    static let hourlyCollectionViewCell = "HourlyCollectionViewCell"
    
    //    MARK: - String Constants
    static let error = "Error"
    static let ok = "Ok"
    static let tryAgain = "Try Again"
    static let iPhone = "iPhone"
    static let noSign = "nosign"
    static let emptyString = ""
    static let degreeCelsius = "°C"
    static let twoXpng = "@2x.png"
    static let invalidCityError = "Invalid City"
    static let weatherForecastFetchError = "Weather forecast could not be fetched!"
    
    static let sunRiseSunSet = "Sunrise & Sunset"
    static let moonRiseMoonSet = "Moonrise & Moonset"
    static let moonRise = "Moonrise"
    static let moonSet = "Moonset"
    static let sunRise = "Sunrise"
    static let sunSet = "Sunset"
    
    static let mm = "mm"
    static let metreSec = "metre/sec"
    static let windInDirection = " , in direction "
    static let hPa = "hPa"
    static let percentage = "%"
    
    static let feelsLike = "Feels like "
    static let timezone = "Timezone: "
    static let day = "Day "
    static let night = "Night "
}

enum Colors {
    static let backgroundBlueColor = UIColor(displayP3Red: 85/255, green: 145/255, blue: 206/255, alpha: 1)
}
