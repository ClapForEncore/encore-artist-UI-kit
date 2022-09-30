//
//  SwiftUIView 2.swift
//  
//
//  Created by Romain on 16/09/2022.
//

import SwiftUI

public struct RemoveButton: View {

    @State var action: () -> Void
    
    public init(_ action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Color.transparentWhite
                Capsule().frame(width: 2, height: 11)
                    .rotationEffect(.degrees(45))
                    .foregroundColor(.white)
                Capsule().frame(width: 2, height: 11)
                    .rotationEffect(.degrees(-45))
                    .foregroundColor(.white)
            }.frame(width: 27, height: 27)
                .clipShape(Circle())
        }
    }
}

fileprivate struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            RemoveButton { }
        }
    }
}
