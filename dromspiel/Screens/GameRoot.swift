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
                Spacer(minLength: 50)
                    NavigationLink(destination: GameScreen(game: game),
                                   label:{
                        ListGameRow(game: game)
                            
                    })
                
            }
            
            .navigationBarTitle("Nos Recommandations").navigationBarTitleDisplayMode(.inline)
        }
        
    }
    }
}

struct GameRoot_Previews: PreviewProvider {
    static var previews: some View {
        GameRoot()
    }
}
