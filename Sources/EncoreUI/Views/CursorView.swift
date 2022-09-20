//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 07/04/2022.
//

import SwiftUI

struct CursorView: View {
    @State var up: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Button { up()} label: {
                Text("UP")
            }
            .buttonStyle(CursorButtonStyle())
            HStack(spacing: 10) {
                Button {  } label: {
                    Text("LEFT").bold()
                }
                .buttonStyle(CursorButtonStyle())
                Button { } label: {
                    Image("arrowsTowardsCenter", bundle: .module)
                        .resizable()
                }
                .buttonStyle(CursorButtonStyle(transparent: true))
                Button { } label: {
                    Text("RIGHT").bold()
                }
                .buttonStyle(CursorButtonStyle())
            }
            Button { } label: {
                Text("DOWN").bold()
            }
            .buttonStyle(CursorButtonStyle())
        }
    }
}

struct MoveObjectView_Previews: PreviewProvider {
    static var previews: some View {
        CursorView(up: { print("up")})
    }
}
