//
//  Default.swift
//  dromspiel
//
//  Created by lucas on 26/10/2021.
//

import SwiftUI

struct GameListComponent: View {
    //On vérifie quel mode d'affichage on à.
    @Environment(\.colorScheme) var colorScheme
    
    let game : Game
    let gIndex: Int
    @State var activeUser: User
    
    var body: some View {
        NavigationLink(destination: GameScreen(game: game, activeUser: activeUser)) {
            HStack {
                Image(game.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 60)
                Text(game.name)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Spacer()
                AddRemoveButton(size: 22, activeUser: activeUser, game: game)
            }
            .padding()
            .background(Color.init(white: colorScheme == .dark ? 0.1 : 0.9))
        .cornerRadius(25)
        }
    }
}

struct GameListComponent_Previews: PreviewProvider {
    static var previews: some View {
        GameListComponent(game: games[0], gIndex: 0, activeUser: user)
            .preferredColorScheme(.dark)
    }
}
