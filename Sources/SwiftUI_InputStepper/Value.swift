//
//  Value.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct Value: View {
    @Environment(\.valueStore) var valueStore: ValueStore
    //@ObservedObject var valueObservedStore = valueStore
    @State var value: Float = 0
    
    public init(){}
    
    public var body: some View {
        Text(String(value ))
            .onReceive(valueStore.objectWillChange){ newValue in
                value = valueStore.value
            }.onAppear(perform: {
                value = valueStore.value
            })
             
    }
}

struct Value_Previews: PreviewProvider {
    static var previews: some View {
        Value()
    }
}
