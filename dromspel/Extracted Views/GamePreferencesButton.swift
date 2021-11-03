//
//  GamePreferencesButton.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct GamePreferencesButton: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Image("Choicebutton-bg1")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 270)
                .opacity(0.7)
                .background(Color.black)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))
            VStack{
                Text ("Vérifiez vos jeux préférés :")
                    .font(.system(size: 20, weight: .bold))
                
                HStack{
                    
                    SmallButtonGame(activeUser: user, game: games[user.likedGames.count < 1 ? 0 : user.likedGames[0]] )
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    SmallButtonGame(activeUser: user, game: games[user.likedGames.count < 2 ? 1 : user.likedGames[1]] )
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                }
                
                HStack{
                    
                    SmallButtonGame(activeUser: user, game: games[user.likedGames.count < 3 ? 2 : user.likedGames[2]] )
                        .padding()

                    StyleFirstScreen(gameStyle: GameType.SeeMore(value:.more), activeUser: user)
                        .padding()

                    
                    
                }
            }
            .frame(width: 350, height: 270)
            .padding()
            .foregroundColor(Color.white)
//            .background(Color.blue)
        }
    }
}

struct GamePreferencesButton_Previews: PreviewProvider {
    static var previews: some View {
        GamePreferencesButton()
    }
}
