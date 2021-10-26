//
//  ContentView.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        ScrollView  {
            ForEach(games){game in
                NavigationLink(destination: GameScreen(game: game),
                               label:{
                    Text(game.name)
                })
                    .padding()
                    .background(
                        Image("elden-ring-art-1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150))
                
            }
            
            .navigationBarTitle("Commercants")
        }
        
    }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
