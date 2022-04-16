//
//  WeatherManager.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/04/16.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,alerts&appid=bbcf0be26eeffc45855a6977e3137a69&units=metric") else { fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

struct ResponseBody: Decodable {
    
    var lat: Double
    var lon: Double
    var timezone: String
    var current: CurrentResponse
    
    struct CurrentResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var humidity: Int
    }
    
    
    
//    var coord: CoordinatesResponse
//    var weather: [WeatherResponse]
//    var main: MainResponse
//    var name: String
//    var wind: WindResponse
//
//    struct CoordinatesResponse: Decodable {
//        var lon: Double
//        var lat: Double
//    }
//
//    struct WeatherResponse: Decodable {
//        var id: Double
//        var main: String
//        var description: String
//        var icon: String
//    }
//
//    struct MainResponse: Decodable {
//        var temp: Double
//        var feels_like: Double
//        var temp_min: Double
//        var temp_max: Double
//        var pressure: Double
//        var humidity: Double
//    }
//
//    struct WindResponse: Decodable {
//        var speed: Double
//        var deg: Double
//    }
}
