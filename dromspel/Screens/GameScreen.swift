//
//  ScreenDefault.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameScreen: View {
    @State var game: Game
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var activeUser: User
    var body: some View {
        ZStack {
            ScrollView{
                VStack(alignment: .center, spacing: 5){
                VideoPlayerGame(game: game)
                    HStack {
                        ThumbButtons(size: 30, spacing: 20, activeUser: activeUser, game: game)
                        Spacer()
                            .frame(width: 50)
                        
                        
                        AddRemoveButton(size: 25, activeUser: activeUser, game: game)
                            
                    }
                       
                        Text(game.description)
                        .padding()
                        .font(.system(size: 15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                                
                                .opacity(1))
                        .background(Color(colorScheme == .dark ? .black : .white).opacity(0.5))
                        .cornerRadius(12)
                        .padding()
                    
                        Spacer()
                    
                    Text("Prix Actuel : \(game.price)")
                        .padding()
                        .font(.system(size: 25, weight: .heavy))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                                .opacity(1))
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(12)
                        .padding()
                    Spacer()
                        .frame(height: 20)
                    ZStack {
                        Rectangle()
                            .foregroundColor((colorScheme == .dark ? .black : .white))
                            .opacity(0.5)
                            
                        VStack {
                            
                            
                        Text("Jeux Similaires")
                            .font(.system(size: 35, weight: .heavy))
                            .padding()
                        }.font(.system(size: 30))
                            .navigationBarTitle(game.name)
                    }
                    
                    
                        ScrollView (.horizontal) {
                            HStack (spacing: 60) {
                                Spacer(minLength: -30)
                            SuggestedGames(game:games[0], gameBinding: $game, activeUser: activeUser)
                                .frame(height: 185)
                            SuggestedGames(game:games[1], gameBinding: $game, activeUser: activeUser)
                                .frame(height: 185)
                            SuggestedGames(game:games[2], gameBinding: $game, activeUser: activeUser)
                                .frame(height: 185)
                            SuggestedGames(game:games[3], gameBinding: $game, activeUser: activeUser)
                                .frame(height: 185)
                            SuggestedGames(game:games[4], gameBinding: $game, activeUser: activeUser)
                                .frame(height: 185)
                            }
                            .padding()
                            
                        }
                    
                    
                    
            }
        }.background(
            Image(game.image)
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.8)
        )
    }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(game: games[0], activeUser : user)
                    .preferredColorScheme(.dark)
    }
}

