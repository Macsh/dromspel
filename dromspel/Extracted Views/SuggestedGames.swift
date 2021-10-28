//
//  SuggestedGames.swift
//  dromspel
//
//  Created by alexandre on 28/10/2021.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SuggestedGames: View {
    var game: Game
    @Binding var gameBinding: Game
    @Environment(\.colorScheme) var colorScheme
    var activeUser: User
    var body: some View {
            
            ZStack {
                VStack (spacing: 0){
                    Image(self.game.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 120, alignment: .bottom)
                        .clipped()
                        .opacity(0.8)
                        .overlay(
                            Rectangle()
                                .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                            
                        )
                    
                    
                    VStack {
                        Text(game.name)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor((colorScheme == .dark ? .white : .black))
                            .frame(width: 140, height: 60)
                    }
                    
                    .frame(width: 150)
                    .background(Color(colorScheme == .dark ? .black : .white).opacity(0.5))
                    .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                }
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke((colorScheme == .dark ? .white : .black), lineWidth: 3)
                        .opacity(1))
            }
            .frame(width: 120, height: 150)
            .onTapGesture {
                gameBinding = game
                
            }
        
    }
}
                        
                        
                        extension View {
            func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
                clipShape( RoundedCorner(radius: radius, corners: corners) )
            }
        }
                        
                        struct SuggestedGames_Previews: PreviewProvider {
            static var previews: some View {
                Text("Lalalalalalaaaa")
//                SuggestedGames(game: games[0], gameBinding: game, activeUser: user)
                            .preferredColorScheme(.dark)
            }
        }
