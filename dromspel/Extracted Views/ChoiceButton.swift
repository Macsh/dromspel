//
//  ChoiceButtton.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct ChoiceButton: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Image("Choicebutton-bg")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 270)
                .opacity(0.7)
                .background(Color.black)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))
            VStack{
                Text ("Selectionnez vos preferences:")
                    .font(.system(size: 20, weight: .bold))
                
                HStack{
                    
                    StyleFirstScreen(gameStyle: GameType.ActionAventure(value:.survivalHorror), activeUser: user)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    StyleFirstScreen(gameStyle: GameType.RPG(value:.JRPG), activeUser: user)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    
                }
                
                HStack{
                    
                    StyleFirstScreen(gameStyle: GameType.Action(value:.FPS), activeUser: user)
                        .padding()
                    StyleFirstScreen(gameStyle: GameType.SeeMore(value:.more), activeUser: user)
                        .padding()
                    
                    
                }
            }
            .frame(width: 350, height: 270)
            .padding()
            .foregroundColor(Color.white)
//            .background(Color.blue)
        }
    }
}

struct ChoiceButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceButton()
//            .preferredColorScheme(.dark)
    }
}
