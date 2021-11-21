//
//  MinusButton.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct MinusButton<Content: View>: View {
    @Environment(\.valueStore) var valueStore: ValueStore
    let content: AnyView

    public init() where Content == EmptyView {
        self.content = AnyView(
            Text("MINUS")
        )
    }

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = AnyView(content())
    }

    public var body: some View {
        ControlButton(
            action: valueStore.decrement,
            longPressStartAction: valueStore.startDecreasingValue,
            longPressStopAction: valueStore.stopDecreasingValue) {
                content
            }

    }
}

struct MinusButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MinusButton()
            MinusButton {
                Text("CUSTOM MINUS")
            }
        }

    }
}
