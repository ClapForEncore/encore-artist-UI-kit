import SwiftUI


public extension Font {

     public static func registerFonts() {
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
 }


struct Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                
                ZStack(alignment: .topLeading) {
                    ZStack(alignment: .top) {
                        Image("livingRoom", bundle: .module)
                            .resizable()
                            .aspectRatio(9/16, contentMode: .fit)
                        Group {
                            encoreLogo
                            signalStrength
                            BlackGradient()
                        }.padding(.top, 20)
                    }
                }
            }
            bottomMenu
        }
        .previewInterfaceOrientation(.portrait)
    }
    
    static var signalStrength: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            SignalStrengthView(.constant(3))
                .padding(.leading, 27)
        }
    }
    static var encoreLogo: some View {
        
        HStack {
            Spacer()
            Image.encoreWordmark.foregroundColor(.white)
            Spacer()
        }
    }
    
    static var bottomMenu: some View {
        
        VStack {
            Spacer()
//            CarouselView(label: CreateNewTile(label: "Show") { },
//                         content: Group {
//                TileView { Text("Hello") }
//                TileView { Color.encorePurp }
//                TileView { Image.encoreWordmark }
//                TileView { Image.encoreLogoECentered.resizable().aspectRatio(contentMode: .fit) }
//                TileView { ColorButton(label: "TAP ME", action: { }) }
//            }
//            )
//
        }.padding(.leading)
    }
}
