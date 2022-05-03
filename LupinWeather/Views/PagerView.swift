//
//  PagerView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/05/02.
//

import SwiftUI

struct PagerView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TabView{
            ForEach(0..<5) { i in
                Text("\(i)")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(Double(i)/5))
            }
        }
        .tabViewStyle(.automatic)
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView()
    }
}
