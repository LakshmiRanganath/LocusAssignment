//
//  ViewController.swift
//  Locus
//
//  Created by Lakshmi H R on 10/03/22.
//

import UIKit

class ViewController: UIViewController {

//    MARK: - IBOutlets and Variables
    @IBOutlet weak var lookupButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var locationSearchTextView: UITextView!
    var searchViewModel = SearchCityViewModel()
    
//    MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    MARK: - IBActions
    @IBAction func lookUpButtonTapped(_ sender: Any) {
        lookupButton.isUserInteractionEnabled = false
        fetchLatLong(forAddress: searchViewModel.address)
    }
    
//    MARK: - API CAlls
    //Fetch lat and long from city
    func fetchLatLong(forAddress : String) {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        searchViewModel.fetchLatLongFromAddress(addressString: forAddress, completionHandler:{[weak self]
            resultFetched in
            DispatchQueue.main.async {[weak self] in
                self?.lookupButton.isUserInteractionEnabled = true
            }
            switch(resultFetched){
            case .failure(_) :
                //Display an alert to show error
                DispatchQueue.main.async {[weak self] in
                    let alert = UIAlertController.init(title: .error, message: .invalidCityError, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: .ok, style: .cancel, handler: {(action) in
                    })
                //Try again action is added to alert and callFetch is called again.
                    let tryAgainAction = UIAlertAction(title: .tryAgain, style: .default, handler: {[weak self] (action) in
                        self?.fetchLatLong(forAddress: self?.searchViewModel.address ?? .emptyString)
                    })
                    
                    alert.addAction(okAction)
                    alert.addAction(tryAgainAction)
                    
                    self?.activityIndicator.stopAnimating()
                    self?.present(alert, animated: true)
                }
                
            case .success(let coordinates) :
                //if data is fetched succefully, weatherforecast api is called
                self?.searchViewModel.lat = coordinates.latitude
                self?.searchViewModel.long = coordinates.longitude
                self?.activityIndicator.isHidden = false
                self?.activityIndicator.startAnimating()
                self?.fetchWeatherForecastInfo()
                //UI elements are updated in main thread
                DispatchQueue.main.async { [weak self] in
                    self?.activityIndicator.stopAnimating()
                }
            }
            
        })
    }
//    To fetch weather forecast info
    private func fetchWeatherForecastInfo() {
        self.searchViewModel.fetchWeatherForecastInfo(completion: {[weak self] resultFetched in
            switch(resultFetched) {
            case .failure(_) :
                //Display an alert to show error
                DispatchQueue.main.async {[weak self] in
                    let alert = UIAlertController.init(title: .error, message: .weatherForecastFetchError, preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: .ok, style: .cancel, handler: {(action) in
                    })
                //Try again action is added to alert and callFetch is called again.
                    let tryAgainAction = UIAlertAction(title: .tryAgain, style: .default, handler: {[weak self] (action) in
                        self?.fetchWeatherForecastInfo()
                    })
                    
                    alert.addAction(okAction)
                    alert.addAction(tryAgainAction)
                    
                    self?.activityIndicator.stopAnimating()
                    self?.present(alert, animated: true)
                }
                
            case .success(let foreCasetResponse) :
                self?.searchViewModel.foreCastResponse = foreCasetResponse
                DispatchQueue.main.async {[weak self] in
                    let cityWeatherForeCastViewController = UIStoryboard.init(name: .main, bundle: Bundle.main).instantiateViewController(withIdentifier: .cityWeatherForecastViewController) as! CityWeatherForecastViewController
                    cityWeatherForeCastViewController.weatherForeCastViewModel.foreCastResponse = self?.searchViewModel.foreCastResponse ?? ForecastModel()
                    cityWeatherForeCastViewController.weatherForeCastViewModel.location = self?.searchViewModel.address ?? .emptyString
                    self?.navigationController?.pushViewController(cityWeatherForeCastViewController, animated: true)
                    self?.activityIndicator.stopAnimating()
                }
            }
            
        })
    }
    
    //MARK: - Error display and try again display handling
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        fetchLatLong(forAddress: searchViewModel.address)
    }
    
}

//MARK: - TextField delegate mathods
extension ViewController : UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        searchViewModel.address = textField.text ?? .emptyString
        textField.endEditing(true)
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchViewModel.address = textField.text ?? .emptyString
        textField.endEditing(true)
        return true
    }
}
