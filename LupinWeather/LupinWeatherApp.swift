//
//  LupinWeatherApp.swift
//  LupinWeather
//
//  Created by 서충원 on 2022/03/29.
//

import SwiftUI

@main
struct LupinWeatherApp: App {
    //AppDelegate 연결
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        //NSpopover을 활용한 방법
        let contentView = ContentView()

        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        //Extension을 통한 backgroundColor 설정
        popover.backgroundColor = NSColor.red

        //StatusBarButton
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.title = "sdfsffesfse"
            MenuButton.action = #selector(MenuButtonToggle)
        }
        
    }
    
    //StatusBarButton Click
    @objc func MenuButtonToggle() {
        if let menuButton = statusItem?.button {
            self.popover.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.maxY)
        }
    }
}

