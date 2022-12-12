//
//  SwiftUIView.swift
//  
//
//  Created by Ubicolor on 09/12/2022.
//

import SwiftUI


public struct BackgroundBlurView: View {
    
    var darkness = 0.7
    
    public var body: some View {
        ZStack {
            Color.black.opacity(darkness)
            VisualEffectView()
        }
    }
}

public struct VisualEffectView: UIViewRepresentable {
    
    public init() { }
    public func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    public func updateUIView(_ uiView: UIView, context: Context) {}
}
