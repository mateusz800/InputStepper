//
//  PlusButton.swift
//  
//
//  Created by Mateusz Budnik on 18/11/2021.
//

import SwiftUI

public struct PlusButton<Content: View>: View {
    @GestureState private var press = false
    @State var actionStart: Bool = false
    @Environment(\.valueStore) var valueStore: ValueStore
    let content: AnyView

    public init() where Content == EmptyView {
        self.content = AnyView(
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 30, height: 5)
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 5, height: 30)
            }
        )
    }

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = AnyView(content())
    }

    public var body: some View {
        ControlButton(
            action: valueStore.increment,
            longPressStartAction: valueStore.startIncreasingValue,
            longPressStopAction: valueStore.stopIncreasingValue) {
                content

        }
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlusButton()
            PlusButton {
                Text("CUSTOM PLUS")
            }
        }
    }
}
