//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 16/09/2022.
//

import SwiftUI

public enum TextFieldSize: CGFloat {
    case small = 10
    case medium = 14
    case large = 16
    
    var fontSize: CGFloat {
        switch self {
        case .small: return 10
        case .medium: return 14
        case .large: return 22
        }
    }
}

public extension TextField {
    func encoreStyle(placeHolder: String,
                     size: TextFieldSize = .medium,
                     showBackground: Bool = true,
                     alignment: TextAlignment = .center) -> some View {
        
        ZStack {
            HStack {
                Text(placeHolder).inter(size: size.rawValue)
                    .foregroundColor(.white).opacity(0.7)
                Spacer()
            }.padding(.horizontal, 15)
            
            self.inter(size: size.fontSize)
                .foregroundColor(.white)
                .multilineTextAlignment(alignment)
                .frame(height: 36)
                .padding(.horizontal, 15)
                .background(Color.white.opacity(showBackground ? 0.1 : 0))
                .cornerRadius(5)
                .accentColor(.encoreNeon)
                
        }
        
    }
}

struct EncoreTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                TextField("", text: .constant(""))
                    .encoreStyle(placeHolder: "Hello", size: .large, alignment: .leading)
            }
           
        }
    }
}
