//
//  ContentView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MovingBannerView()
            VStack {
                Text("Test Text")
                Spacer()
                HStack {
                    Text("Test Text")
                    Text("Test Text")
                }
                
                Spacer()
                Text("Test Text")
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing)
            )
            .frame(width: 200, height: 200, alignment: .center)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
