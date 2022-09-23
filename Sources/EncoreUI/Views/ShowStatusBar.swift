//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 14/09/2022.
//

import SwiftUI

public struct ShowStatusBar: View {
    
    @Binding var showName: String?
    @Binding var fans: Int
    @Binding var claps: Int
    @State var action: () -> Void
    @State var barTapped: () -> Void
    
    public init(showName: Binding<String?>,
                fans: Binding<Int>,
                claps: Binding<Int>,
                action: @escaping () -> Void,
                barTapped: @escaping () -> Void) {
        self._showName = showName
        self._fans = fans
        self._claps = claps
        self.action = action
        self.barTapped = barTapped
    }
    
    public var body: some View {
        
        HStack {
            UserIcon()
            barInfo
            ColorButton(icon: Image.stopCircle,
                        label: "End Show",
                        color: .encoreRed,
                        height: .small) {
                action()
            }.frame(width: 120)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 15)
        .padding(.vertical, 7)
        .frame(height: 38)
    }
    
    private var barInfo: some View {
        ZStack {
            Color.clear
            if let name = showName {
                Color.encoreLeastDark.cornerRadius(5)
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.system(size: 12))
                    HStack {
                        NumberView(iconName: "personIcon", number: $fans)
                        NumberView(iconName: "clapIcon", number: $claps)
                        Spacer()
                    }
                }.padding(4)
                ZStack(alignment: .bottomTrailing) {
                    Color.clear
                    Text("EDIT").font(.inter(size: 6))
                        .kerning(0.25)
                        .foregroundColor(.gray)
                        .padding(4)
                }
            } else {
                Text("Welcome to Encore Studio")
                    .kerning(-0.5)
                    .inter(size: 12)
            }
        }
        .frame(height: 38)
        .onTapGesture {
            barTapped()
        }
    }
    struct NumberView: View {
        @State var iconName = "personIcon"
        @Binding var number: Int
        
        var body: some View {
            HStack {
                Image(iconName, bundle: .module)
                Text(number.description)
                    .font(.system(size: 11))
            }
        }
    }
}

struct ShowStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ShowStatusBar(showName: .constant("This Is The Name Of Your Show"),
                              fans: .constant(1239),
                              claps: .constant(234245)) {
                    print("do something")
                } barTapped: {
                    print("edit show or something like that")
                }
                Spacer()
            }
        }
        .previewInterfaceOrientation(.portrait)
    }
}
