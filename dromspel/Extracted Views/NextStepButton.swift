//
//  NextStepButton.swift
//  dromspel
//
//  Created by alexandre on 03/11/2021.
//

import SwiftUI

struct NextStepButton: View {
    @Environment(\.colorScheme) var colorScheme
    var textButton : LocalizedStringKey
    
    var body: some View {
        ZStack {
            
                
            HStack{
                Text (textButton)
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                    .multilineTextAlignment(.center)
                
            }
            .frame(width: 330, height: 200)
            .padding()
            .foregroundColor(Color.white)
            
        }
        .frame(width: 200, height: 40)
        .background(Color.blue)
        .clipped()
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke((colorScheme == .dark ? .white : .black), lineWidth: 2)
                .opacity(1))
    }
}

struct NextStepButton_Previews: PreviewProvider {
    static var previews: some View {
        NextStepButton(textButton: "Étape Suivante     \(Image(systemName: "greaterthan"))")
    }
}
