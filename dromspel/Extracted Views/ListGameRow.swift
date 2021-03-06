//
//  Default.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct ListGameRow: View {
    var game: Game
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var activeUser : User
    var body: some View {
            ZStack {
                Image(self.game.image)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.8)
                        .background(Color.black)
                        .frame(height: 100)
                        .clipped()
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                        
                        
                HStack {
                    VStack (alignment: .center, spacing: 10) {
                        Text(self.game.name)
                            .font(.system(size: 20, weight: .heavy))
//                        Text(self.game.type)
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .frame(height: 70)
        }
}

struct ListGameRow_Previews: PreviewProvider {
    static var previews: some View {
        ListGameRow(game: games[0], activeUser: user)
//            .preferredColorScheme(.dark)
    }
}
