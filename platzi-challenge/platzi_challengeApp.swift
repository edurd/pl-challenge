//
//  platzi_challengeApp.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 14/07/23.
//

import SwiftUI

@main
struct platzi_challengeApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ComicsContentView()
                .environmentObject(networkMonitor)
        }
    }
}
