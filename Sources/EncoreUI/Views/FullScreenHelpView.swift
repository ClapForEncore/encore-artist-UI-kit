//
//  FullScreenHelpView.swift
//  
//
//  Created by Romain on 20/09/2022.
//

import SwiftUI


public struct FullScreenHelpView: View {
    
    @State var type: HelpPageType
    @State var action: () -> Void
    @State var close: () -> Void
    
    public init(type: HelpPageType = .info,
                action: @escaping () -> Void,
                close: @escaping () -> Void) {
        self.type = type
        self.action = action
        self.close = close
    }
    
    public var body: some View {
        
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            BackgroundBlurView().ignoresSafeArea()
            VStack {
                Spacer()
                type.image
                    .resizable()
                    .frame(width: 330, height: 300)
                textView
                Spacer()
                //TODO: 
//                ColorButton(label: "More information", color: .transparentWhite, fontColor: .white, height: .medium) {
//                    action()
//                }.padding(.horizontal, 50)
            }
            CloseButton { close() }
                
        }
    }
    var textView: some View {
        VStack(spacing: 20) {
            Text(type.title)
                .inter(size: 32)
                .foregroundColor(.white)
            
            Text(type.explaination)
                .foregroundColor(.white)
                .inter(size: 14)
                .multilineTextAlignment(.center)
            
            
        }.frame(maxWidth: 300)
        .padding(.horizontal, 30)
        
    }
}

struct FullScreenHelpView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenHelpView(type: .audioSource, action: { }, close: { })
    }
}

///Each type also contains its own content, to be added for each new case (no default case!)
public enum HelpPageType: String {
    
    case audioSource
    case addAR
    case allowConnections
    case arSettings
    case audioDevice
    case audioLevel
    case autoReconnect
    case bestPractices
    case clapBalance
    case clapGoals
    case connectedCameras
    case connectedDevices
    case connectSettings
    case connectToDevice
    case dmEarnings
    case encoreBank
    case flipHorizontal
    case genericInfo
    case gettingStarted
    case hdmiSettings
    case info
    case leaderboard
    case lifetimeEarnings
    case localCamera
    case location
    case magicSync
    case massDm
    case material
    case meshing
    case payouts
    case pendingPayouts
    case polls
    case promote
    case record
    case referrals
    case replayEarnings
    case rotate90
    case searchFans
    case sendToAll
    case testAudio
    case videoSource
    case watermark
    case whatIsEncore
    case yourLiveShow
    
    public var image: Image {
        switch self {
        case .audioSource: return Image("audioSource", bundle: .module)
        case .addAR: return Image("addAR", bundle: .module)
        case .allowConnections: return Image("allowConnections", bundle: .module)
        case .arSettings: return Image("arSettings", bundle: .module)
        case .audioDevice: return Image("audioDevice", bundle: .module)
        case .audioLevel: return Image("audioLevel", bundle: .module)
        case .autoReconnect: return Image("autoReconnect", bundle: .module)
        case .bestPractices: return Image("bestPractices", bundle: .module)
        case .clapBalance: return Image("clapBalance", bundle: .module)
        case .clapGoals: return Image("clapGoals", bundle: .module)
        case .connectedCameras: return Image("connectedCameras", bundle: .module)
        case .connectedDevices: return Image("connectedDevices", bundle: .module)
        case .connectSettings: return Image("connectSettings", bundle: .module)
        case .connectToDevice: return Image("connectToDevice", bundle: .module)
        case .dmEarnings: return Image("dmEarnings", bundle: .module)
        case .encoreBank: return Image("encoreBank", bundle: .module)
        case .flipHorizontal: return Image("flipHorizontal", bundle: .module)
        case .genericInfo: return Image("genericInfo", bundle: .module)
        case .gettingStarted: return Image("gettingStarted", bundle: .module)
        case .hdmiSettings: return Image("hdmiSettings", bundle: .module)
        case .info: return Image("info3d", bundle: .module)
        case .leaderboard: return Image("leaderboard", bundle: .module)
        case .lifetimeEarnings: return Image("lifetimeEarnings", bundle: .module)
        case .localCamera: return Image("localCamera", bundle: .module)
        case .location: return Image("location", bundle: .module)
        case .magicSync: return Image("magicSync", bundle: .module)
        case .massDm: return Image("massDm", bundle: .module)
        case .material: return Image("material", bundle: .module)
        case .meshing: return Image("meshing", bundle: .module)
        case .payouts: return Image("payouts", bundle: .module)
        case .pendingPayouts: return Image("pendingPayouts", bundle: .module)
        case .polls: return Image("polls3D", bundle: .module)
        case .promote: return Image("promote", bundle: .module)
        case .record: return Image("record", bundle: .module)
        case .referrals: return Image("referrals", bundle: .module)
        case .replayEarnings: return Image("replayEarnings", bundle: .module)
        case .rotate90: return Image("rotate90", bundle: .module)
        case .searchFans: return Image("searchFans", bundle: .module)
        case .sendToAll: return Image("sendToAll", bundle: .module)
        case .testAudio: return Image("testAudio", bundle: .module)
        case .videoSource: return Image("videoSource", bundle: .module)
        case .watermark: return Image("watermark", bundle: .module)
        case .whatIsEncore: return Image("whatIsEncore", bundle: .module)
        case .yourLiveShow: return Image("yourLiveShow", bundle: .module)
        }
    }
    public var title: String {
        switch self {
        case .audioSource: return "Audio Source"
        case .addAR: return "Add AR"
        case .allowConnections: return "Allow Connections"
        case .arSettings: return "AR Settings"
        case .audioDevice: return "Audio Device"
        case .audioLevel: return "Audio Level"
        case .autoReconnect: return "Auto Reconnect"
        case .bestPractices: return "Best practices"
        case .clapBalance: return "Clap Balance"
        case .clapGoals: return "Clap Goals"
        case .connectedCameras: return "Connected Cameras"
        case .connectedDevices: return "Connected Devices"
        case .connectSettings: return "Connect Settings"
        case .connectToDevice: return "Connect To Device"
        case .dmEarnings: return "DM Earnings"
        case .encoreBank: return "Encore Bank"
        case .flipHorizontal: return "Flip Horizontal"
        case .genericInfo: return "Generic Info"
        case .gettingStarted: return "Getting Started"
        case .hdmiSettings: return "HDMI Settings"
        case .info: return "Info"
        case .leaderboard: return "Leaderboard"
        case .lifetimeEarnings: return "Lifetime Earnings"
        case .localCamera: return "Local Camera"
        case .location: return "Location"
        case .magicSync: return "Magic Sync"
        case .massDm: return "Mass DM"
        case .material: return "Material"
        case .meshing: return "Meshing"
        case .payouts: return "Payouts"
        case .pendingPayouts: return "Pending Payouts"
        case .polls: return "Polls"
        case .promote: return "Promote"
        case .record: return "Record"
        case .referrals: return "Referrals"
        case .replayEarnings: return "Replay Earnings"
        case .rotate90: return "Rotate 90°"
        case .searchFans: return "Search Fans"
        case .sendToAll: return "Send to All"
        case .testAudio: return "Test Audio"
        case .videoSource: return "Video Source"
        case .watermark: return "Watermark"
        case .whatIsEncore: return "What is Encore"
        case .yourLiveShow: return "Your Live Show"
        }
    }
    
    
    public var explaination : String {
        switch self {
        case .audioSource: return "Audio source allows you to select which microphone you want to broadcast from on local and connected devices."
        case .addAR: return "Add scenes and objects to incorporate into your stage. You can upload assets from your device or the ones provided in the Encore Library."
        case .allowConnections: return "Allows your device to be discoverable from others that can connect as additional cameras for your show."
        case .arSettings: return "AR Settings"
        case .audioDevice: return "Select an input as the primary microphone in your stream."
        case .audioLevel: return "Test the levels of your audio input to ensure the volume is optimal for your stream."
        case .autoReconnect: return "Allows you to automatically connect to a device in the event of a disconnection."
        case .bestPractices: return "Best practices"
        case .clapBalance: return "Your clap balance contains all claps from shows and referrals that are ready to withdraw."
        case .clapGoals: return "Set one or multiple goals you want to hit throughout your show. You can add a title to encourage fans to clap. For example, \"performing a new song at 1,000 claps\""
        case .connectedCameras: return "Toggle through the connected devices. You can use connected cameras for different angles or effects."
        case .connectedDevices: return "All the devices connected as cameras will appear here. You can also disconnect any devices from the list."
        case .connectSettings: return "Connect settings enable customization when connecting to or from other devices."
        case .connectToDevice: return "Find and connect to another device as a camera. Your device will be used as one of the cameras in the show."
        case .dmEarnings: return "A history of all earnings from Direct Messages."
        case .encoreBank: return "The Encore Bank is your collection of claps from all your shows and referrals. You can withdraw claps to your bank account at any time."
        case .flipHorizontal: return "Flip the orientiation of your output on a display."
        case .genericInfo: return "Generic Info"
        case .gettingStarted: return "Getting Started"
        case .hdmiSettings: return "View your show on an external video display like a TV or Monitor using an HDMI output from your device. You can see live video as well as the lobby and leaderboard."
        case .info: return "Info"
        case .leaderboard: return "All the fans in your lobby will appear here. Fans are ordered by amount of claps."
        case .lifetimeEarnings: return "Lifetime earnings includes all history of claps earned from shows and referrals including payouts and current balance in the Encore Bank."
        case .localCamera: return "Toggle through the available lenses on your device."
        case .location: return "Create or load a location to help with the placement of your scene. This is helpful with multiple cameras to ensure the scene can be seen from different angles."
        case .magicSync: return "Magic Sync take AR scene from currently active device to all other connected devices."
        case .massDm: return "Send a DM to all your followers or show attendees for updates."
        case .material: return "Material"
        case .meshing: return "Meshing"
        case .payouts: return "A history of all withdrawls to date from the Encore Bank to your bank account."
        case .pendingPayouts: return "Pending payouts are on the way to your bank account from the Encore Bank. Most transactions take up to 3 business days."
        case .polls: return "Have your fans interact in a poll. Specify a question with a series of answers and see which one wins. You can use this to dictate the next song or even use it for trivia."
        case .promote: return "Promote"
        case .record: return "Record"
        case .referrals: return "A history of all referrals to date. For every artist you refer you recieve a bonus of 10% of claps they earn on shows."
        case .replayEarnings: return "A history of all earnings from Replays of your past shows."
        case .rotate90: return "Rotate your video output to fit a display."
        case .searchFans: return "Quickly search for a fan to invite them to Backstage Pass or remove them from the show."
        case .sendToAll: return "When enabled this will send the current trigger to all cameras. When disabled it will only affect the selected device."
        case .testAudio: return "Test Audio"
        case .videoSource: return "Video source allows you to select which lens you want to broadcast from on local and connected devices."
        case .watermark: return "Toggle a watermark during your broadcast and recording."
        case .whatIsEncore: return "What is Encore"
        case .yourLiveShow: return "Your Live Show"
        }
    }
}

