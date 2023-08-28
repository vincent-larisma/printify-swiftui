//
//  ScreenCaptureViewModel.swift
//  printify
//
//  Created by Vincent Angelo Larisma on 8/28/23.
//

import Foundation
import HotKey


final class ScreenCaptureViewModel: ObservableObject {
    
    @Published var isPrintScreen: Bool = true
    @Published var isKeyBoardCleaning: Bool = false
    
    let hotKey = HotKey(key: .p, modifiers: [.control])
    
    init() {
        hotKey.keyDownHandler = {
            if self.takeScreenCapture() {
                // success
            } else {
                print("failed to capture screen")
            }
        }
    }
    
    func takeScreenCapture() -> Bool {
        guard self.isValidPrintScreen() else { return false}
        
        let task = Process()
        task.launchPath = "/usr/sbin/screencapture"
        task.arguments = ["-cs"]
        task.launch()
        task.waitUntilExit()
        let status = task.terminationStatus
        
        return status == 0
        
    }
    
    func isValidPrintScreen() -> Bool {
        isPrintScreen == true
    }
    
}
