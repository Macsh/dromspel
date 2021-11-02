//
//  ScreenDefault.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI


struct GameScreen: View {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
    @Environment(\.colorScheme) var colorScheme
    @State var game: Game
    @State var topID = 0
    @State var horizontalID = 1
    @ObservedObject var activeUser: User
    let uniqueNumbers: [Int] = getUniqueRandomNumbers(min: 0, max: 50, count: 5)
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
                                    Spacer(minLength: -30).id(horizontalID)
                                    SuggestedGames(game:games[uniqueNumbers[0]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[0]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[0])
                                }
                                SuggestedGames(game:games[uniqueNumbers[1]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[1]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[1])
                                }
                                SuggestedGames(game:games[uniqueNumbers[2]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[2]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[2])
                                }
                                    SuggestedGames(game:games[uniqueNumbers[3]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[3]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[3])
                                }
                                SuggestedGames(game:games[uniqueNumbers[4]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[4]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[4])
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

extension Int {

    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }

}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(game: games[0], activeUser : user)
                    .preferredColorScheme(.dark)
    }
}

