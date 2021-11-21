//
//  IncrementTest.swift
//  InputStepperTests
//
//  Created by Mateusz Budnik on 21/11/2021.
//

import XCTest
@testable import InputStepper

class ValueStoreTest: XCTestCase {
    let initialValue: Float = 25.35

    func incrementValueInValueStore() throws {
        let valueStore = ValueStore(.constant(initialValue))
        XCTAssertEqual(initialValue, valueStore.value);
        valueStore.increment()
        XCTAssertEqual(initialValue + valueStore.step, valueStore.value);
        valueStore.increment()
        XCTAssertEqual(initialValue + valueStore.step, valueStore.value);
    }
    
}
