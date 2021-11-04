//
//  FirstBootGameList.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct FirstBootGameList: View {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
    @ObservedObject var activeUser : User
    @State var bindingSearch: String = ""
    @Binding var isValidated: Bool
    @Environment(\.colorScheme) var colorScheme
    @State var uniqueNumbers: [Int] = getUniqueRandomNumbers(min: 0, max: games.count-1, count: 8)

    var body: some View {
        VStack {
            ScrollView {
                VStack (spacing: 5) {
                    TextBubble(textBubble : "Recherchez Manuellement :")
                        .padding()

                    SearchBar(binding: $bindingSearch)
                    
                }
                if bindingSearch != "" {
                    ForEach(games) { game in
                        if game.name.lowercased().contains(bindingSearch.lowercased()) {
                            GamePrefComponent(game : game, activeUser: activeUser)
                        }
                    }
                }
                else {
                    Spacer()
                        .frame(height: 10)
                    TextBubble(textBubble : "Ou bien, voici déjà quelques recommandations :")
                        .padding()
                    

                    ForEach(0..<uniqueNumbers.count , id: \.self) { index in
                        GamePrefComponent(game:games[uniqueNumbers[index]], activeUser: activeUser)
                    }
                    .padding(.horizontal, 8)
                    Spacer()
                        .frame(height: 50)
                    Button (action: {
                        isValidated = true
                    }, label: {
                    NextStepButton(textButton: "Vous avez fini !")
                    })
                }
            }
        }
    }
    
}

struct FirstBootGameList_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootGameList(activeUser: user, bindingSearch: "", isValidated: .constant(false))
//            .preferredColorScheme(.dark)
    }
}
