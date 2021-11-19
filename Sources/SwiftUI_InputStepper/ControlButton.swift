//
//  ControlButton.swift
//  
//
//  Created by Mateusz Budnik on 19/11/2021.
//

import SwiftUI

struct ControlButton<Content:View>: View {
    @GestureState private var press = false
    @State var actionStart:Bool = false
    var action: () -> Void
    var longPressStartAction: () -> Void
    var longPressStopAction: () -> Void
    
    let content:Content
    public init(
        action:@escaping ()->Void,
        longPressStartAction: @escaping () -> Void,
        longPressStopAction: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.longPressStartAction = longPressStartAction
        self.longPressStopAction = longPressStopAction
        self.content = content()
    }
    
    var body: some View {
        Button(action: action){
            content
        }.simultaneousGesture(
            DragGesture(minimumDistance:0)
                .onChanged({_ in
                    if !actionStart{
                        longPressStartAction()
                    }
                    self.actionStart = true
                    
                })
                .onEnded({_ in
                    longPressStopAction()
                    self.actionStart = false
                    
                })
                .updating($press, body:  { (value, gestureState, transaction) in }))
    }
}

struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlButton(
            action: {},
            longPressStartAction: {},
            longPressStopAction: {}
        ){
            Text("Control Button")
        }
    }
}
