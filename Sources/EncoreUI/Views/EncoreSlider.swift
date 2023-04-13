//
//  ARTools.swift
//  
//
//  Created by Romain on 19/12/2022.
//

import SwiftUI

//class Example: ObservableObject {
//        @Published var value: CGFloat = 0.5
//        @Published var toggleValue: Bool = false
//}

//struct EncoreSlider_Previews: PreviewProvider {
//    static var example = Example()
//    static var previews: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//            ScrollView(.horizontal ) {
//                EncoreSlider()
//            }
//        }.environmentObject(example)
//    }
//}

struct CustomSlider: View {
    
    var minValue: CGFloat = 0
    var maxValue: CGFloat = 1
    var precision: Precision = .singleDecimal
    
    enum Precision: String {
        case doubleDecimal
        case singleDecimal
        case integer
        
        var format: String {
            switch self {
            case .doubleDecimal: return "%.2f"
            case .singleDecimal: return "%.1f"
            case .integer: return  "%.0f"
            }
        }
    }
    //@EnvironmentObject var example: Example
    #warning("use below for PROD, above for preview here ")
    @Binding var value: CGFloat
   
    var body: some View {
        HStack(spacing: 5) {
            Text(String(format: Precision.integer.format, minValue)).inter(size: 10)
                .foregroundColor(.white)
            
            GeometryReader { geometry in
                ZStack {
                    Color.clear.height(28)
                    Capsule().foregroundColor(.transparentWhite).height(3)
                    Capsule().foregroundColor(.encoreNeon).height(3)
                        .scaleEffect(x: value, anchor: .leading)
                    
                    ZStack {
                        Color.clear
                        ZStack {
                            Color.encoreNeon.cornerRadius(25)
                                .width(28).height(28)
                            Text(Int(value * 100).description)
                                .inter(size: 10)
                        }
                        .position(x: geometry.size.width * value, y: 14)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        self.value = min(max(0, CGFloat(value.location.x / geometry.size.width)), 1)
                    })
                )
            }
            Text(String(format: Precision.integer.format, maxValue)).inter(size: 10)
                .foregroundColor(.white)
        }
        .height(28)
        .width(150)
    }
}
