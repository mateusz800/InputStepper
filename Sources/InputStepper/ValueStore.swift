//
//  ValueStore.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import Foundation
import SwiftUI

class ValueStore: ObservableObject {
    let uuid = NSUUID().uuidString
    @Published var value: Float = 0
    var maxValue: Int?
    var minValue = 0
    var speed = 0.95
    var step: Float = 1
    var increaseWork: DispatchWorkItem?
    var decreaseWork: DispatchWorkItem?
    @Binding var bindedValue: Float

    init(_ bindedValue: Binding<Float>) {
        self._bindedValue = bindedValue
        self.value = self.bindedValue
    }

    func increment() {
        guard let maxValue = maxValue else {
            value += step
            bindedValue = value
            return
        }
        guard value < Float(maxValue) else {
            return
        }
        value += step
        bindedValue = value
    }

    func decrement() {
        guard value > Float(minValue) else {
            return
        }
        value -= step
        bindedValue = value
    }

    func startIncreasingValue() {
        increaseWork = DispatchWorkItem {
            while !(self.increaseWork?.isCancelled ?? false) {
                DispatchQueue.main.async {
                    guard let maxValue = self.maxValue else {
                        self.value += self.step
                        return
                    }
                    guard self.value > Float(maxValue) else {
                        self.value += self.step
                        return
                    }
                }
                Thread.sleep(forTimeInterval: 1 - self.speed)
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: increaseWork!)
    }

    func stopIncreasingValue() {
        increaseWork?.cancel()
        bindedValue = value
    }

    func startDecreasingValue() {
        decreaseWork = DispatchWorkItem {
            while !(self.decreaseWork?.isCancelled ?? false) {
                DispatchQueue.main.async {
                    guard self.value < Float(self.minValue) else {
                        self.value -= self.step
                        return
                    }
                }
                Thread.sleep(forTimeInterval: 1 - self.speed)
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: decreaseWork!)
    }

    func stopDecreasingValue() {
        decreaseWork?.cancel()
        bindedValue = value
    }
}
