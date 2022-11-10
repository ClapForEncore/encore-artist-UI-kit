//
//  SegmentedControl.swift
//  
//  Created by Romain on 16/09/2022.
//

import SwiftUI

public struct SegmentedControl: View {
    
    @State var values: [String]
    @Binding var selectedValue: String
    @State private var cellWidth: CGFloat = 40
    public init(values: [String], selectedValue: Binding<String>) {
        self.values = values
        self._selectedValue = selectedValue
    }
    
    public var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: 0.5) {
                ForEach(values, id: \.self) { value in
                    ValueCell(value: value, selectedValue: $selectedValue, width: cellWidth)
                        .onTapGesture {
                            selectedValue = value
                        }
                }
            }
            .background(Color.transparentWhite)
            .clipShape(Capsule())
            .onAppear {
                cellWidth = geometry.size.width / CGFloat(values.count)
            }
        }.height(36)

    }
    
    struct ValueCell: View {
        @State var value: String
        @Binding var selectedValue: String
        var width: CGFloat
        
        var body: some View {
            Text(value.description)
                .width(width)
                .padding(.vertical, 10)
                .foregroundColor(
                    value == selectedValue ? .black : .gray)
                .background(
                    value == selectedValue ? Color.white : Color.black)
                .inter(size: 14)
        }
    }
}


struct SegmentedControl_Previews: PreviewProvider {
    @State static var number = 0
    @State static var text = "crocodile"
    
    static var previews: some View {
        
        ZStack {
            Color.encoreLeastDark
            VStack(spacing: 0) {
                Spacer()
                SegmentedControl(values: [0.description, 5.description, 10.description, 30.description],
                                 selectedValue:
                                    Binding(get: { number.description },
                                            set: { newValue in
                    number = Int(newValue) ?? 0
                }))
                SegmentedControl(values:["blue", "red", "sixtyfour", "crocodile"], selectedValue: $text)
            }
        }
    }
    
}

