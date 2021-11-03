//
//  UserProfile.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI


struct UserProfile: View {
    @ObservedObject var person = user
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("background-profile")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .ignoresSafeArea()
                
                ScrollView{
                    Image ("venom_profil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .cornerRadius(50)
                    
                    
                    //                VStack(alignment: .leading, spacing:6) {
                    Text(person.pseudo)
                    Text(person.description)
                    
                    NavigationLink (destination:UserForm(), label:{
                        Text("Mini-Questionnaire")
                            .padding(7)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })
                        
                        
                        
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Type de Jeux")
                        .font(.system(size: 17, weight: .bold))
                        .padding(10)
                        .frame(width: 600)
                        .background(Color.black)
                        .foregroundColor(.white)
                    //                               NavigationLink
                    NavigationLink (destination:PreferencesScreen(activeUser: user, selection: 0), label:{
                    StylePreferencesButton()
                    })
                                  
                    Text("Jeux Préférés")
                        .font(.system(size: 17, weight: .bold))
                        .padding(10)
                        .frame(width: 600)
                        .background(Color.black)
                        .foregroundColor(.white)
                    
                    NavigationLink (destination:PreferencesScreen(activeUser: user, selection: 1), label:{
                    GamePreferencesButton()
                    })
                    
            }
            }
            .navigationBarTitle("Votre Profil").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
            .toolbar {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
