//
//  SwiftUIView.swift
//  
//
//  Created by Ubicolor on 30/09/2022.
//

import SwiftUI

public struct AvatarView: View {
    @Binding var url: String
    
    public init(url: Binding<String>) {
        self._url = url
    }
    
    public var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(.transparentWhite)
                .frame(width: 38, height: 38)
            
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
            } placeholder: {
                Image.personIcon
            }
            .frame(width: 32, height: 32)

        }.overlay(
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 12, height: 12)
                Image.filter
                    .resizable()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.black)
            }.offset(x: 14, y: 14)
        )
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HStack(spacing: 0) {
                Color.black
                Color.white
            }
            AvatarView(url: .constant(""))
        }
        
    }
}
