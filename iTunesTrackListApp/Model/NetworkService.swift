//
//  NetworkService.swift
//  iTunesTrackListApp
//
//  Created by Stepan Vasilyeu on 3/8/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

class NetworkService {
    
    func fetchTrack(searchTraks: String, completion: @escaping (SearchResponse?) -> Void) {
        
        let jsonUrl = "https://itunes.apple.com/search?term=\(searchTraks)&limit=25"
        
        guard let url = URL(string: jsonUrl) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                
                do {
                    let weatherProperty = try JSONDecoder().decode(SearchResponse.self, from: data)
                    DispatchQueue.main.async {
                        
                        let tempCelsius = fahrenheitInCelsius(fahrenheitTemp: (weatherProperty.main!.temp ?? 0))
                        let pressure = weatherProperty.main!.pressure ?? 0
                        let humidity = weatherProperty.main!.humidity ?? 0
                        let windSpeed = weatherProperty.wind!.speed ?? 0
                        let cloudiness = weatherProperty.clouds!.all ?? 0
                        let perceivedTemperature = windColdIndex(tempAir: tempCelsius, speedWind: windSpeed)
                        let cloudImageView = weatherProperty.weather![0].icon
                            
                        self.cityNameLabel.text = weatherProperty.name
                        self.weathersLabel.text = weatherProperty.weather![0].weatherDescription
                        self.temperatureCityLabel.text = ("\(NSString(format:"%.f", tempCelsius)) °")
                        self.perceivedTemperatureLabel.text = ("feels like: \(NSString(format:"%.f", perceivedTemperature)) °")
                        self.pressureLabel.text = ("pressure: \(NSString(format:"%.f", pressure)) hPa")
                        self.humidityLabel.text = ("humidity: \(NSString(format:"%.f", humidity)) %")
                        self.windSpeedLabel.text = ("wind: \(NSString(format:"%.f", windSpeed)) m/s")
                        self.cloudinessLabel.text = ("cloud: \(NSString(format:"%.f", cloudiness)) %")
                        self.cloudImageView.image = UIImage(named: cloudImageView ?? "sun")
                        
                        self.view.reloadInputViews()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    

}
