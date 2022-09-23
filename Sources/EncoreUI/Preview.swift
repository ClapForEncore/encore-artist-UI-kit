import SwiftUI

struct Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                ShowStatusBar(showName: .constant("SHOW MUST GO ON"),
                              fans: .constant(1234), claps: .constant(12345)) { } barTapped: { }
                
                ZStack(alignment: .topLeading) {
                    ZStack(alignment: .top) {
                        Image("livingRoom", bundle: .module)
                            .resizable()
                            .aspectRatio(9/16, contentMode: .fit)
                        Group {
                            encoreLogo
                            signalStrength
                            BottomGradient()
                        }.padding(.top, 20)
                        ToolBar()
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
            SignalStrengthView(bars: .constant(3))
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
            CarouselView(label: CreateNewTile(label: "Show") { },
                         content: Group {
                TileView { Text("Hello") }
                TileView { Color.encorePurp }
                TileView { Image.encoreWordmark }
                TileView { Image.encoreLogoECentered.resizable().aspectRatio(contentMode: .fit) }
                TileView { ColorButton(label: "TAP ME", action: { }) }
            }
            )
            
        }.padding(.leading)
    }
}
