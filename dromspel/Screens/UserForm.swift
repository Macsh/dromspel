//
//  UserForm.swift
//  dromspel
//
//  Created by alexandre on 02/11/2021.
//

import SwiftUI

struct UserForm: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isValidated: Bool
    let haveButton : Bool
    var activeUser: User
    
    @State private var selectedMotivation = Motivation.passerLeTemps
    @State private var selectedPlayer = WhichPlayer.jeuxCollectifs
    @State private var selectedGender = AreYou.man
    @State private var selectedType = GameTypeTitles.action
    @State private var dernierJeuJoue: String = ""
    @State private var selectedGame = -1
    @State private var selections: [String] = []
    
    init(isValidated: Binding<Bool>, haveButton: Bool, activeUser: User) {
        self._isValidated = isValidated
        self.haveButton = haveButton
        self.activeUser = activeUser
        
        self._selectedGender = State(initialValue: self.activeUser.playerInfo)
        self._selectedPlayer = State(initialValue: self.activeUser.playerType)
        self._selectedMotivation = State(initialValue: self.activeUser.motivation)
        self._selectedType = State(initialValue: self.activeUser.preferedGames)
    }

    var body: some View {
//        NavigationView {
            
            VStack (alignment: .center, spacing: 00) {
                
                Text("Questionnaire de préférences")
                    .font(.system(size: 30, weight: .heavy))
                    .bold()
                    .multilineTextAlignment(.center)
                            
                Spacer()
                
                Form {
              
                    
                    Picker("Vous êtes... ?", selection: $selectedGender) {
                        Text("Homme").tag(AreYou.man)
                        Text("Femme").tag(AreYou.woman)
                    }
                    .onChange(of: self.selectedGender, perform: { newValue in
                        self.activeUser.playerInfo = newValue
                        User.saveSpecificUserDefault(newValue.rawValue, forKey: "user.playerInfo")
                    })
                    
                    Picker("Pourquoi jouez-vous ?", selection: $selectedMotivation) {
                        Text("Passer le temps \n(parce qu'on s'ennuie tous à  un moment donné...)").tag(Motivation.passerLeTemps)
                        Text("Extérioriser \n(éviter d'en arriver aux mains avec vos collègues)").tag(Motivation.exterioriser)
                        Text("Se vider le crâne \n(parce que la semaine a été longue)").tag(Motivation.seViderLeCrane)
                        Text("Autre \n(le coeur a ses raisons que la raison ignore)").tag(Motivation.autre)
                    }
                    .onChange(of: self.selectedMotivation, perform: { newValue in
                        self.activeUser.motivation = newValue
                        User.saveSpecificUserDefault(newValue.rawValue, forKey: "user.motivation")
                    })
                    
                    Picker("Vous êtes plutôt... ?", selection: $selectedPlayer) {
                        Text("Jeux collectifs \n(plus on est de fous, plus on rit)").tag(WhichPlayer.jeuxCollectifs)
                        Text("Égotrip \n(l'enfer c'est les autres)").tag(WhichPlayer.egotrip)
                        Text("Autre \n(le coeur a ses raisons que la raison ignore)").tag(WhichPlayer.autre)
                    }
                    .onChange(of: self.selectedPlayer, perform: { newValue in
                        self.activeUser.playerType = newValue
                        User.saveSpecificUserDefault(newValue.rawValue, forKey: "user.playerType")
                    })
                    
                    Picker("Vous préférez les jeux... ?", selection: $selectedType) {
                        Text("Action \n(pas le temps de niaiser)").tag(GameTypeTitles.action)
                        Text("Aventure \n(un peu d'évasion dans ce monde de brutes)").tag(GameTypeTitles.aventure)
                        Text("RPG \n(pour fuire la dure réalité de la vie)").tag(GameTypeTitles.rpg)
                        Text("Simulation \n(réaliser l'irréalisable)").tag(GameTypeTitles.simulation)
                        Text("Stratégie \n(préparer votre future domination sur le monde)").tag(GameTypeTitles.strategy)
                        Text("Reflexion \n(continuer d'entraîner ce gros muscle qu'est votre cerveau)").tag(GameTypeTitles.reflexion)
                        Text("Sport \n(parce que c'est toujours mieux sans transpiration)").tag(GameTypeTitles.sport)
                        Text("Openworld \n(parce que le vrai monde est trop fermé pour ta libre personne)").tag(GameTypeTitles.openworld)
                        Text("Autre \n(le coeur a ses raisons que la raison ignore)").tag(GameTypeTitles.autre)

                    }
                    .onChange(of: self.selectedType, perform: { newValue in
                        self.activeUser.preferedGames = newValue
                        User.saveSpecificUserDefault(newValue.rawValue, forKey: "user.preferedGames")
                    })
                    
                    NavigationLink(destination: selectedPlayedGames(activeUser: activeUser)) {
                        Text("Avez vous déjà joué à... ?")
                    }
                    
                    }
                if self.haveButton {
                        Button(action: {
                            isValidated = true
                        }, label: {
                            NextStepButton(textButton: "Vous avez fini !")
                        })
                    }

                }
                    
                }

            
//        }
    }



struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm(isValidated: .constant(false), haveButton: true, activeUser: user)

    }
}




