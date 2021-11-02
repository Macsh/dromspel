//
//  GameStyleButton.swift
//  dromspel
//
//  Created by alexandre on 29/10/2021.
//

import SwiftUI

struct GameStyleButton: View {
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
                        .frame(width: 150, height: 100)
                        .clipped()
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                            .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            .opacity(1))
                        
                VStack {
                    Spacer()
                        .frame(height: 10)
                    HStack {
                        CheckMarkButton(binding: $binding)
                        Spacer()
                            .frame(width: 110)
                            
                    }
                    HStack {
                        VStack (alignment: .center, spacing: 10) {
                            Text(gameStyle.keyString)
                                .font(.system(size: 20, weight: .heavy))
                                .frame(width: 140, height: 60)
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .onTapGesture(perform: {
                self.binding.toggle()
            })
            .frame(width: 120, height: 70)
        }
}

struct GameStyleButton_Previews: PreviewProvider {
    static var previews: some View {
        GameStyleButton(gameStyle: GameType.Strategy(value: .TBS), activeUser: user)
    }
}
