//
//  SegmentedControl.swift
//  
//  Created by Romain on 16/09/2022.
//

import SwiftUI

struct SegmentedControl: View {
    @State var values: [String]
    @Binding var selectedValue: String
    var body: some View {
        
        HStack(spacing: 0.5) {
                ForEach(values, id: \.self) { value in
                    ValueCell(value: value,
                              isSelected: (value == selectedValue))
                        .onTapGesture {
                            selectedValue = value
                        }
                }
            }
        .background(Color.white.opacity(0.4))
                .clipShape(Capsule())
        
    }
    
    struct ValueCell: View {
        @State var value: String
        @State var isSelected: Bool
        var body: some View {
            Text(value)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .foregroundColor(isSelected ? .black : .gray)
                .background(isSelected ? Color.white : Color.encoreLeastDark)
                .inter(size: 14)
                    
        }
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            Color.black
            
            VStack {
                Spacer()
                SegmentedControl(values: ["500", "1000", "2000"],
                                 selectedValue: .constant("500"))
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
