//
//  GameRoot.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameRoot: View {
    @ObservedObject var activeUser : User
    @State var navigationViewIsActive: Bool = false
    var game: Game
    var body: some View {
        NavigationView{
        ScrollView  {
            
            NavigationLink(destination: GameScreen(game: game, activeUser: user, gameIndex: 1), isActive: $navigationViewIsActive) { EmptyView() }
            
            ForEach(games){game in
                Spacer(minLength: 50)
                Button(action : {
                    navigationViewIsActive = true
                }, label: {
                    ListGameRow(game: game, activeUser: user)
                })
                    .onTapGesture {
                        self.activeUser.history.append(4)
                    }
                
            }
            
            .navigationBarTitle("Nos Recommandations").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
        }
        
    }
    }
}

struct GameRoot_Previews: PreviewProvider {
    static var previews: some View {
        GameRoot(activeUser: user, game: games[0])
    }
}
