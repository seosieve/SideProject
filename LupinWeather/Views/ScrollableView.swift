//
//  ScrollableView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/05/02.
//

import SwiftUI

struct ScrollableView: View {
    
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            Button("Scroll") {
                withAnimation(.spring()) {
                    scrollToIndex = Int.random(in: 0..<20)
                }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<40) { index in
                        Text("This is \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: nil)
                        }
                    }
                }
            }
            
        }
    }
}

struct ScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableView()
    }
}
