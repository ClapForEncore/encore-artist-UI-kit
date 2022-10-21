//
//  SegmentedControl.swift
//  
//  Created by Romain on 16/09/2022.
//

import SwiftUI

public struct SegmentedControl: View {
    @State var values: [Int]
    @Binding var selectedValue: Int
    @State private var customValue: Int? = nil
    
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
            customValueCell
                .frame(maxWidth: 90)
            }
        .background(Color.white.opacity(0.4))
                .clipShape(Capsule())
        
    }
    
    struct ValueCell: View {
        @State var value: Int
        @Binding var selectedValue: Int
        var body: some View {
            Text(value.description)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .foregroundColor(
                    value == selectedValue ? .black : .gray)
                .background(
                    value == selectedValue ? Color.white : Color.encoreLeastDark)
                .inter(size: 14)
                    
        }
    }
    
    private var customValueCell: some View {
        TextField("Custom", text: Binding(get: {
            if let value = customValue {
                return value.description
            } else {
                return "Custom"
            }
           
        }, set: { text in
            if let number = Double(text), number > 0 {
                customValue = Int(number)
                selectedValue = customValue ?? 0
            } else {
                customValue = nil
            }
        }))
        .keyboardType(.numberPad)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .foregroundColor(customValue == selectedValue ? .black : .gray)
            .background(customValue == selectedValue ? Color.white : Color.encoreLeastDark)
            .inter(size: 14)
    }
}

struct SegmentedControl_Previews: PreviewProvider {
     @State static var number = 500
    
    static var previews: some View {
        
        ZStack {
            Color.black
            
            VStack {
                Spacer()
                SegmentedControl(values: [500, 1500, 2000],
                                 selectedValue: $number)
                Spacer()
            }
            
        }
    }
}

