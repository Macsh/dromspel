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

                VStack{

                    Button (action: {

                    }, label:{


                        VStack{
                            Text ("Selectionner vos preferences:")
                                .font(.system(size: 20))

                            HStack{

                                Text("Fight")

                                    .padding(8)
                                    .foregroundColor(Color.blue)
                                    .background(Color.white)
                                    .cornerRadius (9)
                                Text("Arcade")
                                    .padding(8)
                                    .foregroundColor(Color.blue)
                                    .background(Color.white)
                                    .cornerRadius (9)

                            }
HStack{

                                Text("Aventure")
                                    .padding(8)
                                    .foregroundColor(Color.blue)
                                    .background(Color.white)
                                    .cornerRadius (9)
                                Text("Simulation")
                                    .padding(8)
                                    .foregroundColor(Color.blue)
                                    .background(Color.white)
                                    .cornerRadius (9)


                            }

                        }
                        .padding(30)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(20)


                    })


                    Spacer().frame(height: 150)

                    Button (action: {

                    }, label: {
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


                    })            }


            }
        }
    }
}


struct FirstBootScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstBootScreen()
    }
}
