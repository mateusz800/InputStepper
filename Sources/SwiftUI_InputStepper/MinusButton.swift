//
//  MinusButton.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct MinusButton<Content:View>: View {
    @Environment(\.valueStore) var valueStore: ValueStore
    let content:Content
    
    public init(@ViewBuilder content: @escaping () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        ControlButton(
            action: valueStore.decrement,
            longPressStartAction: valueStore.startDecreasingValue,
            longPressStopAction: valueStore.stopDecreasingValue){
                content
            }
        
    }
}

extension MinusButton where Content == EmptyView {
    init(){
        self.init(content: { EmptyView() })
    }
}

    struct MinusButton_Previews: PreviewProvider {
        static var previews: some View {
            MinusButton()
        }
    }
