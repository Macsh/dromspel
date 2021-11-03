//
//  TextBubble.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct TextBubble: View {
    @Environment(\.colorScheme) var colorScheme
    var textBubble : String
    var body: some View {
        ZStack {
            if (colorScheme == .dark) {
            Image("bg-bubble")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .opacity(0.7)
                .background(Color.black)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))
                
            }
            else {
                Image("Firstscreen-bg-lightmode")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200, alignment: .top)
                    .opacity(0.7)
                    .background(Color.black)
                    .clipped()
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                
            }
            HStack{
                Text (textBubble)
                    .font(.system(size: 17, weight: .bold))
                    .padding()
                    .multilineTextAlignment(.center)
                
            }
            .frame(height: 80)
            
        }
        .frame(height: 50)
        .background(Color(colorScheme == .dark ? .black : .white))
        .clipped()
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke((colorScheme == .dark ? .white : .black), lineWidth: 2)
                .opacity(1))
    }
}

struct TextBubble_Previews: PreviewProvider {
    static var previews: some View {
        TextBubble(textBubble : "Ou bien, voici déjà quelques recommandations :")
//            .preferredColorScheme(.dark)

    }
}
