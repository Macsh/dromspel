//
//  PreferencesScreen.swift
//  dromspel
//
//  Created by alexandre on 02/11/2021.
//

import SwiftUI

struct PreferencesScreen: View {
    @ObservedObject var activeUser : User
    @State var selection: Int = 0
    @State var bindingSearch: String
    @State var navigationViewAreActive: [Bool] = Array(repeating: false, count: games.count)
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
       ]
    var body: some View {
        
        
            VStack {
                Picker("", selection: $selection) {
                    Text("Style de jeu")
                        .tag(0)
                    Text("Jeu déjà joué")
                        .tag(1)
                    
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                if selection == 0 {
                    
                    ScrollView  {
                        Spacer(minLength: 20)
                        LazyVGrid(columns: columns, spacing: 50) {
                            ForEach(Action.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.Action(value:act), activeUser: user)
                            }
                            ForEach(ActionAventure.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.ActionAventure(value:act), activeUser: user)
                            }
                            ForEach(Aventure.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.Aventure(value:act), activeUser: user)
                            }
                            ForEach(RPG.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.RPG(value:act), activeUser: user)
                            }
                            ForEach(Simulation.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.Simulation(value:act), activeUser: user)
                            }
                            ForEach(Strategy.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.Strategy(value:act), activeUser: user)
                            }
                            ForEach(Reflexion.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.Reflexion(value:act), activeUser: user)
                            }
                            ForEach(Sport.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.Sport(value:act), activeUser: user)
                            }
                            ForEach(OpenWorld.allCases, id: \.self){ act in
                                GameStyleButton(gameStyle: GameType.OpenWorld(value:act), activeUser: user)
                            }
                        }
                        .padding()
                        
                        .navigationBarTitle("Préférences").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
                    }
                }
                else {
                    VStack {
                        SearchBar(binding: $bindingSearch)
                        ScrollView {
                            if bindingSearch != "" {
                                ForEach(games) { game in
                                    if game.name.lowercased().contains(bindingSearch.lowercased()) {
                                        GamePrefComponent(game : game, activeUser: activeUser)
                                    }
                                }
                            }
                            else {
                                ForEach(activeUser.likedGames.reversed() , id: \.self) { gameIndex in
                                    GamePrefComponent(game : games[gameIndex], activeUser: activeUser)
                                }
                                .padding(.horizontal, 8)
                                Spacer()
                            }
                        }
                    }
                }
                
                Spacer()
            }
        
    }
}


struct PreferencesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesScreen(activeUser: user, bindingSearch: "")
    }
}

