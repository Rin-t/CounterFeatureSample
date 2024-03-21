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
    struct State: Equatable {
        var count = 0
        var fact: String?
        var isLoading = false
        var isTimerRunning = false
    }

    enum Action: Equatable {
        case decrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case incrementButtonTapped
        case toggleTimerButtonTapped
        case timerTick
    }

    enum CancelID { case timer }

    @Dependency(\.continuousClock) var clock
    @Dependency(\.numberFact) var numberFact

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
                    try await send(.factResponse(self.numberFact.fetch(count)))
                }

            case .factResponse(let fact):
                state.fact = fact
                state.isLoading = false
                return .none
                
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none

            case .timerTick:
                state.count += 1
                state.fact = nil
                return .none

            case .toggleTimerButtonTapped:
                state.isTimerRunning.toggle()
                if state.isTimerRunning {
                    return .run { send in
                        while true {
                            try await Task.sleep(for: .seconds(1))
                            await send(.timerTick)
                        }
                    }
                    .cancellable(id: CancelID.timer)
                } else {
                    return .cancel(id: CancelID.timer)
                }

            }
        }
    }
}
