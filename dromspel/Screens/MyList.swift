//
//  ScreenDefault.swift
//  dromspiel
//
//  Created by lucas on 26/10/2021.
//

import SwiftUI

fileprivate enum ListState: Int {
    case list, historique
}

struct MyList: View {
    @State private var selection = ListState.list
    
    //@State private var appearAnimation = false
    
    @ObservedObject private var activeUser : User
    
    init(user: User) {
        self.activeUser = user
    }
    
    var body: some View {
        
        NavigationView {
            VStack() {
                Picker("", selection: $selection) {
                    Text("Ma liste")
                        .tag(ListState.list)
                    Text("Historique")
                        .tag(ListState.historique)
                }
                .pickerStyle(.segmented)
            
                ScrollView {
                    VStack {
                        if selection == ListState.list {
                            ForEach(activeUser.gamesList.reversed() , id: \.self) { gameIndex in
                                GameListComponent(game : games[gameIndex], activeUser: activeUser)
                            }
                            .padding(.horizontal, 8)
                        }
                        else {
                            ForEach(activeUser.history.reversed() , id: \.self) { gameIndex in
                                GameListComponent(game : games[gameIndex], activeUser: activeUser)
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                }
            }
            .navigationBarTitle(Text(selection == ListState.list ? "Ma liste" : "Historique"), displayMode: .inline)

        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList(user: user)
            .preferredColorScheme(.dark)
    }
}
