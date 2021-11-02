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
            ZStack(alignment: .top){
                Image("background-profile")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.8)
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                        .frame(height: 50)
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
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                        
                    })
                        
                        .padding()
                        .padding()
                    
                    NavigationLink (destination:MiniGameScreen(), label:{
                        VStack{
                            Text ("Vous ne savez pas quoi choisir ?")
                                .font(.system(size: 20, weight: .bold))
                                .padding()
                            Text ("Cliquez ici :")
                                .font(.system(size: 20, weight: .bold))
                            Image (systemName:"gamecontroller.fill")
                                .padding()
                            
                        }
                        .font(.system(size: 20))
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(20)
                    })
                    
                        .padding()
                }

                
                
            }
            .navigationBarTitle("Faite votre choix").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
//            .navigationBarHidden(true)
        }
        
    }
}


struct FirstBootScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootScreen()
    }
}
