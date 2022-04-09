//
//  Extensions.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/03/29.
//

import Foundation
import SwiftUI

extension NSPopover {
    
    private struct Keys {
        static var backgroundViewKey = "backgroundKey"
    }
    
    private var backgroundView: NSView {
        let bgView = objc_getAssociatedObject(self, &Keys.backgroundViewKey) as? NSView
        if let view = bgView {
            return view
        }
        
        let view = NSView()
        objc_setAssociatedObject(self, &Keys.backgroundViewKey, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        NotificationCenter.default.addObserver(self, selector: #selector(popoverWillOpen(_:)), name: NSPopover.willShowNotification, object: nil)
        return view
    }
    
    @objc private func popoverWillOpen(_ notification: Notification) {
        if backgroundView.superview == nil {
            if let contentView = contentViewController?.view, let frameView = contentView.superview {
                frameView.wantsLayer = true
                backgroundView.frame = NSInsetRect(frameView.frame, 1, 1)
                backgroundView.autoresizingMask = [.width, .height]
                frameView.addSubview(backgroundView, positioned: .below, relativeTo: contentView)
                
                
                
                //야호 여기서 그라데이션 설정하면 댐
//                var gradientLayer = CAGradientLayer()
//                gradientLayer.frame = backgroundView.bounds
//                gradientLayer.colors = [NSColor.red.cgColor,NSColor.green.cgColor]
//                frameView.layer?.addSublayer(gradientLayer)
            }
        }
    }
    
    var backgroundColor: NSColor? {
        get {
            if let bgColor = backgroundView.layer?.backgroundColor {
                return NSColor(cgColor: bgColor)
            }
            return nil
        }
        set {
            backgroundView.wantsLayer = true
            backgroundView.layer?.backgroundColor = newValue?.cgColor
        }
    }
}
