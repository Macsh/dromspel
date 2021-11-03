//
//  FirstBootGameList.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct FirstBootGameList: View {
    @ObservedObject var activeUser : User
    @State var bindingSearch: String
    var body: some View {
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
}

struct FirstBootGameList_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootGameList(activeUser: user, bindingSearch: "")
    }
}
