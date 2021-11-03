//
//  ChoiceButtonQuestion.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct ChoiceButtonQuestion: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Image("Thinking-bg")
                .resizable()
                .scaledToFill()
                .frame(width: 340, height: 200)
                .opacity(0.7)
                .background(Color.black)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))
            VStack{
                Text ("Vous ne savez pas quoi choisir ?")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                    .multilineTextAlignment(.center)
                    Spacer()
                    .frame(height: 19)
                Text ("Cliquez ici ")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                
                
            }
            .frame(width: 330, height: 200)
            .padding()
            .foregroundColor(Color.white)
            
        }
    }
}

struct ChoiceButtonQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceButtonQuestion()
    }
}
