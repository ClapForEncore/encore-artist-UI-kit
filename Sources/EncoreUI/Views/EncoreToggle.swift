//
//  EncoreToggle.swift
//  
//
//  Created by Romain on 20/09/2022.
//

import SwiftUI

public struct EncoreToggle: View {
    
    @Binding var isOn: Bool
    
    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    public var body: some View {
        ZStack {
            Capsule().foregroundColor(.transparentWhite)
                .frame(width: 66, height: 38)
            Color(hue: 74/255, saturation: isOn ? 1 : 0, brightness: 1)
                .opacity(isOn ? 1 : 0.15)
                .clipShape(Circle())
                .offset(x: isOn ? 14 : -14)
                .frame(width: 28, height: 28)
            
        }
        .onTapGesture {
            withAnimation(.spring()) { isOn.toggle() }
        }
    }
}

struct EncoreToggle_Previews: PreviewProvider {
    
    static var previews: some View {
        EncoreToggle(isOn: .constant(true))
    }
}
