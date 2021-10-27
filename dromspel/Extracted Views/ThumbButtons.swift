//
//  PoucesButtons.swift
//  dromspiel
//
//  Created by lucas on 26/10/2021.
//

import SwiftUI

struct ThumbButtons: View {
    //On vérifie quel mode d'affichage on à.
    @Environment(\.colorScheme) var colorScheme
    @State var isUp: Bool
    @ObservedObject var activeUser : User
    let game: Game
    let size: Double
    let isValidated: Bool
    let onTap: () -> Void
    
    init(size: Double = 50, isUp : Bool = false, isValidated: Bool = false, onTap: @escaping () -> Void = {}) {
        self.onTap = onTap
        self.isUp = isUp
        self.isValidated = isValidated
        self.size = size
    }
    
    var body: some View {
        ZStack {
            Image(systemName: isUp ? "hand.thumbsup.fill" :"hand.thumbsdown.fill")
                .foregroundColor(isUp ?
                                 isValidated ? .green : .blue :
                                 isValidated ? .black : .red)
                .font(.system(size: size))
            Image(systemName: isUp ? "hand.thumbsup" :"hand.thumbsdown")
                .foregroundColor(colorScheme == .dark ? .white : .black)
            .font(.system(size: size+2))
            .onTapGesture(perform: onTap)
        }
    }
}

struct ThumbButtons_Previews: PreviewProvider {
    static var previews: some View {
        ThumbButtons()
            .preferredColorScheme(.dark)
    }
}
