//
//  FullScreenHelpView.swift
//  
//
//  Created by Romain on 20/09/2022.
//

import SwiftUI

//rocket, encoreAtm, badSignal, microphoneWhite, stage

public struct FullScreenHelpView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    public var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            Image("livingRoom", bundle: .module).resizable()
            BottomGradient()
            Color.clear.background(.ultraThinMaterial)
                .colorScheme(.dark)
            if verticalSizeClass == .compact {
                HStack {
                    imageView
                    textView
                }
            } else {
                VStack {
                    imageView
                    textView
                }
            }
        }
    }
    
    var imageView: some View {
        Image("moneyEmoji", bundle: .module)
    }
    var textView: some View {
        VStack(spacing: 20) {
            Text("Lifetime Earnings")
                .inter(size: 32)
                .foregroundColor(.white)
            
            
            Text(explaination)
                .foregroundColor(.white)
                .inter(size: 14)
                .multilineTextAlignment(.center)
            
            ColorButton(icon: Image.plusCircle,
                        label: "Get Paid ", color: .transparentWhite, fontColor: .white, height: .medium) {
                
            }
        }.frame(maxWidth: 300)
            .padding(.horizontal, 30)
        
    }
    
    let explaination = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. \n\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."
}

struct FullScreenHelpView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenHelpView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
