//
//  SearchCityViewModel.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import CoreLocation

class SearchCityViewModel : NSObject {
    lazy var geocoder = CLGeocoder()
    lazy var lat = Double()
    lazy var long = Double()
    lazy var address = String()
    lazy var foreCastResponse = ForecastModel()

//    MARK: - Fetch latitude and longitude from city name
    func fetchLatLongFromAddress( addressString : String,
                completionHandler: @escaping(Result<CLLocationCoordinate2D , Error>) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                            
                    completionHandler(.success(location.coordinate))
                    return
                }
            }
            completionHandler(.failure(error!))
        }
    }
//    MARK: - Fetch weather forecast info
    
    func fetchWeatherForecastInfo(completion: @escaping(Result<ForecastModel , Error>) -> Void){
        let urlString = String.oneCallUrl + Constants.API_KEY + "&lat=" + String(lat) + "&lon=" + String(long)
        URLSession.shared.dataTask(with: URL(string : urlString)!){[weak self](data, response, error) in
            if (error != nil){
                completion(.failure(error!))
            }
            else{
            if (data != nil){
                    do{
                        let forecastResponse = try JSONDecoder.init().decode(ForecastModel.self, from: data!)
                        timeZone = forecastResponse.timezone ?? .emptyString
                        completion(.success(forecastResponse))
                    }catch let jsonError{
                        self?.foreCastResponse = ForecastModel()
                        completion(.failure(jsonError))
                    }
                }
            }
        }.resume()
    }
}
