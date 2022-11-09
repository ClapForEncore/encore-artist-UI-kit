//
//  SegmentedControl.swift
//  
//  Created by Romain on 16/09/2022.
//

import SwiftUI

public struct SegmentedControl: View {
    @State var values: [Int]
    @Binding var selectedValue: Int
    
    public init(values: [Int], selectedValue: Binding<Int>) {
        self.values = values
        self._selectedValue = selectedValue
    }
    
    public var body: some View {
        HStack(spacing: 0.5) {
            ForEach(values, id: \.self) { value in
                ValueCell(value: value, selectedValue: $selectedValue)
                    .onTapGesture {
                        selectedValue = value
                    }
            }
        }
        .background(Color.transparentWhite)
        .clipShape(Capsule())
    }
    
    struct ValueCell: View {
        @State var value: Int
        @Binding var selectedValue: Int
        
        var body: some View {
            
            Text(value.description)
                .padding(.horizontal, 20)
                .frame(minWidth: 65)
                .padding(.vertical, 10)
                .foregroundColor(
                    value == selectedValue ? .black : .gray)
                .background(
                    value == selectedValue ? Color.white : Color.black)
                .inter(size: 14)
        }
    }
}


public struct SegmentedTextControl: View {
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
            }
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
            VStack {
                Spacer()
                SegmentedControl(values: [0, 5, 10, 30],
                                 selectedValue: $number)
                SegmentedTextControl(values: ["blue", "red", "sixtyfour", "crocodile"],
                                 selectedValue: $text)
                .padding(.horizontal, 30)
                Spacer()
            }
            
        }
    }
}
