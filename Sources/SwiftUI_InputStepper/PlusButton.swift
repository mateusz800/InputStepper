//
//  PlusButton.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct PlusButton<Content:View>: View {
    @GestureState private var press = false
    @State var actionStart:Bool = false
    @Environment(\.valueStore) var valueStore: ValueStore
    let content:Content
    
    public init(@ViewBuilder content: @escaping () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        ControlButton(
            action: valueStore.increment,
            longPressStartAction: valueStore.startIncreasingValue,
            longPressStopAction: valueStore.stopIncreasingValue){
                content
           
        }
    }
}

extension PlusButton where Content == EmptyView {
    init(){
        self.init(content: { EmptyView() })
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
