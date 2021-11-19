//
//  MinusButton.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct MinusButton: View {
    @Environment(\.valueStore) var valueStore: ValueStore
    public init(){}
    public var body: some View {
        ControlButton(
            action: valueStore.decrement,
            longPressStartAction: valueStore.startDecreasingValue,
            longPressStopAction: valueStore.stopDecreasingValue){
                Text("MINUS")
            }
        
    }
}

    struct MinusButton_Previews: PreviewProvider {
        static var previews: some View {
            MinusButton()
        }
    }
