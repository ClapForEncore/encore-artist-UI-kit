//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 22/09/2022.
//

import SwiftUI



struct ProgressLabelView: View {
    
    @Binding var value: CGFloat
    @State var goal: CGFloat
    
    private var progress: CGFloat { value / goal }
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                Color.black.opacity(0.4).cornerRadius(9)
                Color.encorePollBlue.cornerRadius(9)
                    .frame(width: geometry.size.width * (value / goal))
            }
            Text(Int(value).description + "/" + Int(goal).description)
                .foregroundColor(.white)
                .inter(size: 20)
        }.frame(height: 68)
    }
}

struct ProgressLabelView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                HStack {
                    TileView {
                        VStack {
                            
                        }
                        ProgressLabelView(value: .constant(2800), goal: 3000)
                        ZStack(alignment: .bottomTrailing) {
                            Color.clear
                            Text("ACTIVE")
                                .kerning(0.25)
                                .interMedium(size: 6)
                                .foregroundColor(.encoreNeon)
                        }
                    }
                    TileView {
                        ProgressLabelView(value: .constant(1400), goal: 3000)
                    }
                }
                .frame(height: 128)
            }
            .padding()
        }
    }
}
