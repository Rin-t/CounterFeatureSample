//
//  AppFeatureTest.swift
//  CounterFeatureSampleTests
//
//  Created by Rin on 2024/03/23.
//

import ComposableArchitecture
import XCTest
@testable import CounterFeatureSample


@MainActor
final class AppFeatureTests: XCTestCase {

    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }

        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }
    }
}
