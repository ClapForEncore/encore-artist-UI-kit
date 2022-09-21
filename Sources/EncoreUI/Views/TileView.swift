//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 20/09/2022.
//

import SwiftUI

public struct TileView<Content: View>: View {
    let content: Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            Color.transparentWhite
            content
                .foregroundColor(.white)
                .padding()
        }
        .cornerRadius(9)
        .frame(minWidth: 92)
        .multilineTextAlignment(.center)
    }
}


struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.encoreDark
            ScrollView(.horizontal) {
                HStack {
                    TileView {
                    Image.infinity
                    }
                    TileView {
                        Image.encoreWordmark
                    }
                    TileView {
                        Image.encoreLogoECentered.resizable().aspectRatio(contentMode: .fit)
                    }
                    TileView {
                        ZStack {
                            Color.encoreDark.cornerRadius(4)
                            Text("TileView")
                                .padding()
                                .foregroundColor(.encoreNeon)
                        }

                    }
                }.frame(height: 128)
            }
        }
    }
}
