//
//  TemperatureDetailTableViewCell.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class TemperatureDetailTableViewCell : UITableViewCell {
    //    MARK: - IBOutlets and Variables
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var mornTemperatureLabel: UILabel!
    @IBOutlet weak var feelLikeTemperatureLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: CacheImageView!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var nightTemperatureLabel: UILabel!
    @IBOutlet weak var dayTemperatureLabel: UILabel!
    
    //    MARK: - Configure cell methods
    func configureTemperatureDetailCell(data : DailyModel) {
        if !((data.weather?[0].icon ?? "").isEmpty) {
            weatherIconImageView.loadImageViewWithUrlString(urlString: .weatherIconUrl + (data.weather?[0].icon)! + .twoXpng)
        } else {
            weatherIconImageView.image = UIImage(systemName: .noSign )
        }
        dateLabel.text = data.dt?.convertUnixTimeToDate().createDateTime(unixTime: data.dt ?? 0, timeZone: timeZone, format: Constants.dateInMMMMdd)
        weatherDescriptionLabel.text = data.weather?[0].description?.capitalizingFirstLetter()
        dayTemperatureLabel.text = .day + String(data.temp?.day ?? 0) + .degreeCelsius
        nightTemperatureLabel.text = .night + String(data.temp?.night ?? 0) + .degreeCelsius
        mornTemperatureLabel.text = String(data.temp?.day ?? 0) + .degreeCelsius
        feelLikeTemperatureLabel.text = .feelsLike + String(data.feels_like?.day ?? 0) + .degreeCelsius
        timeZoneLabel.text = .timezone + timeZone
        
    }
}

