//
//  Color.swift
//  
//
//  Created by Romain on 12/09/2022.
//

import SwiftUI

struct EncoreColorsView_Previews: PreviewProvider {
        
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            HStack {
                Color.encoreAqua
                Color.encoreYellow
                Color.encoreNeon
                Color.encoreRed
                Color.encoreLeastDark
                Color.encoreKindaDark
                Color.encoreDark
                Color.encorePollBlue
                Color.transparentWhite
                
            }.ignoresSafeArea()
            
            Text("BODY COPY TEXT")
                .foregroundColor(Color.encoreBodyCopyText
                ).interBlack(size: 90)
        }
    }
}

public extension Color {
            
    static var gucciGold =                  Color(.gucciGold)
    static var encoreBodyCopyText =         Color(.encoreBodyCopyText)
    static var encoreNeon =                 Color(.encoreNeon)
    static var encorePurp =                 Color(.encorePurp)
    static var encoreGreen =                Color(.encoreGreen)
    static var encoreYellow =               Color(.encoreYellow)
    static var encoreRed =                  Color(.encoreRed)
    static var encoreAqua =                 Color(.encoreAqua)
    static var encoreDark =                 Color(.encoreDark)
    static var encoreKindaDark =            Color(.encoreKindaDark)
    static var encoreLeastDark =            Color(.encoreLeastDark)
    static var encorePollBlue =             Color(.encorePollBlue)
    static var encoreInactiveTextFields =   Color(.encoreInactiveTextFields)
    static var lightGray =                  Color(.lightGray)
    static var transparentWhite =           Color(.transparentWhite)
    static var encoreDarkGray =             Color(.encoreDarkGray)
    static var offWhite =                   Color(.offWhite)
        
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    init(hex: String) {
        let scrubbed = hex.replacingOccurrences(of: "#", with: "")
        let hexs = scrubbed.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexs).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hexs.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    var hexValue: String? {
        return toHex()
    }

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor?.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

