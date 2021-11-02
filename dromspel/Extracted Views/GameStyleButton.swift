//
//  GameStyleButton.swift
//  dromspel
//
//  Created by alexandre on 29/10/2021.
//

import SwiftUI

struct GameStyleButton: View {
    var game: Game
    var gameStyle : GameType
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var activeUser : User
    var body: some View {
            ZStack {
                Image(self.game.image)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.8)
                        .background(Color.black)
                        .frame(height: 100)
                        .clipped()
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                        
                        
                HStack {
                    VStack (alignment: .center, spacing: 10) {
//                        Text(self.gameStyle)
//                            .font(.system(size: 20, weight: .heavy))
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .frame(height: 70)
        }
}

struct GameStyleButton_Previews: PreviewProvider {
    static var previews: some View {
        GameStyleButton(game: games[0], gameStyle: GameType.RPG(value: .actionRPG), activeUser: user)
    }
}
