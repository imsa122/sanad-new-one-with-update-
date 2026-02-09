//
//  SanadApp.swift
//  Sanad
//
//  Created by hhhh on 20/08/1447 AH.
//  Updated to use enhanced views
//

import SwiftUI

@main
struct SanadApp: App {
    
    init() {
        setupAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            EnhancedMainView()
                .onAppear {
                    requestPermissions()
                }
        }
    }
    
    private func setupAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
    }
    
    private func requestPermissions() {
        LocationManager.shared.requestPermission()
        
        EnhancedReminderManager.requestPermission { granted in
            print(granted ? "✅ Notifications granted" : "❌ Notifications denied")
        }
        
        EnhancedVoiceManager.shared.requestPermission { granted in
            print(granted ? "✅ Speech recognition granted" : "❌ Speech recognition denied")
        }
    }
}
