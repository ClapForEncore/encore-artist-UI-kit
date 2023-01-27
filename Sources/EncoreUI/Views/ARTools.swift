//
//  ARTools.swift
//  
//
//  Created by Romain on 19/12/2022.
//

import SwiftUI

struct Drawer: View {
    
    @State private var value: CGFloat = 500
    @State private var isOn: Bool = false
    
    var body: some View {
        
        ZStack {
            Image("livingRoom", bundle: .module)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Color.clear.height(value)
                Text(value.description).font(.largeTitle).foregroundColor(.white)
                ZStack {
                    Color.encoreDark.opacity(0.8)
                    VStack {
                        HStack {
                            Spacer()
                            Capsule().height(5).width(60)
                                .foregroundColor(Color(white: 0.8, opacity: 0.3))
                            Spacer()
                        }
                        .padding()
                        content
                    }
                }
                .cornerRadius(20)
            }
            .gesture(DragGesture(minimumDistance: 0).onChanged({ dragValue in
                value = dragValue.translation.height
                print(dragValue.translation.height)
            }).onEnded({ endValue in
                print("end ", endValue.translation.height)
                withAnimation(.spring()) { snap() }
            })
            )
        }
        .ignoresSafeArea()
    }
    private func snap() {
        if value > 500 { value = 500 }
        if value > 300 { value = 300 }
        if value > 150 { value = 150 }
       
    }
    
    @State var selectedLibrary: String = "My Stuff"
    @State var selectedPercentage: String = "1%"
    @State var rotation = "180º"
    private var content: some View {
        ZStack {
            Color.clear
            VStack {
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        ZStack {
                            Color.transparentWhite.cornerRadius(25)
                            Color.black.cornerRadius(25).padding(1)
                            Image.rotateCw.foregroundColor(.white)
                                .scaleEffect(CGSize(width: -1, height: 1))
                        }.width(38).height(38)
                        
                    }
                    Text(rotation).inter(size: 22)
                        .foregroundColor(.white)
                    Button {
                        
                    } label: {
                        ZStack {
                            Color.transparentWhite.cornerRadius(25)
                            Color.black.cornerRadius(25).padding(1)
                            Image.rotateCw.foregroundColor(.white)
                        }.width(38).height(38)
                    }
                    SegmentedControl(values: ["1º", "5º", "25º"], selectedValue: $selectedPercentage)
                }
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        ZStack {
                            Color.transparentWhite.cornerRadius(25)
                            Color.black.cornerRadius(25).padding(1)
                            Image.minus.foregroundColor(.white)
                                .scaleEffect(CGSize(width: -1, height: 1))
                        }.width(38).height(38)
                        
                    }
                    Text(rotation).inter(size: 22)
                        .foregroundColor(.white)
                    Button {
                        
                    } label: {
                        ZStack {
                            Color.transparentWhite.cornerRadius(25)
                            Color.black.cornerRadius(25).padding(1)
                            Image.plus.foregroundColor(.white)
                        }.width(38).height(38)
                    }
                    SegmentedControl(values: ["1%", "5%", "25%"], selectedValue: $selectedPercentage)
                }
                SegmentedControl(values: ["Encore Library", "My Stuff"], selectedValue: $selectedLibrary)
                HStack {
                    EncoreToggle(isOn: $isOn)
                    EncoreSlider()
                    EncoreToggle(isOn: $isOn)
                }
                
                HStack {
                    ZStack {
                        Color.transparentWhite.cornerRadius(10)
                        VStack {
                            Image.plusCircle
                            Text("Upload").inter(size: 12)
                        }.foregroundColor(.white)
                    }.width(64).height(89)
                    ZStack {
                        Color.transparentWhite.cornerRadius(10)
                        VStack {
                            Image("openAiIcon", bundle: .module)
                            Text("Generate").inter(size: 12)
                        }.foregroundColor(.white)
                    }.width(64).height(89)
                }
                
                HStack(spacing: 10) {
                    ColorButton(icon: .arrowsMoveRec ,label: "Move", color: .transparentWhite, fontColor: .white) { }
                    ColorButton(icon: .refreshCwRec ,label: "Scale", color: .transparentWhite, fontColor: .white) { }
                    ColorButton(icon: .arrowsMoveRec ,label: "Rotate", color: .transparentWhite, fontColor: .white) { }
                    ColorButton(icon: .slidersHoriz ,label: "Controls", color: .transparentWhite, fontColor: .white) { }
                }
            }
            
        }.padding(15)
        
    }
    
    
}



struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        Drawer()
    }
}

struct EncoreSlider: View {
    
    @State var value: CGFloat = 0.5
    var body: some View {
        
        HStack(spacing: 5) {
            Text("0").inter(size: 10)
                .foregroundColor(.white)

            GeometryReader { geometry in
            ZStack {
                Color.clear.height(28)
                Capsule().foregroundColor(.transparentWhite).height(3)
                Capsule().foregroundColor(.encoreNeon).height(3)
                    .scaleEffect(x: value, anchor: .leading)
                
                    ZStack {
                        Color.clear
                        ZStack {
                            Color.encoreNeon.cornerRadius(25)
                                .width(28).height(28)
                            Text(Int(value * 100).description)
                                .inter(size: 10)
                        }
                        .position(x: geometry.size.width * value, y: 14)
                    }
                }
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    self.value = min(max(0, CGFloat(value.location.x / geometry.size.width)), 1)
                })
                     )
            }
            Text("100").inter(size: 10)
                .foregroundColor(.white)
        }
        .height(28)
    }
}
