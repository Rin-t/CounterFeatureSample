//
//  AppVIew.swift
//  CounterFeatureSample
//
//  Created by Rin on 2024/03/23.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {

//    let store1: StoreOf<CounterFeature>
//    let store2: StoreOf<CounterFeature>
    let store: StoreOf<AppFeature>

    var body: some View {
        TabView {
            ContentView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Text("Counter 1")
                }

            ContentView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Text("Counter 2")
                }
        }
    }
}

#Preview {
  AppView(
    store: Store(initialState: AppFeature.State()) {
      AppFeature()
    }
  )
}

