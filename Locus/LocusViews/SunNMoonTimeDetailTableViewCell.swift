//
//  SunNMoonTimeDetailTableViewCell.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class SunNMoonTimeDetailTableViewCell : UITableViewCell {
    
    //    MARK: - IBOutlets and Variables
    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var setTitleLabel: UILabel!
    @IBOutlet weak var riseTimeLabel
    : UILabel!
    @IBOutlet weak var riseTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //    MARK: - Configure cell methods
    func configureSunNMoonTimeCell(data : DailyModel , isSun : Bool) {
        if isSun == true{
            titleLabel.text = .sunRiseSunSet
            riseTitleLabel.text = .sunRise
            setTitleLabel.text = .sunSet
            riseTimeLabel.text = data.sunrise?.convertUnixTimeToDate().createDateTime(unixTime: data.sunrise ?? 0, timeZone: timeZone, format: Constants.dateInHHmm)
            setTimeLabel.text = data.sunset?.convertUnixTimeToDate().createDateTime(unixTime: data.sunset ?? 0, timeZone: timeZone, format: Constants.dateInHHmm)
        } else {
            titleLabel.text = .moonRiseMoonSet
            riseTitleLabel.text = .moonRise
            setTitleLabel.text = .moonSet
            riseTimeLabel.text = data.moonrise?.convertUnixTimeToDate().createDateTime(unixTime: data.moonrise ?? 0, timeZone: timeZone, format: Constants.dateInHHmm)
            setTimeLabel.text = data.moonset?.convertUnixTimeToDate().createDateTime(unixTime: data.moonset ?? 0, timeZone: timeZone, format: Constants.dateInHHmm)
        }
    }
    
}
