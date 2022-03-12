//
//  ForecastDetailViewController.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

class ForecastDetailViewController : UIViewController {
    //    MARK: - IBOutlets and Variables
    var foreCastDetailViewModel = ForecastDetailViewModel()
    var arrayOfCells : [String] = [.temperatureDetailTableViewCell , .sunNMoonTimeDetailTableViewCell, .sunNMoonTimeDetailTableViewCell,.weatherDetailsTableViewCell , .hourlyTableViewCell]
    var forForecastIndex = 0
    private let borderValue : CGFloat = 15
    private let collectionViewHeightDevisor : CGFloat = (UIDevice.current.isiPad ? 5 : 4)
    
    @IBOutlet weak var forecastDetailTableView: UITableView!
    
    //    MARK: - View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
    }
    
    private func registerTableViewCell() {
        forecastDetailTableView.register(UINib(nibName:.temperatureDetailTableViewCell, bundle: nil), forCellReuseIdentifier: .temperatureDetailTableViewCell)
        forecastDetailTableView.register(UINib(nibName:.sunNMoonTimeDetailTableViewCell, bundle: nil), forCellReuseIdentifier: .sunNMoonTimeDetailTableViewCell)
        forecastDetailTableView.register(UINib(nibName:.weatherDetailsTableViewCell, bundle: nil), forCellReuseIdentifier: .weatherDetailsTableViewCell)
        forecastDetailTableView.register(UINib(nibName:.hourlyTableViewCell, bundle: nil), forCellReuseIdentifier: .hourlyTableViewCell)
    }
    private func setDataSourceAndDelegateForHourlyCollectionView(cell : HourlyTableViewCell){
        cell.hourlyCollectionView.dataSource = self
        cell.hourlyCollectionView.delegate = self
    }
}

//    MARK: - TableView data source methods
extension ForecastDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if forForecastIndex == 0 || forForecastIndex == 1 {
            return arrayOfCells.count
        } else {
            return arrayOfCells.count - 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .temperatureDetailTableViewCell, for: indexPath) as? TemperatureDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.configureTemperatureDetailCell(data: foreCastDetailViewModel.dailyForecastData)
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .sunNMoonTimeDetailTableViewCell, for: indexPath) as? SunNMoonTimeDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.configureSunNMoonTimeCell(data: foreCastDetailViewModel.dailyForecastData, isSun: true)
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .sunNMoonTimeDetailTableViewCell, for: indexPath) as? SunNMoonTimeDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.configureSunNMoonTimeCell(data: foreCastDetailViewModel.dailyForecastData, isSun: false)
            return cell
        } else if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .weatherDetailsTableViewCell, for: indexPath) as? WeatherDetailsTableViewCell else {
                return UITableViewCell()
            }
            cell.configureWeatheDetailsTableViewCell(data: foreCastDetailViewModel.dailyForecastData)
            return cell
        } else if indexPath.row == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: .hourlyTableViewCell, for: indexPath) as? HourlyTableViewCell else {
                return UITableViewCell()
            }
            setDataSourceAndDelegateForHourlyCollectionView(cell: cell)
            cell.configureHourlyTableViewCell()
            return cell
        }
        return UITableViewCell()
    }
}

//    MARK: - TableView delegate methods
extension ForecastDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return Constants.indexZeroHeight
        } else if indexPath.row == 3 {
            return Constants.indexThreeHeight
        } else if indexPath.row == 4 {
            return Constants.indexFourHeight
        }else {
            return Constants.detailForecastHeight
        }
    }
}

//    MARK: - CollectionView delegate methods
extension ForecastDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.width
        return CGSize(width: (collectionWidth - borderValue)/5, height: collectionWidth/collectionViewHeightDevisor)
    }
}
//    MARK: - CollectionView data source methods
extension ForecastDetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foreCastDetailViewModel.hourlyDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .hourlyCollectionViewCell, for: indexPath) as? HourlyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.hourlyForecastData = foreCastDetailViewModel.hourlyDataArray[indexPath.row]
        cell.configureHourlyCollectionViewCell(data: cell.hourlyForecastData)
        return cell
    }
    
    
}
