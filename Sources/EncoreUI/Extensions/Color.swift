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
            }.ignoresSafeArea()
            
        }
        
    }
}

extension Color {
        
    
    static var transparentWhite: Color {
        Color.white.opacity(0.15)
    }
    
    static var lightGray: Color {
        Color(white: 0.1)
    }
    
    static var encoreBodyCopyText: Color {
        let uiColor = #colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreNeon: Color {
        let uiColor = #colorLiteral(red: 0.768627451, green: 1, blue: 0, alpha: 1)
        return Color(uiColor)
    }
    
    static var encorePurp: Color {
        let uiColor = #colorLiteral(red: 0.3019607843, green: 0.07058823529, blue: 0.9019607843, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreGreen: Color {
        let uiColor = #colorLiteral(red: 0.3725490196, green: 0.8588235294, blue: 0.3921568627, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreYellow: Color {
        let uiColor = #colorLiteral(red: 1, green: 0.9176470588, blue: 0.1803921569, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreRed: Color {
        let uiColor = #colorLiteral(red: 1, green: 0.2784313725, blue: 0.2784313725, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreAqua: Color {
        let uiColor = #colorLiteral(red: 0.0862745098, green: 0.8588235294, blue: 0.7647058824, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreDark: Color {
        let uiColor = #colorLiteral(red: 0.05490196078, green: 0.05490196078, blue: 0.05490196078, alpha: 1)
        return Color(uiColor)
    }
    
    static var encorePollBlue: Color {
        let uiColor = #colorLiteral(red: 0, green: 0.3411764706, blue: 1, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreLeastDark: Color {
        let uiColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreInactiveTextFields: Color {
        let uiColor = #colorLiteral(red: 0.3568627451, green: 0.3568627451, blue: 0.3568627451, alpha: 1)
        return Color(uiColor)
    }
    
    static var encoreKindaDark: Color {
        let uiColor = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        return Color(uiColor)
    }
    
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

