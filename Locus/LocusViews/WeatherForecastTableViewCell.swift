//
//  WeatherForecastTableViewCell.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class WeatherForecastTableViewCell : UITableViewCell {
    
    //    MARK: - IBOutlets and variables
    @IBOutlet weak var weatherIconImageView: CacheImageView!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
        
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    //    MARK: - Configure cell methods
    func configureWeatherForeCastTableViewCell(withForecastData : DailyModel) {
        if !((withForecastData.weather?[0].icon ?? "").isEmpty) {
            weatherIconImageView.loadImageViewWithUrlString(urlString: .weatherIconUrl + (withForecastData.weather?[0].icon)! + .twoXpng)
        } else {
            weatherIconImageView.image = UIImage(systemName: .noSign )
        }
        weekLabel.text = withForecastData.dt?.convertUnixTimeToDate().createDateTime(unixTime: withForecastData.dt ?? 0, timeZone: timeZone, format: Constants.dateInMMMMdd)
        maxTemperatureLabel.text = String(withForecastData.temp?.max ?? 0) + .degreeCelsius
        minTemperatureLabel.text = String(withForecastData.temp?.min ?? 0) + .degreeCelsius
        weatherDescriptionLabel.text = withForecastData.weather?[0].description?.capitalizingFirstLetter()
    }
}
