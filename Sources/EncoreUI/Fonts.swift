//
//  Fonts.swift

import SwiftUI

extension Font {
    
    public static func anton(size: CGFloat) -> Font {
        return Font.custom("Anton", fixedSize: size)
    }

    public static func inter(size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", fixedSize: size)
    }
    public static func interBold(size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", fixedSize: size)
    }
    public static func interSemiBold(size: CGFloat) -> Font {
        return Font.custom("Inter-SemiBold", fixedSize: size)
    }
    public static func interExtraBold(size: CGFloat) -> Font {
        return Font.custom("Inter-ExtraBold", fixedSize: size)
    }
    public static func interLight(size: CGFloat) -> Font {
        return Font.custom("Inter-Light", fixedSize: size)
    }
    public static func interMedium(size: CGFloat) -> Font {
        return Font.custom("Inter-Medium", fixedSize: size)
    }
    public static func interThin(size: CGFloat) -> Font {
        return Font.custom("Inter-Thin", fixedSize: size)
    }
    public static func interExtraLight(size: CGFloat) -> Font {
        return Font.custom("Inter-ExtraLight", fixedSize: size)
    }
    public static func interBlack(size: CGFloat) -> Font {
        return Font.custom("Inter-Black", fixedSize: size)
    }
    
    public static var allInterFonts: [String] {
        let fonts = ["Inter-Regular", "Inter-Bold", "Inter-SemiBold","Inter-ExtraBold","Inter-Light", "Inter-Medium", "Inter-Thin", "Inter-ExtraLight", "Inter-Black"]
        return fonts
    }
    
}
