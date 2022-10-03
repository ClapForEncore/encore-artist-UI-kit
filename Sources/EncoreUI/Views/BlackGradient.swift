//
//  BottomGradient.swift
//  
//
//  Created by Romain on 15/09/2022.
//

import SwiftUI

///Transparent top to full black bottom
public struct BlackGradient: View {
    public init() { }
    public var body: some View {
        VStack {
            Spacer()
            LinearGradient(colors: [Color.black.opacity(0), .black], startPoint: .top, endPoint: .bottom)
        }
    }
}

fileprivate struct BottomGradient_Previews: PreviewProvider {
    static var previews: some View {
        BlackGradient()
    }
}
