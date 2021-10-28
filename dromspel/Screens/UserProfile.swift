//
//  UserProfile.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        ZStack{
                   Image("background-profile")
                       .resizable()
                       .scaledToFill()
                       .opacity(0.3)
                   
                   VStack{
                       
                       Image (systemName: "person")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 100)
                       
                       
       //                VStack(alignment: .leading, spacing:6) {
                       HStack{
                       Text("Pseudo")
                           Image(systemName: "pencil.circle")
                       }
                       Text("ans")
                       Text("info")
                       Text("info")
                       Button(action: {
                           
                       }, label: {
                           Text("Minis-jeux")
                           
                       })
                           .padding(5)
                           .background(Color.red)
                           .foregroundColor(.white)
                           .cornerRadius(15)
                       
                  
                       
                       Text("Type de Jeux")
                           .padding(10)
                           .frame(width: 600)
                           .background(Color.black)
                           .foregroundColor(.white)
                       
       //                listStyle(<#T##S#>)
                   
                       
                       Spacer()
             
                       
                       Text("Jeux Préférés")
                           .padding(10)
                           .frame(width: 600)
                           .background(Color.black)
                           .foregroundColor(.white)
                       
                      Spacer()
                   }
               }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
