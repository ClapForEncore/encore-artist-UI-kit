//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 08/11/2022.
//

import SwiftUI

public struct Badge: View {
    
    var icon: Image?
    var text: String
    var color: Color
    
    public init(icon: Image? = nil, text: String, color: Color) {
        self.icon = icon
        self.text = text
        self.color = color
    }
    public var body: some View {
        
        HStack(spacing: 2) {
            icon?.resizable().frame(width: 8, height: 8)
            Text(text).interBold(size: 7)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 5)
        .padding(.vertical, 4)
        .background(color)
        .cornerRadius(5)
    }
}

public struct SuperFanBadge: View {
    public init() {}
    public var body: some View {
        Badge(text: "SUPERFAN", color: Color.white.opacity(0.4))
    }
}
public struct Top3Badge: View {
    public init() {}
    public var body: some View {
        Badge(icon: .trophyFill, text: "TOP 3", color: .gucciGold)
    }
}
public struct DayOneBadge: View {
    public init() {}
    public var body: some View {
        Badge(icon: .heartFill, text: "DAY ONE", color: .encorePink)
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Badge(icon: .trophyFill, text: "TOP 3", color: .gucciGold)
            Badge(text: "SUPERFAN", color: Color.white.opacity(0.4))
            Badge(text: "+3", color: .encoreBlue)
            
            SuperFanBadge()
            Top3Badge()
            DayOneBadge()
            
        }
        .padding(50)
        .background(Color.black)
        .onAppear {
            Font.register()
        }
    }
}
