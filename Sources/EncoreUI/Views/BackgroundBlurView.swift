//
//  SwiftUIView.swift
//  
//
//  Created by Ubicolor on 09/12/2022.
//

import SwiftUI

public struct BackgroundBlurView: UIViewRepresentable {
    var darkness = 0.7
    public init(darkness: CGFloat = 0.7) { }
    public func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = UIColor.black.withAlphaComponent(darkness)
        }
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}
