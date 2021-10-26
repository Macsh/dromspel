//
//  ContentView.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ForEach(games){game in
                NavigationLink(destination: GameScreen(game: game),
                               label:{
                    Text(game.name)
                })
            }
            .navigationBarTitle("Nos Recommandations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
