//
//  GameRoot.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct SheetView: View {
    @Binding var showing : Bool
    @Binding var pegiEmpty: String
    var body: some View {
        VStack {
            Button("Press to dismiss") {
                showing = false
            }
            .font(.title)
            .padding()
            .background(Color.black)
            
            Button(action: {
                pegiEmpty = "PEGI 3"
            }, label: {
                Text("PEGI 3")
            })
        }
        
    }
}

struct GameRoot: View {
    @ObservedObject var activeUser : User
    //On crée un tableau de Bool qui nous servira pour les bindings des NavigationLinks
    //On utilise l'initialisateur Array
    @State var navigationViewAreActive: [Bool] = Array(repeating: false, count: games.count)
    @State private var showingSheet = false
    @State var pegiEmpty: [String] = []
    @State var filteredPegi: [Game] = []
    @State var typeEmpty : [GameType] = []
    @State var filteredType: [Game] = []
    @State var platformEmpty: [String] = []
    @State var filteredPlatform: [Game] = []
    @State var ButtonSelection : Bool = false
    @State var ButtonSelection1 : Bool = false
    @State var ButtonSelection2 : Bool = false
    @State var ButtonSelection3 : Bool = false
    @State var ButtonSelection4 : Bool = false
    @State var ButtonSelection5 : Bool = false
    @State var ButtonSelection6 : Bool = false
    @State var ButtonSelection7 : Bool = false
    @State var ButtonSelection8 : Bool = false
    @State var ButtonsType: [Bool] = Array(repeating: false, count: 36)
    @State var searchToggle: Bool = false
    @State var bindingSearch = ""
    
    
    init(activeUser: User) {
        self.activeUser = activeUser
        
        self._filteredPegi = State(initialValue: games.filter { game in return pegiEmpty.contains(game.pegi) || pegiEmpty.count == 0 })
        
        self._filteredType = State(initialValue: self.filteredPegi.filter { game in
            return self.typeEmpty.contains(where: {g in return g.keyString ==  game.type.keyString})
        })
        
        self._filteredPlatform = State(initialValue: self.filteredType.filter { game in return self.platformEmpty.filter({g in return game.platform.contains(g)}).count > 0 })
    }
    
    var body: some View {
        NavigationView{
            
            VStack {
                if searchToggle {
                    SearchBar(binding: $bindingSearch)
                }
                ScrollView  {
                    if bindingSearch != "" {
                        ForEach(Array(games.enumerated()), id:\.offset) { index, game in
                            if game.name.lowercased().contains(bindingSearch.lowercased()) {
                                Spacer(minLength: 50)
                                NavigationLink(destination: GameScreen(game: game, activeUser: user), isActive: $navigationViewAreActive[index]) {
                                    Button(action : {
                                        navigationViewAreActive[index] = true
                                        self.activeUser.addGameToHistory(index)
                                    }, label: {
                                        ListGameRow(game: game, activeUser: user)
                                    })
                                }
                                
                            }
                        }
                    }
                    else {
                        ForEach(Array(self.filteredPegi.enumerated()), id: \.offset){ index, games in
                            Spacer(minLength: 50)
                            
                            NavigationLink(destination: GameScreen(game: games, activeUser: user), isActive: $navigationViewAreActive[index]) {
                                Button(action : {
                                    navigationViewAreActive[index] = true
                                    self.activeUser.addGameToHistory(index)
                                }, label: {
                                    ListGameRow(game: games, activeUser: user)
                                })
                            }
                        }
                    }
                    }
                    .navigationBarTitle("Nos Recommandations").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            
                            Button(action: {
                                showingSheet.toggle()
                                
                            } , label: {
                                Image("funnel-logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                            })
                                .sheet(isPresented: $showingSheet) {
                                    FilterElement(pegiEmpty:$pegiEmpty, typeEmpty:$typeEmpty, platformEmpty:$platformEmpty, ButtonSelection: $ButtonSelection, ButtonSelection1: $ButtonSelection1, ButtonSelection2: $ButtonSelection2, ButtonSelection3: $ButtonSelection3, ButtonSelection4: $ButtonSelection4, ButtonSelection5: $ButtonSelection5, ButtonSelection6: $ButtonSelection6, ButtonSelection7: $ButtonSelection7, ButtonSelection8: $ButtonSelection8, ButtonsType: $ButtonsType)
                                }
                            
                        }
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            
                            Button(action: {
                                searchToggle.toggle()
                            } , label: {
                                Image(systemName: "magnifyingglass.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                
                            })
                        }
                    }
                }
            }
            
        }
    }


struct GameRoot_Previews: PreviewProvider {
    static var previews: some View {
        GameRoot(activeUser: user)
    }
}
