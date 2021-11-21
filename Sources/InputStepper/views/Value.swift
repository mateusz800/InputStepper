//
//  Value.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct Value: View {
    @Environment(\.valueStore) var valueStore: ValueStore
    // @ObservedObject var valueObservedStore = valueStore
    @State var value: Float = 0
    @State var decimalPlaces: Int
    @State var fixedDecimalPlaces: Bool

    public init() {
        decimalPlaces = 0
        fixedDecimalPlaces = false
    }

    public init(decimalPlaces: Int) {
        self.decimalPlaces = decimalPlaces
        fixedDecimalPlaces = true
    }

    public var body: some View {
        Text(String(format: "%.\(decimalPlaces)f", value))
            .onReceive(valueStore.objectWillChange) { _ in
                value = valueStore.value
            }.onAppear(perform: {
                value = valueStore.value
            }).onChange(of: value, perform: {newValue in
                if !fixedDecimalPlaces && newValue.decimalPlaces > decimalPlaces {
                    decimalPlaces = newValue.decimalPlaces
                }
            })

    }
}

struct Value_Previews: PreviewProvider {
    static var previews: some View {
        Value()
    }
}
