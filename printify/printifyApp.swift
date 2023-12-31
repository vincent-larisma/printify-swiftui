//
//  printifyApp.swift
//  printify
//
//  Created by Vincent Angelo Larisma on 8/13/23.
//

import SwiftUI

@main
struct printifyApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let viewModel = ScreenCaptureViewModel()
        
        if let window = NSApplication.shared.windows.first {
                   window.close()
          }
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(systemSymbolName: "line.3.crossed.swirl.circle", accessibilityDescription: "camera lens shutter")
            statusButton.action = #selector(togglePopover)
            
            self.popover = NSPopover()
            self.popover.contentSize = NSSize(width: 230, height: 130)
            self.popover.behavior = .transient
            self.popover.contentViewController = NSHostingController(rootView: ScreenCaptureView(viewModel: viewModel))
        }
    }
    
    @objc func togglePopover() {
        if let button = statusItem.button {
            if popover.isShown {
                self.popover.performClose(nil)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }

}
