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
    //    var game: Game
    var body: some View {
        NavigationView{
            ScrollView  {
                    //            NavigationLink(destination: GameScreen(game:game, activeUser: user, gameIndex: 0), isActive: $navigationViewIsActive) { EmptyView() }
                    
                    ForEach(Array(games.enumerated()), id: \.offset){index, game in
                        Spacer(minLength: 50)
                        NavigationLink(destination: GameScreen(game:game, activeUser: user, gameIndex: 0), isActive: $navigationViewIsActive) { EmptyView() }
                        Button(action : {
                            self.activeUser.history.append(index)
                            self.navigationViewIsActive = true
                        }, label: {
                            ListGameRow(game: game, activeUser: user)
                            
                        })
                        
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
