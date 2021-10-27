//
//  PoucesButtons.swift
//  dromspiel
//
//  Created by lucas on 26/10/2021.
//

import SwiftUI

struct ThumbUp: View {
    @Environment(\.colorScheme) var colorScheme
    @State var opacity: Bool = true
    @State var gameIndex : Int = -1
    @State var isValidated: Bool = false
    @ObservedObject var activeUser : User
    let game: Game
    let size: Double
var body: some View {
    ZStack {
          Image(systemName: "hand.thumbsup.fill")
            .font(.system(size: size))
            .foregroundColor(isValidated ? .green : .blue)
          Image(systemName: "hand.thumbsup")
              .foregroundColor(colorScheme == .dark ? .white : .black)
              .font(.system(size: size+2))
              }
                .opacity(self.opacity ? 1 : 0)
                .onTapGesture(perform: {
            if gameIndex != -1 {
                if !self.isValidated { //Si le jeu est déja dans la liste alors
                    if let gIndex = self.activeUser.likedGames.firstIndex(of: gameIndex) {
                        self.activeUser.likedGames.remove(at: gIndex)
                    }
                } else { //Si il n'est pas dans la liste alors
                    self.activeUser.likedGames.append(gameIndex)
                }

                self.isValidated.toggle()
            }
        })
    .onAppear(perform: {
        
        if let gIndex = games.firstIndex(of: self.game) {
            self.gameIndex = gIndex
            opacity = !activeUser.dislikedGames.contains(gameIndex)
        }
        
        if self.gameIndex == -1 {
            isValidated = false
            
        }
        else {
            isValidated = (activeUser.likedGames.contains(gameIndex))
        }
    })
    /*.onChange(of: activeUser.dislikedGames.contains(gameIndex), perform: { _ in
    opacity = true
                })*/
    .onChange(of: activeUser.dislikedGames, perform: { _ in
        opacity = activeUser.dislikedGames.contains(gameIndex)
    })
}
}

struct ThumbDown: View {
    @Environment(\.colorScheme) var colorScheme
    @State var opacity: Bool = true
    @State var isUp: Bool = false
    @State var gameIndex : Int = -1
    @State var isValidated: Bool = false
    @Binding var opacityUp: Bool
    @ObservedObject var activeUser : User
    let game: Game
    let size: Double
var body: some View {
    ZStack {
          Image(systemName: "hand.thumbsdown.fill")
            .font(.system(size: size))
            .foregroundColor(isValidated ? .black : .red)
          Image(systemName: "hand.thumbsdown")
              .foregroundColor(colorScheme == .dark ? .white : .black)
              .font(.system(size: size+2))
              }
            .opacity(self.opacity ? 1 : 0)
            .onTapGesture(perform: {
                    if gameIndex != -1 {
                        if !self.isValidated { //Si le jeu est déja dans la liste alors
                            if let gIndex = self.activeUser.dislikedGames.firstIndex(of: gameIndex) {
                                self.activeUser.dislikedGames.remove(at: gIndex)
                                opacityUp = true
                            }
                        } else { //Si il n'est pas dans la liste alors
                            self.activeUser.dislikedGames.append(gameIndex)
                            opacityUp = false
                        }
    
                        self.isValidated.toggle()
                    }
                })
            .onAppear(perform: {
                
                if let gIndex = games.firstIndex(of: self.game) {
                    self.gameIndex = gIndex
                    opacity = !activeUser.likedGames.contains(gameIndex)
                }
                
                if self.gameIndex == -1 {
                    isValidated = false
                }
                else {
                    isValidated = (activeUser.dislikedGames.contains(gameIndex))
                }
            })
            .onChange(of: activeUser.likedGames, perform: { _ in
                opacity = activeUser.likedGames.contains(gameIndex)
            })
          }
}

struct ThumbButtons: View {
    //On vérifie quel mode d'affichage on à.
    @Environment(\.colorScheme) var colorScheme
    @State var isUp: Bool = false
    @State var opacityUp: Bool = true
    @State var gameIndex : Int = -1
    @State var isValidated: Bool = false
    var activeUser : User
    let game: Game
    let size: Double
    
    init(size: Double = 50, activeUser: User, game: Game) {
        self.size = size
        self.activeUser = activeUser
        self.game = game
    }
    
    var body: some View {
        ZStack {
            HStack {
            ThumbUp(activeUser: activeUser, game: game, size: size)
            ThumbDown(opacityUp: $opacityUp, activeUser: activeUser, game: game, size: size)
            }
        }
    }
}

struct ThumbButtons_Previews: PreviewProvider {
    static var previews: some View {
        ThumbButtons(size: 50,activeUser: user, game: games[0])
            .preferredColorScheme(.dark)
    }
}
