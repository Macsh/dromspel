//
//  MiniGame.swift
//  dromspiel
//
//  Created by gibril on 27/10/2021.
//

import SwiftUI

struct firstBootScreen: View {
    var body: some View {

        ZStack{

            VStack{

                Button (action: {

                }, label:{


                    VStack{
                        Text ("Sectionnez vos preferences")
                            .font(.system(size: 20))

                    }
                    .padding(30)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(20)


                })

                Spacer().frame(height: 90)

                HStack{

                    Text("Fight")

                        .padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .cornerRadius (9)
                    Text("Arcade")
                        .padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .cornerRadius (9)
                    Text("Aventure")
                        .padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .cornerRadius (9)
                    Text("Simulation")
                        .padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.gray)
                        .cornerRadius (9)

                }
Spacer().frame(height: 170)

                Button (action: {

                }, label: {


                    HStack{
                        Text ("Vous ne savez pas choisir, cliquez ici")
                            .font(.system(size: 20))
                    }

                    .padding(30)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(20)


                })            }



        }
    }
}



struct firstBootScreen_Previews: PreviewProvider {
    static var previews: some View {
        firstBootScreen()
    }
}
