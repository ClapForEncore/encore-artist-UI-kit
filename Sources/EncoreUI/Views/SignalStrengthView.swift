//
//  SwiftUIView.swift
//  
//
//  Created by Ubicolor on 14/09/2022.
//

import SwiftUI

struct SignalStrengthView: View {

    @Binding var bars: Int
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 2) {
            Capsule().frame(width: 2, height: 3)
                .foregroundColor(bars > 0 ? Color.encoreNeon : Color.white.opacity(0.1))
            Capsule().frame(width: 2, height: 6)
                .foregroundColor(bars > 1 ? Color.encoreNeon : Color.white.opacity(0.1))
            Capsule().frame(width: 2, height: 10)
                .foregroundColor(bars > 2 ? Color.encoreNeon : Color.white.opacity(0.1))
            Capsule().frame(width: 2, height: 14)
                .foregroundColor(bars > 3 ? Color.encoreNeon : Color.white.opacity(0.1))

        }
        .frame(width: 14, height: 14)
        
    }
    
}

struct SignalStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SignalStrengthView(bars: .constant(3))
        }
    }
}
