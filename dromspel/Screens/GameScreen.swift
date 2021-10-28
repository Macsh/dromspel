//
//  ScreenDefault.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @State var game: Game
    @State var topID = 0
    @ObservedObject var activeUser: User
    var body: some View {
        ZStack {
            ScrollView { 
                ScrollViewReader { proxy in
                    VStack(alignment: .center, spacing: 5){
                    VideoPlayerGame(game: game).id(topID)
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
                                    SuggestedGames(game:games[0], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        game = games[0]
                                        self.activeUser.history.append(0)
                                }
                                SuggestedGames(game:games[1], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        game = games[1]
                                        self.activeUser.history.append(1)
                                }
                                SuggestedGames(game:games[2], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        game = games[2]
                                        self.activeUser.history.append(2)
                                }
                                    SuggestedGames(game:games[3], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        game = games[3]
                                        self.activeUser.history.append(3)
                                }
                                SuggestedGames(game:games[4], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        game = games[4]
                                        self.activeUser.history.append(4)
                                }
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
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(game: games[0], activeUser : user)
                    .preferredColorScheme(.dark)
    }
}

