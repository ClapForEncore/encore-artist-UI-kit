//
//  BottomGradient.swift
//  
//
//  Created by Romain on 15/09/2022.
//

import SwiftUI

public struct BottomGradient: View {
    public var body: some View {
        VStack {
            Spacer()
            LinearGradient(colors: [Color.black.opacity(0), .black], startPoint: .top, endPoint: .bottom)
                .frame(height: 362)
        }
    }
}

struct BottomGradient_Previews: PreviewProvider {
    static var previews: some View {
        BottomGradient()
    }
}
