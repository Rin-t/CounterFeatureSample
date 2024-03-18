//
//  ContentView.swift
//  CounterFeatureSample
//
//  Created by Rin on 2024/03/18.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {

    let store: StoreOf<CounterFeature>

    var body: some View {
        VStack {
            Text("\(store.count)")
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .presentationCornerRadius(10)

            HStack {
                Button("-") {
                    store.send(.decrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .presentationCornerRadius(10)

                Button("+") {
                    store.send(.incrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .presentationCornerRadius(10)
            }
            Button("Fact") {
                store.send(.factButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .presentationCornerRadius(10)
        }
    }
}

#Preview {
    let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
    }
    return ContentView(store: store)
}
