//
//  TitleView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/04/09.
//

import SwiftUI

struct TitleView: View, Identifiable {
    let id = UUID()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gangnam, Seoul")
                .foregroundColor(.black)
        }
        .frame(height: 44)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
