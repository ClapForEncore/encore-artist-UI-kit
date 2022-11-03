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

struct SegmentedControl_Previews: PreviewProvider {
     @State static var number = 0
    
    static var previews: some View {
        
        ZStack {
            Color.black
            VStack {
                Spacer()
                SegmentedControl(values: [0, 5, 10, 30],
                                 selectedValue: $number)
                Spacer()
            }
            
        }
    }
}

