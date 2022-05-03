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
            TitleView()
            MovingBannerView()
            ScrollableView()
            LupinView()
            Spacer()
        }
        .frame(width: 344, height: 640)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
