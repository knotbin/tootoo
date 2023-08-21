//
//  TootooApp.swift
//  Tootoo
//
//  Created by Beau Rubin-Rottenberg on 8/18/23.
//

import SwiftUI
import FirebaseCore

@main
struct TootooApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
