//
//  ToggleView.swift
//  printify
//
//  Created by Vincent Angelo Larisma on 8/21/23.
//

import SwiftUI

struct ToggleView: View {
    
    @Binding var isOn: Bool
    var title: String
    
    var body: some View {
        HStack() {
            Text(title)
            Spacer()
            Toggle("", isOn: $isOn).labelsHidden()
        }
        .padding(.horizontal)
    }
}
