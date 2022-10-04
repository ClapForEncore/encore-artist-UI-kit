//
//  ChatIcon.swift
//
//  Created by Romain on 04/10/2022.
//

import SwiftUI

public struct ChatIcon: View {
    @Binding var notificationOn: Bool
    private let onColor: UIColor = #colorLiteral(red: 0.9019607843, green: 0.9725490196, blue: 0.6705882353, alpha: 1)
    
    public init(notificationOn: Binding<Bool>) {
        self._notificationOn = notificationOn
    }
    
    public var body: some View {
        ZStack {
            Image.chat
            if notificationOn {
                Group {
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(Color(onColor))
                        .blur(radius: 2)
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(Color(onColor))
                        .shadow(color: Color(onColor), radius: 5)
                        .shadow(color: Color(onColor), radius: 10)
                        .shadow(color: Color(onColor), radius: 10)
                }
                .offset(x: 7, y: -7)
            }
        }
    }
}
