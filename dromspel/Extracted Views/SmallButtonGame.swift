//
//  SmallButtonGame.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct SmallButtonGame: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var activeUser : User
    var game : Game
    var body: some View {
        ZStack {
            Image(game.image)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .background(Color.black)
                    .frame(width: 130, height: 80)
                    .clipped()
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))
                    
            VStack {
                HStack {
                    VStack (alignment: .center, spacing: 10) {
                        Text(game.name)
                            .font(.system(size: 20, weight: .heavy))
                            .frame(width: 110, height: 90)
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .frame(width: 120, height: 70)

    }
}

struct SmallButtonGame_Previews: PreviewProvider {
    static var previews: some View {
        SmallButtonGame(activeUser: user, game: games[0])
    }
}
