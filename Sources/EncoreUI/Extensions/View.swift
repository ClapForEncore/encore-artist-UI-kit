//
//  View.swift
//  
//
//  Created by Romain on 15/09/2022.
//

import SwiftUI

extension View {
    func inter(size: CGFloat) ->            some View { self.font(.inter(size: size)) }
    func interBold(size: CGFloat) ->        some View { self.font(.interBold(size: size)) }
    func interSemiBold(size: CGFloat) ->    some View { self.font(.interSemiBold(size: size)) }
    func interExtraBold(size: CGFloat) ->   some View { self.font(.interExtraBold(size: size)) }
    func interLight(size: CGFloat) ->       some View { self.font(.interLight(size: size)) }
    func interMedium(size: CGFloat) ->      some View { self.font(.interMedium(size: size)) }
    func interThin(size: CGFloat) ->        some View { self.font(.interThin(size: size)) }
    func interExtraLight(size: CGFloat) ->  some View { self.font(.interExtraLight(size: size)) }
    func interBlack(size: CGFloat) ->       some View { self.font(.interBlack(size: size)) }
}
