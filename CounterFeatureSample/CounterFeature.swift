//
//  CounterFeature.swift
//  CounterFeatureSample
//
//  Created by Rin on 2024/03/18.
//

import Foundation
import ComposableArchitecture


@Reducer
struct CounterFeature {

    @ObservableState
    struct State {
        var count = 0
        var fact: String?
        var isLoading = false
    }

    enum Action {
        case decrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case incrementButtonTapped
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none

            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true

                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "http://numbersapi.com/\(count)")!)

                    let fact = String(decoding: data, as: UTF8.self)
                    await send(.factResponse(fact))
                }

            case .factResponse(let fact):
                state.fact = fact
                state.isLoading = false
                return .none
                
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
            }




        }
    }
}
