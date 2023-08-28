//
//  ContentView.swift
//  printify
//
//  Created by Vincent Angelo Larisma on 8/13/23.
//

import SwiftUI


struct ScreenCaptureView: View {
    @StateObject var viewModel: ScreenCaptureViewModel = ScreenCaptureViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(spacing: 0) {
                Label("Printify", systemImage: "line.3.crossed.swirl.circle")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Divider()
            }
           
            Spacer()
        
            Form {
                ToggleView(isOn: $viewModel.isPrintScreen, title: "Enable Screen Capture")
                ToggleView(isOn: $viewModel.isKeyBoardCleaning, title: "Keyboard Cleaning")
            }
            .toggleStyle(.switch)
            
            Spacer()
        }
        .frame(width: 230, height: 130)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenCaptureView()
    }
}
