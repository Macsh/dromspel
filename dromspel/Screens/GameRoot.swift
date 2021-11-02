//
//  GameRoot.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameRoot: View {
    @ObservedObject var activeUser : User
    //On crée un tableau de Bool qui nous servira pour les bindings des NavigationLinks
    //On utilise l'initialisateur Array
    @State var navigationViewAreActive: [Bool] = Array(repeating: false, count: games.count)
    
    var body: some View {
        NavigationView{
        ScrollView  {
            ForEach(Array(games.enumerated()), id: \.offset){ index, games in
                Spacer(minLength: 50)
                
                NavigationLink(destination: GameScreen(game: games, activeUser: user), isActive: $navigationViewAreActive[index]) {
                    Button(action : {
                        navigationViewAreActive[index] = true
                        self.activeUser.addGameToHistory(index)
                    }, label: {
                        ListGameRow(game: games, activeUser: user)
                    })
                }
            }
            .navigationBarTitle("Nos Recommandations").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
    }
}

struct GameRoot_Previews: PreviewProvider {
    static var previews: some View {
        GameRoot(activeUser: user)
    }
}
