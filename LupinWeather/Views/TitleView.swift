//
//  TitleView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/04/09.
//

import SwiftUI

struct TitleView: View, Identifiable {
    let id = UUID()
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack(spacing: 20) {
            if let location = locationManager.location {
                if let weather = weather {
                    Text(String(weather.current.temp))
                        .foregroundColor(.black)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    Text("Seoul")
                        .foregroundColor(.black)
                }
            }
        }
        .frame(height: 44)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
