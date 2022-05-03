//
//  ControlButtonView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/05/02.
//

import SwiftUI

struct ControlButtonView: View {
    @State var index: Int = 0
    @State var selectedIndex: Int = 0
    @State var showingSubview = false
    
    let titles: [String] =
        ["First",
         "Second",
         "Third",
         "Fourth"
        ]
    
    var body: some View {
        VStack{
            SegmentedControlView(selectedIndex: $index, titles: titles)
            StackNavigationView(currentSubviewIndex: self.$selectedIndex, showingSubview: self.$showingSubview) { index in
                self.subView(forIndex: index)
            } rootView: {
                <#code#>
            }

        }
        }
}

struct ControlButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtonView()
    }
}
