//
//  MiniGame.swift
//  dromspiel
//
//  Created by gibril on 27/10/2021.
//

import SwiftUI

struct FirstBootScreen: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("background-profile")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                VStack{
                    
                    
                    NavigationLink (destination:MiniGameScreen(), label:{
                    VStack{
                        Text ("Selectionnez vos preferences:")
                            .font(.system(size: 20, weight: .bold))
                        
                        HStack{
                            
                            StyleFirstScreen(gameStyle: GameType.ActionAventure(value:.metroidVania), activeUser: user)
                                .padding(8)
                            StyleFirstScreen(gameStyle: GameType.RPG(value:.JRPG), activeUser: user)
                                .padding(8)
                            
                        }
                        HStack{
                            
                            StyleFirstScreen(gameStyle: GameType.Action(value:.FPS), activeUser: user)
                                .padding(8)
                            StyleFirstScreen(gameStyle: GameType.OpenWorld(value:.openWorld), activeUser: user)
                                .padding(8)
                            
                            
                        }
                        
                    }
                    .padding(30)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    })
                    
                    
                    
                    
                    
                    Spacer().frame(height: 150)
                    
                    NavigationLink (destination:MiniGameScreen(), label:{
                        VStack{
                            Text ("Vous ne savez pas choisir, cliquez ici")
                            Image (systemName:"gamecontroller.fill")
                            
                        }
                        .font(.system(size: 20))
                        .padding(30)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(20)
                    })
                    
                    
                }
                
                
            }
            
        }
    }
}


struct FirstBootScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootScreen()
    }
}
