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
    
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }

    var body: some Scene {
        WindowGroup {
            AppView(store: CounterFeatureSampleApp.store)
        }
    }
}
