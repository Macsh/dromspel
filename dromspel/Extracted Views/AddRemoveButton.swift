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
    var gameIndex : Int
    @State var buttonMode: Bool = false
    @ObservedObject var activeUser : User
    let game: Game
    let size: Double
    
    init(size: Double = 22, activeUser: User, game: Game, gameIndex: Int = -1) {
        self.size = size
        self.activeUser = activeUser
        self.game = game
        
        if gameIndex == -1 {
            if let gIndex = games.firstIndex(of: self.game) {
                self.gameIndex = gIndex
            }
            else {
                self.gameIndex = -1
            }
        }
        else {
            self.gameIndex = gameIndex
        }
    }
    
    var body: some View {
        Image(systemName: buttonMode ? "plus.circle" : "minus.circle")
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .font(.system(size: size, weight: .bold))
            .onTapGesture(perform: {
                if gameIndex != -1 {
                    if !self.buttonMode {
                        if let gIndex = self.activeUser.gamesList.firstIndex(of: gameIndex) {
                            self.activeUser.gamesList.remove(at: gIndex)
                        }
                    }
                    else {
                        self.activeUser.gamesList.append(gameIndex)
                    }
                    
                    self.buttonMode.toggle()
                }
            })
            .onAppear(perform: {
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
        AddRemoveButton(size: 22,activeUser: user, game: games[2])
            .preferredColorScheme(.dark)
    }
}
