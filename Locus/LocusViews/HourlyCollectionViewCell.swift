//
//  HourlyCollectionViewCell.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class HourlyCollectionViewCell : UICollectionViewCell {
    //    MARK: - IBOutlets and Variables
    @IBOutlet weak var weatherIconImageView: CacheImageView!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    lazy var hourlyForecastData = WeatherInfoModel()
    
    //    MARK: - Configure cell methods
    func configureHourlyCollectionViewCell(data : WeatherInfoModel) {
        if !((data.weather?[0].icon ?? "").isEmpty) {
            weatherIconImageView.loadImageViewWithUrlString(urlString: .weatherIconUrl + (data.weather?[0].icon)! + .twoXpng)
        } else {
            weatherIconImageView.image = UIImage(systemName: .noSign )
        }
        maxTemperatureLabel.text = String(data.temp ?? 0) + .degreeCelsius
        timeLabel.text = data.dt?.convertUnixTimeToDate().createDateTime(unixTime: data.dt ?? 0, timeZone: timeZone, format: Constants.dateInHHmm)
        
    }
}
