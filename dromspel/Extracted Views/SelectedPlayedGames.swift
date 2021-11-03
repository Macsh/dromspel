//
//  SelectedPlayedGames.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

// view des jeux à selectionner dans le questionnaire
struct selectedPlayedGames: View {
    @State var selectionGames: [Game] = games
    @State var isSelected: [Bool] = Array(repeating: false, count: games.count)
    var id = UUID()
    
    var body: some View {
        List{
                ForEach(0..<selectionGames.count){ index in
                        HStack {
                                Button(action: {
                                    isSelected[index].toggle()
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
        
    }
}

struct selectedPlayedGames_Previews: PreviewProvider {
    static var previews: some View {
        selectedPlayedGames()
    }
}
