//
//  ContentView.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {                     // Declaration de la TabView (TabBar)
            GameRoot(activeUser: user, game: games[0])                  // Ecran  1 a affiché
                .tabItem {              // icone et texte lié a l'ecran a afficher
                    Image(systemName: "gamecontroller")
                    Text("Accueil")
                }
            // On repete la meme operation autant de fois que necessaire
            EventRoot()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Evènements")
                }
            
            MyList(user: user)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Liste Jeux")
                }
            UserProfile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
