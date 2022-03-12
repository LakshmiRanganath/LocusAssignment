//
//  CityWeatherForecastViewController.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

var timeZone = ""
class CityWeatherForecastViewController : UIViewController {
    //    MARK: - IBOutlets and Variables
    @IBOutlet weak var weatherForecastTableView: UITableView!
    
    var weatherForeCastViewModel = WeatherForeCastViewModel()
    private let weatherForecastTableViewCellHeight : CGFloat = 150
    
    //    MARK: - View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        weatherForecastTableView.reloadData()
        self.navigationItem.title = weatherForeCastViewModel.location
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        weatherForeCastViewModel.generateHourlyArrayDict()
    }
    
//    methods to load view
    private func registerTableViewCell() {
        weatherForecastTableView.register(UINib(nibName:.weatherForecastTableViewCell, bundle: nil), forCellReuseIdentifier: .weatherForecastTableViewCell)
    }
}

//    MARK: - TableView data source methods
extension CityWeatherForecastViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForeCastViewModel.foreCastResponse.daily?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .weatherForecastTableViewCell, for: indexPath) as? WeatherForecastTableViewCell else {
            return UITableViewCell()
        }
        let foreCastData = weatherForeCastViewModel.foreCastResponse.daily?[indexPath.row] ?? DailyModel()
        cell.configureWeatherForeCastTableViewCell(withForecastData: foreCastData)
        return cell
    }
}

//    MARK: - TableView delegate methods
extension CityWeatherForecastViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let foreCastDetailViewController = storyboard?.instantiateViewController(withIdentifier: .forecastDetailViewController) as? ForecastDetailViewController {
            foreCastDetailViewController.forForecastIndex = indexPath.row
            if indexPath.row == 0 || indexPath.row == 1 {
                foreCastDetailViewController.foreCastDetailViewModel.hourlyDataArray = weatherForeCastViewModel.hourlyArrayDict[indexPath.row] ?? [WeatherInfoModel]()
            }
            foreCastDetailViewController.foreCastDetailViewModel.dailyForecastData = weatherForeCastViewModel.foreCastResponse.daily?[indexPath.row] ?? DailyModel()
            navigationController?.pushViewController(foreCastDetailViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return weatherForecastTableViewCellHeight
    }
}
