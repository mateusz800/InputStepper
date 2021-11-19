//
//  InputStepper.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct InputStepper<Content:View>: View, Equatable {
    public static func == (lhs: InputStepper<Content>, rhs: InputStepper<Content>) -> Bool {
        return lhs.valueStore != nil
    }
    
    let content:Content
    @State var valueStore:ValueStore?
    @Binding var value:Float

    public init(
        _ value:Binding<Float>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._value = value
        self.content = content()
    }
    public var body:some View{
        content
            .environment(\.valueStore, valueStore ?? ValueStore(_value))
            .onAppear {
                valueStore = ValueStore(_value)
            }
    }
}



extension InputStepper{
    public func withStep(step:Float) -> some View{
        valueStore?.step = step
        return body
    }
    
}

/*
struct InputStepper_Previews: PreviewProvider {
    static var previews: some View {
        InputStepper(value: 0.0){
            HStack{
                MinusButton()
                Value()
                PlusButton()
            }
        }
    }
}
 */

