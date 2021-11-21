//
//  InputStepper.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct InputStepper<Content: View>: View, Equatable {
    let content: Content
    @State var valueStore: ValueStore
    @Binding var value: Float

    public init(
        _ value: Binding<Float>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._value = value
        self.content = content()
        self._valueStore = State(initialValue: ValueStore(_value))
    }

    public var body:some View {
        content
            .environment(\.valueStore, valueStore)
    }

    public func withStep(step: Float) -> Self {
        valueStore.step = step
        return self
    }

    public static func == (lhs: InputStepper<Content>, rhs: InputStepper<Content>) -> Bool {
        return true
    }
}

struct InputStepper_Previews: PreviewProvider {
    static var previews: some View {
        @State var value: Float = 0
        return InputStepper($value) {
            HStack {
                MinusButton()
                Value()
                PlusButton()
            }
        }
    }
}
