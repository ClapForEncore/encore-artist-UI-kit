//
//  Fonts.swift

import SwiftUI

public extension Font {
    ///Needs to be called at app launch:
    ///`.onAppear { Font.register() }`
    ///The font files are included in the Swift packages and need to be delared int he app's info.plist.
    static func register() {
         for font in Font.encoreFonts {
            registerFont(bundle: .module, fontName: font, fontExtension: "ttf")
        }
     }

    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
                  fatalError("Couldn't create font from data")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
     
    
    static func anton(size: CGFloat) -> Font {
        return Font.custom("Anton", fixedSize: size)
    }

    static func inter(size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", fixedSize: size)
    }
    static func interBold(size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", fixedSize: size)
    }
    static func interSemiBold(size: CGFloat) -> Font {
        return Font.custom("Inter-SemiBold", fixedSize: size)
    }
    static func interExtraBold(size: CGFloat) -> Font {
        return Font.custom("Inter-ExtraBold", fixedSize: size)
    }
    static func interLight(size: CGFloat) -> Font {
        return Font.custom("Inter-Light", fixedSize: size)
    }
    static func interMedium(size: CGFloat) -> Font {
        return Font.custom("Inter-Medium", fixedSize: size)
    }
    static func interThin(size: CGFloat) -> Font {
        return Font.custom("Inter-Thin", fixedSize: size)
    }
    static func interExtraLight(size: CGFloat) -> Font {
        return Font.custom("Inter-ExtraLight", fixedSize: size)
    }
    static func interBlack(size: CGFloat) -> Font {
        return Font.custom("Inter-Black", fixedSize: size)
    }
    
    static let encoreFonts = ["Anton", "Inter-Regular", "Inter-Bold", "Inter-SemiBold","Inter-ExtraBold","Inter-Light", "Inter-Medium", "Inter-Thin", "Inter-ExtraLight", "Inter-Black"]
}
