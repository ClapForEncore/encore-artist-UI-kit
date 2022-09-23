//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 22/09/2022.
//

import SwiftUI

public struct PollVotesView: View {
    
    @State var label: String
    @Binding var timeLeft: Int
    @State var voteOptions: [(label: String, votes: CGFloat)]

    public init(state: String, timeLeft: Binding<Int>, voteOptions: [(label: String, votes: CGFloat)]) {
        self.label = label
        self._timeLeft = timeLeft
        self.voteOptions = voteOptions
    }
    
    public var body: some View {
        TileView {
            VStack {
                HStack(alignment: .top) {
                    Text(label)
                        .multilineTextAlignment(.leading)
                        .frame(height: 30)
                    Spacer()
                    Text(timeLeft.description)
                }
                .inter(size: 12)

               Spacer()
                VStack(spacing: 5) {
                    ForEach(0..<voteOptions.count) { index in
                        VoteView(label: voteOptions[index].label,
                                 votes: voteOptions[index].votes,
                                 maxVotes: 2455)
                    }
                }
            }
        }.frame(width: 167, height: 128)
    }
}

struct PollVotesView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                Image("livingRoom", bundle: .module)
                BottomGradient()
            }
            
            VStack {
                Spacer()
                PollVotesView(label: "What should I play next?",
                              timeLeft: .constant(22),
                              voteOptions: [
                    (label: "Man on the Moon", votes: 2345),
                    (label: "Man on the Moon", votes: 1234),
                    (label: "Man on the Moon", votes: 200),
                    (label: "Man on the Moon", votes: 800)
                ])
            }.padding()
        }
    }
}

public struct VoteView: View {
    @State var label: String
    @State var votes: CGFloat
    @State var maxVotes: CGFloat
    
    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                Color.black.opacity(0.4).cornerRadius(10)
                Color.encorePollBlue.cornerRadius(10)
                    .frame(width: geometry.size.width * (votes / maxVotes))
            }
            HStack {
                Text(label)
                Spacer()
                Text("\(Int(votes))")
            }
                .inter(size: 10)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
        }.frame(width: 150)
        .frame(height: 13)
    }
}
