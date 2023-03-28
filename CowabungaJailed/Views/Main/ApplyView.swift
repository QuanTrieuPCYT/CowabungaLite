//
//  ApplyView.swift
//  CowabungaJailed
//
//  Created by Rory Madden on 21/3/2023.
//

import SwiftUI

struct ApplyView: View {
    @StateObject private var logger = Logger.shared
    
    var body: some View {
        List {
            ForEach(Array(DataSingleton.shared.allEnabledTweaks()), id: \.self) { tweak in
                HStack(spacing: 5) {
                    Text("•")
                        .foregroundColor(.secondary)
                    Text(tweak.rawValue)
                        .foregroundColor(.primary)
                }
            }
            
            NiceButton(text: AnyView(
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Apply Tweaks")
                }
            )) {
                applyTweaks()
            }
            TextEditor(text: $logger.logText).font(Font.system(.body, design: .monospaced)).frame(height: 250)
        }
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView()
    }
}
