//
//  SelectedPlayedGames.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

// view des jeux à selectionner dans le questionnaire
struct selectedPlayedGames: View {
    var activeUser: User
    @State var selectionGames: [Game] = games
    @State var isSelected: [Bool] = Array(repeating: false, count: games.count)
    var id = UUID()
    
    var body: some View {
        List{
                ForEach(0..<selectionGames.count){ index in
                        HStack {
                                Button(action: {
                                    if isSelected[index] {
                                        if let i = activeUser.experiences.firstIndex(of: index) {
                                            activeUser.experiences.remove(at: i)
                                            
                                        }
                                    } else {
                                        activeUser.experiences.append(index)
                                    }
                                    isSelected[index].toggle()
                                    User.saveSpecificUserDefault(activeUser.experiences, forKey: "user.experiences")
                                }) {
                                        HStack{
                                                if isSelected[index] {
                                                        Image(systemName: "checkmark.circle.fill")
                                                                .foregroundColor(.green)
                                                                .animation(.easeIn)
                                                } else {
                                                        Image(systemName: "circle")
                                                                .foregroundColor(.primary)
                                                                .animation(.easeOut)
                                                }
                                                Text(selectionGames[index].name)
                                        }
                                }.buttonStyle(BorderlessButtonStyle())
                        }
                }
        }
        .onAppear(perform: {
            for index in activeUser.experiences {
                isSelected[index] = true
            }
        })
        
    }
}

struct selectedPlayedGames_Previews: PreviewProvider {
    static var previews: some View {
        selectedPlayedGames(activeUser: user)
    }
}


