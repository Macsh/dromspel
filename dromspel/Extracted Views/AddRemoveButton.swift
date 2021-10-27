//
//  AddRemoveButton.swift
//  dromspiel
//
//  Created by lucas on 27/10/2021.
//

import SwiftUI

struct AddRemoveButton: View {
    //On vérifie quel mode d'affichage on à.
    @Environment(\.colorScheme) var colorScheme
    @State var gameIndex : Int = -1
    @State var buttonMode: Bool = false
    @ObservedObject var activeUser : User
    let game: Game
    let size: Double
    
    init(size: Double = 22, activeUser: User, game: Game) {
        self.size = size
        self.activeUser = activeUser
        self.game = game
    }
    
    var body: some View {
        Image(systemName: buttonMode ? "plus.circle" : "minus.circle")
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .font(.system(size: size, weight: .bold))
            .onTapGesture(perform: {
                if gameIndex != -1 {
                    if !self.buttonMode { //Si le jeu est déja dans la liste alors
                        if let gIndex = self.activeUser.gamesList.firstIndex(of: gameIndex) {
                            self.activeUser.gamesList.remove(at: gIndex)
                        }
                    }
                    else { //Si il n'est pas dans la liste alors
                        self.activeUser.gamesList.append(gameIndex)
                    }
                    
                    self.buttonMode.toggle()
                }
            })
            .onAppear(perform: {
                
                if let gIndex = games.firstIndex(of: self.game) {
                    self.gameIndex = gIndex
                }
                
                if self.gameIndex == -1 {
                    buttonMode = false
                }
                else {
                    buttonMode = !(activeUser.gamesList.contains(gameIndex))
                }
            })
    }
}

struct AddRemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        AddRemoveButton(size: 22,activeUser: user, game: games[3])
            .preferredColorScheme(.dark)
    }
}
