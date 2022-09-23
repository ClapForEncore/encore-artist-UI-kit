//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 11/04/2022.
//

import SwiftUI

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Color.blue.frame(height: 50)
            HStack {
                Color.red.frame(height: 50)
                DropDownMenu(options: [.small, .medium, .large], selectedOption: .constant(.medium))
                
                Color.orange.frame(height: 50)
            }
            .zIndex(100)
            Color.green.frame(height: 50)
            
        }
        .environmentObject(TestModel())
    }
}

public struct DropDownMenu: View {
    
    @EnvironmentObject var model : TestModel
    @Namespace var nameSpace
    let options: [Option]
    @Binding var selectedOption: Option
    @State private var showOptions = false
    
    
    public var body: some View {
        
        Button {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                showOptions.toggle()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "background", in: nameSpace)
                    .frame(width: 120, height:  30)
                HStack {
                    Text(model.selected.rawValue)
                        .font(.caption)
                        
                    Spacer()
                }
                .padding(8)
                
            }
            .overlay {
                if showOptions {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "background", in: nameSpace)
                            .frame(width: 120, height: 120)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image.chevronDown
                                    .matchedGeometryEffect(id: "chevron", in: nameSpace)
                                    .rotationEffect(.degrees(90))
                                
                            }
                            Spacer()
                            
                        }.padding(8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            TextCell(text: "Small") {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    selectedOption = .small
                                    showOptions = false
                                }
                            }
                            Color.white.opacity(0.05).frame(height: 1)
                            TextCell(text: "Medium") {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    selectedOption = .medium
                                    showOptions = false
                                }
                            }
                            Color.white.opacity(0.05).frame(height: 1)
                            
                            TextCell(text: "Large") {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    selectedOption = .large
                                    showOptions = false
                                }
                            }
                        }.padding(8)
                    }
                    
                } else {
                    HStack {
                        Spacer()
                        Image.chevronDown
                            .matchedGeometryEffect(id: "chevron", in: nameSpace)
                        
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct TextCell: View {
    
    @State var text: String
    @State var onTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
            Text(text)
                .font(.caption)
                .frame(height: 30)
        }
        .onTapGesture {
            onTap()
        }
    }
}

class TestModel : ObservableObject {
    @Published var selected: DropDownMenu.Option = .medium
    
}

extension DropDownMenu {
    enum Option: String {
        case small = "Small", medium = "Medium", large = "Large"
    }
}
