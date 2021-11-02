//
//  Default.swift
//  dromspiel
//
//  Created by alexandre on 26/10/2021.
//

import SwiftUI

struct ListGameRowCalendar: View {
    var game: Game
    @Environment(\.colorScheme) var colorScheme
    @State var NavigationIsActive = false
    @ObservedObject var activeUser : User
    var body: some View {
        NavigationLink(destination: GameScreen(game: game, activeUser: activeUser), isActive: $NavigationIsActive) {
            Button(action: {
                
                if let gIndex = games.firstIndex(of: game) {
                    self.activeUser.addGameToHistory(gIndex)
                    NavigationIsActive = true
                }
            }) {
                ZStack {
                    Image(self.game.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 100, alignment: .bottom)
                        .clipped()
                        .cornerRadius(12)
                        .opacity(0.45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                                .opacity(1))


                    HStack {
                        VStack (alignment: .center, spacing: 10) {
                            Text(self.game.name)
                                .shadow(color: colorScheme == .dark ? .black : .white, radius: 1)
                                .font(.system(size: 23, weight: .heavy))
                            Text(self.game.date)
                                .font(.system(size: 19, weight: .heavy))

                        }
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                }

                .padding(.horizontal)
                .frame(height: 70)
            }
        }
        }
}

struct ListGameRowCalendar_Previews: PreviewProvider {
    static var previews: some View {
        ListGameRowCalendar(game: games[0], activeUser: user)
            .preferredColorScheme(.dark)
    }
}
