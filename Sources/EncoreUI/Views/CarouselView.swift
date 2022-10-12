//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 19/09/2022.
//

//import SwiftUI
//
//private struct CarouselPreview: PreviewProvider {
//    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
//
//    static var previews: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//            VStack {
//                Spacer()
//                CarouselView(label: CreateNewTile(label: "Show") { },
//                             content:
//                                Group {
//                    TileView { Text("ENCORE IS NOT A VERY LONG WORD") }
//                    TileView { Image.atom }
//                    TileView { Color.encorePurp }
//                    TileView { Color.encoreYellow }
//                    TileView { Color.encoreRed }
//
//                })
//
//                .padding(.bottom)
//            }.inter(size: 12)
//    }
//        .previewInterfaceOrientation(.portrait)
//    }
//}
//
/////CarouselView takes 2 Views, first the label will stay visible and the content will be instered in a horizontal scrollview
//public struct CarouselView<Label: View, Content: View>: View {
//    
//    var label: Label
//    var content: Content
//
//    public init(label: Label, content: Content) {
//        self.label = label
//        self.content = content
//    }
//    
//    private let start = Gradient.Stop(color: Color.white.opacity(0),location: 0)
//    private let end = Gradient.Stop(color: .white,location: 0.08)
//
//    public var body: some View {
//        HStack(spacing: 0) {
//                label
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        content
//                    }.padding(.leading)
//                        .padding(.trailing)
//                }
//                .mask {
//                    LinearGradient(
//                        stops: [start, end],
//                        startPoint: .leading,
//                        endPoint: .trailing)
//                }
//            }
//
//        .frame(height: 128)
//
//
//        }
//}
//
//
//public struct CreateNewTile: View {
//    @State var label: String
//    @State var action: () -> Void
//    public init(label: String, action: @escaping () -> Void) {
//        self.label = label
//        self.action = action
//    }
//    public var body: some View {
//        TileView {
//            VStack {
//                Image.plusCircle
//                Text("Create New \(label)")
//                    .interSemiBold(size: 14)
//            }
//        }.frame(width: 92)
//    }
//}
