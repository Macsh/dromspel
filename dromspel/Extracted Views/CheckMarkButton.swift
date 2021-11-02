//
//  CheckMarkButton.swift
//  dromspiel
//
//  Created by lucas on 27/10/2021.
//

import SwiftUI

struct CheckMarkButton: View {
    //On vérifie quel mode d'affichage on à.
    @Environment(\.colorScheme) var colorScheme
    
    var taille: Double = 30
    @Binding var binding: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: taille, height: taille)
                .onTapGesture(perform: {
                    self.binding.toggle()
                })
            Circle()
                .foregroundColor(.black)
                .frame(width: binding ? taille - 7 : 0, height: binding ? taille - 7 : 0)
                .animation(.easeInOut(duration: 0.15))
                .onTapGesture(perform: {
                    self.binding.toggle()
                })
        }
    }
}

struct CheckMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckMarkButton(binding: .constant(false))
            .preferredColorScheme(.dark)
    }
}
