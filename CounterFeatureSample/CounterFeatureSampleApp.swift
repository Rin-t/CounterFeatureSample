//
//  CounterFeatureSampleApp.swift
//  CounterFeatureSample
//
//  Created by Rin on 2024/03/18.
//

import SwiftUI
import ComposableArchitecture

@main
struct CounterFeatureSampleApp: App {
    var body: some Scene {
        WindowGroup {
            let store = Store(initialState: CounterFeature.State()) {
                CounterFeature()
            }
            ContentView(store: store)
        }
    }
}
