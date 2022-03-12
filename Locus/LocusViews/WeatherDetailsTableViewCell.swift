//
//  WeatherDetailsTableViewCell.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class WeatherDetailsTableViewCell : UITableViewCell {
    
    //    MARK: - IBOutlets and Variables
    @IBOutlet weak var windStackView: UIStackView!
    @IBOutlet weak var pressureStackView: UIStackView!
    @IBOutlet weak var dewPointStackView: UIStackView!
    @IBOutlet weak var humidityStackView: UIStackView!
    @IBOutlet weak var uvIndexStackView: UIStackView!
    @IBOutlet weak var rainStackView: UIStackView!
    
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var dewPointLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    //    MARK: - Configure cell methods
    func configureWeatheDetailsTableViewCell(data : DailyModel) {
        rainLabel.text = String(data.rain ?? 0) + .mm
        windLabel.text = String(data.wind_speed ?? 0) + .metreSec + .windInDirection + String(data.wind_deg ?? 0)
        pressureLabel.text = String(data.pressure ?? 0) + .hPa
        dewPointLabel.text = String(data.dew_point ?? 0) + .degreeCelsius
        humidityLabel.text = String(data.humidity ?? 0) + .percentage
        uvIndexLabel.text = String(data.uvi ?? 0)
    }
}
