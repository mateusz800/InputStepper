//
//  Environment.swift
//  
//
//  Created by Mateusz Budnik on 19/11/2021.
//

import SwiftUI

private struct ValueStoreKey: EnvironmentKey {
    @State static  var value: Float = 0
    static let defaultValue = ValueStore($value)
}

extension EnvironmentValues{
    var valueStore:ValueStore{
        get{self[ValueStoreKey.self]}
        set { self[ValueStoreKey.self] = newValue }
    }
}
