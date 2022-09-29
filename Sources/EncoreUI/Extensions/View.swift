//
//  View.swift
//  
//
//  Created by Romain on 15/09/2022.
//

import SwiftUI

public extension View {
    func inter(size: CGFloat) ->            some View { self.font(.inter(size: size)) }
    func interBold(size: CGFloat) ->        some View { self.font(.interBold(size: size)) }
    func interSemiBold(size: CGFloat) ->    some View { self.font(.interSemiBold(size: size)) }
    func interExtraBold(size: CGFloat) ->   some View { self.font(.interExtraBold(size: size)) }
    func interLight(size: CGFloat) ->       some View { self.font(.interLight(size: size)) }
    func interMedium(size: CGFloat) ->      some View { self.font(.interMedium(size: size)) }
    func interThin(size: CGFloat) ->        some View { self.font(.interThin(size: size)) }
    func interExtraLight(size: CGFloat) ->  some View { self.font(.interExtraLight(size: size)) }
    func interBlack(size: CGFloat) ->       some View { self.font(.interBlack(size: size)) }
    
    func width(_ width: CGFloat) -> some View { self.frame(width: width) }
    func height(_ height: CGFloat) -> some View { self.frame(height: height) }

    func `if`<T: View>(_ conditional: Bool, transform: (Self) -> T) -> some View {
        Group {
            if conditional {
                transform(self)
            } else {
                self
            }
        }
    }
}


