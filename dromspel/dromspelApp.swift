//
//  dromspielApp.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

@main
struct dromspelApp: App {
    
    var firstLaunch: Bool = false
    @State var validated : Bool = false
    
    init() {
        if let usr = User.getUserFromUserDefaults() {
            user = usr
            firstLaunch = false
        }
        else {
            user = User(gamesList: [], history: [], likedGames: [], dislikedGames: [], preferences: [], experiences: [], pseudo: "Pseudo", description: "Description")
            user.saveUserToUserDefault()
            firstLaunch = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if firstLaunch && !validated {
                FirstBootScreen(isValidated: $validated)
            } else {
                ContentView()
            }
        }
    }
}
