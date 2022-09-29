//
//  FullScreenHelpView.swift
//  
//
//  Created by Romain on 20/09/2022.
//

import SwiftUI


struct FullScreenHelpView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenHelpView(type: .badSignal, action: { }, close: { })
        FullScreenHelpView(type: .goLive, action: { }, close: { })
        FullScreenHelpView(type: .getPaid, action: { }, close: { })
    }
}

///Each type also contains its own content, to be added for each new case (no default case!)
public enum HelpPageType: String {
    case earnings, showTime, getPaid, goLive, badSignal
    
    var image: Image {
        switch self {
        case .earnings: return Image("moneyEmoji", bundle: .module)
        case .showTime: return Image("rocket", bundle: .module)
        case .getPaid: return Image("encoreATM", bundle: .module)
        case .goLive: return Image("stage3d", bundle: .module)
        case .badSignal: return Image("badSignal", bundle: .module)
        }
    }
    var title: String {
        switch self {
        case .earnings: return "Lifetime Earnings"
        case .showTime: return "Ready for Showtime"
        case .getPaid: return "Get Paid"
        case .goLive: return "Build Your Stage"
        case .badSignal: return "Bad Signal"
        }
    }
    
    
    var explaination : String {
    //TODO: switch self { ... }
    return  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna. \n\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."
    }
}

public struct FullScreenHelpView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State var type: HelpPageType = .showTime
    
    @State var action: () -> Void
    @State var close: () -> Void
    
    public var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            Image("livingRoom", bundle: .module).resizable()
            BlackGradient()
            Color.clear.background(.ultraThinMaterial)
                .colorScheme(.dark)
            if verticalSizeClass == .compact {
                HStack {
                    type.image
                    textView
                }
            } else {
                VStack {
                    type.image
                    textView
                }
            }
            CloseButton { close() }
        }
    }
    var textView: some View {
        VStack(spacing: 20) {
            Text(type.title)
                .inter(size: 32)
                .foregroundColor(.white)
            
            Text(type.explaination)
                .foregroundColor(.white)
                .inter(size: 14)
                .multilineTextAlignment(.center)
            
            ColorButton(icon: Image.plusCircle,
                        label: "Get Paid ", color: .transparentWhite, fontColor: .white, height: .medium) {
                action()
            }
        }.frame(maxWidth: 300)
            .padding(.horizontal, 30)
        
    }
}
