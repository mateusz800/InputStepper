//
//  PlusButton.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct PlusButton: View {
    @GestureState private var press = false
    @State var actionStart:Bool = false
    @Environment(\.valueStore) var valueStore: ValueStore
    
    public init(){}
    public var body: some View {
        ControlButton(
            action: valueStore.increment,
            longPressStartAction: valueStore.startIncreasingValue,
            longPressStopAction: valueStore.stopIncreasingValue){
            Text("PLUS")
        }
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
