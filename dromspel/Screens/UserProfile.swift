//
//  UserProfile.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI


struct UserProfile: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var person = user
    @State var isModifying: Bool = false
    @State var pseudoBinding: String = ""
    @State var descriptionBinding: String = ""
    
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
                    if !isModifying {
                        Text(person.pseudo)
                        Text(person.description)
                    }
                    else {
                        TextField("Pseudo", text: $pseudoBinding)
                            .frame(width: 120,alignment: .center)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 5)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                        TextField("Description", text: $descriptionBinding)
                            .frame(width: 120,alignment: .center)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 5)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                    }
                    
                    NavigationLink (destination:UserForm(isValidated: .constant(false), haveButton: false, activeUser: person), label:{
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
                    .onTapGesture {
                        if isModifying {
                            self.person.pseudo = pseudoBinding
                            self.person.description = descriptionBinding
                            person.saveUserToUserDefault()
                        }
                        
                        self.isModifying.toggle()
                    }
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

