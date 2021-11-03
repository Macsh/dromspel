//
//  MiniGame.swift
//  dromspiel
//
//  Created by gibril on 27/10/2021.
//

import SwiftUI

struct FirstBootScreen: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                Color(red: 212 / 255, green: 230 / 255, blue: 241 / 255)
                    .ignoresSafeArea(.all)
//                Image("Firstscreen-bg")
//                    .resizable()
//                    .scaledToFill()
//                    .opacity(0.7)
//                    .background(Color.black)
//                    .clipped()
                
                VStack{
                    Spacer()
                        .frame(height: 50)
                    NavigationLink (destination:MiniGameScreen(), label:{
                            ChoiceButton()
                                
                    })
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink (destination:MiniGameScreen(), label:{
                            ChoiceButtonQuestion()
                                
                    })
                    
                        
                }
                .padding()

                
                
            }
            
            .navigationBarTitle("Faites votre choix").navigationBarTitleDisplayMode(.inline).navigationViewStyle(StackNavigationViewStyle())
//            .navigationBarHidden(true)
            
        }
        
    }
}


struct FirstBootScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootScreen()
//            .preferredColorScheme(.dark)
    }
}
