//
//  APIManager.swift
//  Meteo
//
//  Created by SERGEI on 02.02.2023.
//

import Foundation

class APIManager{
    static let shared = APIManager()
    
    let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m"
    
    func getWeather(complition: @escaping ([Double]) -> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) {
                complition(weatherData.hourly.temperature2M)
            }else{
                print("Fail")
            }
                
        }
        task.resume()
    }
}
