//
//  MovingBannerView.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/03/29.
//

import SwiftUI

struct MovingBannerView: View {
    var body: some View {
        Marquee(text: "Tech , video Games, failed cooking attempts, vlogs and more!", font: .systemFont(ofSize: 16, weight: .regular))
            .background(Color.black)
    }
}

struct MovingBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MovingBannerView()
    }
}

//MARK: - Marguee Text View
struct Marquee: View {
    @State var text: String
    var font: NSFont
    @State var storedSize: CGSize = .zero
    @State var offset: CGFloat = 0
    var animationSpeed: Double = 0.02
    var delayTime: Double = 0
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Text(text)
                .font(Font(font))
                .offset(x: offset)
                .padding(.horizontal,15)
        }
        .frame(height: 33)
        .overlay(content: {
            HStack {
                let color: Color = scheme == .dark ? .black : .white
                
                LinearGradient(colors: [color, color.opacity(0.7), color.opacity(0.5), color.opacity(0.1)], startPoint: .leading, endPoint: .trailing)
                    .frame(width: 10)
                
                Spacer()
                
                LinearGradient(colors: [color, color.opacity(0.7), color.opacity(0.5), color.opacity(0.1)], startPoint: .trailing, endPoint: .leading)
                    .frame(width: 10)
            }
        })
        .disabled(true)
        .onAppear {
            let baseText = text
            (1...15).forEach { _ in
                text.append(" ")
            }
            storedSize = textSize()
            text.append(baseText)
            
            
            let timing: Double = (animationSpeed * storedSize.width)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                withAnimation(.linear(duration: timing)) {
                    offset = -storedSize.width
                }
            }
        }
        
        .onReceive(Timer.publish(every: ((animationSpeed * storedSize.width) + delayTime), on: .main, in: .default).autoconnect()) { _ in
            offset = 0
            withAnimation(.linear(duration: (animationSpeed * storedSize.width))) {
                offset = -storedSize.width
            }
        }
    }
    
    func textSize() -> CGSize {
        let attribute = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attribute)
        
        return size
    }
}
