//
//  CloseButton.swift
//  EncoreArtist
//
//  Created by Romain on 09/08/2022.
//

import SwiftUI

/// Aways shows top right of the View it's in.
public struct CloseButton: View {
    
    @State var close: () -> Void
    
    public init(_ close: @escaping () -> Void) {
        self.close = close
    }
    
    public var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    withAnimation { close() }
                } label: {
                    ZStack {
                        Color.white.opacity(0.2)
                        Capsule().frame(width: 2, height: 12)
                            .rotationEffect(.degrees(45))
                        Capsule().frame(width: 2, height: 12)
                            .rotationEffect(.degrees(-45))
                    }
                    .clipShape(Circle())
                    .frame(width: 28, height: 28)
                    .contentShape(Rectangle())
                }
                .foregroundColor(.white)
            }
            Spacer()
        }.padding()
    }
}


struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            CloseButton { }
        }
    }
}
