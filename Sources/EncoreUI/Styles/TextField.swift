//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 16/09/2022.
//

import SwiftUI

enum TextFieldSize: CGFloat {
    case small = 10
    case medium = 14
    case big = 16
}

extension TextField {
    func encoreStyle(size: TextFieldSize = .medium, showBackground: Bool = true) -> some View {
        
        self.inter(size: size.rawValue)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(height: 36)
            .background(Color.white.opacity(showBackground ? 0.1 : 0))
            .cornerRadius(5)
            .accentColor(.encoreNeon)
            .padding(.horizontal, 20)
    }
}

struct EncoreTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                TextField("type in a username", text: .constant("ENCORE"))
                    .encoreStyle(size: .big, showBackground: false)
                TextField("type in a username", text: .constant("ENCORE"))
                    .encoreStyle(size: .medium, showBackground: false)
                TextField("type in a username", text: .constant("ENCORE"))
                    .encoreStyle(size: .small, showBackground: true)

            }
           
        }
    }
}
