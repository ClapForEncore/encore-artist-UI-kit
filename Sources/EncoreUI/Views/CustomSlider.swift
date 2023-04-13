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

public enum SliderPrecision: String {
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
public struct CustomSlider: View {
    @Binding var value: CGFloat
    var minValue: CGFloat = 0
    var maxValue: CGFloat = 100
    var precision: SliderPrecision = .singleDecimal
    
   
    public init(value: Binding<CGFloat>, minValue: CGFloat, maxValue: CGFloat, precision: SliderPrecision = .singleDecimal) {
        self._value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.precision = precision
    }
    
    public var body: some View {
        HStack(spacing: 5) {
            Text(String(format: SliderPrecision.integer.format, minValue))
                .inter(size: 10)
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
                            Text(Int(value).description)
                                .inter(size: 10)
                        }
                        .position(x: geometry.size.width * (value / maxValue), y: 14)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        self.value = min(max(0, CGFloat(value.location.x / geometry.size.width) * maxValue), maxValue)
                    })
                )
            }
            .width(200)
            Text(String(format: SliderPrecision.integer.format, maxValue)).inter(size: 10)
                .foregroundColor(.white)
        }
        .height(28)
        
    }
}
