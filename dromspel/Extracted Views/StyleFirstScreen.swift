//
//  GameStyleButton.swift
//  dromspel
//
//  Created by alexandre on 29/10/2021.
//

import SwiftUI

struct StyleFirstScreen: View {
    var gameStyle : GameType
    @State var binding: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var activeUser : User
    var body: some View {
            ZStack {
                Image(gameStyle.keyString)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.8)
                        .background(Color.black)
                        .frame(width: 130, height: 80)
                        .clipped()
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                        
                VStack {
                    HStack {
                        VStack (alignment: .center, spacing: 10) {
                            Text(gameStyle.keyString)
                                .font(.system(size: 20, weight: .heavy))
                                .frame(width: 110, height: 90)
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .frame(width: 120, height: 70)
        }
}

struct StyleFirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        StyleFirstScreen(gameStyle: GameType.Strategy(value: .TBS), activeUser: user)
    }
}
