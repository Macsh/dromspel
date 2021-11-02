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
    @State var uniqueNumbers: [Int] = getUniqueRandomNumbers(min: 0, max: games.count, count: 5)
    
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
                        
                        HStack {
                            ForEach(game.platform , id: \.self) { platform in
                                if platform == "logo-switch" {
                                    if  colorScheme == .dark {
                                        Image(platform)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 35)
                                            .colorInvert()
                                    } else {
                                        Image(platform)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 35)
                                    }
                            
                                } else {
                                Image(systemName: platform)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                }
                            }
                            
                            .padding()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                                
                                .opacity(1))
                        .background(Color(colorScheme == .dark ? .black : .white).opacity(0.5))
                        .cornerRadius(12)
                        
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
                                        self.uniqueNumbers = suggerer(5)
                                }
                                SuggestedGames(game:games[uniqueNumbers[1]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[1]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[1])
                                        self.uniqueNumbers = suggerer(5)
                                }
                                SuggestedGames(game:games[uniqueNumbers[2]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[2]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[2])
                                        self.uniqueNumbers = suggerer(5)
                                }
                                    SuggestedGames(game:games[uniqueNumbers[3]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[3]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[3])
                                        self.uniqueNumbers = suggerer(5)
                                }
                                SuggestedGames(game:games[uniqueNumbers[4]], activeUser: activeUser)
                                    .frame(height: 185)
                                    .onTapGesture {
                                        proxy.scrollTo(topID)
                                        proxy.scrollTo(horizontalID)
                                        game = games[uniqueNumbers[4]]
                                        self.activeUser.addGameToHistory(uniqueNumbers[4])
                                        self.uniqueNumbers = suggerer(5)
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
                    .onAppear(perform: {
                        self.uniqueNumbers = suggerer(5)
                    })
        )
            }
    }
    }
    
    func suggerer(_ nb: Int) -> [Int] {
        var result: [Int] = []
        
        var numberToSuggerate = nb
        var gamesTemp = games
        
        for i in 0..<games.count {
            if (games[i] != self.game && games[i].type.keyString == self.game.type.keyString && !self.activeUser.dislikedGames.contains(i)) {
                result.append(i)
                gamesTemp.remove(at: i)
                numberToSuggerate -= 1
                
                if numberToSuggerate <= 0 {
                    break;
                }
            }
        }
        
        while result.count < 6 {
            var r = Int.random(in: 0..<gamesTemp.count)
            while games[r] == self.game {
                r = Int.random(in: 0..<gamesTemp.count)
            }
            result.append(r)
            gamesTemp.remove(at: r)
        }
        
        return result
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

