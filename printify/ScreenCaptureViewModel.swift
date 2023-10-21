//
//  ScreenCaptureViewModel.swift
//  printify
//
//  Created by Vincent Angelo Larisma on 8/28/23.
//

import Foundation
import HotKey


final class ScreenCaptureViewModel: ObservableObject {
    
    @Published var isPrintScreen: Bool      = true {
        didSet {
            if self.isPrintScreen {
                hotKey = HotKey(key: .p, modifiers: [.control])
            } else {
                hotKey = nil
            }
        }
    }
    @Published var isKeyBoardCleaning: Bool = false
    
    @Published private var hotKey: HotKey? {
        didSet {
            guard let hotKey else { return }
            
            hotKey.keyDownHandler = { _ = self.takeScreenCapture() }
        }
    }
    
    init() {
        if self.isPrintScreen {
            hotKey = HotKey(key: .o, modifiers: [.control])
            hotKey?.keyDownHandler = { _ = self.takeScreenCapture() }
        }
    }
    
    func takeScreenCapture() -> Bool {
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-cs"]
        task.launch()
        task.waitUntilExit()
        let status = task.terminationStatus
        
        return status == 0
    }
    
}
