//
//  ScreenDefault.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameScreen: View {
    var game: Game
    @ObservedObject var activeUser: User
    var body: some View {
        ZStack {
            ScrollView{
                VStack(alignment: .center, spacing: 10){
                VideoPlayerGame(game: game)
                        Spacer()
                    HStack {
//                        ThumbButtons(size: 30, isUp: true)
//                            .padding(7)
//                        ThumbButtons(size: 30)
//                            .padding(7)
                        Spacer()
                            .frame(width: 50)
                        
                        
                        AddRemoveButton(size: 25, activeUser: activeUser, game: game)
                            .padding()
                    }
                       
                        Text(game.description)
                        .padding()
                        .font(.system(size: 20))
                        Spacer()
                    }.font(.system(size: 30))
                        .navigationBarTitle(game.name)
            }
        }.background(
            Image(game.image)
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.8)
        )
    }
    
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(game: games[0], activeUser : user)
    }
}

