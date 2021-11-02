//
//  UserForm.swift
//  dromspel
//
//  Created by alexandre on 02/11/2021.
//

import SwiftUI

struct UserForm: View {
    @State private var selectedMotivation = Motivation.passerLeTemps
    @State private var selectedPegi = Pegi.pegi_3
    @State private var selectedPlayer = WhichPlayer.jeuxCollectifs
    @State private var selectedGender = AreYou.man
    @State private var selectedType = GameTypeTitles.action
    @State private var dernierJeuJoue: String = ""
    @State private var dernierJeuAchete: String = ""


    var body: some View {
        NavigationView {
            
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
                    
                    Picker("Quel âge avez-vous ?", selection: $selectedPegi) {
                        Text("Pegi 3").tag(Pegi.pegi_3)
                        Text("Pegi 7").tag(Pegi.pegi_7)
                        Text("Pegi 12").tag(Pegi.pegi_12)
                        Text("Pegi 16").tag(Pegi.pegi_16)
                        Text("Pegi 18").tag(Pegi.pegi_18)


                    
                }
                    
                    Picker("Pourquoi jouez-vous ?", selection: $selectedMotivation) {
                        Text("Passer le temps \n(parce qu'on s'ennuie tous à  un moment donné...)").tag(Motivation.passerLeTemps)
                        Text("Extérioriser \n(éviter d'en arriver aux mains avec vos collègues)").tag(Motivation.exterioriser)
                        Text("Se vider le crâne \n(parce que la semaine a été longue)").tag(Motivation.seViderLeCrane)
                        Text("Autre \n(le coeur a ses raisons que la raison ignore)").tag(Motivation.autre)

                    }
                    
                    Picker("Vous êtes plutôt... ?", selection: $selectedPlayer) {
                        Text("Jeux collectifs \n(plus on est de fous, plus on rit)").tag(WhichPlayer.jeuxCollectifs)
                        Text("Égotrip \n(l'enfer c'est les autres)").tag(WhichPlayer.egotrip)
                      


                }
                    
                    Picker("Vous préférez les jeux... ?", selection: $selectedType) {
                        Text("Action \n(pas le temps de niaiser)").tag(GameTypeTitles.action)
                        Text("Aventure \n(un peu d'évasion dans ce monde de brutes)").tag(GameTypeTitles.aventure)
                        Text("RPG \n(pour fuire la dure réalité de la vie)").tag(GameTypeTitles.rpg)
                        Text("Simulation \n(réaliser l'irréalisable)").tag(GameTypeTitles.simulation)
                        Text("Stratégie \n(préparer votre future domination sur le monde)").tag(GameTypeTitles.strategy)
                        Text("Reflexion \n(continuer d'entraîner ce gros muscle qu'est votre cerveau)").tag(GameTypeTitles.reflexion)
                        Text("Sport \n(parce que c'est toujours mieux sans transpiration)").tag(GameTypeTitles.sport)
                        Text("Openworld \n(parce que le vrai monde est trop fermé pour ta libre personne)").tag(GameTypeTitles.openworld)

                }
                    HStack {
                    Text("Dernier jeu joué ?")
                        TextField("", text: $dernierJeuJoue)
                            .background(Color.gray)
                            .cornerRadius(20)
                            .padding()

                }
                    HStack {
                    Text("Dernier jeu acheté ?")
                    TextField("", text: $dernierJeuAchete)
                            .background(Color.gray)
                            .cornerRadius(20)
                            .padding()

                }
                    
                }
                
            }
        }
    }
    
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm()
    }
}


