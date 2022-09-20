//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 14/09/2022.
//

import SwiftUI

struct UserIcon: View {
    @State var image = Image.userCircle
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .frame(width: 38, height: 38)
            image
                .resizable()
                .frame(width: 36, height: 36)
        }.overlay(
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 12, height: 12)
                Image.filter
                    .resizable()
                    .frame(width: 6, height: 6)
            }.offset(x: 14, y: 14)
        )
    }
}

struct UserIcon_Previews: PreviewProvider {
    static var previews: some View {
        UserIcon()
    }
}
