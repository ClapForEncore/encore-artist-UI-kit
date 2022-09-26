//
//  SegmentedControl.swift
//  
//  Created by Romain on 16/09/2022.
//

import SwiftUI



//to be used for a number choice
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
                ValueCell(value: value,
                          isSelected: (value == selectedValue))
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
        @State var isSelected: Bool
        var body: some View {
            Text(value.description)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .foregroundColor(isSelected ? .black : .gray)
                .background(isSelected ? Color.white : Color.encoreLeastDark)
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
                customValue = values.first
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
    
    static var previews: some View {
        
        ZStack {
            Color.black
            
            VStack {
                Spacer()
                SegmentedControl(values: [500, 1500, 2000],
                                 selectedValue: .constant(500))
                TextField("", text: .constant("romain@clapforencore.com"))
                    .encoreStyle(size: .big, showBackground: false)
                    .padding()
            }
            
        }
    }
}

class PreviewModel: ObservableObject {
    @Published var number = "500"
}

//struct MockBackground: View {
//    var body: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//            Image("livingRoom", bundle: .module)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//            BottomGradient()
//        }
//    }
//}
