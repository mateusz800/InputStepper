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
    let font: Font
    let fontWeight: Font.Weight
    let unit: String

    public init() {
        decimalPlaces = 0
        fixedDecimalPlaces = false
        unit = ""
        font = .system(size: 30)
        fontWeight = .bold
    }

    public init(decimalPlaces: Int, unit: String = "", font: Font = .system(size: 30), fontWeight: Font.Weight = .bold) {
        self.decimalPlaces = decimalPlaces
        self.unit = unit
        self.font = font
        self.fontWeight = fontWeight
        fixedDecimalPlaces = true
    }

    public var body: some View {
        Text(String(format: "%.\(decimalPlaces)f %@", value, unit))
            .font(font)
            .fontWeight(fontWeight)
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
    func withFont(font: Font, fontWeight: Font.Weight = .regular) {
    }
}

struct Value_Previews: PreviewProvider {
    static var previews: some View {
        Value()
    }
}
