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
    let unit: String

    public init() {
        decimalPlaces = 0
        fixedDecimalPlaces = false
        unit = ""
    }

    public init(decimalPlaces: Int, unit: String = "") {
        self.decimalPlaces = decimalPlaces
        self.unit = unit
        fixedDecimalPlaces = true
    }

    public var body: some View {
        Text(String(format: "%.\(decimalPlaces)f %@", value, unit))
            .font(.system(size: 30))
            .fontWeight(.bold)
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
