//
//  ScreenDefault.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameScreen: View {
    var game: Game
    var body: some View {
        VStack{
                    Spacer()
                    Text(game.name)
                    Spacer()
                    Text(game.description)
                    Spacer()
                }.font(.system(size: 30))
                    .navigationBarTitle(game.name)
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(game: games[0])
    }
}

