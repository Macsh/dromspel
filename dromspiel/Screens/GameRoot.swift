//
//  GameRoot.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct GameRoot: View {
    var body: some View {
        NavigationView{
        ScrollView  {
            ForEach(games){game in
                NavigationLink(destination: GameScreen(game: game),
                               label:{
                    Text(game.name)
                        .background(
                        Image("elden-ring-art-1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 50))
                })
                    .padding()
                Spacer()
                    
                            
                
            }
            
            .navigationBarTitle("Commercants")
        }
        
    }
    }
}

struct GameRoot_Previews: PreviewProvider {
    static var previews: some View {
        GameRoot()
    }
}
