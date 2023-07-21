//
//  platzy_challengeApp.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import SwiftUI

@main
struct platzy_challengeApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ComicsContentView()
                .environmentObject(networkMonitor)
        }
    }
}
