//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 15/09/2022.
//

import SwiftUI


struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ToolBar()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct ToolBar: View {
    
    @State private var isCollapsed = true
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        
        ZStack(alignment: verticalSizeClass == .compact ? .topLeading : .topTrailing) {
            Color.clear
            ScrollView(verticalSizeClass == .compact ? .horizontal : .vertical, showsIndicators: false) {
                if verticalSizeClass == .compact {
                    HStack(spacing: 20) { toolsView }
                } else {
                    VStack(spacing: 20) { toolsView }
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(verticalSizeClass == .compact ? .leading : .trailing, 15)
    }
    
    private var toolsView: some View {
        Group {
            topTools
            Group {
                if isCollapsed {
                    EmptyView()
                } else {
                    otherTools
                }
            }
            .transition(.scale)
            barToggle
        }
    }
    
    func toggleOrientation() -> CGFloat {
        if verticalSizeClass == .compact {
            return !isCollapsed ? 270 : 90
        } else {
           return isCollapsed ? -180 : 0
        }
    }
    
    var barToggle: some View {
        VStack {
            Image.chevronsUp.foregroundColor(.white)
                .rotationEffect(.degrees(toggleOrientation()))
            Text(isCollapsed ? "More" : "Less")
                .interSemiBold(size: 8)
        }
        .frame(width: 35, height: 35)
        .onTapGesture {
            withAnimation(Animation.easeInOut(duration: 5)) { isCollapsed.toggle() }
        }
    }
    private var topTools: some View {
        Group {
            ToolButton(tool: Tool(name: "Video", icon: "videoCamera"))
            ToolButton(tool: Tool(name: "Sound", icon: "volumeHigh"))
        }
    }
    
    private let optionalTools = [
        Tool(name: "Fans", icon: "users"),
        Tool(name: "Polls", icon: "polls"),
        Tool(name: "Clap Goals" , icon: "slowMoCheck"),
        Tool(name: "AR" , icon:   "ar"),
        Tool(name: "Record" , icon:  "recordTool"),
        Tool(name: "Connect" , icon:  "lightning")
    ]
    
    private var otherTools: some View {
        Group {
            ForEach(optionalTools, id: \.self) { tool in
                ToolButton(tool: tool)
            }
        }
    }
    
    struct ToolButton: View {
        @State var tool: Tool
        
        var body: some View {
            VStack {
                Image(tool.icon, bundle: .module)
                    .foregroundColor(.white)
                Text(tool.name)
                    .interSemiBold(size: 8)
            }.frame(width: 35, height: 35)
        }
    }
}



struct Tool: Hashable {
    var name: String
    var icon: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

